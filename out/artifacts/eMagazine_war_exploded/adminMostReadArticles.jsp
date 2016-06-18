<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("X-XSS-Protection", "1; mode=block");%>
<html>
<head>
    <title>Dashboard - Most Read Articles</title>
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

<center><h4> MOST READ ARTICLES </h4></center>
<br/>

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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=1" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article1TitleEnglish" id="article1TitleEnglish" type="text" length="64">
                        <label for="article1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article1TitleKannada" id="article1TitleKannada" type="text" length="64">
                        <label for="article1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article1Link',1);">
                        <i class="material-icons prefix">language</i>
                        <input name="article1Link" id="article1Link" type="text" length="64" onfocus="toggleDisable('article1Link',1);">
                        <label for="article1Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article1upload" onclick="toggleDisable(this.id,1);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=2" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article2TitleEnglish" id="article2TitleEnglish" type="text" length="64">
                        <label for="article2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article2TitleKannada" id="article2TitleKannada" type="text" length="64">
                        <label for="article2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article2Link',2);">
                        <i class="material-icons prefix">language</i>
                        <input name="article2Link" id="article2Link" type="text" length="64" onfocus="toggleDisable('article2Link',2);">
                        <label for="article2Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article2upload" onclick="toggleDisable(this.id,2);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=3" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article3TitleEnglish" id="article3TitleEnglish" type="text" length="64">
                        <label for="article3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article3TitleKannada" id="article3TitleKannada" type="text" length="64">
                        <label for="article3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article3Link',3);">
                        <i class="material-icons prefix">language</i>
                        <input name="article3Link" id="article3Link" type="text" length="64" onfocus="toggleDisable('article3Link',3);">
                        <label for="article3Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article3upload" onclick="toggleDisable(this.id,3);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=4" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article4TitleEnglish" id="article4TitleEnglish" type="text" length="64">
                        <label for="article4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article4TitleKannada" id="article4TitleKannada" type="text" length="64">
                        <label for="article4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article4Link',4);">
                        <i class="material-icons prefix">language</i>
                        <input name="article4Link" id="article4Link" type="text" length="64" onfocus="toggleDisable('article4Link',4);">
                        <label for="article4Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article4upload" onclick="toggleDisable(this.id,4);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=5" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article5TitleEnglish" id="article5TitleEnglish" type="text" length="64">
                        <label for="article5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article5TitleKannada" id="article5TitleKannada" type="text" length="64">
                        <label for="article5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article5Link',5);">
                        <i class="material-icons prefix">language</i>
                        <input name="article5Link" id="article5Link" type="text" length="64" onfocus="toggleDisable('article5Link',5);">
                        <label for="article5Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article5upload" onclick="toggleDisable(this.id,5);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=6" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 6: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article6TitleEnglish" id="article6TitleEnglish" type="text" length="64">
                        <label for="article6TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article6TitleKannada" id="article6TitleKannada" type="text" length="64">
                        <label for="article6TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article6Link',6);">
                        <i class="material-icons prefix">language</i>
                        <input name="article6Link" id="article6Link" type="text" length="64" onfocus="toggleDisable('article6Link',6);">
                        <label for="article6Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article6upload" onclick="toggleDisable(this.id,6);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=7" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 7: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article7TitleEnglish" id="article7TitleEnglish" type="text" length="64">
                        <label for="article7TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article7TitleKannada" id="article7TitleKannada" type="text" length="64">
                        <label for="article7TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article7Link',7);">
                        <i class="material-icons prefix">language</i>
                        <input name="article7Link" id="article7Link" type="text" length="64" onfocus="toggleDisable('article7Link',7);">
                        <label for="article7Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article7upload" onclick="toggleDisable(this.id,7);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=mostReadArticles&number=8" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 8: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article8TitleEnglish" id="article8TitleEnglish" type="text" length="64">
                        <label for="article8TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article8TitleKannada" id="article8TitleKannada" type="text" length="64">
                        <label for="article8TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article8Link',8);">
                        <i class="material-icons prefix">language</i>
                        <input name="article8Link" id="article8Link" type="text" length="64" onfocus="toggleDisable('article8Link',8);">
                        <label for="article8Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article8upload" onclick="toggleDisable(this.id,8);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=9" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 9: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article9TitleEnglish" id="article9TitleEnglish" type="text" length="64">
                        <label for="article9TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article9TitleKannada" id="article9TitleKannada" type="text" length="64">
                        <label for="article9TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article9Link',9);">
                        <i class="material-icons prefix">language</i>
                        <input name="article9Link" id="article9Link" type="text" length="64" onfocus="toggleDisable('article9Link',9);">
                        <label for="article9Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article9upload" onclick="toggleDisable(this.id,9);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
            <form action="controller.jsp?requestFor=upload&&upload=mostReadArticles&&number=10" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Article 10: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article10TitleEnglish" id="article10TitleEnglish" type="text" length="64">
                        <label for="article10TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="article10TitleKannada" id="article10TitleKannada" type="text" length="64">
                        <label for="article10TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12" onclick="toggleDisable('article10Link',10);">
                        <i class="material-icons prefix">language</i>
                        <input name="article10Link" id="article10Link" type="text" length="64" onfocus="toggleDisable('article10Link',10);">
                        <label for="article10Link">Link</label>
                    </div>
                </div>
                <div class="file-field input-field col s12">
                    <a class="btn" id="article10upload" onclick="toggleDisable(this.id,10);"><i class="material-icons left">perm_media</i>Upload File
                        <input name="misc1File" type="file">
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
        var toggleElements = ["article"+articleNumber+"Link","article"+articleNumber+"upload"];
        if(id == toggleElements[0]){
            $("#"+toggleElements[1]).addClass("disabled");
            document.getElementById(toggleElements[0]).disabled = false;
            document.getElementsByName("misc1File")[articleNumber-1].value = null; //reset the file input
        }else if(id == toggleElements[1]){
            $("#"+toggleElements[1]).removeClass("disabled");
            document.getElementById(toggleElements[0]).value = null;
            document.getElementById(toggleElements[0]).disabled = true;
        }
    }

</script>

</html>