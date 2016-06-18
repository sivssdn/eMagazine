<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<center><h4> OTHER STORIES </h4></center>
<br/>

<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Story 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Story 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Story 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Story 4</a></li>
            <li class="tab col s3"><a href="#test5" style="color: #009688;">Story 5</a></li>

        </ul>
    </div>


    <!-- Other Stories form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp?requestFor=upload&upload=stories&number=1" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story1TitleEnglish" id="story1TitleEnglish" type="text" length="64">
                        <label for="story1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story1TitleKannada" id="story1TitleKannada" type="text" length="64">
                        <label for="story1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="story1ContentEnglish" id="story1ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="story1ContentKannada" id="story1ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story1Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=2" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story2TitleEnglish" id="story2TitleEnglish" type="text" length="64">
                        <label for="story2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story2TitleKannada" id="story2TitleKannada" type="text" length="64">
                        <label for="story2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="story2ContentEnglish" id="story2ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="story2ContentKannada" id="story2ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story2Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=3" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story3TitleEnglish" id="story3TitleEnglish" type="text" length="64">
                        <label for="story3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story3TitleKannada" id="story3TitleKannada" type="text" length="64">
                        <label for="story3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="story3ContentEnglish" id="story3ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="story3ContentKannada" id="story3ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story3Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=4" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story4TitleEnglish" id="story4TitleEnglish" type="text" length="64">
                        <label for="story4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story4TitleKannada" id="story4TitleKannada" type="text" length="64">
                        <label for="story4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="story4ContentEnglish" id="story4ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="story4ContentKannada" id="story4ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story4Image" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=5" method="post" enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story5TitleEnglish" id="story5TitleEnglish" type="text" length="64">
                        <label for="story5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story5TitleKannada" id="story5TitleKannada" type="text" length="64">
                        <label for="story5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="story5ContentEnglish" id="story5ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="story5ContentKannada" id="story5ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story5Image" type="file">
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