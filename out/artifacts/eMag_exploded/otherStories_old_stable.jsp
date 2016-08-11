<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="process.General" %>
<%@ page import="process.Stories" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("X-Frame-Options", "DENY");
    response.addHeader("X-Content-Type-Options", "nosniff");
    response.addHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline';style-src 'self' http://fonts.googleapis.com/icon?family=Material+Icons 'unsafe-inline'; font-src 'self' http://fonts.gstatic.com/s/materialicons/v17/2fcrYFNaTjcS6g4U3t-Y5ZjZjT5FdEJ140U2DJYC3mY.woff2 'unsafe-inline'; img-src *");
%>
<html>
<head>
    <title>MRC eMagazine</title>
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
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
    <style>
        html, body {
            width: 100%;
        }

        .teal-color {
            color: #009688;
        }

        a {
            color: #FF5722;
            cursor: pointer;
        }

    </style>
    <script>
        var language = 0;

        //for other_stories section
        var stories_title = [];
        var stories_title_kannada = [];
        var stories_content = [];
        var stories_content_kannada = [];
        var stories_image = [];
        var stories_link_kannada = [];
        <%
            General escape = new General();
            String pageToDisplay = "mrc";
              int isDistrict = 0;
              int isUlb = 0;
               if(StringEscapeUtils.escapeJava(request.getParameter("district")) != null ){
                  pageToDisplay = request.getParameter("district");
                  isDistrict = 1;
              }else if(StringEscapeUtils.escapeJava(request.getParameter("ulb")) != null){
                  pageToDisplay = request.getParameter("ulb");
                  isUlb = 1;
              }

                //status=editing for preview purposes
                String status = "APPROVED";
                if(StringEscapeUtils.escapeJava(request.getParameter("status")) != null && request.getParameter("status").equals("editing"))
                    status = "editing";

              //get month

              String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                      "August", "September", "October", "November", "December" };
              Calendar now = Calendar.getInstance();
              String monthName = monthNames[now.get(Calendar.MONTH)];
              int year = now.get(Calendar.YEAR);
              if(StringEscapeUtils.escapeJava(request.getParameter("month")) != null && StringEscapeUtils.escapeJava(request.getParameter("year")) != null)
              {
                monthName = StringEscapeUtils.escapeJavaScript(request.getParameter("month"));
                year =  Integer.parseInt(request.getParameter("year"));
              }
        %>
    </script>
</head>
<body>

<header>
    <ul id="dropdownDistrict" class="dropdown-content">
        <li><a href="#!">Bidar</a></li>
        <li><a href="#!">Bijapur</a></li>
        <li><a href="#!">Chikmagalur</a></li>
    </ul>
    <nav style="height: 10em; background-color: #009688;">
        <div class="nav-wrapper container">
            <div class="row">
                <a href="index.jsp" class="left hide-on-small-and-down" style="margin-top: 0.5%; margin-left: 10%;">
                    <img src="images/gkLogo.png" style="height: 90px;">
                </a>
                <a href="index.jsp" class="brand-logo center" style="margin-top: 2%;">eMagazine
                    <br/>
                        <span class="dropdown-button center" data-activates="dropdownDistrict"
                              style="margin-top: -2.5%; font-size: 0.6em;">Choose District
                        <i class="material-icons right">arrow_drop_down</i> </span>
                </a>
                <a href="index.jsp" class="right hide-on-small-and-down" style="margin-top: 0.5%; margin-right: 10%;">
                    <img src="images/mrcLogo.png" style="height: 90px;">
                </a>
            </div>
            <div class="row">
                <a class="left hide-on-small-and-down" style="margin-top: -2.5%; margin-left: 7%;">
                    MRC/<%=year%>/<%=monthName%>-001
                </a>
                <a class="right hide-on-small-and-down" style="margin-top: -2.5%; margin-right: 14%;">
                    <%=monthName%> <%=year%>
                </a>
            </div>
        </div>
    </nav>
