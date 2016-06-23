<%@ page import="java.util.Calendar" %>
<%@ page import="process.General" %>
<%@ page import="process.NewsFeed" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("X-XSS-Protection", "1; mode=block");%>
<html>
<head>
    <title>Dashboard - News Feed</title>
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="180x180" href="images/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="images/icon/android-icon-192x192.png">
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
    <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>


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
            <a href="adminNewsFeed.jsp" class="brand-logo" style="margin-left: 10px">News Feed</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminEvents.jsp">Events</a></li>
                <li><a href="adminOtherStories.jsp">Other Stories</a></li>
                <li><a href="adminMiscellaneous.jsp"> Miscellaneous </a></li>
                <li><a href="adminMostReadArticles.jsp">Most Read Articles</a></li>
                <li><a href="adminAdvertisements.jsp">Advertisements</a></li>
            </ul>
        </div>
    </nav>
</div>
<br/><br/>

<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">News Feed 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">News Feed 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">News Feed 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">News Feed 4</a></li>
            <li class="tab col s3"><a href="#test5" style="color: #009688;">News Feed 5</a></li>
            <li class="tab col s3"><a href="#test6" style="color: #009688;">News Feed 6</a></li>
            <li class="tab col s3"><a href="#test7" style="color: #009688;">News Feed 7</a></li>
            <li class="tab col s3"><a href="#test8" style="color: #009688;">News Feed 8</a></li>


        </ul>
    </div>


    <!-- News Feed Form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=1" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed1TitleEnglish" id="newsfeed1TitleEnglish" type="text">
                        <label for="newsfeed1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed1TitleKannada" id="newsfeed1TitleKannada" type="text">
                        <label for="newsfeed1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1Link',1);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed1Link" id="newsfeed1Link" type="text" onfocus="toggleDisable('newsfeed1Link',1);">
                        <label for="newsfeed1Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1ContentEnglish',1);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed1ContentEnglish"
                                  id="newsfeed1ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed1ContentEnglish',1);"></textarea>
                        <label for="newsfeed1ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1ContentKannada',1);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed1ContentKannada"
                                  id="newsfeed1ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed1ContentKannada',1);"></textarea>
                        <label for="newsfeed1ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed1uploadEnglish" onclick="toggleDisable(this.id,1);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed1FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed1uploadKannada" onclick="toggleDisable(this.id,1);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed1FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=2" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed2TitleEnglish" id="newsfeed2TitleEnglish" type="text">
                        <label for="newsfeed2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed2TitleKannada" id="newsfeed2TitleKannada" type="text">
                        <label for="newsfeed2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2Link',2);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed2Link" id="newsfeed2Link" type="text" onfocus="toggleDisable('newsfeed2Link',2);">
                        <label for="newsfeed2Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2ContentEnglish',2);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed2ContentEnglish"
                                  id="newsfeed2ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed2ContentEnglish',2);"></textarea>
                        <label for="newsfeed2ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2ContentKannada',2);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed2ContentKannada"
                                  id="newsfeed2ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed2ContentKannada',2);"></textarea>
                        <label for="newsfeed2ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed2uploadEnglish" onclick="toggleDisable(this.id,2);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed2FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed2uploadKannada" onclick="toggleDisable(this.id,2);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed2FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=3" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed3TitleEnglish" id="newsfeed3TitleEnglish" type="text">
                        <label for="newsfeed3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed3TitleKannada" id="newsfeed3TitleKannada" type="text">
                        <label for="newsfeed3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3Link',3);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed3Link" id="newsfeed3Link" type="text" onfocus="toggleDisable('newsfeed3Link',3);">
                        <label for="newsfeed3Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3ContentEnglish',3);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed3ContentEnglish"
                                  id="newsfeed3ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed3ContentEnglish',3);"></textarea>
                        <label for="newsfeed3ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3ContentKannada',3);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed3ContentKannada"
                                  id="newsfeed3ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed3ContentKannada',3);"></textarea>
                        <label for="newsfeed3ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed3uploadEnglish" onclick="toggleDisable(this.id,3);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed3FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed3uploadKannada" onclick="toggleDisable(this.id,3);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed3FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=4" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed4TitleEnglish" id="newsfeed4TitleEnglish" type="text">
                        <label for="newsfeed4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed4TitleKannada" id="newsfeed4TitleKannada" type="text">
                        <label for="newsfeed4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4Link',4);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed4Link" id="newsfeed4Link" type="text" onfocus="toggleDisable('newsfeed4Link',4);">
                        <label for="newsfeed4Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4ContentEnglish',4);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed4ContentEnglish"
                                  id="newsfeed4ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed4ContentEnglish',4);"></textarea>
                        <label for="newsfeed4ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4ContentKannada',4);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed4ContentKannada"
                                  id="newsfeed4ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed4ContentKannada',4);"></textarea>
                        <label for="newsfeed4ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed4uploadEnglish" onclick="toggleDisable(this.id,4);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed4FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed4uploadKannada" onclick="toggleDisable(this.id,4);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed4FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=5" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed5TitleEnglish" id="newsfeed5TitleEnglish" type="text">
                        <label for="newsfeed5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed5TitleKannada" id="newsfeed5TitleKannada" type="text">
                        <label for="newsfeed5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5Link',5);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed5Link" id="newsfeed5Link" type="text" onfocus="toggleDisable('newsfeed5Link',5);">
                        <label for="newsfeed5Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5ContentEnglish',5);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed5ContentEnglish"
                                  id="newsfeed5ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed5ContentEnglish',5);"></textarea>
                        <label for="newsfeed5ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5ContentKannada',5);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed5ContentKannada"
                                  id="newsfeed5ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed5ContentKannada',5);"></textarea>
                        <label for="newsfeed5ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed5uploadEnglish" onclick="toggleDisable(this.id,5);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed5FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed5uploadKannada" onclick="toggleDisable(this.id,5);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed5FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=6" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 6: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed6TitleEnglish" id="newsfeed6TitleEnglish" type="text">
                        <label for="newsfeed6TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed6TitleKannada" id="newsfeed6TitleKannada" type="text">
                        <label for="newsfeed6TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6Link',6);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed6Link" id="newsfeed6Link" type="text" onfocus="toggleDisable('newsfeed6Link',6);">
                        <label for="newsfeed6Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6ContentEnglish',6);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed6ContentEnglish"
                                  id="newsfeed6ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed6ContentEnglish',6);"></textarea>
                        <label for="newsfeed6ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6ContentKannada',6);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed6ContentKannada"
                                  id="newsfeed6ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed6ContentKannada',6);"></textarea>
                        <label for="newsfeed6ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed6uploadEnglish" onclick="toggleDisable(this.id,6);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed6FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed6uploadKannada" onclick="toggleDisable(this.id,6);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed6FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=7" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 7: </span> <br/>
                    <div class="input-field col s12" >
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed7TitleEnglish" id="newsfeed7TitleEnglish" type="text">
                        <label for="newsfeed7TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed7TitleKannada" id="newsfeed7TitleKannada" type="text">
                        <label for="newsfeed7TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7Link',7);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed7Link" id="newsfeed7Link" type="text" onfocus="toggleDisable('newsfeed7Link',7);">
                        <label for="newsfeed7Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7ContentEnglish',7);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed7ContentEnglish"
                                  id="newsfeed7ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed7ContentEnglish',7);"></textarea>
                        <label for="newsfeed7ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7ContentKannada',7);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed7ContentKannada"
                                  id="newsfeed7ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed7ContentKannada',7);"></textarea>
                        <label for="newsfeed7ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed7uploadEnglish" onclick="toggleDisable(this.id,7);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed7FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed7uploadKannada" onclick="toggleDisable(this.id,7);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed7FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
            <form action="controller.jsp?requestFor=upload&upload=newsFeed&number=8" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> News Feed 8: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed8TitleEnglish" id="newsfeed8TitleEnglish" type="text">
                        <label for="newsfeed8TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed8TitleKannada" id="newsfeed8TitleKannada" type="text">
                        <label for="newsfeed8TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8Link',8);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed8Link" id="newsfeed8Link" type="text" onfocus="toggleDisable('newsfeed8Link',8);">
                        <label for="newsfeed8Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8ContentEnglish',8);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed8ContentEnglish"
                                  id="newsfeed8ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed8ContentEnglish',8);"></textarea>
                        <label for="newsfeed8ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8ContentKannada',8);">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="newsfeed8ContentKannada"
                                  id="newsfeed8ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed8ContentKannada',8);"></textarea>
                        <label for="newsfeed8ContentKannada">Content in Kannada</label>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed8uploadEnglish" onclick="toggleDisable(this.id,8);"><i class="material-icons left">perm_media</i>Upload English File
                            <input name="newsfeed8FileEnglish" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed8uploadKannada" onclick="toggleDisable(this.id,8);"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="newsfeed8FileKannada" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
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
</body>
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });

    var id;
    var newsNumber;
    function toggleDisable(id, newsNumber){
        var toggleElements = ["newsfeed"+newsNumber+"Link","newsfeed"+newsNumber+"ContentEnglish","newsfeed"+newsNumber+"ContentKannada","newsfeed"+newsNumber+"uploadEnglish","newsfeed"+newsNumber+"uploadKannada"];
        if(id == toggleElements[0]){
            for(var i=1; i<toggleElements.length; i++)
            {
                document.getElementById(toggleElements[i]).disabled = true;
                document.getElementById(toggleElements[i]).value = null;
                $("#"+toggleElements[3]).addClass("disabled");
                $("#"+toggleElements[4]).addClass("disabled");
                document.getElementsByName("newsfeed"+newsNumber+"FileEnglish")[0].value = null;
                document.getElementsByName("newsfeed"+newsNumber+"FileKannada")[0].value = null;
            }

            document.getElementById(toggleElements[0]).disabled = false;
        }else if(id == toggleElements[1] ||id == toggleElements[2]) {
            document.getElementById(toggleElements[0]).disabled = true;
            document.getElementById(toggleElements[0]).value = null;
            document.getElementById(toggleElements[3]).disabled = true;
            document.getElementById(toggleElements[3]).value = null;
            $("#"+toggleElements[3]).addClass("disabled");
            $("#"+toggleElements[4]).addClass("disabled");
            document.getElementsByName("newsfeed"+newsNumber+"FileEnglish")[0].value = null;
            document.getElementsByName("newsfeed"+newsNumber+"FileKannada")[0].value = null;


            document.getElementById(toggleElements[1]).disabled = false;
            document.getElementById(toggleElements[2]).disabled = false;
        }else if(id == toggleElements[3] || id == toggleElements[4]) {
            for(var i=0; i<3; i++)
            {
                document.getElementById(toggleElements[i]).disabled = true;
                document.getElementById(toggleElements[i]).value = null;
            }
            $("#"+toggleElements[3]).removeClass("disabled");
            $("#"+toggleElements[4]).removeClass("disabled");
        }


    }


    //for autofill content that's present already
    //for news feed
    var news_title = [];
    var news_title_kannada = [];
    var news_link = [];
    var news_link_kannada = [];
    var news_content = [];
    var news_content_kannada = [];

