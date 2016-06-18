package process;

import database.DatabaseManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;


public class Events {
    String title;
    String imagePath;
    String eventsContent;

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


    public List<Events> getAllEvents(String area, String month, int year){
        DatabaseManager db = new DatabaseManager();
        ResultSet eventsFromDb = null;

        //for the all list of events, event a, event b...
        List<Events> allEvents = new LinkedList<>();


        if (db.success.intern() == "success") {
            String selectStatement = "SELECT title, image_path, events_content FROM emagazine.public.events WHERE status ILIKE 'APPROVED' AND month = lower(?) AND year = ? AND area = ?;";
            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);

                eventsFromDb = db.select(statement);

                while(eventsFromDb.next()){
                    Events event = new Events();
                    event.setTitle(eventsFromDb.getString("title"));
                    event.setImagePath(eventsFromDb.getString("image_path"));
                    event.setEventsContent(eventsFromDb.getString("events_content"));

                    allEvents.add(event);
                }
                eventsFromDb.close(); //close resultset
            }catch(SQLException se){
                se.printStackTrace();
            }


        }
        db.close();

        return allEvents;
    }

    public void declareEvent(String month, int year, String area, DatabaseManager db){

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.events(" +
                    "            title, image_path, status, month, area, events_content, year, " +
                    "            serial, title_kannada, events_content_kannada)" +
                    "    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i=1; i<6; i++){
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, "editting");
                statement.setString(4, month);
                statement.setString(5, area);
                statement.setString(6, " ");
                statement.setInt(7, year);
                statement.setInt(8, i);
                statement.setString(9, " ");
                statement.setString(10, " ");
                db.insert(statement);

            }
        }catch(SQLException se){
            se.printStackTrace();
        }

    }

    public void updateEvent(String directory, int eventNumber, String contentType, HttpServletRequest request, HttpSession session){

        String uploadedFilePath = "#";
        String[] eventFields = {"TitleEnglish", "TitleKannada", "ContentEnglish", "ContentKannada"};
        String[] eventValues = new String[eventFields.length];

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
                        String fileExtension = "";
                        if(fileName.intern() != "")
                            fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length());

                        //if matches image extension
                        if(fileExtension.equals("jpg") ) {
                            //String fileFieldName = fi.getFieldName();
                            file = new File(directory + fileName);
                            fi.write(file);

                            uploadedFilePath = directory + fileName;
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();


                        for (int j=0; j<eventFields.length; j++){

                                if(fieldName.equals("event"+eventNumber+eventFields[j]) ){
                                    eventValues[j] = fi.getString(); //getting values from name attribute of the form
                                    break;
                                }
                        }

                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }

            //insert into db
            DatabaseManager db = new DatabaseManager();
            if(db.success.intern() == "success"){

                String updateStatement = "UPDATE public.events" +
                        "   SET title=?, image_path=?, events_content=?, title_kannada=?, events_content_kannada=?" +
                        " WHERE serial = ? AND month = ? AND year = ? AND area = ? AND status = 'editting';";
                try {
                    PreparedStatement statement = db.con.prepareStatement(updateStatement);
                    statement.setString(1, eventValues[0]);
                    statement.setString(2, uploadedFilePath);
                    statement.setString(3, eventValues[2]);
                    statement.setString(4, eventValues[1]);
                    statement.setString(5, eventValues[3]);

                    statement.setInt(6, eventNumber);
                    statement.setString(7, session.getAttribute("month").toString());
                    statement.setInt(8, Integer.parseInt(session.getAttribute("year").toString()));
                    statement.setString(9, session.getAttribute("area").toString());
                    db.update(statement);
                }catch(SQLException se){
                    se.printStackTrace();
                }

            }
            db.close();

        }
    }
}
