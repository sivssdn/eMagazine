<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("X-Frame-Options", "DENY");
    response.addHeader("X-Content-Type-Options", "nosniff");
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0");
    response.addHeader("Pragma", "no-cache");
    response.addDateHeader("Expires", 0);

    if (session.getAttribute("email") != null) {
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "createEdition.jsp");
    }

%>
<html>
<head>
    <title>Login</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="images/icon/android-icon-192x192.png">
    <link rel="manifest" href="images/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">


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
<div class="container" style="width: 25em;">
    <% if (request.getParameter("message") != null) {%>
    <div class="row">
        <div class="col m10 push-m3">
            <h5 class="light red-text "><%= request.getParameter("message") %>
            </h5>
        </div>
    </div>
    <%}%>
    <div class="card blue-grey darken-1">
        <div class="card-content white-text">
            <center><span class="card-title">Login</span></center>
            <p>
            <form action="userControl.jsp" method="post">
                <div class="row">
                    <div class="input-field">
                        <i class="material-icons prefix">perm_identity</i>
                        <input name="email" id="email" type="email" class="validate" required autofocus>
                        <label for="email">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field">
                        <i class="material-icons prefix">vpn_key</i>
                        <input name="password" id="password" type="password" class="validate" required>
                        <label for="password">Password</label>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <button class="btn waves-effect waves-light" type="submit" name="requestFor" value="login">
                            Submit
                        </button>
                    </center>
                </div>
            </form>
        </div>
        </p>

        </center>
    </div>
</div>
</div>



</body>
<SCRIPT type="text/javascript" src="materialize/js/jquery.js"></SCRIPT>
<SCRIPT type="text/javascript" src="materialize/js/materialize.min.js"></SCRIPT>
</html>
