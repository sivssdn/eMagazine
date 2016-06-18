package process;



import database.DatabaseManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
    String title;
    String storiesContent;
    String imagePath;

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

    public List<Stories> getAllStories(String area, String month,int year,int numberOfStories){

        DatabaseManager db = new DatabaseManager();
        List<Stories> allStories = new LinkedList<>();

        if(db.success.intern() == "success"){

            String selectStatement = "SELECT title, stories_content, image_path FROM emagazine.public.other_stories WHERE status ILIKE 'APPROVED' AND month = ? AND year = ? AND AREA = ? LIMIT ?;";
            try{
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setInt(4, numberOfStories);

                ResultSet storiesRowsInDb = db.select(statement);

                while (storiesRowsInDb.next()){
                    Stories singleStory = new Stories();
                    singleStory.setTitle(storiesRowsInDb.getString("title"));
                    singleStory.setStoriesContent(storiesRowsInDb.getString("stories_content"));
                    singleStory.setImagePath(storiesRowsInDb.getString("image_path"));

                    allStories.add(singleStory);
                }

                storiesRowsInDb.close(); //close the resultset
            }catch(SQLException se){
                se.printStackTrace();
            }
        }

        db.close();
        return allStories;
    }

    public void declareEvent(String month, int year, String area, DatabaseManager db){

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.other_stories(title, stories_content, image_path, month, status, area, year, serial, title_kannada, stories_content_kannada) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i=1; i<6; i++){
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, " ");
                statement.setString(4, month);
                statement.setString(5, "editting");
                statement.setString(6, area);
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


    public void updateStories(String directory, int storyNumber, String contentType, HttpServletRequest request, HttpSession session){

        String uploadedFilePath = "#";
        String[] storiesFields = {"TitleEnglish", "TitleKannada", "ContentEnglish", "ContentKannada"};
        String[] storiesValues = new String[storiesFields.length];

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
                        if (fileName.intern() != ""){
                            fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length());


                        //if matches image extension
                        if (fileExtension.equals(".jpg")) {
                            //String fileFieldName = fi.getFieldName();
                            file = new File(directory + fileName);
                            fi.write(file);

                            uploadedFilePath = directory + fileName;
                        }
                    }
                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();


                        for (int j=0; j<storiesFields.length; j++){

                            if(fieldName.equals("story"+storyNumber+storiesFields[j]) ){
                                storiesValues[j] = fi.getString(); //getting values from name attribute of the form
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

                String updateStatement = "UPDATE public.other_stories" +
                        " SET title=?, stories_content=?, image_path=?, title_kannada=?, stories_content_kannada=?" +
                        " WHERE serial = ? AND month = ? AND year = ? AND area = ? AND status = 'editting';";
                try {
                        PreparedStatement statement = db.con.prepareStatement(updateStatement);
                        statement.setString(1, storiesValues[0]);
                        statement.setString(2, storiesValues[2]);
                        statement.setString(3, uploadedFilePath);
                        statement.setString(4, storiesValues[1]);
                        statement.setString(5, storiesValues[3]);

                        statement.setInt(6, storyNumber);
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
