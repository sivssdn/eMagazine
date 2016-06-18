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


public class NewsFeed {
    String title;
    String link;
    String content;

    public String getTitle() {
        return title;
    }

    public String getLink() {
        return link;
    }

    public String getContent() {
        return content;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public List<NewsFeed> getNewsFeed(String area, String month){


        DatabaseManager db = new DatabaseManager();
        List<NewsFeed> allNews = new LinkedList<>();

        if(db.success.intern() == "success") {
            String selectStatement = "SELECT title, link, news_content FROM emagazine.public.news_feed WHERE status ILIKE 'APPROVED' AND month = lower(?) AND area = ? ;";
            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1,month);
                statement.setString(2,area);

                ResultSet newsRowsInDB = db.select(statement);

                while(newsRowsInDB.next()){
                    NewsFeed newsItem = new NewsFeed();
                    newsItem.setTitle(newsRowsInDB.getString("title"));
                    newsItem.setContent(newsRowsInDB.getString("news_content"));
                    newsItem.setLink(newsRowsInDB.getString("link"));

                    allNews.add(newsItem);

                }
                newsRowsInDB.close(); //close resultset

            }catch(SQLException se){
                se.printStackTrace();
            }
        }

        db.close();
        return allNews;
    }

    public void declareNewsFeed(String month, int year, String area, DatabaseManager db){

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.news_feed(" +
                    "            title, link, month, area, status, news_content, year, serial, " +
                    "            title_kannada, news_content_kannada)" +
                    "    VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?);");

            for (int i=1; i<9; i++){
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, month);
                statement.setString(4, area);
                statement.setString(5, "editting");
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


    public void updateEvent(String directory, int newsNumber, String contentType, HttpServletRequest request, HttpSession session){

        String uploadedFilePath = "#";
        String[] newsFeedFields = {"TitleEnglish","TitleKannada","Link","ContentEnglish","ContentKannada"};
        String[] newsFeedValues = new String[newsFeedFields.length];


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
                        if(fileExtension.equals(".jpg") ) {
                            //String fileFieldName = fi.getFieldName();
                            file = new File(directory + fileName);
                            fi.write(file);

                            uploadedFilePath = directory + fileName;
                            newsFeedValues[2] = uploadedFilePath;
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();


                        for (int j=0; j<newsFeedFields.length; j++){


                            if(fieldName.equals("newsfeed"+newsNumber+newsFeedFields[j]) ){
                                if(fi.getString() != null)
                                newsFeedValues[j] = fi.getString(); //getting values from name attribute of the form
                                break;
                            }
                        }

                    }
                }
            } catch (Exception e) {
                System.out.println(e);
                e.printStackTrace();
            }

            //insert into db
            DatabaseManager db = new DatabaseManager();
            if(db.success.intern() == "success"){

                String updateStatement = "UPDATE public.news_feed" +
                        " SET title=?, link=?, news_content=?, title_kannada=?, news_content_kannada=?" +
                        " WHERE serial = ? AND month = ? AND year = ? AND area = ? AND status = 'editting';";
                try {
                    PreparedStatement statement = db.con.prepareStatement(updateStatement);
                    statement.setString(1, newsFeedValues[0]);
                    statement.setString(2, newsFeedValues[2]);
                    statement.setString(3, newsFeedValues[3]);
                    statement.setString(4, newsFeedValues[1]);
                    statement.setString(5, newsFeedValues[4]);

                    statement.setInt(6, newsNumber);
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