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

public class MostReadArticles {
    String title;
    String link;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public List<MostReadArticles> getAllRecentArticles(String area, String month, int year) {

        DatabaseManager db = new DatabaseManager();
        List<MostReadArticles> allArticles = new LinkedList<>();

        if (db.success.intern() == "success") {
            String selectStatement = "SELECT title, link, status, area, month, year FROM emagazine.public.most_read_articles WHERE status ILIKE 'APPROVED' AND month = lower(?) AND year = ? AND area = ?;";

            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);


                ResultSet articlesInDB = db.select(statement);
                while (articlesInDB.next()) {
                    MostReadArticles singleArticle = new MostReadArticles();
                    singleArticle.setTitle(articlesInDB.getString("title"));
                    singleArticle.setLink(articlesInDB.getString("link"));

                    allArticles.add(singleArticle);
                }
                articlesInDB.close(); //close resultset

            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        db.close();

        return allArticles;
    }


    public void declareEvent(String month, int year, String area, DatabaseManager db) {

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO public.most_read_articles(" +
                    "            title, link, status, area, month, year, serial, title_kannada)" +
                    "    VALUES (?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i = 1; i < 11; i++) {
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, "editting");
                statement.setString(4, area);
                statement.setString(5, month);
                statement.setInt(6, year);
                statement.setInt(7, i);
                statement.setString(8, " ");
                db.insert(statement);

            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

    }

    public void updateMostRead(String directory, int articleNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String uploadedFilePath = "#";
        String[] mostReadFields = {"TitleEnglish", "TitleKannada", "Link"};
        String[] mostReadValues = new String[mostReadFields.length];


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
                            fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length());

                        //if matches image extension
                        if (fileExtension.equals(".jpg")) {
                            file = new File(directory + fileName);
                            fi.write(file);

                            uploadedFilePath = directory + fileName;
                            mostReadValues[2] = uploadedFilePath;
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();
                        for (int j = 0; j < mostReadFields.length; j++) {

                            //for other request.getParameter
                             if (fieldName.equals("article" + articleNumber + mostReadFields[j])) {
                                if(fi.getString() != null)
                                mostReadValues[j] = fi.getString(); //getting values from name attribute of the form
                                break;
                            }
                        }

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


            DatabaseManager db = new DatabaseManager();
            if (db.success.intern() == "success") {

                String updateStatement = "UPDATE public.most_read_articles" +
                        "   SET title=?, link=?, title_kannada=?" +
                        " WHERE serial = ? AND month = ? AND year = ? AND area = ? AND status = 'editting';;";
                try {

                    PreparedStatement statement = db.con.prepareStatement(updateStatement);
                    statement.setString(1, mostReadValues[0]);
                    statement.setString(2, mostReadValues[2]);
                    statement.setString(3, mostReadValues[1]);

                    statement.setInt(4, articleNumber);
                    statement.setString(5, session.getAttribute("month").toString());
                    statement.setInt(6, Integer.parseInt(session.getAttribute("year").toString()));
                    statement.setString(7, session.getAttribute("area").toString());
                    db.update(statement);

                } catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            db.close();
        }
    }
}