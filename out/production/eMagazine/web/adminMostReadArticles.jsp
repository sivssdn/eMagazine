<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="process.MostReadArticles" %>
<%@ page import="java.util.List" %>
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
    <title>Dashboard - Most Read Articles</title>
    <title>Dashboard - News Feed</title>
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

<div class="container">
    <nav>
        <div class="nav-wrapper" style="background-color: #795548;">
            <a href="adminMostReadArticles.jsp" class="brand-logo" style="margin-left: 10px">Most Read Articles</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminEvents.jsp">Events</a></li>
                <li><a href="adminNewsFeed.jsp">News Feed</a></li>
                <li><a href="adminOtherStories.jsp">Other Stories</a></li>
                <li><a href="adminMiscellaneous.jsp"> Miscellaneous </a></li>
                <li><a href="adminAdvertisements.jsp">Advertisements</a></li>
            </ul>
        </div>
    </nav>
</div>
<br/><br/>

<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Article 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Article 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Article 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Article 4</a></li>
            <li class="tab col s3"><a href="#test5" style="color: #009688;">Article 5</a></li>
            <li class="tab col s3"><a href="#test6" style="color: #009688;">Article 6</a></li>
            <li class="tab col s3"><a href="#test7" style="color: #009688;">Article 7</a></li>
            <li class="tab col s3"><a href="#test8" style="color: #009688;">Article 8</a></li>
            <li class="tab col s3"><a href="#test9" style="color: #009688;">Article 9</a></li>
            <li class="tab col s3"><a href="#test10" style="color: #009688;">Article 10</a></li>

        </ul>
    </div>


    <!-- Most read articles form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=1" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article1TitleEnglish" id="article1TitleEnglish" type="text">
                        <label for="article1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article1TitleKannada" id="article1TitleKannada" type="text">
                        <label for="article1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article1Link',1);">
                        <i class="material-icons prefix">language</i>
                        <input name="article1Link" id="article1Link" type="text"
                               onfocus="toggleDisable('article1Link',1);">
                        <label for="article1Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article1uploadEnglish" onclick="toggleDisable(this.id,1);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead1FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article1uploadKannada" onclick="toggleDisable(this.id,1);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead1FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=2" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article2TitleEnglish" id="article2TitleEnglish" type="text">
                        <label for="article2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article2TitleKannada" id="article2TitleKannada" type="text">
                        <label for="article2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article2Link',2);">
                        <i class="material-icons prefix">language</i>
                        <input name="article2Link" id="article2Link" type="text"
                               onfocus="toggleDisable('article2Link',2);">
                        <label for="article2Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article2uploadEnglish" onclick="toggleDisable(this.id,2);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead2FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article2uploadKannada" onclick="toggleDisable(this.id,2);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead2FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=3" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article3TitleEnglish" id="article3TitleEnglish" type="text">
                        <label for="article3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article3TitleKannada" id="article3TitleKannada" type="text">
                        <label for="article3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article3Link',3);">
                        <i class="material-icons prefix">language</i>
                        <input name="article3Link" id="article3Link" type="text"
                               onfocus="toggleDisable('article3Link',3);">
                        <label for="article3Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article3uploadEnglish" onclick="toggleDisable(this.id,3);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead3FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article3uploadKannada" onclick="toggleDisable(this.id,3);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead3FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=4" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article4TitleEnglish" id="article4TitleEnglish" type="text">
                        <label for="article4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article4TitleKannada" id="article4TitleKannada" type="text">
                        <label for="article4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article4Link',4);">
                        <i class="material-icons prefix">language</i>
                        <input name="article4Link" id="article4Link" type="text"
                               onfocus="toggleDisable('article4Link',4);">
                        <label for="article4Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article4uploadEnglish" onclick="toggleDisable(this.id,4);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead4FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article4uploadKannada" onclick="toggleDisable(this.id,4);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead4FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test5" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=5" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article5TitleEnglish" id="article5TitleEnglish" type="text">
                        <label for="article5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article5TitleKannada" id="article5TitleKannada" type="text">
                        <label for="article5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article5Link',5);">
                        <i class="material-icons prefix">language</i>
                        <input name="article5Link" id="article5Link" type="text"
                               onfocus="toggleDisable('article5Link',5);">
                        <label for="article5Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article5uploadEnglish" onclick="toggleDisable(this.id,5);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead5FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article5uploadKannada" onclick="toggleDisable(this.id,5);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead5FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test6" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=6" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 6: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article6TitleEnglish" id="article6TitleEnglish" type="text">
                        <label for="article6TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article6TitleKannada" id="article6TitleKannada" type="text">
                        <label for="article6TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article6Link',6);">
                        <i class="material-icons prefix">language</i>
                        <input name="article6Link" id="article6Link" type="text"
                               onfocus="toggleDisable('article6Link',6);">
                        <label for="article6Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article6uploadEnglish" onclick="toggleDisable(this.id,6);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead6FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article6uploadKannada" onclick="toggleDisable(this.id,6);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead6FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test7" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=7" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 7: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article7TitleEnglish" id="article7TitleEnglish" type="text">
                        <label for="article7TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article7TitleKannada" id="article7TitleKannada" type="text">
                        <label for="article7TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article7Link',7);">
                        <i class="material-icons prefix">language</i>
                        <input name="article7Link" id="article7Link" type="text"
                               onfocus="toggleDisable('article7Link',7);">
                        <label for="article7Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article7uploadEnglish" onclick="toggleDisable(this.id,7);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead7FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article7uploadKannada" onclick="toggleDisable(this.id,7);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead7FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test8" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=mostReadArticles&number=8" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 8: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article8TitleEnglish" id="article8TitleEnglish" type="text">
                        <label for="article8TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article8TitleKannada" id="article8TitleKannada" type="text">
                        <label for="article8TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article8Link',8);">
                        <i class="material-icons prefix">language</i>
                        <input name="article8Link" id="article8Link" type="text"
                               onfocus="toggleDisable('article8Link',8);">
                        <label for="article8Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article8uploadEnglish" onclick="toggleDisable(this.id,8);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead8FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article8uploadKannada" onclick="toggleDisable(this.id,8);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead8FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test9" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=9" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 9: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article9TitleEnglish" id="article9TitleEnglish" type="text">
                        <label for="article9TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article9TitleKannada" id="article9TitleKannada" type="text">
                        <label for="article9TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article9Link',9);">
                        <i class="material-icons prefix">language</i>
                        <input name="article9Link" id="article9Link" type="text"
                               onfocus="toggleDisable('article9Link',9);">
                        <label for="article9Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article9uploadEnglish" onclick="toggleDisable(this.id,9);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead9FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article9uploadKannada" onclick="toggleDisable(this.id,9);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead9FileKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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

    <div id="test10" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=10" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 10: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article10TitleEnglish" id="article10TitleEnglish" type="text">
                        <label for="article10TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article10TitleKannada" id="article10TitleKannada" type="text">
                        <label for="article10TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article10Link',10);">
                        <i class="material-icons prefix">language</i>
                        <input name="article10Link" id="article10Link" type="text"
                               onfocus="toggleDisable('article10Link',10);">
                        <label for="article10Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article10uploadEnglish" onclick="toggleDisable(this.id,10);"><i
                            class="material-icons left">perm_media</i>Upload File English
                        <input name="mostRead10FileEnglish" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article10uploadKannada" onclick="toggleDisable(this.id,10);"><i
                            class="material-icons left">perm_media</i>Upload File Kannada
                        <input name="mostRead10FileEnglishKannada" type="file">
                    </a>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
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
        <li><a href="createEdition.jsp" class="btn-floating tooltipped blue" data-position="top" data-delay="50"
               data-tooltip="Home"><i
                class="material-icons">store</i></a></li>

        <li><a href="userControl.jsp?requestFor=logout" class="btn-floating tooltipped red" data-position="top"
               data-delay="50" data-tooltip="Logout"><i
                class="material-icons">power_settings_new</i></a></li>
    </ul>
