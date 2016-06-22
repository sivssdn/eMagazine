package process;

import database.DatabaseManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

public class Advertisements {

    public void getAllAdvertisement(){

        DatabaseManager db = new DatabaseManager();

        if(db.success.intern() == "success"){
            String selectStatement = "";
        }
        db.close();
    }
    public void updateAdvertisements(String directory, int advertisementNumber, String contentType, HttpServletRequest request) {

        String uploadedFilePath = "#";
        String link = "#";

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
                            if (fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") || fileExtension.equals(".gif")) {
                                file = new File(directory + fileName);
                                fi.write(file);
                                uploadedFilePath = directory + fileName;


                                //compress if not .gif
                                if(!fileExtension.equals(".gif")){
                                    General compress = new General();
                                    compress.imageCompressor(uploadedFilePath);
                                }

                            }
                        }

                    } else if (fi.isFormField()) {

                        String fieldName = fi.getFieldName();

                            if (fieldName.equals("ad" + advertisementNumber + "Link")) {
                                link = fi.getString(); //getting the input by checking the name attribute
                            }
                        }

                    }


                //updating db
                DatabaseManager db = new DatabaseManager();
                if (db.success.intern() == "success") {
                    String updateStatement = "UPDATE emagazine.public.advertisements" +
                            " SET image_path = ?, link = ?" +
                            " WHERE serial = ?;";
                    PreparedStatement preparedStatement = db.con.prepareStatement(updateStatement);
                    preparedStatement.setString(1, uploadedFilePath);
                    preparedStatement.setString(2, link);
                    preparedStatement.setInt(3, advertisementNumber);

                    db.update(preparedStatement);

                    db.close();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        }
    }
}
