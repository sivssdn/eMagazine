<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("X-Frame-Options", "DENY");
    response.addHeader("X-Content-Type-Options", "nosniff");
    response.addHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline';style-src 'self' http://fonts.googleapis.com/icon?family=Material+Icons 'unsafe-inline'; font-src 'self' http://fonts.gstatic.com/s/materialicons/v17/2fcrYFNaTjcS6g4U3t-Y5ZjZjT5FdEJ140U2DJYC3mY.woff2 'unsafe-inline'; img-src *");
%>
<html>
<head>
    <title>eMagazine</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/icon/android-icon-192x192.png">
    <link rel="manifest" href="images/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--favicons over-->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="msapplication-tap-highlight" content="no">
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection"/>
</head>
<body>
<main>
    <div class="container">
        <br><br>
        <div class="col s12 m10 offset-m2 l6 offset-l3 section">
            <div class="card-panel grey lighten-5 z-depth-1 section">

                    <div class="col s10 section">
                      <span class="black-text center-align">
                          <%
                              if(request.getParameter("message") != null){
                          %>
                          <h4 class="light">The page you are looking for <%=StringEscapeUtils.escapeJavaScript(request.getParameter("message"))%></h4>
                          <%
                              }else{
                          %>
                        <h4 class="light">The page you are looking for encountered some error.</h4>
                          <%}%>
                      </span>
                    </div>

            </div>
        </div><br><br>
        <div class="row">
            <div class="col push-s2 push-m4">
            <i class="material-icons dp48 red-text" style="font-size: 15em;">report</i>
            </div>
        </div>
        <div class="row">
            <div class="col push-s2 push-m4">
                <a onclick="window.history.back();" style="font-size: 1.5em;cursor: pointer;"> GO TO PREVIOUS PAGE</a>
            </div>
        </div>
    </div>
</main>

</body>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
</html>