</header>
<br><br>
<div>

    <div class="container" style="width: 90%;">

        <p class="light right push-l5"><a onclick="languageChange('kannada');return false;"><strong>
            Kannada </strong></a>/ <a onclick="languageChange('english');return false;"><strong>English</strong></a>
        </p>

        <div class="row">

            <!--first story-->
            <div class="col s12 m3">
                <div class="card " id="story1_card_image">
                    <div class="card-content">
                        <span class="card-title teal-color" id="story1_title"></span>
                    </div>
                    <div class="card-image" style="max-height: 14em;">
                        <img id="story1_image"/>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="col s12 m7">
                <p id="story1_summary">

                </p>

                <p><a id="story1_readmore_link" class="waves-effect waves-light modal-trigger" href="#story1_modal">
                    READ MORE </a></p>

                <!--Modal for event popup-->
                <div id="story1_modal" class="modal modal-fixed-footer " style="width:70%; ">
                    <div class="modal-content">
                        <h4 class="light teal-color" id="story1_modal_title"></h4>
                        <p>
                            <img id="story1_modal_image"
                                 style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                        </p>
                        <p id="story1_modal_content">

                        </p>
                    </div>
                    <div class="modal-footer">
                        <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                    </div>
                </div>
                <!--modal over-->

            </div>

        </div>


        <div class="row">

            <div class="col s12 m3">
                <div class="card" id="story2_card_image">
                    <div class="card-content">
                        <span class="card-title teal-color" id="story2_title"></span>
                    </div>
                    <div class="card-image" style="max-height: 14em;">
                        <img id="story2_image"/>
                    </div>

                </div>
            </div>
            <br><br>
            <div class="col s12 m7">
                <p id="story2_summary">

                </p>

                <p><a id="story2_readmore_link" class="waves-effect waves-light modal-trigger" href="#story2_modal">
                    READ MORE </a></p>

            </div>
            <!--Modal for event popup-->
            <div id="story2_modal" class="modal modal-fixed-footer " style="width:70%; ">
                <div class="modal-content">
                    <h4 class="light teal-color" id="story2_modal_title"></h4>
                    <p>
                        <img id="story2_modal_image"
                             style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                    </p>
                    <p id="story2_modal_content">

                    </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                </div>
            </div>
        </div>


        <div class="row">


            <div class="col s12 m3">
                <div class="card" id="story3_card_image">
                    <div class="card-content">
                        <span class="card-title teal-color" id="story3_title"></span>
                    </div>
                    <div class="card-image" style="max-height: 14em;">
                        <img id="story3_image"/>
                    </div>

                </div>
            </div>
            <br><br>
            <div class="col s12 m7">
                <p id="story3_summary">

                </p>

                <p><a id="story3_readmore_link" class="waves-effect waves-light modal-trigger" href="#story3_modal">
                    READ MORE </a></p>

            </div>
            <!--Modal for event popup-->
            <div id="story3_modal" class="modal modal-fixed-footer " style="width:70%; ">
                <div class="modal-content">
                    <h4 class="light teal-color" id="story3_modal_title"></h4>
                    <p>
                        <img id="story3_modal_image"
                             style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                    </p>
                    <p id="story3_modal_content">

                    </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                </div>
            </div>
        </div>


        <div class="row">

            <div class="col s12 m3">
                <div class="card" id="story4_card_image">
                    <div class="card-content">
                        <span class="card-title teal-color" id="story4_title"></span>
                    </div>
                    <div class="card-image" style="max-height: 14em;">
                        <img id="story4_image"/>
                    </div>

                </div>
            </div>
            <br><br>
            <div class="col s12 m7">
                <p id="story4_summary">

                </p>

                <p><a id="story4_readmore_link" class="waves-effect waves-light modal-trigger" href="#story4_modal">
                    READ MORE </a></p>

            </div>
            <!--Modal for event popup-->
            <div id="story4_modal" class="modal modal-fixed-footer " style="width:70%; ">
                <div class="modal-content">
                    <h4 class="light teal-color" id="story4_modal_title"></h4>
                    <p>
                        <img id="story4_modal_image"
                             style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                    </p>
                    <p id="story4_modal_content">

                    </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                </div>
            </div>
        </div>


        <div class="row">

            <div class="col s12 m3">
                <div class="card" id="story5_card_image">
                    <div class="card-content">
                        <span class="card-title teal-color" id="story5_title"></span>
                    </div>
                    <div class="card-image" style="max-height: 14em;">
                        <img id="story5_image"/>
                    </div>

                </div>
            </div>
            <br><br>
            <div class="col s12 m7">
                <p id="story5_summary">

                </p>

                <p><a id="story5_readmore_link" class="waves-effect waves-light modal-trigger" href="#story5_modal">
                    READ MORE </a></p>

            </div>
            <!--Modal for event popup-->
            <div id="story5_modal" class="modal modal-fixed-footer " style="width:70%; ">
                <div class="modal-content">
                    <h4 class="light teal-color" id="story5_modal_title"></h4>
                    <p>
                        <img id="story5_modal_image"
                             style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                    </p>
                    <p id="story5_modal_content">

                    </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                </div>
            </div>
        </div>


    </div>

</div>
</main>

<footer class="page-footer" style="background-color: #009688;">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Useful Links</h5>
                <h6 class="white-text">Library</h6>
                <h6 class="white-text">Feedback</h6>
                <h6 class="white-text">Blogs</h6>

            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text"></h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#"><img src="images/fb.png" height="40"/> </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><img src="images/tw.png" height="40"/> </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><i class="material-icons dp48"
                                                                        style="color: black;font-size: 2.5em; ">call</i>
                        </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><img src="images/wa.png" height="40"/> </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">

            <!--  <a class="grey-text text-lighten-4 right" href="#!">More Links</a> -->
        </div>
    </div>
