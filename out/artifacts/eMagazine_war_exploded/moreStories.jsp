<%@ page import="process.General" %>
<%@ page import="process.Stories" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("X-XSS-Protection", "1; mode=block");%>
<html>
<head>
    <script>
        //for other_stories section
        var stories_title = [];
        var stories_content = [];
        var stories_image = [];
    <%
        General escape = new General();
        String pageToDisplay = "mrc";
          int isDistrict = 0;
          int isUlb = 0;
           if(escape.escapeHtml(request.getParameter("district")) != null ){
              pageToDisplay = request.getParameter("district");
              isDistrict = 1;
          }else if(escape.escapeHtml(request.getParameter("ulb")) != null){
              pageToDisplay = request.getParameter("ulb");
              isUlb = 1;
          }

      //status=editing for preview purposes
            String status = "APPROVED";
            if(escape.escapeHtml(request.getParameter("status")) != null && request.getParameter("status").equals("editing"))
                status = "editing";

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



        //for other stories

        Stories story = new Stories();
        List<Stories> allStories = story.getAllStories(pageToDisplay, "june", year, 30, status);

    %>
    </script>
    <title>MRC eMagazine</title>
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
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
    <style>
        html,body{
            width: 100%;
        }

        .teal-color                     { color: #009688;}
        a                     { color: #FF5722; }

    </style>
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
                    MRC/2016-17/June 001
                </a>
                <a class="right hide-on-small-and-down" style="margin-top: -2.5%; margin-right: 14%;">
                    June 2016
                </a>
            </div>
        </div>
    </nav>
</header>
<br><br>
    <main>
        <div class="container" style="width: 90%;">
            <%

                for(int i=0; i<allStories.size(); i++)
                {
                    Stories singleStory = allStories.get(i);

            %>
            <div class="row">

                <!--first story-->
                <div class="col s12 m3">
                    <div class="card small">
                        <div class="card-image" style="max-height: 14em;">
                            <img src="<%= escape.escapeHtml(singleStory.getImagePath())%>" />
                        </div>
                        <div class="card-content">
                            <span class="card-title teal-color"><%= escape.escapeHtml(singleStory.getTitle())%></span>
                        </div>
                    </div>
                </div><br><br>
                <div class="col s12 m7">
                    <p>
                        <%= escape.escapeHtml(singleStory.getStoriesContent()).substring(0,550) %> ...
                    </p>

                    <p><a class="waves-effect waves-light modal-trigger" href="#event_modal<%= i%>">READ MORE </a></p>

                </div>
                                <!--Modal for event popup-->
                                <div id="event_modal<%= i%>" class="modal modal-fixed-footer " style="width:70%; ">
                                    <div class="modal-content">
                                        <h4 class="light teal-color"><%= escape.escapeHtml(singleStory.getTitle())%></h4>
                                        <p>
                                            <img src="<%= escape.escapeHtml(singleStory.getImagePath())%>" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                        </p>
                                        <p>
                                            <%= escape.escapeHtml(singleStory.getStoriesContent())%>
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                                    </div>
                                </div>

            </div>
<%}%>
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
                <h5 class="white-text">  </h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#"><img src="images/fb.png" height="40" /> </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><img src="images/tw.png" height="40" /> </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><i class="material-icons dp48" style="color: black;font-size: 2.5em; ">call</i> </a> &nbsp;&nbsp;
                        <a class="grey-text text-lighten-3" href="#"><img src="images/wa.png" height="40" /> </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            2016 | Designed by Deva and Paras
            <!--  <a class="grey-text text-lighten-4 right" href="#!">More Links</a> -->
        </div>
    </div>
</footer>
</body>

<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="materialize/js/jquery.js"></script>
<script type="text/javascript" src="materialize/js/materialize.min.js"></script>
<script>
    //for popups / modals
    $(document).ready(function(){
        // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
        $('.modal-trigger').leanModal();
        $('.modal-trigger').leanModal({
                    dismissible: true, // Modal can be dismissed by clicking outside of the modal
                    opacity: 1, // Opacity of modal background
                    in_duration: 300, // Transition in duration
                    out_duration: 200, // Transition out duration
                }
        )


            $('select').material_select();

    });


</script>
</html>