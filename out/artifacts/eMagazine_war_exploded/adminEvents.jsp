<%@ page import="process.Events" %>
<%@ page import="process.General" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Events</title>
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
            <a href="adminEvents.jsp" class="brand-logo" style="margin-left: 10px">Events</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminNewsFeed.jsp">News Feed</a></li>
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
                        <input name="event1TitleEnglish" id="event1TitleEnglish" type="text" length="64">
                        <label for="event1TitleEnglish">Title in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">label</i>
                        <input name="event1TitleKannada" id="event1TitleKannada" type="text" length="64">
                        <label for="event1TitleKannada">Title in Kannada</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="event1ContentEnglish" id="event1ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event1ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="event1ContentKannada" id="event1ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event1ContentKannada">Content in Kannada</label>

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
                        <textarea class="materialize-textarea" name="event2ContentEnglish" id="event2ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event2ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="event2ContentKannada" id="event2ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event2ContentKannada">Content in Kannada</label>
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
                        <textarea class="materialize-textarea" name="event3ContentEnglish" id="event3ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event3ContentEnglish">Content in English</label>

                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="event3ContentKannada" id="event3ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event1ContentKannada">Content in Kannada</label>
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
                        <textarea class="materialize-textarea" name="event4ContentEnglish" id="event4ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event4ContentEnglish">Content in English</label>

                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea class="materialize-textarea" name="event4ContentKannada" id="event4ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event4ContentKannada">Content in Kannada</label>
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
                        <textarea class="materialize-textarea" name="event5ContentEnglish" id="event5ContentEnglish"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event5ContentEnglish">Content in English</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">subject</i>
                        <textarea placeholder="Content in Kannada" name="event5ContentKannada" id="event5ContentKannada"
                                  type="text"
                                  length="4096"></textarea>
                        <label for="event5ContentKannada">Content in Kannada</label>
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
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    //for popups / modals
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered

        $('select').material_select();


    });
    //for events
    var events_title = [];
    var events_title_kannada = [];
    var events_image = [];
    var events_content = [];
    var events_content_kannada = [];

<%

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


        //to get all events under the area name
          Events event = new Events();
          List<Events> allEvents = event.getAllEvents(pageToDisplay, monthName, year, status);
          try {
              for(int i=0; i< allEvents.size(); i++)
              {
                    Events singleEvent = allEvents.get(i);
                    out.println("events_title["+i+"] =\" "+ escape.escapeHtml(singleEvent.getTitle()) + " \" ;");
                    out.println("events_title_kannada["+i+"] =\" "+ escape.escapeHtml(singleEvent.getTitleKannada()) + " \" ;");
                    //if(singleEvent.getImagePath() != null )
                    //out.println("events_image["+i+"] =\" uploaded\"");
                    out.println("events_content["+i+"] =\" "+ escape.escapeHtml(singleEvent.getEventsContent()) + " \" ;");
                    out.println("events_content_kannada["+i+"] =\" "+ escape.escapeHtml(singleEvent.getEventsContentKannada()) + " \" ;");
              }
          }catch(Exception e){
              //redirect to error page
              out.print(e.getMessage());
          }

%>
    function addto_events(){
        for(var i=0; i<5; i++){
            if(events_title[i] != undefined)
                document.getElementById("event"+(i+1)+"TitleEnglish").value = events_title[i];
            if(events_title_kannada[i] != undefined)
                document.getElementById("event"+(i+1)+"TitleKannada").value = events_title_kannada[i];
            if(events_content[i] != undefined)
                document.getElementById("event"+(i+1)+"ContentEnglish").value = events_content[i];
            if(events_content_kannada[i] != undefined)
                document.getElementById("event"+(i+1)+"ContentKannada").value = events_content_kannada[i];
            if(events_image[i] != undefined)
                document.getElementsByClassName("file-path validate")[i].value = events_image[i];
        }

    }
    addto_events();
        </script>
</html>