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

public class Stories {
    private String title;
    private String titleKannada;
    private String storiesContent;
    private String storiesContentKannada;
    private String imagePath;
    private String linkKannada;

    public String getLinkKannada() {
        return linkKannada;
    }

    public void setLinkKannada(String linkKannada) {
        this.linkKannada = linkKannada;
    }

    public String getTitleKannada() {
        return titleKannada;
    }

    public void setTitleKannada(String titleKannada) {
        this.titleKannada = titleKannada;
    }

    public String getStoriesContentKannada() {
        return storiesContentKannada;
    }

    public void setStoriesContentKannada(String storiesContentKannada) {
        this.storiesContentKannada = storiesContentKannada;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStoriesContent() {
        return storiesContent;
    }

    public void setStoriesContent(String storiesContent) {
        this.storiesContent = storiesContent;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public List<Stories> getAllStories(String area, String month, int year, int numberOfStories, String status) {

        DatabaseManager db = new DatabaseManager();
        List<Stories> allStories = new LinkedList<>();

        if (db.success.intern() == "success") {

            String selectStatement = "SELECT title, stories_content, image_path, title_kannada, stories_content_kannada, link_kannada FROM emagazine.public.other_stories WHERE month = lower(?) AND year = ? AND AREA = ? AND status ILIKE ? ORDER BY serial ASC LIMIT ?;";
            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, status);
                statement.setInt(5, numberOfStories);

                ResultSet storiesRowsInDb = db.select(statement);

                while (storiesRowsInDb.next()) {
                    Stories singleStory = new Stories();
                    singleStory.setTitle(storiesRowsInDb.getString("title"));
                    singleStory.setTitleKannada(storiesRowsInDb.getString("title_kannada"));
                    singleStory.setStoriesContent(storiesRowsInDb.getString("stories_content"));
                    singleStory.setStoriesContentKannada(storiesRowsInDb.getString("stories_content_kannada"));
                    singleStory.setImagePath(storiesRowsInDb.getString("image_path"));
                    singleStory.setLinkKannada(storiesRowsInDb.getString("link_kannada"));

                    allStories.add(singleStory);

                }

                storiesRowsInDb.close(); //close the resultset
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        db.close();
        return allStories;
    }

    public void declareStories(String month, int year, String area, DatabaseManager db) {

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.other_stories(title, stories_content, image_path, month, status, area, year, serial, title_kannada, stories_content_kannada, link_kannada) VALUES (?, ?, ?, lower(?), ?, ?, ?, ?, ?, ?, ?);");

            for (int i = 1; i < 6; i++) {
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, " ");
                statement.setString(4, month);
                statement.setString(5, "editing");
                statement.setString(6, area);
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


    public void updateStories(String directory, int storyNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String uploadedFilePath = "#";
        String[] storiesFields = {"TitleEnglish", "TitleKannada", "ContentEnglish", "ContentKannada", "Image", "LinkKannada"};
        String[] storiesValues = new String[storiesFields.length];
        String selectImagePathStatement = "";
        String dbColumnField = "";

        DatabaseManager db = new DatabaseManager();

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
                        String fileExtension;
                        if (fileName.intern() != "") {
                            fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();


                            //if matches image extension
                            if (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") ||
                                    fileExtension.equals(".pdf")) {

                                file = new File(directory + fileName);
                                fi.write(file);
                                uploadedFilePath = directory + fileName;


                                //rename file by appending current timestamp
                                String newFileName = fileName.substring(0, fileName.lastIndexOf("."));
                                newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                                FileUtils.moveFile(FileUtils.getFile(uploadedFilePath), FileUtils.getFile(directory + newFileName));
                                //uploadedFilePath = newFileName;


                                if (db.success.intern() == "success") {

                                    if (fi.getFieldName().equals("story" + storyNumber + "Image")) { //for image upload
                                        //compress uploaded image
                                        General compress = new General();
                                        compress.imageCompressor(directory + newFileName);

                                        selectImagePathStatement = "SELECT image_path FROM emagazine.public.other_stories WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                        dbColumnField = "image_path";
                                        storiesValues[4] = newFileName;

                                    } else { //for kannada document upload

                                        selectImagePathStatement = "SELECT link_kannada FROM emagazine.public.other_stories WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                        dbColumnField = "link_kannada";
                                        storiesValues[5] = newFileName;

                                    }
                                    PreparedStatement preparedStatement = db.con.prepareStatement(selectImagePathStatement);

                                    preparedStatement.setString(1, session.getAttribute("month").toString());
                                    preparedStatement.setInt(2, Integer.parseInt(session.getAttribute("year").toString()));
                                    preparedStatement.setString(3, session.getAttribute("area").toString());
                                    preparedStatement.setInt(4, storyNumber);

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


                        for (int j = 0; j < storiesFields.length; j++) {

                            if (fieldName.equals("story" + storyNumber + storiesFields[j])) {
                                storiesValues[j] = StringEscapeUtils.unescapeJavaScript(fi.getString()); //getting values from name attribute of the form
                                break;
                            }
                        }

                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }

            //insert into db
            if (db.success.intern() == "success") {


                try {
                    String updateStatement;
                    PreparedStatement statement;
                    int counter = 5;
                    if (storiesValues[4] != null && storiesValues[5] != null) {
                        updateStatement = "UPDATE emagazine.public.other_stories" +
                                " SET title=?, stories_content=?,  title_kannada=?, stories_content_kannada=?, image_path=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);

                        statement.setString(counter++ , storiesValues[5]); //link counter = 5
                        statement.setString(counter++ , storiesValues[4]); //image counter = 6

                    } else if (storiesValues[4] == null && storiesValues[5] != null) {

                        updateStatement = "UPDATE emagazine.public.other_stories" +
                                " SET title=?, stories_content=?,  title_kannada=?, stories_content_kannada=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , storiesValues[5]); //link counter = 5

                    } else if (storiesValues[4] != null && storiesValues[5] == null) {
                        updateStatement = "UPDATE emagazine.public.other_stories" +
                                " SET title=?, stories_content=?,  title_kannada=?, stories_content_kannada=?, image_path=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , storiesValues[4]); //link counter = 5
                    }else{
                        updateStatement = "UPDATE emagazine.public.other_stories" +
                                " SET title=?, stories_content=?,  title_kannada=?, stories_content_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                    }

                    statement.setString(1, storiesValues[0]);
                    statement.setString(2, storiesValues[2]);
                    statement.setString(3, storiesValues[1]);
                    statement.setString(4, storiesValues[3]);

                    statement.setInt(counter++ , storyNumber);
                    statement.setString(counter++ , session.getAttribute("month").toString());
                    statement.setInt(counter++ , Integer.parseInt(session.getAttribute("year").toString()));
                    statement.setString(counter , session.getAttribute("area").toString());

                    db.update(statement);
                } catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            db.close();
        }

    }
}
