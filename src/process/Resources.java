package process;

import org.apache.commons.lang.StringEscapeUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Locale;
import java.util.ResourceBundle;


public class Resources extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String imageName = request.getParameter("name");

        String escapedImageName = StringEscapeUtils.escapeJava(imageName);
        if (escapedImageName.length() > 0 && !escapedImageName.contains("..") && !escapedImageName.contains(File.separator)) {

            //neutralize here imageName


            //String path = "C:\\Users\\admin\\IdeaProjects\\eMagazine\\resources\\" + escapedImageName;
            Locale locale = new Locale("en", "US");
            //ResourceBundle bundle = ResourceBundle.getBundle("bundles" + File.separator +"paths", locale);
            ResourceBundle bundle = ResourceBundle.getBundle("paths", locale);

            String path = bundle.getString("upload.path") + escapedImageName;

            BufferedInputStream inputStream = null;
            try {
                inputStream = new BufferedInputStream(new FileInputStream(new File(path)));
                OutputStream outputStream = response.getOutputStream();
                byte[] bytes = new byte[1024 * 2];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, bytesRead);
                }
                outputStream.flush();
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
            }

        }

    }
}
