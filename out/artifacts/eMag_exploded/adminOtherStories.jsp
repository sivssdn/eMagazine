<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="process.Stories" %>
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
    <title>Dashboard</title>
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
            <a href="adminOtherStories.jsp" class="brand-logo" style="margin-left: 10px">Other Stories</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminEvents.jsp">Events</a></li>
                <li><a href="adminNewsFeed.jsp">News Feed</a></li>
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=1" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 1: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story1TitleEnglish" id="story1TitleEnglish" type="text">
                        <label for="story1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story1TitleKannada" id="story1TitleKannada" type="text">
                        <label for="story1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea id="story1ContentEnglish" minlength="100" name="story1ContentEnglish"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story1ContentEnglish">Content in English</label>
                    </div>
                    <!--<div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea  name="story1ContentKannada" id="story1ContentKannada" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story1ContentKannada">Content in Kannada</label>
                    </div>-->
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story1Image" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="story1Link" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=2" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 2: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story2TitleEnglish" id="story2TitleEnglish" type="text">
                        <label for="story2TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story2TitleKannada" id="story2TitleKannada" type="text">
                        <label for="story2TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea name="story2ContentEnglish" id="story2ContentEnglish" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story2ContentEnglish">Content in English</label>
                    </div>
                    <!--<div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea  name="story2ContentKannada" id="story2ContentKannada" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story2ContentKannada">Content in Kannada</label>
                    </div>-->
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story2Image" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="story2Link" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=3" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 3: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story3TitleEnglish" id="story3TitleEnglish" type="text">
                        <label for="story3TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story3TitleKannada" id="story3TitleKannada" type="text">
                        <label for="story3TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea name="story3ContentEnglish" id="story3ContentEnglish" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story3ContentEnglish">Content in English</label>
                    </div>
                    <!--<div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea  name="story3ContentKannada" id="story3ContentKannada" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story3ContentKannada">Content in Kannada</label>
                    </div>-->
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story3Image" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="story3Link" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=4" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 4: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story4TitleEnglish" id="story4TitleEnglish" type="text">
                        <label for="story4TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story4TitleKannada" id="story4TitleKannada" type="text">
                        <label for="story4TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea name="story4ContentEnglish" id="story4ContentEnglish" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story4ContentEnglish">Content in English</label>
                    </div>
                    <!--<div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea  name="story4ContentKannada" id="story4ContentKannada" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story4ContentKannada">Content in Kannada</label>
                    </div>-->
                    <br/><br/>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Image
                            <input name="story4Image" type="file">
                        </a>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                    <div class="file-field input-field col s12">
                        <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                            <input name="story4Link" type="file">
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
            <form action="controller.jsp?requestFor=upload&upload=stories&number=5" method="post"
                  enctype="multipart/form-data">
                <div class="row">
                    <span style="font-size: 1.5em;"> Story 5: </span> <br/>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story5TitleEnglish" id="story5TitleEnglish" type="text">
                        <label for="story5TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="story5TitleKannada" id="story5TitleKannada" type="text">
                        <label for="story5TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea name="story5ContentEnglish" id="story5ContentEnglish" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story5ContentEnglish">Content in English</label>
                    </div>
                    <!--<div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea  name="story5ContentKannada" id="story5ContentKannada" minlength="100"
                                  type="text" class="materialize-textarea"></textarea>
                        <label for="story5ContentKannada">Content in Kannada</label>
                    </div>-->
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
                <div class="file-field input-field col s12">
                    <a class="btn"><i class="material-icons left">perm_media</i>Upload Kannada File
                        <input name="story5Link" type="file">
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
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').material_select();
    });
    //for other_stories section
    var stories_title = [];
    var stories_title_kannada = [];
    var stories_content = [];
    var stories_content_kannada = [];
    var stories_image = [];

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

                    //for other stories

        Stories story = new Stories();
        List<Stories> allStories = story.getAllStories(pageToDisplay, monthName, year, 5, status);

                        for(int i=0; i<allStories.size(); i++)
                        {
                                Stories singleStory = allStories.get(i);

                                out.print("stories_title["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitle()) +"\" ;");
                                out.print("stories_title_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitleKannada()) +"\" ;");
                                out.print("stories_content["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContent()) +"\" ;");
                                out.print("stories_content_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContentKannada()) +"\" ;");
                            //    if(singleStory.getImagePath() != null)
                            //    out.print("stories_image["+i+"]=\"uploaded\";");

                        }
    %>
    function addto_Stories() {
        for (var i = 0; i < 5; i++) {
            if (stories_title[i] != undefined)
                document.getElementById("story" + (i + 1) + "TitleEnglish").value = stories_title[i];
            if (stories_title_kannada[i] != undefined)
                document.getElementById("story" + (i + 1) + "TitleKannada").value = stories_title_kannada[i];
            if (stories_content[i] != undefined)
                document.getElementById("story" + (i + 1) + "ContentEnglish").value = stories_content[i];
            // if (stories_content_kannada[i] != undefined)
            //   document.getElementById("story" + (i + 1) + "ContentKannada").value = stories_content_kannada[i];
            if (stories_image[i] != undefined)
                document.getElementsByClassName("file-path validate")[i].value = stories_image[i];
        }
    }
    addto_Stories();
</script>
</html>