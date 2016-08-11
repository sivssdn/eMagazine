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


public class NewsFeed {
    String title;
    String titleKannada;
    String link;
    String linkKannada;
    String content;
    String contentKannada;

    public String getTitleKannada() {
        return titleKannada;
    }

    public void setTitleKannada(String titleKannada) {
        this.titleKannada = titleKannada;
    }

    public String getContentKannada() {
        return contentKannada;
    }

    public void setContentKannada(String contentKannada) {
        this.contentKannada = contentKannada;
    }

    public String getTitle() {
        return title;
    }

    public String getLink() {
        return link;
    }

    public String getLinkKannada() {
        return linkKannada;
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

    public void setLinkKannada(String link) {
        this.linkKannada = link;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public List<NewsFeed> getNewsFeed(String area, int year, String month, String status) {


        DatabaseManager db = new DatabaseManager();
        List<NewsFeed> allNews = new LinkedList<>();

        if (db.success.intern() == "success") {
            String selectStatement = "SELECT title, link, news_content,link_kannada,title_kannada,news_content_kannada FROM emagazine.public.news_feed WHERE month = lower(?) AND year = ? AND area = ? AND status ILIKE ? ORDER BY serial ASC;";
            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, status);

                ResultSet newsRowsInDB = db.select(statement);

                while (newsRowsInDB.next()) {
                    NewsFeed newsItem = new NewsFeed();
                    newsItem.setTitle(newsRowsInDB.getString("title"));
                    newsItem.setTitleKannada(newsRowsInDB.getString("title_kannada"));
                    newsItem.setContent(newsRowsInDB.getString("news_content"));
                    newsItem.setContentKannada(newsRowsInDB.getString("news_content_kannada"));
                    newsItem.setLinkKannada(newsRowsInDB.getString("link_kannada"));
                    newsItem.setLink(newsRowsInDB.getString("link"));

                    allNews.add(newsItem);

                }
                newsRowsInDB.close(); //close resultset

            } catch (SQLException se) {
                se.printStackTrace();
            }
        }

        db.close();
        return allNews;
    }

    public void declareNewsFeed(String month, int year, String area, DatabaseManager db) {

        String[] defaulTitles = {"From the Desk of the Director", "ULB rankings", "Analytical reports", "Swach Bharat news", "Amruth cities news", "Smart cities news", "Tender notifications", "Note from the President or Chief Officer"};
        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.news_feed(title, link, month, area, status, news_content, year, serial, title_kannada, news_content_kannada, link_kannada) VALUES (?, ?, lower(?), ?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i = 1; i < 9; i++) {
                statement.setString(1, defaulTitles[i-1]);
                statement.setString(2, " ");
                statement.setString(3, month);
                statement.setString(4, area);
                statement.setString(5, "editing");
                statement.setString(6, " ");
                statement.setInt(7, year);
                statement.setInt(8, i);
                statement.setString(9, defaulTitles[i-1]);
                statement.setString(10, " ");
                statement.setString(11, " ");
                db.insert(statement);

            }
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }


    public void updateEvent(String directory, int newsNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String[] newsFeedFields = {"TitleEnglish", "TitleKannada", "Link", "ContentEnglish", "ContentKannada", "Link_kannada"};
        String[] newsFeedValues = new String[newsFeedFields.length];
        DatabaseManager db = new DatabaseManager();
        String selectFileStatement = "";
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
                        String fileExtension = "";
                        if (fileName.intern() != "")
                            fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();


                        if (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") ||
                                fileExtension.equals(".pdf")) {
                            //String fileFieldName = fi.getFieldName();
                            file = new File(directory + fileName);
                            fi.write(file);

                            //rename file by appending current timestamp
                            String newFileName = fileName.substring(0, fileName.lastIndexOf("."));
                            newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                            FileUtils.moveFile(FileUtils.getFile(directory + fileName), FileUtils.getFile(directory + newFileName));
                            //uploadedFilePath = directory + newFileName;


                            if (fi.getFieldName().equals("newsfeed" + newsNumber + "FileEnglish")) {
                                newsFeedValues[2] = newFileName; //initialized to # in case of null
                                selectFileStatement = "SELECT link FROM emagazine.public.news_feed WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                dbColumnField = "link";
                            } else {
                                newsFeedValues[5] = newFileName;
                                selectFileStatement = "SELECT link_kannada FROM emagazine.public.news_feed WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                dbColumnField = "link_kannada";
                            }

                            if (db.success.intern() == "success") {
                                PreparedStatement preparedStatement = db.con.prepareStatement(selectFileStatement);
                                preparedStatement.setString(1, session.getAttribute("month").toString());
                                preparedStatement.setInt(2, Integer.parseInt(session.getAttribute("year").toString()));
                                preparedStatement.setString(3, session.getAttribute("area").toString());
                                preparedStatement.setInt(4, newsNumber);

                                String path;
                                ResultSet row = db.select(preparedStatement);
                                while (row.next()) {
                                    path = directory + row.getString(dbColumnField);
                                    General fileMethod = new General();
                                    fileMethod.deleteFile(path);
                                }
                            }
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();

                        for (int j = 0; j < newsFeedFields.length; j++) {


                            if (fieldName.equals("newsfeed" + newsNumber + newsFeedFields[j])) {
                                if (fi.getString() != null)
                                    newsFeedValues[j] = StringEscapeUtils.unescapeJavaScript(fi.getString()); //getting values from name attribute of the form
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
            if (db.success.intern() == "success") {


                try {
                    String updateStatement;
                    PreparedStatement statement;
                    int counter = 5;
                    if((newsFeedValues[2] != null && newsFeedValues[2].length() > 2) && (newsFeedValues[5] != null && newsFeedValues[5].length() > 2)) {

                        updateStatement = "UPDATE public.news_feed" +
                                " SET title=?, news_content=?, title_kannada=?, news_content_kannada=?, link=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , newsFeedValues[2]); //link counter = 5
                        statement.setString(counter++ , newsFeedValues[5]); //link kannada counter = 6

                    }else if(newsFeedValues[2] == null && (newsFeedValues[5] != null && newsFeedValues[5].length() > 2)){

                        updateStatement = "UPDATE public.news_feed" +
                                " SET title=?, news_content=?, title_kannada=?, news_content_kannada=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , newsFeedValues[5]); //link kannada counter = 5

                    }else if((newsFeedValues[2] != null && newsFeedValues[2].length() > 2) && newsFeedValues[5] == null){

                        updateStatement = "UPDATE public.news_feed" +
                                " SET title=?, news_content=?, title_kannada=?, news_content_kannada=?, link=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , newsFeedValues[2]); //link counter = 5

                    }else{

                        updateStatement = "UPDATE public.news_feed" +
                                " SET title=?, news_content=?, title_kannada=?, news_content_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                    }

                    statement.setString(1, newsFeedValues[0]);
                    statement.setString(2, newsFeedValues[3]);
                    statement.setString(3, newsFeedValues[1]);
                    statement.setString(4, newsFeedValues[4]);

                    statement.setInt(counter++ , newsNumber);
                    statement.setString(counter++ , session.getAttribute("month").toString());
                    statement.setInt(counter++ , Integer.parseInt(session.getAttribute("year").toString()));
                    statement.setString(counter++ , session.getAttribute("area").toString());
                    db.update(statement);

                } catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            db.close();
        }

    }


}
