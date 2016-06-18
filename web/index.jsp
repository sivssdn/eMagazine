<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.common.html.HtmlEscapers" %>
<%@ page import="process.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("X-XSS-Protection", "1; mode=block");%>
<!DOCTYPE HTML>
<html>

  <head>
        <script>
            //for events
            var events_title = [];
            var events_image = [];
            var events_content = [];

            //for news feed
            var news_title = [];
            var news_link = [];
            var news_content = [];

            //for other_stories section
            var stories_title = [];
            var stories_content = [];
            var stories_image = [];

            //for recent articles
            var recent_article_title = [];
            var recent_article_link = [];

            //for miscellaneous
            var miscellaneous_title = [];
            var miscellaneous_content = [];
      <%

    //TEMPORARY SESSION VARIABLE-------
    session.setAttribute("area","mrc");
    //----------------------------------


          String pageToDisplay = "mrc";
          int isDistrict = 0;
          int isUlb = 0;
          if(request.getParameter("district") != null ){
              pageToDisplay = request.getParameter("district");
              isDistrict = 1;
          }else if(request.getParameter("ulb") != null){
              pageToDisplay = request.getParameter("ulb");
              isUlb = 1;
          }


          //get current month
          String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                  "August", "September", "October", "November", "December" };
          Calendar now = Calendar.getInstance();
          String monthName = monthNames[now.get(Calendar.MONTH)];
          int year = now.get(Calendar.YEAR);


          //to get all events under the area name
          General escape = new General();

          Events event = new Events();
          List<Events> allEvents = event.getAllEvents(pageToDisplay, "june", year);
          try {
              for(int i=0; i< allEvents.size(); i++)
              {
                    Events singleEvent = allEvents.get(i);
                    out.println("events_title["+i+"] =\" "+ escape.escapeHtml(singleEvent.getTitle()) + " \" ;");
                    out.println("events_image["+i+"] =\" "+ escape.escapeHtml(singleEvent.getImagePath()) + " \" ;");
                    out.println("events_content["+i+"] =\" "+ escape.escapeHtml(singleEvent.getEventsContent()) + " \" ;");
              }
          }catch(Exception e){
              //redirect to error page
              out.print(e.getMessage());
          }




        //for news feed

        NewsFeed news = new NewsFeed();
        List<NewsFeed> listOfAllNews = news.getNewsFeed(pageToDisplay, "june");

                            for(int i=0; i< listOfAllNews.size(); i++){
                                NewsFeed singleNews = listOfAllNews.get(i);

                                out.print("news_title["+i+"]=\""+escape.escapeHtml(singleNews.getTitle())+"\" ;");
                                out.print("news_link["+i+"]=\""+escape.escapeHtml(singleNews.getLink())+"\" ;");
                                out.print("news_content["+i+"]=\""+escape.escapeHtml(singleNews.getContent())+"\" ;");
                            }



        //for other stories

        Stories story = new Stories();
        List<Stories> allStories = story.getAllStories(pageToDisplay, "june", year, 3);

                        for(int i=0; i<allStories.size(); i++)
                        {
                                Stories singleStory = allStories.get(i);

                                out.print("stories_title["+i+"]=\""+ escape.escapeHtml(singleStory.getTitle()) +"\" ;");
                                out.print("stories_content["+i+"]=\""+ escape.escapeHtml(singleStory.getStoriesContent()) +"\" ;");
                                out.print("stories_image["+i+"]=\""+ escape.escapeHtml(singleStory.getImagePath()) +"\" ;");

                        }


         //for recent articles
         MostReadArticles recent = new MostReadArticles();
         List<MostReadArticles> allRecentArticles = recent.getAllRecentArticles(pageToDisplay, "june", year);

                         for(int i=0; i<allRecentArticles.size(); i++)
                         {
                                MostReadArticles article = allRecentArticles.get(i);

                                out.print("recent_article_title["+i+"] = \""+ escape.escapeHtml(article.getTitle()) +"\";");
                                out.print("recent_article_link["+i+"] = \""+ escape.escapeHtml(article.getLink()) +"\";");
                         }


         //for miscellaneous section
          //General urlContent =  new General();
          Miscellaneous rows = new Miscellaneous();
          List<Miscellaneous> allMiscellaneous = rows.getAllMiscellaneous(pageToDisplay, "june", year);
                        for(int i=0; i<allMiscellaneous.size(); i++)
                        {
                                Miscellaneous row = allMiscellaneous.get(i);
               //                 String content = escape.escapeHtml(row.getContent());
              //                  out.print("miscellaneous_content["+i+"]=\""+urlContent.urlExtracter(content)+"\";");
                                out.print("miscellaneous_content["+i+"]=\""+escape.escapeHtml(row.getContent())+"\";");
                                out.print("miscellaneous_title["+i+"]=\""+escape.escapeHtml(row.getTitle())+"\";");
                        }

                        //trying image compression
                      //  urlContent.compressImages();
      %>
      </script>


    <title>MRC eMagazine</title>
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
      <style>
          html,body{
              width: 100%;
          }
          .shadow:hover{
              box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
          }
          .teal-dark               { color: #00796B;}
          .teal-color                     { color: #009688;}
          a                     { color: #FF5722; }
          .link{cursor: pointer;}
      </style>
  </head>
  <body>


  <header>

      <ul id="dropdownDistrict" class="dropdown-content">
          <% if(isDistrict == 0 && isUlb == 0) {%>
          <li><a href="<%= "index.jsp?district=district 1"%>" >District 1</a></li>
          <li><a href="<%= "index.jsp?district=district 2"%>">District 2</a></li>
          <li><a href="<%= "index.jsp?district=district 3"%>">District 3</a></li>
          <%} else if(isDistrict == 1){%>
          <li><a href="<%= "index.jsp?ulb=ulb 1"%>">ULB 1</a></li>
          <li><a href="<%= "index.jsp?ulb=ulb 2"%>">ULB 2</a></li>
          <li><a href="<%= "index.jsp?ulb=ulb 3"%>">ULB 3</a></li>
          <%}%>
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
                  <a class="left hide-on-small-and-down" style="margin-top: -3.5em; margin-left: 7%;">
                      MRC/2016-17/June 001
                  </a>
                  <a class="right hide-on-small-and-down" style="margin-top: -3.5em; margin-right: 14%;">
                      June 2016
                  </a>
              </div>
          </div>
      </nav>
  </header><br><br>

  <!--after header-->
  <main>

      <div class="container" style="width: 90%;">
          <div class="row">
                  <!--Events -->
                  <div class="col s12 m5">
                          <h4 class="light teal-color">Events</h4>
                      <div class="card large shadow">
                        <div class="card-image" style="max-height: 18em;">
                          <img src="http://materializecss.com/images/sample-1.jpg" id="event_image">

                          <span class="card-title" id="event_title">Title of the event</span>
                        </div>
                        <div class="card-content" style="min-height: 6em;">
                          <p id="event_summary">I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                          <p><a class="waves-effect waves-light modal-trigger" href="#event_modal">READ MORE </a></p>
                        </div>

                          <div class="card-action">
                            <!-- < 1 2 3 4 > -->
                            <ul class="pagination left-align ">
                                <li class="active link" id="0" onclick="change_event(this.id);return false;"> <a>1</a></li>
                                <li class="waves-effect link" id="1" onclick="change_event(this.id);return false;"><a>2</a></li>
                                <li class="waves-effect link" id="2" onclick="change_event(this.id);return false;"><a>3</a></li>
                                <li class="waves-effect link" id="3" onclick="change_event(this.id);return false;"><a>4</a></li>
                                <li class="waves-effect link" id="4" onclick="change_event(this.id);return false;"><a>5</a></li>
                                <!--<li class=" disabled"><a><i class="material-icons">chevron_right</i></a></li>-->
                            </ul>
                            </div>
                        </div>
                  </div>
                        <!--Modal for event popup-->
                          <div id="event_modal" class="modal modal-fixed-footer " style="width:70%; ">
                              <div class="modal-content">
                                  <h4 class="light teal-color" id="event_modal_title">Event Name/heading</h4>
                                  <p>
                                      <img id="event_modal_image" src="http://materializecss.com/images/sample-1.jpg" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                  </p>
                                  <p id="event_modal_content">
                                      Content
                                      In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments marking several significant sites in the life of Gautama Buddha. "Ashoka regarded Buddhism as a doctrine that could serve as a cultural foundation for political unity."[9] Ashoka is now remembered as a philanthropic administrator. In the Kalinga edicts, he addresses his people as his "children", and mentions that as a father he desires their good.

                                      Ashoka's name "Aśoka" means "painless, without sorrow" in Sanskrit (the a privativum and śoka "pain, distress"). In his edicts, he is referred to as Devānāmpriya (Pali Devānaṃpiya or "The Beloved of the Gods"), and Priyadarśin (Pali Piyadasī or "He who regards everyone with affection"). His fondness for his name's connection to the Saraca asoca tree, or the "Ashoka tree" is also referenced in the Ashokavadana.

                                      H.G. Wells wrote of Ashoka in his book The Outline of History: "Amidst the tens of thousands of names of monarchs that crowd the columns of history, their majesties and graciousnesses and serenities and royal highnesses and the like, the name of Ashoka shines, and shines, almost alone, a star." Along with the Edicts of Ashoka, his legend is related in the 2nd-century CE Ashokavadana ("Narrative of Ashoka", a part of Divyavadana), and in the Sri Lankan text Mahavamsa ("Great Chronicle"). The emblem of the modern Republic of India is an adaptation of the Lion Capital of Ashoka.
                                  </p>
                              </div>
                              <div class="modal-footer">
                                  <a href="#" class="modal-action modal-close waves-effect btn red">CLOSE</a>
                              </div>
                          </div>

                    <!--news feed-->
                      <div class="col s12 m4">
                          <h4 class="light teal-color">News Feed</h4>
                          <div class="card shadow">
                              <div class="card-content">
                                  <p>
                                      <!--news feed table-->
                                        <table id="news_feed_table">
                                            <!--Modal for upcoming events-->
                                            <div id="upcoming_events_modal" class="modal modal-fixed-footer " style="width:70%; ">
                                                <div class="modal-content">
                                                    <h4 class="light teal-color center">Upcoming events</h4>
                                                    <br>
                                                      <p id="upcoming_events_modal_content"></p>
                                                  </div>
                                                  <div class="modal-footer">
                                                      <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                                                </div>
                                            </div>

                                        </table>
                                  </p>
                              </div>

                          </div>
                      </div>

              <!--place for add-->
              <div class="col s12 m3">

                  <div class="card blue-grey darken-1" style="min-height: 18em;max-height: 18em;">

                          <div class="card-image">
                                <img src="http://materializecss.com/images/sample-1.jpg"  style="max-height: 100%;">
                          </div>


                   </div>

                      <div class="card blue-grey darken-1" style="min-height: 18em;max-height: 18em;">

                              <div class="card-image">
                                  <img src="http://materializecss.com/images/sample-1.jpg" style="max-height: 100%;">
                              </div>

                       </div>
                    </div>
           </div>


          <!--row 2-->
          <div class="row">
              <div class="col s12 m9">
                  <div class="row">
                      <div class="col s12 m4">
                          <h4 class="light teal-color">Other stories : </h4>
                          <div class="card">
                              <div class="card-image" style="max-height: 18em;">
                                  <img id="story1_image" src="http://materializecss.com/images/office.jpg" />
                              </div>
                              <div class="card-content">
                                  <span id="story1_title" class="card-title teal-color">Story heading</span>
                              </div>
                          </div>
                      </div>

                      <div class="col s12 m7">
                          <br><br><br><br>
                          <p id="story1_summary">
                              More Content about card on the left goes here...<br>
                              In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments...
                          </p>

                          <p><a class="waves-effect waves-light modal-trigger" href="#story1_modal">READ MORE </a></p>
                                              <!--Modal for story 1-->
                                              <div id="story1_modal" class="modal modal-fixed-footer " style="width:70%; ">
                                                  <div class="modal-content">
                                                      <h4 class="light teal-color" id="story1_modal_title">Event Name/heading</h4>
                                                      <p>
                                                          <img id="story1_modal_image" src="http://materializecss.com/images/sample-1.jpg" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                                      </p>
                                                      <p id="story1_modal_content">

                                                      </p>
                                                  </div>
                                                  <div class="modal-footer">
                                                      <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                                                  </div>
                                              </div>

                      </div>
                  </div>
              </div>

              <!--place for add-->
              <div class="col s12 m3">

                  <div class="card blue-grey darken-1" style="min-height: 23em;max-height: 23em;">
                      <div class="card-content white-text">
                          <p>
                          <div class="card-image" style="max-height: 22em;">
                              <img src="http://materializecss.com/images/sample-1.jpg">
                          </div>
                          </p>
                      </div>
                  </div>
              </div>
          </div>


          <!--row 3-->
          <div class="row">
          <div class="col s12 m9">
            <div class="row">
              <div class="col s12 m4">
                  <div class="card">
                      <div class="card-image" style="max-height: 18em;">
                          <img id="story2_image" src="http://materializecss.com/images/office.jpg" />
                      </div>
                      <div class="card-content">
                          <span id="story2_title" class="card-title teal-color">Story heading</span>
                      </div>
                  </div>
              </div>

              <div class="col s12 m7"> <br>
                              <p id="story2_summary">
                                  More Content about card on the left goes here...<br>
                              In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments...
                              </p>

                          <p><a class="waves-effect waves-light modal-trigger" href="#story2_modal">READ MORE </a></p>
                                              <!--Modal for story 2-->
                                              <div id="story2_modal" class="modal modal-fixed-footer " style="width:70%; ">
                                                  <div class="modal-content">
                                                      <h4 class="light teal-color" id="story2_modal_title">Event Name/heading</h4>
                                                      <p>
                                                          <img id="story2_modal_image" src="http://materializecss.com/images/sample-1.jpg" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                                      </p>
                                                      <p id="story2_modal_content">

                                                      </p>
                                                  </div>
                                                  <div class="modal-footer">
                                                      <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                                                  </div>
                                              </div>

              </div>
            </div>
          </div>

              <!--place for add-->
              <div class="col s12 m3">

                  <div class="card blue-grey darken-1"  style="min-height: 21em;max-height: 21em;">
                      <div class="card-content white-text">
                          <p>
                          <div class="card-image">
                              <img src="http://materializecss.com/images/sample-1.jpg" style="max-height: 20em;">
                          </div>
                          </p>
                      </div>
                  </div>
               </div>



          </div>


          <!--row 4-->
          <div class="row">
              <div class="col s12 m9">
                    <div class="row">

                              <div class="col s12 m4">
                                  <!--story section-->
                                  <div class="card">
                                      <div class="card-image" >
                                          <img id="story3_image" src="http://materializecss.com/images/office.jpg" style="max-height: 18em;"/>
                                      </div>
                                      <div class="card-content">
                                          <span id="story3_title" class="card-title teal-color">Story heading</span>
                                      </div>
                                  </div>
                              </div>

                              <div class="col s12 m7"> <br>
                                          <p id="story3_summary">
                                              More Content about card on the left goes here...<br>
                                              In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments ...

                                          </p>
                                          <p><a class="waves-effect waves-light modal-trigger" href="#story3_modal">READ MORE </a></p>
                                          <p><a class="waves-effect waves-light" href="moreStories.jsp">MORE STORIES</a></p>
                                                          <!--Modal for story 3-->
                                                          <div id="story3_modal" class="modal modal-fixed-footer " style="width:70%; ">
                                                              <div class="modal-content">
                                                                  <h4 class="light teal-color" id="story3_modal_title">Event Name/heading</h4>
                                                                  <p>
                                                                      <img id="story3_modal_image" src="http://materializecss.com/images/sample-1.jpg" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                                                  </p>
                                                                  <p id="story3_modal_content">

                                                                  </p>
                                                              </div>
                                                              <div class="modal-footer">
                                                                  <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                                                              </div>
                                                          </div>

                              </div>

              </div>
              <div class="row">
                  <!--miscellaneous section-->
                  <ul class="collapsible pull-l1" data-collapsible="accordion">
                      <li>
                          <div class="collapsible-header"><h4 class="light teal-color">Miscellaneous</h4></div>

                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i><span id="miscellaneous1_title">Health Capsule</span></div>
                          <div class="collapsible-body">
                              <p id="miscellaneous1_content">
                                  Prevention of Chicken Gunia/Dengue/Tips for good health < link to article>
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i><span id="miscellaneous2_title">Interesting Articles on Urban Development</span></div>
                          <div class="collapsible-body">
                              <p id="miscellaneous2_content">
                                  article 1 <br>
                                  article 2 <br>
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i><span id="miscellaneous3_title">Bizarre news</span></div>
                          <div class="collapsible-body">
                              <p id="miscellaneous3_content">
                                  News from the World
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i><span id="miscellaneous4_title">Fun Corner</span></div>
                          <div class="collapsible-body">
                              <p id="miscellaneous4_content">
                                  Joke
                              </p>
                          </div>
                      </li>
                  </ul>

              </div>
           </div>

              <!-- recent articles-->
              <div class="col s12 m3">
                  <h4 class="light teal-color">Most Read Articles</h4>
                  <div class="card shadow">
                      <div class="card-content">
                          <p>
                          <table id="recent_articles_table">

                          </table>
                          </p>
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
          );

          $('select').material_select();

      });

      //only for events section (first)
      var id;
      function change_event(id){

          $("#event_title").text(events_title[id]);
          $("#event_modal_title").text(events_title[id]);
          $("#event_image").text(events_image[id]);
          $("#event_modal_image").text(events_image[id]);
          $("#event_summary").text(events_content[id]);
          $("#event_modal_content").text(events_content[id]);


          //to change active button color (ui)
          $("#0").removeClass("active");
          $("#1").removeClass("active");
          $("#2").removeClass("active");
          $("#3").removeClass("active");
          $("#4").removeClass("active");
          $("#"+id).addClass("active");
      }
      change_event(0);

      //for news feed dynamic creation
      function addto_newsfeed(){
          var table = document.getElementById("news_feed_table");



          var newsfeed_length = news_title.length;
          for(var i=0; i<newsfeed_length; i++){
              var tr = document.createElement("tr");

              var td = document.createElement("td");
              if(news_content[i] == "null")
              td.innerHTML = "<a href=\'"+news_link[i]+"\'>"+ (i+1) +". "+news_title[i]+" </a>";
              else{
                  td.innerHTML = "<a href='#upcoming_events_modal'>"+(i+1) +". "+news_title[i]+"</a>";
                  td.className = "waves-effect waves-light modal-trigger";
                  document.getElementById("upcoming_events_modal_content").innerHTML = news_content[i];
              }
              tr.appendChild(td);

              table.appendChild(tr); //merge to table
          }

      }
      addto_newsfeed();

      //for other_stories section
      function addto_otherstories(){
          var stories = ['story1','story2','story3'];
          for(var i=0; i<3; i++){
              document.getElementById(stories[i]+"_image").src = stories_image[i];
              document.getElementById(stories[i]+"_modal_image").src = stories_image[i];
              document.getElementById(stories[i]+"_title").innerHTML = stories_title[i];
              document.getElementById(stories[i]+"_modal_title").innerHTML = stories_title[i];
              document.getElementById(stories[i]+"_summary").innerHTML = stories_content[i].substring(0,550) + "...";
              document.getElementById(stories[i]+"_modal_content").innerHTML = stories_content[i];
          }
      }
      addto_otherstories();

      //for recent articles
      function addto_recentarticles(){
          var table = document.getElementById("recent_articles_table");
          var recentArticlesLength = recent_article_title.length;

                for(var i=0; i<recentArticlesLength; i++){
                    var tr = document.createElement('tr');
                    var td = document.createElement('td');
                    td.innerHTML = "<a href=\'"+recent_article_link[i]+"\'>"+(i+1)+". "+recent_article_title[i]+" </a>";
                    tr.appendChild(td);

                    table.appendChild(tr);
                }
      }
      addto_recentarticles();

      //for miscellaneous section
      function addto_miscellaneous(){
          miscellaneous_elements = ['miscellaneous1','miscellaneous2','miscellaneous3','miscellaneous4'];
            for(var i=0; i<4; i++){
                document.getElementById(miscellaneous_elements[i]+"_title").innerText = miscellaneous_title[i];
                document.getElementById(miscellaneous_elements[i]+"_content").innerHTML = miscellaneous_content[i];
            }
      }
      addto_miscellaneous();
  </script>
</html>
