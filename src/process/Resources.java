package process;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


public class Resources extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String imageName = request.getParameter("name");
        if(imageName.length()>0) {

            String path = "C:\\Users\\admin\\IdeaProjects\\eMagazine\\resources\\" + imageName;

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
