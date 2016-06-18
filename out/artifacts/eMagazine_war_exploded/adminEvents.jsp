<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Events</title>
    <SCRIPT type="text/javascript" src="materialize/js/jquery.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="materialize/js/materialize.min.js"></SCRIPT>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
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

<center><h4> EVENTS </h4></center>
<br/>


<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Event 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Event 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Event 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Event 4</a></li>
            <li class="tab col s3"><a href="#test5" style="color: #009688;">Event 5</a></li>
        </ul>
    </div>

    <!-- Events form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=event&number=1" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Event 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event1TitleEnglish" id="event1TitleEnglish" value="bvb" type="text" length="64">
                        <label for="event1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event1TitleKannada" id="event1TitleKannada" type="text" length="64">
                        <label for="event1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="event1ContentEnglish" id="event1ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event1ContentKannada" id="event1ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="event1Image" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light indigo" type="submit">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </center>
            </form>
        </div>
    </div>

    <div id="test2" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=event&number=2" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Event 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event2TitleEnglish" id="event2TitleEnglish" type="text" length="64">
                        <label for="event2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event2TitleKannada" id="event2TitleKannada" type="text" length="64">
                        <label for="event2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="event2ContentEnglish" id="event2ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event2ContentKannada" id="event2ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="event2Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=event&number=3" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Event 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event3TitleEnglish" id="event3TitleEnglish" type="text" length="64">
                        <label for="event3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event3TitleKannada" id="event3TitleKannada" type="text" length="64">
                        <label for="event3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="event3ContentEnglish" id="event3ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event3ContentKannada" id="event3ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="event3Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=event&number=4" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Event 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event4TitleEnglish" id="event4TitleEnglish" type="text" length="64">
                        <label for="event4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event4TitleKannada" id="event4TitleKannada" type="text" length="64">
                        <label for="event4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="event4ContentEnglish" id="event4ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event4ContentKannada" id="event4ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="event4Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=event&number=5" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Event 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event5TitleEnglish" id="event5TitleEnglish" type="text" length="64">
                        <label for="event5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event5TitleKannada" id="event5TitleKannada" type="text" length="64">
                        <label for="event5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="event5ContentEnglish" id="event5ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event5ContentKannada" id="event5ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="event5Image" type="file">
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
</html>