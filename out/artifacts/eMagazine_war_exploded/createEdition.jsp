<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("X-XSS-Protection", "1; mode=block");%>
<html>
<head>
    <title>Dashboard</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="images/icon/android-icon-192x192.png">
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

<!-- Button containing logout, view previous editions and view editions in process-->
<div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large" style="color: #009688;">
        <i class="material-icons">menu</i>
    </a>
    <ul>
        <li><a class="btn-floating tooltipped red" data-position="top" data-delay="50" data-tooltip="Previous Editions"><i
                class="material-icons">done</i></a></li>
        <li><a class="btn-floating tooltipped green" data-position="top" data-delay="50"
               data-tooltip="Editions In Process"><i class="material-icons">loop</i></a></li>
        <li><a class="btn-floating tooltipped blue" data-position="top" data-delay="50" data-tooltip="Logout"><i
                class="material-icons">power_settings_new</i></a></li>
    </ul>
</div>

<!-- Create new edition -->
<div class="row">
    <div class="col">
        <i class="material-icons left" style="color: black; margin-top: 0.5em; margin-left: 0.25em;">add</i>
        <div class="col">
            <h5>Create New Edition</h5>
        </div>
    </div>
</div>
<div class="divider"></div>
<br/>



<% if(request.getParameter("error") != null) {%>
<div class="row">
    <div class="col m10 push-m5">
        <h5 class="light red-text "><%= request.getParameter("error") %></h5>
    </div>
</div>


<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
<%}%>
<form action="controller.jsp" method="get">
<div class="row">


            <%
                //get current month
                String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                        "August", "September", "October", "November", "December" };
                Calendar now = Calendar.getInstance();
                int month = now.get(Calendar.MONTH);
                int year = now.get(Calendar.YEAR);

            %>

         <div class="input-field col s12 m3 push-m3">
            <select name="month" required>
                <option value="" disabled selected>Choose Month</option>
                <option value="<%=monthNames[month]%>"><%=monthNames[month]%></option>
                <option value="<%=monthNames[month+1]%>"><%=monthNames[month+1]%></option>
                <option value="<%=monthNames[month+2]%>"><%=monthNames[month+2]%></option>
                <option value="<%=monthNames[month+3]%>"><%=monthNames[month+3]%></option>
                <option value="<%=monthNames[month+4]%>"><%=monthNames[month+4]%></option>
                <option value="<%=monthNames[month+5]%>"><%=monthNames[month+5]%></option>
            </select>

        </div>

        <div class="input-field col s12 m3 push-m3">
            <select name="year" required>
                <option value="" disabled selected>Choose Year</option>
                <option value="<%= year%>"><%= year%></option>
                <option value="<%= year%>"><%= year+1%></option>

            </select>

        </div>
</div>
        <div class="row">
            <div class="col push-m5">
            <button class="btn btn-large waves-effect waves-light " type="submit" name="requestFor" value="create_edition">CREATE
                <i class="material-icons right">send</i>
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
