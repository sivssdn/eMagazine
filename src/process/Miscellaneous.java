package process;

import database.DatabaseManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Miscellaneous {
    String title;
    String titleKannada;
    String content;
    String contentKannada;
    String link;
    String linkKannada;

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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public List<Miscellaneous> getAllMiscellaneous(String area, String month, int year, String status) {

        DatabaseManager db = new DatabaseManager();
        List<Miscellaneous> allMiscellaneousContent = new LinkedList<>();

        if (db.success.intern() == "success") {
            String selectStatement = "SELECT title, title_kannada, miscellaneous_content, " +
                    "       miscellaneous_content_kannada, link, link_kannada" +
                    "  FROM emagazine.public.miscellaneous WHERE month = lower(?) AND year = ? AND area = ? AND status ILIKE ? ORDER BY serial ASC;";

            try {
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, status);

                ResultSet miscellaneousRowsInDB = db.select(statement);
                while (miscellaneousRowsInDB.next()) {

                    Miscellaneous row = new Miscellaneous();
                    row.setTitle(miscellaneousRowsInDB.getString("title"));
                    row.setTitleKannada(miscellaneousRowsInDB.getString("title_kannada"));
                    row.setContent(miscellaneousRowsInDB.getString("miscellaneous_content"));
                    row.setContentKannada(miscellaneousRowsInDB.getString("miscellaneous_content_kannada"));
                    row.setLink(miscellaneousRowsInDB.getString("link"));
                    row.setLinkKannada(miscellaneousRowsInDB.getString("link_kannada"));

                    allMiscellaneousContent.add(row);
                }
                miscellaneousRowsInDB.close(); //closing resultset

            } catch (SQLException se) {
                se.printStackTrace();
            }

        }
        db.close();

        return allMiscellaneousContent;
    }

    public void declareMiscellaneous(String month, int year, String area, DatabaseManager db) {

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO public.miscellaneous(" +
                    "            month, year, status, title, area, title_kannada, serial, miscellaneous_content, " +
                    "            miscellaneous_content_kannada, link, link_kannada)" +
                    "    VALUES (lower(?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i = 1; i < 5; i++) {
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, "editing");
                statement.setString(4, " ");
                statement.setString(5, area);
                statement.setString(6, " ");
                statement.setInt(7, i);
                statement.setString(8, " ");
                statement.setString(9, " ");
                statement.setString(10, " ");
                statement.setString(11, " ");

                db.insert(statement);

            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

    }


    public void updateMiscellaneous(String directory, int miscellaneousNumber, String contentType, HttpServletRequest request, HttpSession session) {

        String uploadedEnglishFilePath = "#";
        String uploadedKanndaFilePath = "#";
        String[] miscellaneousFields = {"TitleEnglish", "TitleKannada", "ContentEnglish", "ContentKannada"};
        String[] miscellaneousValues = new String[miscellaneousFields.length];

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
                        //String fileExtension;
                        if(fileName.intern() != "") {
                            String fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();

                            //if matches image extension
                            if (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") ||
                                    fileExtension.equals(".pdf") || fileExtension.equals(".doc") || fileExtension.equals(".docx")
                                    || fileExtension.equals(".xls")) {
                                //String fileFieldName = fi.getFieldName();
                                file = new File(directory + fileName);
                                fi.write(file);

                                String fileFieldName = fi.getFieldName();

                                if (fileFieldName.equals("misc" + miscellaneousNumber + "FileEnglish")) {
                                    uploadedEnglishFilePath = directory + fileName;

                                    //rename file by appending current timestamp
                                    String newFileName = fi.getName().substring(0, fileName.lastIndexOf("."));
                                    newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                                    FileUtils.moveFile(FileUtils.getFile(uploadedEnglishFilePath), FileUtils.getFile(directory + newFileName));
                                    uploadedEnglishFilePath = newFileName;
                                } else if (fileFieldName.equals("misc" + miscellaneousNumber + "FileKannada")) {
                                    uploadedKanndaFilePath = directory + fileName;

                                    //rename file by appending current timestamp
                                    String newFileName = fi.getName().substring(0, fileName.lastIndexOf("."));
                                    newFileName += String.valueOf(System.currentTimeMillis()) + fileExtension;
                                    FileUtils.moveFile(FileUtils.getFile(uploadedKanndaFilePath), FileUtils.getFile(directory + newFileName));
                                    uploadedKanndaFilePath = newFileName;
                                }

                            }
                        }

                    } else if (fi.isFormField()) {
                        String fieldName = fi.getFieldName();
                        for (int j = 0; j < miscellaneousFields.length; j++) {
                            if (fieldName.equals("misc" + miscellaneousNumber + miscellaneousFields[j])) {
                                miscellaneousValues[j] = fi.getString(); //getting the input by checking the name attribute
                            }
                        }
                    }
                }


                //updating db
                DatabaseManager db = new DatabaseManager();
                if (db.success.intern() == "success") {
                    String updateStatement = "UPDATE emagazine.public.miscellaneous" +
                            " SET title = ?, title_kannada = ?, miscellaneous_content = ?, miscellaneous_content_kannada = ?, link = ?, link_kannada = ?" +
                            " WHERE month = ? AND year = ? AND area = ? AND serial = ? AND status = 'editing'  ;";
                    PreparedStatement preparedStatement = db.con.prepareStatement(updateStatement);
                    preparedStatement.setString(1, miscellaneousValues[0]);
                    preparedStatement.setString(2, miscellaneousValues[1]);
                    preparedStatement.setString(3, miscellaneousValues[2]);
                    preparedStatement.setString(4, miscellaneousValues[3]);
                    preparedStatement.setString(5, uploadedEnglishFilePath);
                    preparedStatement.setString(6, uploadedKanndaFilePath);
                    preparedStatement.setString(7, session.getAttribute("month").toString());
                    preparedStatement.setInt(8, Integer.parseInt(session.getAttribute("year").toString()));
                    preparedStatement.setString(9, session.getAttribute("area").toString());
                    preparedStatement.setInt(10, miscellaneousNumber);

                    db.update(preparedStatement);

                    db.close();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        }
    }
}
