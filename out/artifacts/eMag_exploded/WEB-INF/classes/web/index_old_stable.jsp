<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="process.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@  page errorPage="error.jsp"%>
<%

    response.setHeader("X-XSS-Protection", "1; mode=block");
    response.addHeader("X-Frame-Options", "DENY");
    response.addHeader("X-Content-Type-Options", "nosniff");
    response.addHeader("Content-Security-Policy", "default-src 'self'; script-src 'self' 'unsafe-inline';style-src 'self' http://fonts.googleapis.com/icon?family=Material+Icons https://fonts.googleapis.com/icon?family=Material+Icons 'unsafe-inline'; font-src *; img-src *");
%>
<!DOCTYPE HTML>
<html>

<head>
    <script>
        var language = 0;
        //for events
        var events_title = [];
        var events_title_kannada = [];
        var events_image = [];
        var events_content = [];
        var events_content_kannada = [];
        var events_link_kannada = [];

        //for news feed
        var news_title = [];
        var news_title_kannada = [];
        var news_link = [];
        var news_link_kannada = [];
        var news_content = [];
        var news_content_kannada = [];

        //for other_stories section
        var stories_title = [];
        var stories_title_kannada = [];
        var stories_content = [];
        var stories_content_kannada = [];
        var stories_image = [];
        var stories_link_kannada = [];

        //for most read articles
        var recent_article_title = [];
        var recent_article_title_kannada = [];
        var recent_article_link = [];
        var recent_article_link_kannada = [];

        //for miscellaneous
        var miscellaneous_title = [];
        var miscellaneous_title_kannada = [];
        var miscellaneous_content = [];
        var miscellaneous_content_kannada = [];
        var miscellaneous_link = [];
        var miscellaneous_link_kannada = [];

        //for advertisements
        var advertisement_image = [];
        var advertisement_link = [];

        <%
  //TEMORARY
  //session.setAttribute("area","mrc");
  //----

            //to select the area
            String pageToDisplay = "mrc";
            int isDistrict = 0;
            int isUlb = 0;
            if(StringEscapeUtils.escapeJava(request.getParameter("district")) != null ){
                pageToDisplay = StringEscapeUtils.escapeJava(request.getParameter("district"));
                isDistrict = 1;
            }else if(StringEscapeUtils.escapeJava(request.getParameter("ulb")) != null){
                pageToDisplay = StringEscapeUtils.escapeJava(request.getParameter("ulb"));
                isUlb = 1;
            }

              //get status=approved for clients
              //status=editing for preview purposes
              String status = "APPROVED";
              if(StringEscapeUtils.escapeJava(request.getParameter("status")) != null && request.getParameter("status").equals("editing"))
              {
                  status = "editing";
                  if (session.getAttribute("email") == null) {
                  response.setStatus(response.SC_MOVED_TEMPORARILY);
                  response.setHeader("Location", "login.jsp");
                  }
              }
            //get month

            String[] monthNames = { "January", "February", "March", "April", "May", "June", "July",
                    "August", "September", "October", "November", "December" };
            Calendar now = Calendar.getInstance();
            String monthName = monthNames[now.get(Calendar.MONTH)];
            int year = now.get(Calendar.YEAR);
            if(StringEscapeUtils.escapeJava(request.getParameter("month")) != null && StringEscapeUtils.escapeJava(request.getParameter("year")) != null)
            {
              monthName = StringEscapeUtils.escapeJava(request.getParameter("month"));
              year =  Integer.parseInt(request.getParameter("year"));
            }

    //check if the edition exists until the last approved edition is found
        if(!status.equals("editing")){
             Edition magazine = new Edition();
             int monthInNumber;
                for(int i=0; i < 5; i++){
                    if(status.equals("APPROVED") && magazine.editionExists(monthName, year, pageToDisplay, status))
                    break; //if edition exists then fine or else check the previous month's issue
                    else
                    {
                        monthInNumber = now.get(Calendar.MONTH) - i;
                        if(monthInNumber < 0)
                            {
                                monthInNumber = 12 - (now.get(Calendar.MONTH) - i); //to accomodate when addition of january doesn't exists
                                year-=1;
                            }

                        monthName = monthNames[monthInNumber];
                    }
                }
                }

            //to get all events under the area name

            Events event = new Events();
            List<Events> allEvents = event.getAllEvents(pageToDisplay, monthName, year, status);
            try {
                for(int i=0; i< allEvents.size(); i++)
                {
                      Events singleEvent = allEvents.get(i);

                      out.println("events_title["+i+"] =\" "+ StringEscapeUtils.escapeJavaScript(singleEvent.getTitle()) + " \" ;");
                      out.println("events_title_kannada["+i+"] =\" "+ StringEscapeUtils.escapeJavaScript(singleEvent.getTitleKannada()) + " \" ;");
                      out.println("events_image["+i+"] =\"/resources?name="+ StringEscapeUtils.escapeJavaScript(singleEvent.getImagePath()) + " \" ;");
                      out.println("events_content["+i+"] =\" "+ StringEscapeUtils.escapeJavaScript(singleEvent.getEventsContent()) + " \" ;");
                      out.println("events_content_kannada["+i+"] =\" "+ StringEscapeUtils.escapeJavaScript(singleEvent.getEventsContentKannada()) + " \" ;");
                      out.println("events_link_kannada["+i+"] =\"/resources?name="+ singleEvent.getLink_kannada() + " \" ;");
                }
            }catch(Exception e){
                //redirect to error page
                out.print(e.getMessage());
            }




          //for news feed

          NewsFeed news = new NewsFeed();
          List<NewsFeed> listOfAllNews = news.getNewsFeed(pageToDisplay, year, monthName, status);

                              for(int i=0; i< listOfAllNews.size(); i++){
                                  NewsFeed singleNews = listOfAllNews.get(i);

                                  out.print("news_title["+i+"]=\""+StringEscapeUtils.escapeJavaScript(singleNews.getTitle())+"\" ;");
                                  out.print("news_title_kannada["+i+"]=\""+StringEscapeUtils.escapeJavaScript(singleNews.getTitleKannada())+"\" ;");

                                  String extension = singleNews.getLink();
                                  if(extension != null && extension.length() > 2)
                                  {
                                      extension = singleNews.getLink().substring(singleNews.getLink().lastIndexOf('.'), singleNews.getLink().length()).toLowerCase();
                                      if(extension.equals(".jpg") || extension.equals(".jpeg") || extension.equals(".png") || extension.equals(".pdf"))
                                      {
                                          out.print("news_link["+i+"]=\"/resources?name="+StringEscapeUtils.escapeJavaScript(singleNews.getLink())+"\" ;");
                                          out.print("news_link_kannada["+i+"]=\"/resources?name="+StringEscapeUtils.escapeJavaScript(singleNews.getLinkKannada())+"\" ;");
                                      }else{
                                          out.print("news_link["+i+"]=\""+singleNews.getLink()+"\" ;");
                                          out.print("news_link_kannada["+i+"]=\""+singleNews.getLinkKannada()+"\" ;");
                                      }
                                  }else{
                                          out.print("news_link["+i+"]=\""+singleNews.getLink()+"\" ;");
                                          out.print("news_link_kannada["+i+"]=\""+singleNews.getLinkKannada()+"\" ;");
                                      }

                                  out.print("news_content_kannada["+i+"]=\""+StringEscapeUtils.escapeJavaScript(singleNews.getContentKannada())+"\" ;");
                                  out.print("news_content["+i+"]=\""+StringEscapeUtils.escapeJavaScript(singleNews.getContent())+"\" ;");
                              }



          //for other stories

          Stories story = new Stories();
          List<Stories> allStories = story.getAllStories(pageToDisplay, monthName, year, 3, status);

                          for(int i=0; i<allStories.size(); i++)
                          {
                                  Stories singleStory = allStories.get(i);

                                  out.print("stories_title["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitle()) +"\" ;");
                                  out.print("stories_title_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getTitleKannada()) +"\" ;");
                                  out.print("stories_content["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContent()) +"\" ;");
                                  out.print("stories_content_kannada["+i+"]=\""+ StringEscapeUtils.escapeJavaScript(singleStory.getStoriesContentKannada()) +"\" ;");
                                  out.print("stories_image["+i+"]=\"/resources?name="+ StringEscapeUtils.escapeJavaScript(singleStory.getImagePath()) +"\" ;");
                                  out.print("stories_link_kannada["+i+"]=\"/resources?name="+ StringEscapeUtils.escapeJavaScript(singleStory.getLinkKannada()) +"\" ;");

                          }


           //for most read articles
           MostReadArticles recent = new MostReadArticles();
           List<MostReadArticles> allRecentArticles = recent.getAllRecentArticles(pageToDisplay, monthName, year, status);

                           for(int i=0; i<allRecentArticles.size(); i++)
                           {
                                  MostReadArticles article = allRecentArticles.get(i);

                                  out.print("recent_article_title["+i+"] = \""+ StringEscapeUtils.escapeJavaScript(article.getTitle()) +"\";");
                                  out.print("recent_article_title_kannada["+i+"] = \""+ StringEscapeUtils.escapeJavaScript(article.getTitleKannada()) +"\";");

                                  String extension = article.getLink();
                                  if(extension.length() > 2)
                                  {
                                     extension = article.getLink().substring(article.getLink().lastIndexOf('.'), article.getLink().length()).toLowerCase();
                                      if(extension.equals(".jpg") || extension.equals(".jpeg") || extension.equals(".png") || extension.equals(".pdf"))
                                      {
                                          out.print("recent_article_link["+i+"] = \"/resources?name="+ article.getLink() +"\";");
                                          out.print("recent_article_link_kannada["+i+"] = \"/resources?name="+ article.getLinkKannada() +"\";");
                                      }else{
                                          out.print("recent_article_link["+i+"] = \""+ article.getLink() +"\";");
                                          out.print("recent_article_link_kannada["+i+"] = \""+ article.getLinkKannada() +"\";");
                                      }
                                  }else{
                                          out.print("recent_article_link["+i+"] = \""+ article.getLink() +"\";");
                                          out.print("recent_article_link_kannada["+i+"] = \""+ article.getLinkKannada() +"\";");
                                      }
                           }


           //for miscellaneous section
            General urlContent =  new General();
            Miscellaneous rows = new Miscellaneous();
            List<Miscellaneous> allMiscellaneous = rows.getAllMiscellaneous(pageToDisplay, monthName, year, status);
                          for(int i=0; i<allMiscellaneous.size(); i++)
                          {
                                  Miscellaneous row = allMiscellaneous.get(i);

                                               out.print("miscellaneous_title["+i+"]=\""+row.getTitle()+"\";");
                                               out.print("miscellaneous_title_kannada["+i+"]=\""+row.getTitleKannada()+"\";");

                                  out.print("miscellaneous_content["+i+"]=\""+urlContent.urlExtracter(StringEscapeUtils.escapeJavaScript(row.getContent()))+"\";");
                                  out.print("miscellaneous_content_kannada["+i+"]=\""+StringEscapeUtils.escapeJavaScript(row.getContentKannada())+"\";");

                                  String extension = row.getLink();
                                  if(extension.length() > 2)
                                  {
                                     extension = row.getLink().substring(row.getLink().lastIndexOf('.'), row.getLink().length()).toLowerCase();
                                      if(extension.equals(".jpg") || extension.equals(".jpeg") || extension.equals(".png") || extension.equals(".pdf")){
                                          out.print("miscellaneous_link["+i+"]=\"/resources?name="+row.getLink()+"\";");
                                          out.print("miscellaneous_link_kannada["+i+"]=\"/resources?name="+row.getLinkKannada()+"\";");
                                      }else
                                          {
                                               out.print("miscellaneous_link["+i+"]=\""+row.getLink()+"\";");
                                               out.print("miscellaneous_link_kannada["+i+"]=\"="+row.getLinkKannada()+"\";");
                                          }
                                  }else
                                  {
                                              out.print("miscellaneous_link["+i+"]=\""+row.getLink()+"\";");
                                              out.print("miscellaneous_link_kannada["+i+"]=\"="+row.getLinkKannada()+"\";");
                                  }

                          }

              //for advertisements
              Advertisements addRows = new Advertisements();
              List<Advertisements> allAdds = addRows.getAllAdvertisement();
                  for(int i=0; i<allAdds.size(); i++)
                  {
                      Advertisements singleAdd = allAdds.get(i);

                      out.print("advertisement_image["+i+"]=\"/resources?name="+StringEscapeUtils.escapeJavaScript(singleAdd.getImagePath())+"\";");
                      out.print("advertisement_link["+i+"]=\""+singleAdd.getLink()+"\";");
                  }

        %>
    </script>


    <title>MRC eMagazine</title>
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
    <style>
        html, body {
            width: 100%;
        }

        .shadow:hover {
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .teal-dark {
            color: #00796B;
        }

        .teal-color {
            color: #009688;
        }

        a {
            cursor: pointer;
            color: #FF5722;
        }

        .link {
            cursor: pointer;
        }

        .modal {
            width: 90% !important;
            min-height: 88% !important;
            max-height: 95% !important;
            margin-top: -2%;
        }
    </style>
</head>
<body>

<header>


    <% if (isDistrict == 0 && isUlb == 0) {
        String[] allDistricts = {"Bagalkot", "Ballari", "Bangalore Rural", "Bangalore Urban", "Belagavi", "Bidar", "Chamarajanagara", "Chikkaballapur",
                "Chikkamagaluru", "Chitradurga", "Dakshina Kannada", "Davangere", "Dharward", "Gadag", "Hassan", "Haveri", "Kalaburagi", "Kodagu",
                "Kolar", "Koppal", "Mandya", "Mysore", "Raichur", "Ramanagara", "Shivamogga", "Tumkur", "Udupi", "Uttara Kannada", "Vijayapur", "Yadgiri"
        };
    %>

    <ul id="dropdownDistrict" class="dropdown-content" onmouseover="zIndexToggle(-50);" onmouseout="zIndexToggle(1)">
            <%
                //to loop list all the districts in the above array
                for( String district : allDistricts){
                %>
                    <li><a href="index.jsp?district=<%=district%>"><%=district%></a></li>
                <%
                } //end for loop only
                %>

            <%} else if(isDistrict == 1){%>
        <ul id="dropdownDistrict" class="dropdown-content">
            <li><a href="<%= "index.jsp?ulb=ulb 1"%>">Konnur</a></li>
            <li><a href="<%= "index.jsp?ulb=ulb 2"%>">Hanur</a></li>
            <li><a href="<%= "index.jsp?ulb=ulb 3"%>">Birur</a></li>
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
                          style="margin-top: -2.5%; font-size: 0.6em;" onmouseover="zIndexToggle(-50);" onmouseout="zIndexToggle(1)">
                        <% if (isDistrict == 0 && isUlb == 0 || isUlb == 1) {%>
                        Choose District
                        <%} else if (isDistrict == 1) {%>
                        Choose ULB
                        <%}%>
                    <i class="material-icons right">arrow_drop_down</i> </span>
                    </a>

                    <a href="index.jsp" class="right hide-on-small-and-down"
                       style="margin-top: 0.5%; margin-right: 10%;">
                        <img src="images/mrcLogo.png" style="height: 90px;">
                    </a>
                </div>
                <div class="row">
                    <a class="left hide-on-small-and-down" style="margin-top: -3.5em; margin-left: 7%;">
                        MRC/<%=year%>/<%=monthName%>-001
                    </a>
                    <a class="right hide-on-small-and-down" style="margin-top: -3.5em; margin-right: 14%;">
                        <%=monthName%> <%=year%>
                    </a>
                </div>
            </div>
        </nav>
</header>
<br><br>

<!--after header-->
<main>
    <div class="container" style="width: 90%;">
        <% if (request.getParameter("error") != null) {%>
        <div class="row">
            <div class="col m10 push-m5">
                <h5 class="light red-text "><%= request.getParameter("error") %>
                </h5>
            </div>
        </div>
        <%}%>

        <p class="light right push-l5"><a onclick="languageChange('kannada');return false;"><strong>
            Kannada </strong></a>/ <a onclick="languageChange('english');return false;"><strong>English</strong></a>
        </p>
        <div class="row">
            <!--Events -->
            <div class="col s12 m5">
                <h5 class="light teal-color">Events</h5>
                <div class="card large shadow">
                    <div class="card-image" style="max-height: 18em;">
                        <img src="" id="event_image">

                    </div>
                    <div class="card-content" style="min-height: 6em;">
                        <span class="card-title light" style="line-height: 120%;" id="event_title"></span>
                        <p><a id="event_readmore_link" class="waves-effect waves-light modal-trigger"
                              href="#event_modal">READ MORE </a></p>
                        <p id="event_summary"><!--event summary--></p>

                    </div>

                    <div class="card-action">
                        <!-- < 1 2 3 4 > -->
                        <ul class="pagination left-align ">
                            <li class="active link" id="0" onclick="change_event(this.id);return false;"><a>1</a></li>
                            <li class="waves-effect link" id="1" onclick="change_event(this.id);return false;"><a>2</a>
                            </li>
                            <li class="waves-effect link" id="2" onclick="change_event(this.id);return false;"><a>3</a>
                            </li>
                            <li class="waves-effect link" id="3" onclick="change_event(this.id);return false;"><a>4</a>
                            </li>
                            <li class="waves-effect link" id="4" onclick="change_event(this.id);return false;"><a>5</a>
                            </li>
                            <!--<li class=" disabled"><a><i class="material-icons">chevron_right</i></a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <!--Modal for event popup-->
            <div id="event_modal" class="modal modal-fixed-footer ">
                <div class="modal-content">
                    <h4 class="light teal-color" id="event_modal_title">Event Name/heading</h4>
                    <p>
                        <img id="event_modal_image" src=""
                             style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                    </p>
                    <p id="event_modal_content">

                    </p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="modal-action modal-close waves-effect btn red">CLOSE</a>
                </div>
            </div>

            <!--news feed-->
            <div class="col s12 m4">
                <h4 class="light teal-color">News Feed</h4>
                <div class="card shadow " id="news_feed_class">
                    <div class="card-content">
                        <p>
                            <!--news feed table-->
                            <table id="news_feed_table">
                                <!--Modal for upcoming events-->
                                <div id="upcoming_events_modal" class="modal modal-fixed-footer " style="width:70%; ">
                                    <div class="modal-content">
                                        <h4 class="light teal-color center"> <!----></h4>
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

        <div class="card" style="min-height: 18em;max-height: 18em;box-shadow: 0 0 0 0;">

            <div class="card-image">
                <a href="" id="advertisement1_link"><img id="advertisement1_image" src="" style="max-height: 100%;"></a>
            </div>

        </div>

        <div class="card" style="min-height: 18em;max-height: 18em;box-shadow: 0 0 0 0;">

            <div class="card-image">
                <a href="" id="advertisement2_link"><img id="advertisement2_image" src="" style="max-height: 100%;"></a>
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
                    <div class="card" id="story1_card_image">
                        <div class="card-content">
                            <span id="story1_title" class="card-title teal-color"><!--story heading--></span>
                        </div>
                        <div class="card-image" style="max-height: 18em;">
                            <img id="story1_image" src=""/>
                        </div>

                    </div>
                </div>

                <div class="col s12 m7">
                    <br><br><br><br>
                    <p id="story1_summary">


                    </p>

                    <p><a id="story1_readmore_link" class="waves-effect waves-light modal-trigger" href="#story1_modal">READ
                        MORE </a></p>
                    <!--Modal for story 1-->
                    <div id="story1_modal" class="modal modal-fixed-footer " style="width:70%; ">
                        <div class="modal-content">
                            <h4 class="light teal-color" id="story1_modal_title">Event Name/heading</h4>
                            <p>
                                <img id="story1_modal_image" src=""
                                     style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
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

            <div class="card" style="min-height: 23em;max-height: 23em;box-shadow: 0 0 0 0;">
                <div class="card-content white-text">
                    <p>
                    <div class="card-image" style="max-height: 22em;">
                        <a href="" id="advertisement3_link"><img id="advertisement3_image" src=""></a>
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
                    <div class="card" id="story2_card_image">
                        <div class="card-content">
                            <span id="story2_title" class="card-title teal-color"><!--story heading--></span>
                        </div>
                        <div class="card-image" style="max-height: 18em;">
                            <img id="story2_image" src=""/>
                        </div>

                    </div>
                </div>

                <div class="col s12 m7"><br>
                    <p id="story2_summary">


                    </p>

                    <p><a id="story2_readmore_link" class="waves-effect waves-light modal-trigger" href="#story2_modal">READ
                        MORE </a></p>
                    <!--Modal for story 2-->
                    <div id="story2_modal" class="modal modal-fixed-footer " style="width:70%; ">
                        <div class="modal-content">
                            <h4 class="light teal-color" id="story2_modal_title"><!--event name--></h4>
                            <p>
                                <img id="story2_modal_image" src=""
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
            </div>
        </div>

        <!--place for add-->
        <div class="col s12 m3">

            <div class="card" style="min-height: 21em;max-height: 21em;box-shadow: 0 0 0 0;">
                <div class="card-content white-text">
                    <p>
                    <div class="card-image">
                        <a href="" id="advertisement4_link"><img id="advertisement4_image" src=""
                                                                 style="max-height: 20em;"></a>
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
                    <div class="card" id="story3_card_image">
                        <div class="card-content">
                            <span id="story3_title" class="card-title teal-color"><!--story heading--></span>
                        </div>
                        <div class="card-image" style="max-height: 18em;">
                            <img id="story3_image" src=""/>
                        </div>

                    </div>
                </div>

                <div class="col s12 m7"><br>
                    <p id="story3_summary">


                    </p>
                    <p><a id="story3_readmore_link" class="waves-effect waves-light modal-trigger" href="#story3_modal">READ
                        MORE </a></p>

                    <% if (status.intern() == "editing") {%>
                    <p><a class="waves-effect waves-light" href="otherStories.jsp?status=editing&month=<%=monthName%>&year=<%=year%>">MORE STORIES</a></p>
                    <%} else {%>
                    <p><a class="waves-effect waves-light" href="otherStories.jsp?month=<%=monthName%>&year=<%=year%>">MORE STORIES</a></p>
                    <%}%>
                    <!--Modal for story 3-->
                    <div id="story3_modal" class="modal modal-fixed-footer " style="width:70%; ">
                        <div class="modal-content">
                            <h4 class="light teal-color" id="story3_modal_title"><!--Event Name/heading--></h4>
                            <p>
                                <img id="story3_modal_image" src=""
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

            </div>
            <div class="row">
                <!--miscellaneous section-->
                <ul class="collapsible pull-l1" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><h4 class="light teal-color">Miscellaneous</h4></div>

                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i>Health Capsule
                        </div>
                        <div class="collapsible-body">
                            <p>1. <a href="" id="miscellaneous1_link"><span
                                    id="miscellaneous1_title"><!--content--></span></a></p>
                            <p id="miscellaneous1_content">
                                <!--content-->
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i>Interesting
                            Articles on Urban Development
                        </div>
                        <div class="collapsible-body">
                            <p>1.<a href="" id="miscellaneous2_link"><span
                                    id="miscellaneous2_title"><!--content--></span></a></p>
                            <p id="miscellaneous2_content">
                                <!--content-->
                            </p>
                        </div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i>Citizens corner
                        </div>
                        <div class="collapsible-body">
                            <p class="light"><a id="miscellaneous3_link"><span
                                    id="miscellaneous3_title"><!--content--></span></a></p>
                            <p id="miscellaneous3_content">
                                <!--content-->
                            </p>
                            <p class="light"><a class="waves-effect waves-light btn modal-trigger"
                                                href="#citizen_modal"> Instruction to publish here</a></p>

                            <!--Modal for Citizens corner-->
                            <div id="citizen_modal" class="modal modal-fixed-footer white" style="width:70%; ">
                                <div class="modal-content">
                                    <p id="citizen_modal_content ">

                                    <ul class="collection with-header">
                                        <li class="collection-header light teal-color"><h4>Instructions</h4></li>
                                        <li class="collection-item">1. The content of your article shall be between
                                            1500-2000 words.
                                        </li>
                                        <li class="collection-item">2. Photos (if any) may be submitted in jpg, jpeg or
                                            png as part of the document.
                                            Photos can be a. before the event and b. after the event. Photos are not
                                            mandatory.
                                        </li>
                                        <li class="collection-item">3. Please drop your stories to <a
                                                href="mailto:paras.bhattrai@ashoka.edu.in">email@ashoka</a></li>
                                        <li class="collection-item">4. While we love to publish your story, we may be
                                            constrained to choose and publish your story.
                                        </li>
                                    </ul>

                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <a href="#" class="modal-action modal-close waves-effect btn red">CLOSE</a>
                                </div>
                            </div>
                            <!--modal over-->

                        </div>
                    </li>


                    <!--<li>
                        <div class="collapsible-header"><i class="material-icons dp48 teal-dark">info</i>Fun Corner
                        </div>
                        <div class="collapsible-body">
                            <p>1.<a href="" id="miscellaneous4_link"><span
                                    id="miscellaneous4_title">                        </span></a></p>
                            <p id="miscellaneous4_content">

                            </p>
                        </div>
                    </li>-->
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

    <% if (status.intern() == "editing" && session.getAttribute("email") != null) {%>
    <p class="light center-align"><a href="controller.jsp?requestFor=approveEdition"
                                     class="waves-effect waves-light btn btn-large red">Approve Edition</a></p>
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
            <!--Footer text-->
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

        $('.dropdown-button').dropdown({
            constrain_width: true,
        });

    });

    var index;
    function zIndexToggle( index ){
        document.getElementById("news_feed_class").style.zIndex = index;
    }

    //to check how many events are presents and show the numbers links on the footer action bar accordingly
    function display_event_numbers() {

        var i;
        //first hide all the elements
        for (i = 0; i < 5; i++) {
            $("#" + i).addClass("hide");
        }


        //now show links according to total title (events present)
        if (language == 0) {
            for (i = 0; i < events_title.length; i++) {
                if (document.getElementById(i) != undefined && events_title[i] != null && events_title[i].length > 4)
                    $("#" + i).removeClass("hide");
            }
        } else if (language = 1) {

            for (i = 0; i < events_title_kannada.length; i++) {
                if (document.getElementById(i) != undefined && events_title_kannada[i] != null && events_title_kannada[i].length > 4)
                    $("#" + i).removeClass("hide");

            }
        }
    }
    display_event_numbers();

    //only for events section (first)
    var id;
    function change_event(id) {

        document.getElementById("event_image").src = events_image[id];
        document.getElementById("event_modal_image").src = events_image[id];


        if (language == 0) {

            $("#event_title").text(events_title[id]);
            $("#event_modal_title").text(events_title[id]);
            document.getElementById("event_image").alt = events_title[id];
            document.getElementById("event_modal_image").alt = events_title[id];

            if (events_content[id] != undefined) {
                document.getElementById("event_summary").innerHTML = events_content[id].substring(0, 50) + " ...";
                $("#event_modal_content").text(events_content[id]);
            }


            document.getElementById("event_readmore_link").href = "#event_modal"; //assigning button to link modal
            $("event_readmore_link").addClass("waves-light modal-trigger");
        } else if (language == 1) {
            $("#event_title").text(events_title_kannada[id]);
            $("#event_modal_title").text(events_title_kannada[id]);
            document.getElementById("event_image").alt = events_title_kannada[id];
            document.getElementById("event_modal_image").alt = events_title_kannada[id];


            if (events_link_kannada[id] != undefined && events_link_kannada != " ") {
                document.getElementById("event_readmore_link").href = events_link_kannada[id]; //assigning document to link
                $("#event_readmore_link").removeClass("waves-light modal-trigger");

                document.getElementById("event_summary").innerHTML = " "; //clear event summary section in case attachment is found

            }
            /*else {  //to be used in case content kannada is added
             if (events_content[id] != undefined)
             document.getElementById("event_summary").innerHTML = events_content_kannada[id].substring(0, 100);
             $("#event_modal_content").text(events_content_kannada[id]);


             document.getElementById("event_readmore_link").href = "#event_modal"; //assigning button to link modal
             $("event_readmore_link").addClass("waves-light modal-trigger");
             }*/
        }

        //to change active button color (ui)
        $("#0").removeClass("active");
        $("#1").removeClass("active");
        $("#2").removeClass("active");
        $("#3").removeClass("active");
        $("#4").removeClass("active");
        $("#" + id).addClass("active");
    }
    change_event(0);


    //for news feed dynamic creation
    function addto_newsfeed() {
        var table = document.getElementById("news_feed_table");
        var newsfeed_length;

        //to clear previous data
        while (table.firstChild)
            table.removeChild(table.firstChild);

        if (language == 0) {


            newsfeed_length = news_title.length;
            for (var i = 0; i < newsfeed_length; i++) {

                if (news_title[i] != undefined && news_title[i] != " ") { //to prevent appending blank values
                    var tr = document.createElement("tr");
                    var td = document.createElement("td");


                    if (news_content[i] == "null" || news_content[i] == " ")
                        td.innerHTML = "<a href=\'" + news_link[i] + "\'>" + (i + 1) + ". " + news_title[i] + " </a>";
                    else { //else enables modal
                        td.innerHTML = "<a href='#upcoming_events_modal'>" + (i + 1) + ". " + news_title[i] + "</a>";
                        td.className = "waves-effect waves-light modal-trigger";
                        document.getElementById("upcoming_events_modal_content").innerHTML = news_content[i];
                    }
                    tr.appendChild(td);
                    table.appendChild(tr);
                }

            }
            //merge to table
        } else if (language == 1) {

            //for kannada
            newsfeed_length = news_title_kannada.length;
            for (var i = 0; i < newsfeed_length; i++) {

                if (news_title_kannada[i] != undefined && news_title_kannada[i] != " ") {
                    var tr = document.createElement("tr");
                    var td = document.createElement("td");
                    if (news_content_kannada[i] == "null" || news_content_kannada[i] == " ")
                        td.innerHTML = "<a href=\'" + news_link_kannada[i] + "\'>" + (i + 1) + ". " + news_title_kannada[i] + " </a>";
                    else {
                        td.innerHTML = "<a href='#upcoming_events_modal'>" + (i + 1) + ". " + news_title_kannada[i] + "</a>";
                        td.className = "waves-effect waves-light modal-trigger";
                        document.getElementById("upcoming_events_modal_content").innerHTML = news_content_kannada[i];
                    }
                    tr.appendChild(td);
                    table.appendChild(tr); //merge to table
                }

            }

        }

    }
    addto_newsfeed();

    //to make number of stories displayed  = number of stories present in db
    function display_stories() {
        var stories = ['story1', 'story2', 'story3'];

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
        var stories = ['story1', 'story2', 'story3'];
        for (var i = 0; i < stories.length; i++) {
            document.getElementById(stories[i] + "_image").src = stories_image[i];
            document.getElementById(stories[i] + "_modal_image").src = stories_image[i];


            if (language == 0) {
                document.getElementById(stories[i] + "_title").innerHTML = stories_title[i];
                document.getElementById(stories[i] + "_modal_title").innerHTML = stories_title[i];
                document.getElementById(stories[i] + "_image").alt = stories_title[i];
                document.getElementById(stories[i] + "_modal_image").alt = stories_title[i];

                if (stories_content[i] != undefined) {
                    document.getElementById(stories[i] + "_summary").innerHTML = stories_content[i].substring(0, 550) + "...";
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
                /* //to be used when content Kannada is activated,
                 if (stories_content_kannada[i] != undefined) {
                 document.getElementById(stories[i] + "_summary").innerHTML = stories_content_kannada[i].substring(0, 550) + "...";
                 document.getElementById(stories[i] + "_modal_content").innerHTML = stories_content_kannada[i];
                 }*/
            }
        }
    }
    addto_otherstories();

    //for recent articles
    function addto_recentarticles() {
        var table = document.getElementById("recent_articles_table");

        //to clear previous data
        while (table.firstChild)
            table.removeChild(table.firstChild);

        if (language == 0) {

            var recentArticlesLength = recent_article_title.length;
            for (var i = 0; i < recentArticlesLength; i++) {
                var tr = document.createElement('tr');
                var td = document.createElement('td');
                if (recent_article_title[i] != undefined && recent_article_title[i] != " ") {
                    td.innerHTML = "<a href=\'" + recent_article_link[i] + "\'>" + (i + 1) + ". " + recent_article_title[i] + " </a>";
                    tr.appendChild(td);

                    table.appendChild(tr);
                }
            }
        } else if (language == 1) {
            var recentArticlesLength = recent_article_title_kannada.length;
            for (var i = 0; i < recentArticlesLength; i++) {
                var tr = document.createElement('tr');
                var td = document.createElement('td');
                if (recent_article_title_kannada[i] != undefined && recent_article_title_kannada[i] != " ") {
                    td.innerHTML = "<a href=\'" + recent_article_link_kannada[i] + "\'>" + (i + 1) + ". " + recent_article_title_kannada[i] + " </a>";
                    tr.appendChild(td);

                    table.appendChild(tr);
                }
            }
        }
    }
    addto_recentarticles();

    //for miscellaneous section
    function addto_miscellaneous() {
        miscellaneous_elements = ['miscellaneous1', 'miscellaneous2', 'miscellaneous3'];
        if (language == 0) {
            for (var i = 0; i < miscellaneous_elements.length; i++) {
                if (miscellaneous_title[i] != undefined)
                    document.getElementById(miscellaneous_elements[i] + "_title").innerHTML = miscellaneous_title[i];
                if (miscellaneous_content[i] != undefined)
                    document.getElementById(miscellaneous_elements[i] + "_content").innerHTML = miscellaneous_content[i];
                //miscellaneous_link_kannada
                if (miscellaneous_link[i] != undefined)
                    document.getElementById("miscellaneous" + (i + 1) + "_link").href = miscellaneous_link[i];
            }
        } else if (language == 1) {
            for (var i = 0; i < 3; i++) {
                if (miscellaneous_title != undefined)
                    document.getElementById(miscellaneous_elements[i] + "_title").innerText = miscellaneous_title_kannada[i];
                if (miscellaneous_content[i] != undefined)
                    document.getElementById(miscellaneous_elements[i] + "_content").innerHTML = "2." + miscellaneous_content_kannada[i];
                //miscellaneous_link_kannada
                if (miscellaneous_link[i] != undefined)
                    document.getElementById("miscellaneous" + (i + 1) + "_link").href = miscellaneous_link_kannada[i];
            }

        }
    }
    addto_miscellaneous();

    //for advertisements
    function addto_advertisements() {
        for (var i = 0; i < 4; i++) {
            if (advertisement_image[i] != undefined) {
                document.getElementById("advertisement" + (i + 1) + "_image").src = advertisement_image[i];
                document.getElementById("advertisement" + (i + 1) + "_link").href = advertisement_link[i];
            }
        }
    }
    addto_advertisements();
    var x;
    function languageChange(x) {
        if (x == 'kannada')
            language = 1;
        else
            language = 0;

        display_event_numbers();
        change_event(0);

        addto_newsfeed();

        display_stories();
        addto_otherstories();

        addto_recentarticles();

        addto_miscellaneous();
        return false;
    }

    //random console messages
    console.log("%c We request you to not paste any code here as this console is not meant for coding.", "color: red;font-size: 6em");
    console.log("%c Paras and Deva, first version started at june 2016", "color: blue;font-size: 4em");
    //Paras Bhattrai

</script>
</html>