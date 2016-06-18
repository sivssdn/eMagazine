<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="process.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");

    String requestFor = request.getParameter("requestFor");
    if(requestFor != null && requestFor.intern() == "create_edition") {



        String month = request.getParameter("month");
        String requestYear = request.getParameter("year");
        String area = session.getAttribute("area").toString();



        if (month != null && requestYear != null && area != null) { //check if parameter exists
            General validation = new General();
            int year = Integer.parseInt(requestYear);

                        if(validation.isValidMonth(month, year) && validation.isValidYear(year)) {

                            Edition magazine = new Edition();

                            if (!magazine.editionExists(month, year, area)) {

                                magazine.createEdition(month, year, area);

                                session.setAttribute("month", month);
                                session.setAttribute("year", year);
                            } else {

                                //if edition already exist then redirect to same page with error message
                                response.setStatus(response.SC_MOVED_TEMPORARILY);
                                response.setHeader("Location", "createEdition.jsp?error=Edition already exist");
                            }
                    }else{
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", "createEdition.jsp?error=Month and Year not valid");
                        }

                }else{
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "createEdition.jsp?error=Parameters cannot be empty");
                }



    }else if(requestFor != null && requestFor.intern() == "logout"){
        session.invalidate();

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "login.jsp");
    }else if(requestFor != null && requestFor.intern() == "upload"){


        String upload = request.getParameter("upload");
        String directory = "C:\\Users\\admin\\IdeaProjects\\eMagazine\\resources\\";
        String contentType = request.getContentType();

        if(upload != null) {
            if (upload.intern() == "event")
            {

                int eventNumber = Integer.parseInt(request.getParameter("number"));
                Events event = new Events();
                event.updateEvent(directory, eventNumber, contentType, request, session);

            }else if (upload.intern() == "mostReadArticles") {
                session.setAttribute("month", "june");
                session.setAttribute("year", "2016");

                int articleNumber = Integer.parseInt(request.getParameter("number"));
                MostReadArticles articles = new MostReadArticles();
                articles.updateMostRead(directory, articleNumber,contentType, request, session);


            }else if(upload.intern() == "newsFeed"){

                int newsNumber = Integer.parseInt(request.getParameter("number"));
                NewsFeed news = new NewsFeed();
                news.updateEvent(directory, newsNumber, contentType, request, session);


            }else if(upload.intern() == "stories"){

                int storyNumber = Integer.parseInt(request.getParameter("number"));
                Stories story = new Stories();
                story.updateStories(directory, storyNumber, contentType, request, session);

            }

        }

    }
%>