<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("X-Frame-Options", "DENY");
    response.addHeader("X-Content-Type-Options", "nosniff");
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
    response.addHeader("Pragma", "no-cache");
    response.addDateHeader("Expires", 0);


    if (session.getAttribute("email") == null) {
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "login.jsp");
    }

%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/icon/android-icon-192x192.png">
    <link rel="manifest" href="images/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--favicons over-->

    <link href="materialize/css/materialize.min.css" type="text/css" rel="STYLESHEET"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>

<header>
    <nav style="height: 7em; background-color: #009688;">
        <div class="nav-wrapper container">
            <div class="row">
                <a href="index.jsp" class="left hide-on-small-and-down" style="margin-top: 0.5%; margin-left: 10%;">
                    <img src="images/gkLogo.png" style="height: 90px;">
                </a>
                <a href="index.jsp" class="brand-logo center" style="margin-top: 2%;">eMagazine
                </a>
                <a href="index.jsp" class="right hide-on-small-and-down" style="margin-top: 0.5%; margin-right: 10%;">
                    <img src="images/mrcLogo.png" style="height: 90px;">
                </a>
            </div>
        </div>
    </nav>
</header>
<br><br/>

<!-- logout -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
    <a href="userControl.jsp?requestFor=logout" class="btn-floating btn-large tooltipped" data-position="top"
       data-delay="50" data-tooltip="Logout" style="color: #009688;">
        <i class="material-icons">power_settings_new</i>
    </a>
</div>

<!-- Create new edition -->
<div class="row">
    <div class="col">
        <i class="material-icons" style="color: black; margin-top: 0.5em; margin-left: 0.25em;">add</i>
    </div>
    <div class="col">
        <h5>Create New Edition &nbsp; &nbsp; &nbsp; / </h5>
    </div>
    <div class="col">
        <i class="material-icons" style="color: black; margin-top: 0.5em; margin-left: 0.25em;">mode_edit</i>
    </div>
    <div class="col">
        <h5>Edit Edition &nbsp; &nbsp; &nbsp; / </h5>
    </div>
    <div class="col">
        <i class="material-icons" style="color: black; margin-top: 0.5em; margin-left: 0.25em;">airplay</i>
    </div>
    <div class="col">
        <h5>View Edition</h5>
    </div>
    <div class="col push-m2">
        <a href="createUser.jsp" class="waves-effect waves-light btn"><i class="material-icons left">add</i><i
                class="material-icons left">perm_identity</i>Create User</a>
    </div>
</div>
<div class="divider"></div>
<br/>


<% if (request.getParameter("error") != null) {%>
<div class="row">
    <div class="col m10 push-m5">
        <h5 class="light red-text "><%= request.getParameter("error") %>
        </h5>
    </div>
</div>


<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
<%}%>
<form action="controller.jsp" method="get" id="edition">
    <div class="row">


        <%
            //get current month
            String[] monthNames = {"January", "February", "March", "April", "May", "June", "July",
                    "August", "September", "October", "November", "December"};
            Calendar now = Calendar.getInstance();
            int month = now.get(Calendar.MONTH);
            int year = now.get(Calendar.YEAR);

            int loopMonth = -1;
        %>

        <div class="input-field col s12 m3 push-m3">
            <select name="month" required>
                <option value="" disabled selected>Choose Month</option>
                <%if (month > 0) {%>
                <option value="<%=monthNames[month - 1]%>"><%=monthNames[month - 1]%>
                        <%}else{%>
                <option value="<%=monthNames[11]%>"><%=monthNames[11]%>
                    <%}%>
                </option>

                <option value="<%=monthNames[month]%>"><%=monthNames[month]%>
                </option>

                <%if ((month + 1) <= 11) {%>
                <option value="<%=monthNames[month+1]%>"><%=monthNames[month+1]%>
                        <%}else{
               loopMonth = 0;
                %>
                <option value="<%=monthNames[loopMonth]%>"><%=monthNames[loopMonth++]%>
                    <%}%>
                </option>
                <%if ((month + 2) <= 11 ) {%>
                <option value="<%=monthNames[month+2]%>"><%=monthNames[month+2]%>
                        <%}else{
                    if(loopMonth == -1)
                        loopMonth = 0;
                %>
                <option value="<%=monthNames[loopMonth]%>"><%=monthNames[loopMonth++]%>
                    <%}%>
                </option>
                <%if ((month + 3) <= 11) {%>
                <option value="<%=monthNames[month+3]%>"><%=monthNames[month+3]%>
                        <%}else{
                    if(loopMonth == -1)
                        loopMonth = 0;
                %>
                <option value="<%=monthNames[loopMonth]%>"><%=monthNames[loopMonth++]%>
                    <%}%>
                </option>
                <%if ((month + 4) <= 11) {%>
                <option value="<%=monthNames[month+4]%>"><%=monthNames[month+4]%>
                        <%}else{
                    if(loopMonth == -1)
                        loopMonth = 0;
                %>
                <option value="<%=monthNames[loopMonth]%>"><%=monthNames[loopMonth++]%>
                    <%}%>
                </option>
                <%if ((month + 5) <= 11) {%>
                <option value="<%=monthNames[month+5]%>"><%=monthNames[month+5]%>
                        <%}else{
                    if(loopMonth == -1)
                        loopMonth = 0;
                %>
                <option value="<%=monthNames[loopMonth]%>"><%=monthNames[loopMonth]%>
                    <%}%>
                </option>

            </select>

        </div>

        <div class="input-field col s12 m3 push-m3">
            <select name="year" required>
                <option value="" disabled selected>Choose Year</option>
                <option value="<%= year%>"><%= year%>
                </option>
                <option value="<%= year%>"><%= year + 1%>
                </option>

            </select>

        </div>
    </div>
    <div class="row">
        <div class="col push-m5">
            <button class="btn btn-large waves-effect waves-light " type="submit" name="requestFor"
                    value="create_edition">Create / Edit
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col push-m5">
            <button style="margin-left: 35px;" class="btn btn-large waves-effect waves-light "
                    name="requestFor"
                    value="view_edition"> Preview
                <i class="material-icons right">airplay</i>
            </button>
        </div>
    </div>
</form>
<br/>

</body>
<SCRIPT type="text/javascript" src="materialize/js/jquery.js"></SCRIPT>
<SCRIPT type="text/javascript" src="materialize/js/materialize.min.js"></SCRIPT>

<script>
    $(document).ready(function () {
        $('select').material_select();
    });

</script>

</html>