</div>

</body>
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });

    var id;
    var articleNumber;
    function toggleDisable(id, articleNumber) {
        var toggleElements = ["article" + articleNumber + "Link", "article" + articleNumber + "uploadEnglish", "article" + articleNumber + "uploadKannada"];
        if (id == toggleElements[0]) {
            $("#" + toggleElements[1]).addClass("disabled");
            document.getElementsByName("mostRead" + articleNumber + "FileEnglish")[0].value = null; //reset the file input$
            $("#" + toggleElements[2]).addClass("disabled");
            document.getElementsByName("mostRead" + articleNumber + "FileKannada")[0].value = null; //reset the file input

            document.getElementById(toggleElements[0]).disabled = false;
        } else if (id == toggleElements[1] || id == toggleElements[2]) {
            document.getElementById(toggleElements[0]).value = null;
            document.getElementById(toggleElements[0]).disabled = true;

            $("#" + toggleElements[1]).removeClass("disabled");
            $("#" + toggleElements[2]).removeClass("disabled");
        }
    }
    //for most read articles
    var recent_article_title = [];
    var recent_article_title_kannada = [];
    var recent_article_link = [];
    var recent_article_link_kannada = [];

    <%


            //to select the area

        String pageToDisplay = session.getAttribute("area").toString();
        String monthName = session.getAttribute("month").toString();
        int year = Integer.parseInt(session.getAttribute("year").toString());
