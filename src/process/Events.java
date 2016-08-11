package process;


import database.DatabaseManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;


public class Events {
    private String title;
    private String titleKannada;
    private String imagePath;
    private String eventsContent;
    private String eventsContentKannada;
    private String link_kannada;

    public String getLink_kannada() {
        return link_kannada;
    }

    public void setLink_kannada(String link_kannada) {
        this.link_kannada = link_kannada;
    }

    public String getTitleKannada() {
        return titleKannada;
    }

    public void setTitleKannada(String titleKannada) {
        this.titleKannada = titleKannada;
    }

    public String getEventsContentKannada() {
        return eventsContentKannada;
    }

    public void setEventsContentKannada(String eventsContentKannada) {
        this.eventsContentKannada = eventsContentKannada;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getEventsContent() {
        return eventsContent;
    }

    public void setEventsContent(String eventsContent) {
        this.eventsContent = eventsContent;
    }


    public List<Events> getAllEvents(String area, String month, int year, String status) {
        DatabaseManager db = new DatabaseManager();
        ResultSet eventsFromDb = null;

        //for the all list of events, event a, event b...
        List<Events> allEvents = new LinkedList<>();


        String selectStatement = "SELECT title, image_path, events_content, title_kannada, events_content_kannada, link_kannada FROM emagazine.public.events WHERE month = lower(?) AND year = ? AND area = ? AND status ILIKE ? ORDER BY serial ASC;";
        try {
            PreparedStatement statement = db.con.prepareStatement(selectStatement);
            statement.setString(1, month);
            statement.setInt(2, year);
            statement.setString(3, area);
            statement.setString(4, status);

            eventsFromDb = db.select(statement);

            while (eventsFromDb.next()) {
                Events event = new Events();
                event.setTitle(eventsFromDb.getString("title"));
                event.setTitleKannada(eventsFromDb.getString("title_kannada"));
                event.setImagePath(eventsFromDb.getString("image_path"));
                event.setEventsContent(eventsFromDb.getString("events_content"));
                event.setEventsContentKannada(eventsFromDb.getString("events_content_kannada"));
                event.setLink_kannada(eventsFromDb.getString("link_kannada"));
                allEvents.add(event);

            }
            eventsFromDb.close(); //close resultset
        } catch (SQLException se) {
            se.printStackTrace();
        }


        db.close();

        return allEvents;
    }


    public void declareEvent(String month, int year, String area, DatabaseManager db) {

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.events(title, image_path, status, month, area, events_content, year, serial, title_kannada, events_content_kannada, link_kannada)VALUES (?, ?, ?, lower(?), ?, ?, ?, ?, ?, ?, ?);");

            for (int i = 1; i < 6; i++) {
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, "editing");
                statement.setString(4, month);
                statement.setString(5, area);
                statement.setString(6, " ");
                statement.setInt(7, year);
                statement.setInt(8, i);
                statement.setString(9, " ");
                statement.setString(10, " ");
                statement.setString(11, " ");
                db.insert(statement);

            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

    }

    public void updateEvent(String directory, int eventNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String uploadedFilePath = "#";
        String[] eventFields = {"TitleEnglish", "TitleKannada", "ContentEnglish", "ContentKannada", "Image", "LinkKannada"};
        String[] eventValues = new String[eventFields.length];

        DatabaseManager db = new DatabaseManager();
        String selectImagePathStatement = "";
        String dbColumnField = "";

        File file;
        if ((contentType.indexOf("multipart/form-data") >= 0)) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List fileItems = upload.parseRequest(request);

                Iterator i = fileItems.iterator();
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        String fileName = fi.getName();

                        //check the file extension
                        if (fileName.intern() != "") {
                            String fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();

                            //if matches image extension
                            if (fileExtension != null && (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") ||
                                    fileExtension.equals(".pdf"))) {

                                file = new File(directory + fileName);
                                fi.write(file);
                                uploadedFilePath = directory + fileName;


                                //rename file by appending current timestamp
                                //String newFileName = fi.getName().substring(0, fileName.lastIndexOf("."));
                                String newFileName = fileName.substring(0, fileName.lastIndexOf("."));
                                newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                                FileUtils.moveFile(FileUtils.getFile(uploadedFilePath), FileUtils.getFile(directory + newFileName));
                                //eventValues[4] = newFileName;

                                if (db.success.intern() == "success") {
                                    if (fi.getFieldName().equals("event" + eventNumber + "Image")) {
                                        //compress uploaded image
                                        General compress = new General();
                                        compress.imageCompressor(directory + newFileName);


                                        selectImagePathStatement = "SELECT image_path FROM emagazine.public.events WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                        dbColumnField = "image_path";
                                        eventValues[4] = newFileName;


                                    } else {
                                        selectImagePathStatement = "SELECT link_kannada FROM emagazine.public.events WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                        dbColumnField = "link_kannada";
                                        eventValues[5] = newFileName;
                                    }
                                    PreparedStatement preparedStatement = db.con.prepareStatement(selectImagePathStatement);

                                    preparedStatement.setString(1, session.getAttribute("month").toString());
                                    preparedStatement.setInt(2, Integer.parseInt(session.getAttribute("year").toString()));
                                    preparedStatement.setString(3, session.getAttribute("area").toString());
                                    preparedStatement.setInt(4, eventNumber);

                                    String filePath;
                                    ResultSet row = db.select(preparedStatement);
                                    while (row.next()) {
                                        filePath = directory + row.getString(dbColumnField);
                                        General fileMethod = new General();
                                        fileMethod.deleteFile(filePath);
                                    }
                                }


                            }
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();

                        for (int j = 0; j < eventFields.length; j++) {

                            if (fieldName.equals("event" + eventNumber + eventFields[j])) {
                                eventValues[j] = StringEscapeUtils.unescapeJavaScript(fi.getString()); //getting the input by checking the name attribute
                                break;
                            }
                        }

                    }
                }

                //updating db
                if (db.success.intern() == "success") {
                    String updateStatement;
                    PreparedStatement preparedStatement;

                    /* to make where clause fields common for all the statements, counter is being used, it will count if the image and link
                    both are updated or only one of them.
                    * */
                    int counter = 5;
                    if(eventValues[4] != null && eventValues[5] != null ) {

                        updateStatement = "UPDATE emagazine.public.events" +
                                " SET title = ?, title_kannada = ?, events_content = ?, events_content_kannada = ?, image_path = ?, link_kannada = ?" +
                                " WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                        preparedStatement = db.con.prepareStatement(updateStatement);
                        preparedStatement.setString(counter++, eventValues[4]); // counter = 5
                        preparedStatement.setString(counter++, eventValues[5]); //counter = 6

                    }else if(eventValues[4] == null && eventValues[5] != null){

                        updateStatement = "UPDATE emagazine.public.events" +
                                " SET title = ?, title_kannada = ?, events_content = ?, events_content_kannada = ?, link_kannada = ?" +
                                " WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                        preparedStatement = db.con.prepareStatement(updateStatement);
                        preparedStatement.setString(counter++, eventValues[5]); //counter = 5

                    }else if(eventValues[4] != null && eventValues[5] == null){

                        updateStatement = "UPDATE emagazine.public.events" +
                                " SET title = ?, title_kannada = ?, events_content = ?, events_content_kannada = ?, image_path = ?" +
                                " WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                        preparedStatement = db.con.prepareStatement(updateStatement);
                        preparedStatement.setString(counter++, eventValues[4]); //give the image path only, counter = 5

                    }else{
                        updateStatement = "UPDATE emagazine.public.events" +
                                " SET title = ?, title_kannada = ?, events_content = ?, events_content_kannada = ?" +
                                " WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                        preparedStatement = db.con.prepareStatement(updateStatement);
                    }

                    preparedStatement.setString(1, eventValues[0]);
                    preparedStatement.setString(2, eventValues[1]);
                    preparedStatement.setString(3, eventValues[2]);
                    preparedStatement.setString(4, eventValues[3]);


                    preparedStatement.setString(counter++ , session.getAttribute("month").toString());
                    preparedStatement.setInt(counter++ , Integer.parseInt(session.getAttribute("year").toString()));
                    preparedStatement.setString(counter++ , session.getAttribute("area").toString());
                    preparedStatement.setInt(counter , eventNumber);
                    db.update(preparedStatement);

                    db.close();

                }
            } catch (Exception e) {
                System.out.println(e);
                e.printStackTrace();
            }

        }
    }
}
