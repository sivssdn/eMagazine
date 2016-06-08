
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>MRC eMagazine</title>

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

      </style>
  </head>
  <body>

  <header>
      <center>
          <nav class="top-nav" style="height: 20%; background-color: #BCAAA4;">
              <div class="container" >
                  <div class="nav-wrapper">
                      <ul id="gklogo" class="left hide-on-med-and-down">
                          <li><a><img src="images/gkLogo.png" style="height: 16vh;margin-top: 14%;"></a></li>
                      </ul>
                      <a class="brand-logo center" style="font-size: 8vh;margin-top: 3%;">eMagazine</a>
                      <ul id="mrclogo" class="right hide-on-med-and-down">
                          <li><a><img src="images/mrcLogo.png" style="height: 16vh;margin-top: 14%;"></a></li>
                      </ul>
                  </div>
              </div>
          </nav>
      </center>
  </header>
<br><br>
  <!--after header-->
  <main>
      <div class="container" style="width: 90%;">
          <div class="row">
                  <!--Events -->
                  <div class="col s12 m5">
                          <h4 class="light">Events</h4>
                      <div class="card large shadow">
                        <div class="card-image" style="max-height: 40vh;">
                          <img src="http://materializecss.com/images/sample-1.jpg">

                          <span class="card-title">Title of the event</span>
                        </div>
                        <div class="card-content" style="min-height: 8vh;">
                          <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
                          <p><a class="waves-effect waves-light modal-trigger" href="#event_modal">READ MORE ... </a></p>
                        </div>

                          <div class="card-action">
                            <!-- < 1 2 3 4 > -->
                            <ul class="pagination left-align ">
                                <li class="active"><a href="#!">1</a></li>
                                <li class="waves-effect"><a href="#!">2</a></li>
                                <li class="waves-effect"><a href="#!">3</a></li>
                                <li class="waves-effect"><a href="#!">4</a></li>
                                <li class="waves-effect"><a href="#!">5</a></li>
                                <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                            </ul>
                            </div>
                        </div>
                  </div>
                        <!--Modal for event popup-->
                          <div id="event_modal" class="modal modal-fixed-footer " style="width:70%; ">
                              <div class="modal-content">
                                  <h4>Event Name/heading</h4>
                                  <p>
                                      <img src="http://materializecss.com/images/sample-1.jpg" style="max-width: 100%;max-height: 40vh;display: block;margin: auto;"/>
                                  </p>
                                  <p>
                                      Content
                                      In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments marking several significant sites in the life of Gautama Buddha. "Ashoka regarded Buddhism as a doctrine that could serve as a cultural foundation for political unity."[9] Ashoka is now remembered as a philanthropic administrator. In the Kalinga edicts, he addresses his people as his "children", and mentions that as a father he desires their good.

                                      Ashoka's name "Aśoka" means "painless, without sorrow" in Sanskrit (the a privativum and śoka "pain, distress"). In his edicts, he is referred to as Devānāmpriya (Pali Devānaṃpiya or "The Beloved of the Gods"), and Priyadarśin (Pali Piyadasī or "He who regards everyone with affection"). His fondness for his name's connection to the Saraca asoca tree, or the "Ashoka tree" is also referenced in the Ashokavadana.

                                      H.G. Wells wrote of Ashoka in his book The Outline of History: "Amidst the tens of thousands of names of monarchs that crowd the columns of history, their majesties and graciousnesses and serenities and royal highnesses and the like, the name of Ashoka shines, and shines, almost alone, a star." Along with the Edicts of Ashoka, his legend is related in the 2nd-century CE Ashokavadana ("Narrative of Ashoka", a part of Divyavadana), and in the Sri Lankan text Mahavamsa ("Great Chronicle"). The emblem of the modern Republic of India is an adaptation of the Lion Capital of Ashoka.
                                  </p>
                              </div>
                              <div class="modal-footer">
                                  <a href="#" class=" modal-action modal-close waves-effect btn red">CLOSE</a>
                              </div>
                          </div>

                    <!--news feed-->
                      <div class="col s12 m4">
                          <h4 class="light">News Feed</h4>
                          <div class="card shadow">
                              <div class="card-content white-text">
                                  <p>
                                        <table>
                                                <tr>
                                                    <td><a href="">1. ULB Ranking</a></td>
                                                </tr>
                                                <tr>
                                                    <td>2. Upcoming Events Diary</td>
                                                </tr>
                                                <tr>
                                                    <td>3. Swach Bharat / Smart City Progress at Karnataka state</td>
                                                </tr>
                                                <tr>
                                                    <td>4. Tender Notifications</td>
                                                </tr>
                                                <tr>
                                                    <td>5. New news</td>
                                                </tr>
                                                <tr>
                                                    <td>6. Any other</td>
                                                </tr>

                                        </table>
                                  </p>
                              </div>

                          </div>
                      </div>

              <!--place for add-->
              <div class="col s12 m3">

                  <div class="card blue-grey darken-1">
                      <div class="card-content white-text">
                          <p>Advertisement 1
                          <div class="card-image" style="max-height: 50vh;">
                                <img src="http://materializecss.com/images/sample-1.jpg">
                          </div>
                          </p>
                      </div>
                   </div>
                      <!--<div class="card-action">
                          <a href="#">This is a link</a>
                          <a href="#">This is a link</a>
                      </div>-->


                      <div class="card blue-grey darken-1">
                          <div class="card-content white-text">
                              <p>Advertisement 2
                              <div class="card-image" style="max-height: 50vh;">
                                  <img src="http://materializecss.com/images/sample-1.jpg">
                              </div>
                              </p>
                          </div>
                       </div>
                    </div>
           </div>
          <!--row 2-->
          <div class="row">
          <div class="col s12 m9">
            <div class="row">
              <div class="col s12 m4">
                  <h4 class="light">Other stories : </h4>
                  <div class="card">
                      <div class="card-image" style="max-height: 40vh;">
                          <img src="http://materializecss.com/images/office.jpg" />
                      </div>
                      <div class="card-content">
                          <span class="card-title">Story heading</span>
                      </div>
                  </div>
              </div>

              <div class="col s12 m7">
                  <br><br><br>
                              <p>
                                  More Content about card on the left goes here...<br>
                              In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments...
                              </p>

                          <p><a class="waves-effect waves-light" href="#">READ MORE </a></p>

              </div>
            </div>
          </div>

              <!--place for add-->
              <div class="col s12 m3">

                  <div class="card blue-grey darken-1">
                      <div class="card-content white-text">
                          <p>Advertisement 3
                          <div class="card-image" style="max-height: 50vh;">
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
                                  <!--story section-->
                                  <div class="card">
                                      <div class="card-image" style="max-height: 40vh;">
                                          <img src="http://materializecss.com/images/office.jpg" />
                                      </div>
                                      <div class="card-content">
                                          <span class="card-title">Story heading</span>
                                      </div>
                                  </div>
                              </div>

                              <div class="col s12 m7">
                                          <p>
                                              More Content about card on the left goes here...<br>
                                              In about 260 BCE, Ashoka waged a bitterly destructive war against the state of Kalinga (modern Odisha).[6] He conquered Kalinga, which none of his ancestors had done.[7] He embraced Buddhism after witnessing the mass deaths of the Kalinga War, which he himself had waged out of a desire for conquest. "Ashoka reflected on the war in Kalinga, which reportedly had resulted in more than 100,000 deaths and 150,000 deportations, ending at around 200,000 deaths."[8] Ashoka converted gradually to Buddhism beginning about 263 BCE.[6] He was later dedicated to the propagation of Buddhism across Asia, and established monuments ...

                                          </p>
                                          <p><a class="waves-effect waves-light" href="#">READ MORE </a></p>
                            </div>

              </div>
              <div class="row">
                  <!--miscellaneous section-->
                  <ul class="collapsible pull-l1" data-collapsible="accordion">
                      <li>
                          <div class="collapsible-header">Miscellaneous</div>

                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48">info</i>Health Capsule:</div>
                          <div class="collapsible-body">
                              <p>
                                  Prevention of Chicken Gunia/Dengue/Tips for good health < link to article>
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48">info</i>Interesting Articles on Urban Development</div>
                          <div class="collapsible-body">
                              <p>
                                  article 1 <br>
                                  article 2 <br>
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48">info</i>Bizarre news</div>
                          <div class="collapsible-body">
                              <p>
                                  News from the World
                              </p>
                          </div>
                      </li>
                      <li>
                          <div class="collapsible-header"><i class="material-icons dp48">info</i>Fun Corner</div>
                          <div class="collapsible-body">
                              <p>
                                  Joke
                              </p>
                          </div>
                      </li>
                  </ul>

              </div>
           </div>

              <!-- recent articles-->
              <div class="col s12 m3">
                  <h4 class="light">Recent articles</h4>
                  <div class="card shadow">
                      <div class="card-content white-text">
                          <p>
                          <table>
                              <tr>
                                  <td><a href="">1. ULB Ranking</a></td>
                              </tr>
                              <tr>
                                  <td>2. Upcoming Events Diary</td>
                              </tr>
                              <tr>
                                  <td>3. Swach Bharat / Smart City Progress at Karnataka state</td>
                              </tr>
                              <tr>
                                  <td>4. Tender Notifications</td>
                              </tr>
                              <tr>
                                  <td>5. New news</td>
                              </tr>
                              <tr>
                                  <td>6. Any other</td>
                              </tr>
                              <tr>
                                  <td>6. Any other</td>
                              </tr>
                              <tr>
                                  <td>6. Any other</td>
                              </tr>
                              <tr>
                                  <td>6. Any other</td>
                              </tr>

                          </table>
                          </p>
                      </div>
                  </div>
              </div>

          </div>



          </div>

      </div>


   </main>

  <footer class="page-footer">
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
      });

      $('.modal-trigger').leanModal({
                  dismissible: true, // Modal can be dismissed by clicking outside of the modal
                  opacity: 1, // Opacity of modal background
                  in_duration: 300, // Transition in duration
                  out_duration: 200, // Transition out duration
              }
      )
  </script>
</html>