</footer>
</body>
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    //for popups / modals
    $(document).ready(function () {
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();

        $('.modal-trigger').leanModal({
                    dismissible: true, // Modal can be dismissed by clicking outside of the modal
                    opacity: 1, // Opacity of modal background
                    in_duration: 300, // Transition in duration
                    out_duration: 200, // Transition out duration
                }
        );

        $('select').material_select();

    });


    <%
        //for other stories

        Stories story = new Stories();
        List<Stories> allStories = story.getAllStories(pageToDisplay, monthName, year, 5, status);

        for(int i=0; i<allStories.size(); i++)
        {
            Stories singleStory = allStories.get(i);

            out.print("stories_title["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitle()) +"\" ;");
            out.print("stories_title_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitleKannada()) +"\" ;");
            out.print("stories_content["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContent()) +"\" ;");
//            out.print("stories_content_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContentKannada()) +"\" ;");
            out.print("stories_image["+i+"]=\"/resources?name="+ StringEscapeUtils.escapeJavaScript(singleStory.getImagePath()) +"\" ;");
            out.print("stories_link_kannada["+i+"]=\"/resources?name="+ StringEscapeUtils.escapeJavaScript(singleStory.getLinkKannada()) +"\" ;");

        }

    %>


    function display_stories() {
        var stories = ['story1', 'story2', 'story3', 'story4', 'story5'];

        //first hide all the stories (image, content and readmore link)
        for (var i = 0; i < stories.length; i++) {
            $("#" + stories[i] + "_image").addClass("hide");
            $("#" + stories[i] + "_card_image").addClass("hide");
            $("#" + stories[i] + "_title").addClass("hide");
            $("#" + stories[i] + "_summary").addClass("hide");
            $("#" + stories[i] + "_readmore_link").addClass("hide");
        }

        var i, title;
        if (language == 0) {

            for (i = 0; i < stories.length; i++) {
                title = stories_title[i];
                if (title != undefined && title != null && title.length > 3) {
                    $("#" + stories[i] + "_image").removeClass("hide");
                    $("#" + stories[i] + "_card_image").removeClass("hide");
                    $("#" + stories[i] + "_title").removeClass("hide");
                    $("#" + stories[i] + "_summary").removeClass("hide");
                    $("#" + stories[i] + "_readmore_link").removeClass("hide");
                }

            }
        } else if (language == 1) {

            for (i = 0; i < stories.length; i++) {
                title = stories_title_kannada[i];
                if (title != undefined && title != null && title.length > 3) {
                    $("#" + stories[i] + "_image").removeClass("hide");
                    $("#" + stories[i] + "_card_image").removeClass("hide");
                    $("#" + stories[i] + "_title").removeClass("hide");
                    $("#" + stories[i] + "_summary").removeClass("hide");
                    $("#" + stories[i] + "_readmore_link").removeClass("hide");
                }

            }


        }
    }
    display_stories();

    //for other_stories section
    function addto_otherstories() {
        var stories = ['story1', 'story2', 'story3', 'story4', 'story5'];
        for (var i = 0; i < stories.length; i++) {
            document.getElementById(stories[i] + "_image").src = stories_image[i];
            document.getElementById(stories[i] + "_modal_image").src = stories_image[i];

            if (language == 0) {
                document.getElementById(stories[i] + "_title").innerHTML = stories_title[i];
                document.getElementById(stories[i] + "_modal_title").innerHTML = stories_title[i];
                document.getElementById(stories[i] + "_image").alt = stories_title[i];
                document.getElementById(stories[i] + "_modal_image").alt = stories_title[i];

                if (stories_content[i] != undefined) {
                    document.getElementById(stories[i] + "_summary").innerHTML = stories_content[i].substring(0, 250) + "...";
                    document.getElementById(stories[i] + "_modal_content").innerHTML = stories_content[i];
                }

                document.getElementById(stories[i] + "_readmore_link").href = "#" + stories[i] + "_modal"; //assigning button to link modal
                $("#" + stories[i] + "_readmore_link").addClass("waves-light modal-trigger");
            } else if (language == 1) {
                document.getElementById(stories[i] + "_title").innerHTML = stories_title_kannada[i];
                document.getElementById(stories[i] + "_modal_title").innerHTML = stories_title_kannada[i];
                document.getElementById(stories[i] + "_image").alt = stories_title_kannada[i];
                document.getElementById(stories[i] + "_modal_image").alt = stories_title_kannada[i];


                if (stories_link_kannada[i] != undefined && stories_link_kannada[i] != " ") {
                    document.getElementById(stories[i] + "_readmore_link").href = stories_link_kannada[i];

                    $("#" + stories[i] + "_readmore_link").removeClass("waves-light modal-trigger");
                    document.getElementById(stories[i] + "_summary").innerHTML = " "; //clear story summary section in case attachment is found
                }
                /*
                 if (stories_content_kannada[i] != undefined)
                 document.getElementById(stories[i] + "_summary").innerHTML = stories_content_kannada[i].substring(0, 250) + "...";
                 document.getElementById(stories[i] + "_modal_content").innerHTML = stories_content_kannada[i];
                 */
            }
        }
    }
    addto_otherstories();

    var x;
    function languageChange(x) {
        if (x == 'kannada')
            language = 1;
        else
            language = 0;

        display_stories();
        addto_otherstories();

    }

</script>
</html>
