<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="process.Events" %>


<%
    if(request.getParameter("requestFor").intern() == "add_event1") {
        String directory = "C:\\Users\\admin\\IdeaProjects\\eMagazine\\resources\\";
        String contentType = request.getContentType();

        Events event = new Events();
        event.updateEvent(directory, 1, contentType, request);

    }
%>