/*
            String pageToDisplay = "mrc";
            int isDistrict = 0;
            int isUlb = 0;
            if(escape.escapeHtml(request.getParameter("district")) != null ){
                pageToDisplay = escape.escapeHtml(request.getParameter("district"));
                isDistrict = 1;
            }else if(escape.escapeHtml(request.getParameter("ulb")) != null){
                pageToDisplay = escape.escapeHtml(request.getParameter("ulb"));
                isUlb = 1;
            }

            //get status=approved for clients
            //status=editing for preview purposes
            String status = "editing";

            //get month

            String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                    "August", "September", "October", "November", "December" };
            Calendar now = Calendar.getInstance();
            String monthName = monthNames[now.get(Calendar.MONTH)];
            int year = now.get(Calendar.YEAR);
            if(escape.escapeHtml(request.getParameter("month")) != null && escape.escapeHtml(request.getParameter("year")) != null)
            {
                monthName = escape.escapeHtml(request.getParameter("month"));
                year =  Integer.parseInt(request.getParameter("year"));
            }
*/
            //get status=approved for clients
            //status=editing for preview purposes
            String status = "editing";

            //for most read articles
             MostReadArticles recent = new MostReadArticles();
             List<MostReadArticles> allRecentArticles = recent.getAllRecentArticles(pageToDisplay, monthName, year, status);

                             for(int i=0; i<allRecentArticles.size(); i++)
                             {
                                    MostReadArticles article = allRecentArticles.get(i);

                                    out.print("recent_article_title["+i+"] = \""+ StringEscapeUtils.escapeJavaScript(article.getTitle()) +"\";");
                                    out.print("recent_article_title_kannada["+i+"] = \""+ StringEscapeUtils.escapeJavaScript(article.getTitleKannada()) +"\";");
                                   // out.print("recent_article_link["+i+"] = \""+ article.getLink() +"\";");
                                   // out.print("recent_article_link_kannada["+i+"] = \""+ article.getLinkKannada() +"\";");
                             }


    %>
    function addto_mostRead() {
        for (var i = 0; i < 10; i++) {
            if (recent_article_title[i] != undefined)
                document.getElementById("article" + (i + 1) + "TitleEnglish").value = recent_article_title[i];

            if (recent_article_title_kannada[i] != undefined)
                document.getElementById("article" + (i + 1) + "TitleKannada").value = recent_article_title_kannada[i];

        }

    }
    addto_mostRead();
</script>

</html>