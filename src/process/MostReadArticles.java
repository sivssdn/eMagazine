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

public class MostReadArticles {
    String title;
    String titleKannada;
    String link;
    String linkKannada;

    public String getTitleKannada() {
        return titleKannada;
    }

    public void setTitleKannada(String titleKannada) {
        this.titleKannada = titleKannada;
    }

    public String getLinkKannada() {
        return linkKannada;
    }

    public void setLinkKannada(String linkKannada) {
        this.linkKannada = linkKannada;
    }

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

    public List<MostReadArticles> getAllRecentArticles(String area, String month, int year, String status) {

        DatabaseManager db = new DatabaseManager();
        List<MostReadArticles> allArticles = new LinkedList<>();

        if (db.success.intern() == "success") {
            String selectStatement = "SELECT title, link, serial, title_kannada, link_kannada" +
                    "  FROM emagazine.public.most_read_articles" +
                    " WHERE month = lower(?) AND year = ? AND area = ? AND status ILIKE ? ORDER BY serial ASC;";

            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, status);


                ResultSet articlesInDB = db.select(statement);


                 while (articlesInDB.next()) {
                    MostReadArticles singleArticle = new MostReadArticles();
                    singleArticle.setTitle(articlesInDB.getString("title"));
                    singleArticle.setTitleKannada(articlesInDB.getString("title_kannada"));
                    singleArticle.setLink(articlesInDB.getString("link"));
                    singleArticle.setLinkKannada(articlesInDB.getString("link_kannada"));

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
                    "            title, link, status, area, month, year, serial, title_kannada, link_kannada)" +
                    "    VALUES (?, ?, ?, ?, lower(?), ?, ?, ?, ?);");

            for (int i = 1; i < 11; i++) {
                statement.setString(1, " ");
                statement.setString(2, " ");
                statement.setString(3, "editing");
                statement.setString(4, area);
                statement.setString(5, month);
                statement.setInt(6, year);
                statement.setInt(7, i);
                statement.setString(8, " ");
                statement.setString(9, " ");
                db.insert(statement);

            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

    }

    public void updateMostRead(String directory, int articleNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String[] mostReadFields = {"TitleEnglish", "TitleKannada", "Link", "Link_kannada"};
        String[] mostReadValues = new String[mostReadFields.length];

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

                        //if matches image extension
                        if (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") ||
                                fileExtension.equals(".pdf")) {
                            file = new File(directory + fileName);
                            fi.write(file);

                            //uploadedFilePath = directory + fileName;

                            //rename file by appending current timestamp
                            String newFileName = fileName.substring(0, fileName.lastIndexOf("."));
                            newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                            FileUtils.moveFile(FileUtils.getFile(directory + fileName), FileUtils.getFile(directory + newFileName));


                            if (fi.getFieldName().equals("mostRead" + articleNumber + "FileEnglish")) {
                                mostReadValues[2] = newFileName; //initialized to # in case of null
                                selectFileStatement = "SELECT link FROM emagazine.public.most_read_articles WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                dbColumnField = "link";
                            } else {
                                mostReadValues[3] = newFileName;
                                selectFileStatement = "SELECT link_kannada FROM emagazine.public.most_read_articles WHERE month = lower(?) AND year = ? AND area = ? AND serial = ? AND status = 'editing';";
                                dbColumnField = "link_kannada";
                            }

                            if (db.success.intern() == "success") {
                                PreparedStatement preparedStatement = db.con.prepareStatement(selectFileStatement);
                                preparedStatement.setString(1, session.getAttribute("month").toString());
                                preparedStatement.setInt(2, Integer.parseInt(session.getAttribute("year").toString()));
                                preparedStatement.setString(3, session.getAttribute("area").toString());
                                preparedStatement.setInt(4, articleNumber);

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
                        for (int j = 0; j < mostReadFields.length; j++) {

                            //for other request.getParameter
                            if (fieldName.equals("article" + articleNumber + mostReadFields[j])) {
                                if (fi.getString() != null)
                                    mostReadValues[j] = StringEscapeUtils.unescapeJavaScript(fi.getString()); //getting values from name attribute of the form
                                break;
                            }
                        }

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


            if (db.success.intern() == "success") {

                int counter = 3;
                try {
                    String updateStatement;
                    PreparedStatement statement;

                    if((mostReadValues[2] != null && mostReadValues[2].length() > 2) && (mostReadValues[3] != null && mostReadValues[3].length() > 2)) {

                        updateStatement = "UPDATE public.most_read_articles" +
                                "   SET title=?,  title_kannada=?,  link=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , mostReadValues[2]); //counter = 3
                        statement.setString(counter++ , mostReadValues[3]); //counter = 4

                    }else if(mostReadValues[2] == null && (mostReadValues[3] != null && mostReadValues[3].length() > 2)){

                        updateStatement = "UPDATE public.most_read_articles" +
                                "   SET title=?,  title_kannada=?, link_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , mostReadValues[3]); //counter = 3

                    }else if((mostReadValues[2] != null && mostReadValues[2].length() > 2) && mostReadValues[3] == null){
                        updateStatement = "UPDATE public.most_read_articles" +
                                "   SET title=?,  title_kannada=?,  link=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);
                        statement.setString(counter++ , mostReadValues[2]); //counter = 3

                    }else{
                        //if the link field is empty then update without it
                        updateStatement = "UPDATE public.most_read_articles" +
                                "   SET title=?, title_kannada=?" +
                                " WHERE serial = ? AND month = lower(?) AND year = ? AND area = ? AND status = 'editing';";
                        statement = db.con.prepareStatement(updateStatement);

                    }
                    statement.setString(1, mostReadValues[0]);
                    statement.setString(2, mostReadValues[1]);

                    statement.setInt(counter++ , articleNumber);
                    statement.setString(counter++ , session.getAttribute("month").toString());
                    statement.setInt(counter++ , Integer.parseInt(session.getAttribute("year").toString()));
                    statement.setString(counter , session.getAttribute("area").toString());
                    db.update(statement);
System.out.println(statement);
                } catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            db.close();
        }
    }
}