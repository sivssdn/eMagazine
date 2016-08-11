<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
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
    <SCRIPT type="text/javascript" src="materialize/js/jquery.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="materialize/js/materialize.min.js"></SCRIPT>
    <link href="materialize/css/materialize.min.css" type="text/css" rel="STYLESHEET"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <script>
        $(document).ready(function () {
            $('select').material_select();
        });
    </script>

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

<div class="container">
    <nav>
        <div class="nav-wrapper" style="background-color: #795548;">
            <a href="adminAdvertisements.jsp" class="brand-logo" style="margin-left: 10px">Advertisements</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminEvents.jsp">Events</a></li>
                <li><a href="adminNewsFeed.jsp">News Feed</a></li>
                <li><a href="adminOtherStories.jsp">Other Stories</a></li>
                <li><a href="adminMiscellaneous.jsp"> Miscellaneous </a></li>
                <li><a href="adminMostReadArticles.jsp">Most Read Articles</a></li>
            </ul>
        </div>
    </nav>
</div>
<br/><br/>


<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Advertisement 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Advertisement 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Advertisement 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Advertisement 4</a></li>
        </ul>
    </div>

    <!-- advertisements form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=advertisement&number=1" method="post"
                  enctype="multipart/form-data">
                <div class="rom">
                    <span style="font-size: 1.5em;"> Advertisement 1: </span> <br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="ad1Image" type="file" required>
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">language</i>
                        <input name="ad1Link" id="ad1Link" type="text">
                        <label for="ad1Link">Link</label>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

    <div id="test2" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=advertisement&number=2" method="post"
                  enctype="multipart/form-data">
                <div class="rom">
                    <span style="font-size: 1.5em;"> Advertisement 2: </span> <br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="ad2Image" type="file" required>
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">language</i>
                        <input name="ad2Link" id="ad2Link" type="text">
                        <label for="ad2Link">Link</label>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

    <div id="test3" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=advertisement&number=3" method="post"
                  enctype="multipart/form-data">
                <div class="rom">
                    <span style="font-size: 1.5em;"> Advertisement 3: </span> <br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="ad3Image" type="file" required>
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">language</i>
                        <input name="ad3Link" id="ad3Link" type="text">
                        <label for="ad3Link">Link</label>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

    <div id="test4" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=advertisement&number=4" method="post"
                  enctype="multipart/form-data">
                <div class="rom">
                    <span style="font-size: 1.5em;"> Advertisement 4: </span> <br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="ad4Image" type="file" required>
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">language</i>
                        <input name="ad4Link" id="ad4Link" type="text">
                        <label for="ad4Link">Link</label>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

</div>
<!-- Button containing logout and home -->
<div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large" style="color: #009688;">
        <i class="material-icons">menu</i>
    </a>
    <ul>
        <li><a href="createEdition.jsp" class="btn-floating tooltipped blue" data-position="top" data-delay="50" data-tooltip="Home"><i
                class="material-icons">store</i></a></li>

        <li><a href="userControl.jsp?requestFor=logout" class="btn-floating tooltipped red" data-position="top"
               data-delay="50" data-tooltip="Logout"><i
                class="material-icons">power_settings_new</i></a></li>
    </ul>
</div>

</body>
</html>