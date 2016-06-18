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

<center><h4> NEWS FEED </h4></center>
<br/>

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
                        <input name="newsfeed1TitleEnglish" id="newsfeed1TitleEnglish" type="text" length="64">
                        <label for="newsfeed1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed1TitleKannada" id="newsfeed1TitleKannada" type="text" length="64">
                        <label for="newsfeed1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1Link',1);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed1Link" id="newsfeed1Link" type="text" length="64" onfocus="toggleDisable('newsfeed1Link',1);">
                        <label for="newsfeed1Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1ContentEnglish',1);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed1ContentEnglish"
                                  id="newsfeed1ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed1ContentEnglish',1);"
                                  length="4096" ></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed1ContentKannada',1);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed1ContentKannada"
                                  id="newsfeed1ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed1ContentKannada',1);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed1upload" onclick="toggleDisable(this.id,1);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed1File" type="file">
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
                        <input name="newsfeed2TitleEnglish" id="newsfeed2TitleEnglish" type="text" length="64">
                        <label for="newsfeed2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed2TitleKannada" id="newsfeed2TitleKannada" type="text" length="64">
                        <label for="newsfeed2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2Link',2);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed2Link" id="newsfeed2Link" type="text" length="64" onfocus="toggleDisable('newsfeed2Link',2);">
                        <label for="newsfeed2Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2ContentEnglish',2);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed2ContentEnglish"
                                  id="newsfeed2ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed2ContentEnglish',2);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed2ContentKannada',2);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed2ContentKannada"
                                  id="newsfeed2ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed2ContentKannada',2);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed2upload" onclick="toggleDisable(this.id,2);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed2File" type="file">
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
                        <input name="newsfeed3TitleEnglish" id="newsfeed3TitleEnglish" type="text" length="64">
                        <label for="newsfeed3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed3TitleKannada" id="newsfeed3TitleKannada" type="text" length="64">
                        <label for="newsfeed3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3Link',3);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed3Link" id="newsfeed3Link" type="text" length="64" onfocus="toggleDisable('newsfeed3Link',3);">
                        <label for="newsfeed3Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3ContentEnglish',3);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed3ContentEnglish"
                                  id="newsfeed3ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed3ContentEnglish',3);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed3ContentKannada',3);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed3ContentKannada"
                                  id="newsfeed3ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed3ContentKannada',3);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed3upload" onclick="toggleDisable(this.id,3);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed3File" type="file">
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
                        <input name="newsfeed4TitleEnglish" id="newsfeed4TitleEnglish" type="text" length="64">
                        <label for="newsfeed4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed4TitleKannada" id="newsfeed4TitleKannada" type="text" length="64">
                        <label for="newsfeed4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4Link',4);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed4Link" id="newsfeed4Link" type="text" length="64" onfocus="toggleDisable('newsfeed4Link',4);">
                        <label for="newsfeed4Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4ContentEnglish',4);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed4ContentEnglish"
                                  id="newsfeed4ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed4ContentEnglish',4);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed4ContentKannada',4);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed4ContentKannada"
                                  id="newsfeed4ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed4ContentKannada',4);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed4upload" onclick="toggleDisable(this.id,4);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed4File" type="file">
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
                        <input name="newsfeed5TitleEnglish" id="newsfeed5TitleEnglish" type="text" length="64">
                        <label for="newsfeed5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed5TitleKannada" id="newsfeed5TitleKannada" type="text" length="64">
                        <label for="newsfeed5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5Link',5);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed5Link" id="newsfeed5Link" type="text" length="64" onfocus="toggleDisable('newsfeed5Link',5);">
                        <label for="newsfeed5Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5ContentEnglish',5);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed5ContentEnglish"
                                  id="newsfeed5ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed5ContentEnglish',5);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed5ContentKannada',5);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed5ContentKannada"
                                  id="newsfeed5ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed5ContentKannada',5);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed5upload" onclick="toggleDisable(this.id,5);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed5File" type="file">
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
                        <input name="newsfeed6TitleEnglish" id="newsfeed6TitleEnglish" type="text" length="64">
                        <label for="newsfeed6TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed6TitleKannada" id="newsfeed6TitleKannada" type="text" length="64">
                        <label for="newsfeed6TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6Link',6);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed6Link" id="newsfeed6Link" type="text" length="64" onfocus="toggleDisable('newsfeed6Link',6);">
                        <label for="newsfeed6Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6ContentEnglish',6);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed6ContentEnglish"
                                  id="newsfeed6ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed6ContentEnglish',6);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed6ContentKannada',6);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed6ContentKannada"
                                  id="newsfeed6ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed6ContentKannada',6);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed6upload" onclick="toggleDisable(this.id,6);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed6File" type="file">
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
                        <input name="newsfeed7TitleEnglish" id="newsfeed7TitleEnglish" type="text" length="64">
                        <label for="newsfeed7TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed7TitleKannada" id="newsfeed7TitleKannada" type="text" length="64">
                        <label for="newsfeed7TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7Link',7);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed7Link" id="newsfeed7Link" type="text" length="64" onfocus="toggleDisable('newsfeed7Link',7);">
                        <label for="newsfeed7Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7ContentEnglish',7);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed7ContentEnglish"
                                  id="newsfeed7ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed7ContentEnglish',7);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed7ContentKannada',7);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed7ContentKannada"
                                  id="newsfeed7ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed7ContentKannada',7);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed7upload" onclick="toggleDisable(this.id,7);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed7File" type="file">
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
                        <input name="newsfeed8TitleEnglish" id="newsfeed8TitleEnglish" type="text" length="64">
                        <label for="newsfeed8TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="newsfeed8TitleKannada" id="newsfeed8TitleKannada" type="text" length="64">
                        <label for="newsfeed8TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8Link',8);">
                        <i class="material-icons prefix">language</i>
                        <input name="newsfeed8Link" id="newsfeed8Link" type="text" length="64" onfocus="toggleDisable('newsfeed8Link',8);">
                        <label for="newsfeed8Link">Link</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8ContentEnglish',8);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="newsfeed8ContentEnglish"
                                  id="newsfeed8ContentEnglish"
                                  type="text" onfocus="toggleDisable('newsfeed8ContentEnglish',8);"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('newsfeed8ContentKannada',8);">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="newsfeed8ContentKannada"
                                  id="newsfeed8ContentKannada"
                                  type="text" onfocus="toggleDisable('newsfeed8ContentKannada',8);"
                                  length="4096"></textarea>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn" id="newsfeed8upload" onclick="toggleDisable(this.id,8);"><i class="material-icons left">perm_media</i>Upload File
                            <input name="newsfeed8File" type="file">
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
        var toggleElements = ["newsfeed"+newsNumber+"Link","newsfeed"+newsNumber+"ContentEnglish","newsfeed"+newsNumber+"ContentKannada","newsfeed"+newsNumber+"upload"];
            if(id == toggleElements[0]){
                for(var i=1; i<toggleElements.length; i++)
                    {
                        document.getElementById(toggleElements[i]).disabled = true;
                        document.getElementById(toggleElements[i]).value = null;
                        $("#"+toggleElements[i]).addClass("disabled");
                        document.getElementsByName("newsfeed"+newsNumber+"File")[0].value = null;
                    }
                document.getElementById(toggleElements[0]).disabled = false;
            }else if(id == toggleElements[1] ||id == toggleElements[2]) {
                document.getElementById(toggleElements[0]).disabled = true;
                document.getElementById(toggleElements[0]).value = null;
                document.getElementById(toggleElements[3]).disabled = true;
                document.getElementById(toggleElements[3]).value = null;
                $("#"+toggleElements[3]).addClass("disabled");
                document.getElementsByName("newsfeed"+newsNumber+"File")[0].value = null;

                document.getElementById(toggleElements[1]).disabled = false;
                document.getElementById(toggleElements[2]).disabled = false;
            }else if(id == toggleElements[3]) {
                for(var i=0; i<3; i++)
                {
                    document.getElementById(toggleElements[i]).disabled = true;
                    document.getElementById(toggleElements[i]).value = null;
                }
                $("#"+toggleElements[3]).removeClass("disabled");
            }


    }
</script>
</html>