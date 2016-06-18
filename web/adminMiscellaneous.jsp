<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
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

<center><h4> MISCELLANEOUS </h4></center>
<br/>

<div class="row">
    <div class="col s12">
        <ul class="tabs">
            <li class="tab col s3"><a class="active" href="#test1" style="color: #009688;">Miscellaneous 1</a></li>
            <li class="tab col s3"><a href="#test2" style="color: #009688;">Miscellaneous 2</a></li>
            <li class="tab col s3 "><a href="#test3" style="color: #009688;">Miscellaneous 3</a></li>
            <li class="tab col s3"><a href="#test4" style="color: #009688;">Miscellaneous 4</a></li>

        </ul>
    </div>


    <!-- Miscellaneous form -->
    <div id="test1" class="col s12">
        <br/><br/>
        <div class="container">
            <form action="controller.jsp" method="post">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc1TitleEnglish" id="misc1TitleEnglish" type="text" length="64">
                        <label for="misc1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc1TitleKannada" id="misc1TitleKannada" type="text" length="64">
                        <label for="misc1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="misc1ContentEnglish" id="misc1ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="misc1ContentKannada" id="misc1ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <div class="file-field input-field col s12">
                            <a class="btn"><i class="material-icons left">perm_media</i>Upload File
                                <input name="misc1File" type="file">
                            </a>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
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
            <form action="controller.jsp" method="post">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc2TitleEnglish" id="misc2TitleEnglish" type="text" length="64">
                        <label for="misc2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc2TitleKannada" id="misc2TitleKannada" type="text" length="64">
                        <label for="misc2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="misc2ContentEnglish" id="misc2ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="misc2ContentKannada" id="misc2ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <div class="file-field input-field col s12">
                            <a class="btn"><i class="material-icons left">perm_media</i>Upload File
                                <input name="misc2File" type="file">
                            </a>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
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
            <form action="controller.jsp" method="post">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc3TitleEnglish" id="misc3TitleEnglish" type="text" length="64">
                        <label for="misc3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc3TitleKannada" id="misc3TitleKannada" type="text" length="64">
                        <label for="misc3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="misc3ContentEnglish" id="misc3ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="misc3ContentKannada" id="misc3ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <div class="file-field input-field col s12">
                            <a class="btn"><i class="material-icons left">perm_media</i>Upload File
                                <input name="misc3File" type="file">
                            </a>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
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
            <form action="controller.jsp" method="post">
                <div class="row">
                    <span style="font-size: 1.5em;"> Miscellaneous 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc4TitleEnglish" id="misc4TitleEnglish" type="text" length="64">
                        <label for="misc4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="misc4TitleKannada" id="misc4TitleKannada" type="text" length="64">
                        <label for="misc4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in English" name="misc4ContentEnglish" id="misc4ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="misc4ContentKannada" id="misc4ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <div class="file-field input-field col s12">
                            <a class="btn"><i class="material-icons left">perm_media</i>Upload File
                                <input name="misc4File" type="file">
                            </a>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
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