<%
        //TEMORARY
//session.setAttribute("area","mrc");
//----
        General escape = new General(); //to escape all the HTML inputs
        //to select the area
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

//for news feed

        NewsFeed news = new NewsFeed();
        List<NewsFeed> listOfAllNews = news.getNewsFeed(pageToDisplay, year, monthName, status);

                            for(int i=0; i< listOfAllNews.size(); i++){
                                NewsFeed singleNews = listOfAllNews.get(i);

                                out.print("news_title["+i+"]=\""+escape.escapeHtml(singleNews.getTitle())+"\" ;");
                                out.print("news_title_kannada["+i+"]=\""+escape.escapeHtml(singleNews.getTitleKannada())+"\" ;");
                                //out.print("news_link["+i+"]=\""+escape.escapeHtml(singleNews.getLink())+"\" ;");
                                //out.print("news_link_kannada["+i+"]=\""+escape.escapeHtml(singleNews.getLinkKannada())+"\" ;");
                                out.print("news_content_kannada["+i+"]=\""+escape.escapeHtml(singleNews.getContentKannada())+"\" ;");
                                out.print("news_content["+i+"]=\""+escape.escapeHtml(singleNews.getContent())+"\" ;");
                            }



%>
        function addto_newsfeed(){
        for (var i=0; i<8; i++){
            if(news_title[i] != undefined)
                document.getElementById("newsfeed"+(i+1)+"TitleEnglish").value = news_title[i];
            if(news_title_kannada[i] != undefined)
                document.getElementById("newsfeed"+(i+1)+"TitleKannada").value = news_title_kannada[i];
            if(news_link[i] != undefined)
                document.getElementById("newsfeed"+(i+1)+"Link").value = news_link[i];
            if(news_content[i] != undefined)
                document.getElementById("newsfeed"+(i+1)+"ContentEnglish").value = news_content[i];
            if(news_content_kannada[i] != undefined)
                document.getElementById("newsfeed"+(i+1)+"ContentKannada").value = news_content_kannada[i];
            if(news_link[i] != undefined)
                document.getElementsByClassName("file-path validate")[i].value = news_link[i];
            if(news_link_kannada[i] != undefined)
                document.getElementsByClassName("file-path validate")[i+1].value = news_link_kannada[i];
        }
    }
    addto_newsfeed();
</script>
</html>