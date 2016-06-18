package process;

import com.google.common.html.HtmlEscapers;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class General {
    public String escapeHtml(String inputString){
        try{
            return HtmlEscapers.htmlEscaper().escape(inputString);
        }catch(NullPointerException ne){
            return inputString;
        }
    }



    //extracts url from a string and replaces it with the link for same with html sanitization
    //example foo bar baaz https://www.google.com will return foo bar baaz <a href='https://www.google.com'>LINK</a>

    public String urlExtracter(String input){
    String outputWithLink="";
        //url matcher
        if(input != null) {
            Pattern urlPattern = Pattern.compile(
                    "(?:^|[\\W])((ht|f)tp(s?):\\/\\/|www\\.)"
                            + "(([\\w\\-]+\\.){1,}?([\\w\\-.~]+\\/?)*"
                            + "[\\p{Alnum}.,%_=?&#\\-+()\\[\\]\\*$~@!:/{};']*)",
                    Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);

            int appendIndex = 0;
            Matcher matcher = urlPattern.matcher(input);
            while (matcher.find()) {
                int matchStart = matcher.start(1); //index of start of url
                int matcherEnd = matcher.end(); //index of end of url
                //out.println("url start : "+matchStart+" "+matcherEnd);
                outputWithLink += input.substring(appendIndex, matchStart - 1) + " <a href=\'" + input.substring(matchStart, matcherEnd) + "\'>LINK</a>";
                appendIndex = matcherEnd;
            }
        }
        return outputWithLink;
    }

    public void compressImages() throws IOException{
        File input = new File("D:\\compress.jpg");
        BufferedImage image = ImageIO.read(input);

        File compressedImageFile = new File("D:\\compress.jpg");
        OutputStream os =new FileOutputStream(compressedImageFile);

        Iterator<ImageWriter> writers =  ImageIO.getImageWritersByFormatName("jpg");
        ImageWriter writer = (ImageWriter) writers.next();

        ImageOutputStream ios = ImageIO.createImageOutputStream(os);
        writer.setOutput(ios);

        ImageWriteParam param = writer.getDefaultWriteParam();

        param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        param.setCompressionQuality(0.7f);
        writer.write(null, new IIOImage(image, null, null), param);

        os.close();
        ios.close();
        writer.dispose();

    }

    /**
     * Takes input as a month and checks if it is a valid month and is greater than equalto last month of the present year
     * if the year is greater than present year, then only checks for the valid month name
     * returns true on success
     * */
    public boolean isValidMonth(String month, int year){
        String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                "August", "September", "October", "November", "December" };
        boolean isMonth = false;
        Calendar now = Calendar.getInstance();
        int presentMonth = now.get(Calendar.MONTH);
        int presentYear = now.get(Calendar.YEAR);
        int startLoop = 0;

        if(year == presentYear)
            startLoop = presentMonth;
        else if(year == presentYear + 1)
                startLoop = 0;

            for (int i = startLoop; i < 12; i++)
                if (monthNames[i].toLowerCase().equals(month.toLowerCase()))
                {
                    isMonth = true;
                    System.out.println(monthNames[i].toLowerCase());
                    break;
                }

        return isMonth;
    }


    /**Takes input as a int value and check if the value is equal to current or nect year*/
    public boolean isValidYear(int year){
        Calendar cal = Calendar.getInstance();
        int presentYear = cal.get(Calendar.YEAR);
        boolean isValidYear = false;

        if(year == presentYear || year == presentYear+1)
        isValidYear = true;

        return isValidYear;
    }
}
