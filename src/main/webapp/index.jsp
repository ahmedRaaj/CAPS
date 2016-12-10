<%--
  Created by IntelliJ IDEA.
  User: Zwe Htat Naing
  Date: 09/12/2016
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

    <title>T-11 Caps</title>
    <style>


        .clickable{
            cursor: pointer;
        }
        body:after{
                 content: url("${pageContext.request.contextPath}/image/LoginBackground.jpg") ;
            display: none;


        }
         body {

            background: url("${pageContext.request.contextPath}/image/LoginBackground.jpg") no-repeat center center fixed;
             -webkit-background-size: cover;
             -moz-background-size: cover;
         }


        .panelbg {
            position: relative;
            padding: 10px 0;
            border-bottom: 1px solid;
            border-bottom-color: #ccc;
            border-bottom-color: rgba(255, 255, 255, 0.2);
            background-color: rgba(120, 105, 143, 0.2);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            min-height: 100% !important;
        }

        p {
            text-align: justify;
            display:-webkit-box;
            height:140px;
            font-size: medium;
            font-family: metro, "Segoe UI", "Open Sans", serif;
            overflow:hidden !important;
            text-overflow: ellipsis;
            -webkit-line-clamp: 5;
            -webkit-box-orient: vertical;


        }
        .panel-heading i:after {
            font-family:'Glyphicons Halflings';
            content:"\e114";
            float: right;
            color: black;
        }
        .panel-heading i.collapsed:after {
            content:"\e080";
        }

    </style>


</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #34495e !important;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class=" navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/image/Game%20Maker-22.png">
                <label style="color: rgba(240,245,235,0.82)">Team 11 Caps        </label>
            </a>
        </div>
        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath}/login/Mainpage" style="color: rgba(240,245,235,0.82)">Login</a></li>
                <li><a href="http://www.science.nus.edu.sg/contact-us" style="color: rgba(240,245,235,0.82)">Contact Us</a></li>
                <li><a href="http://nus.edu.sg/osa/about-us" style="color: rgba(240,245,235,0.82)">About Us</a></li>
            </ul>
        </div>

    </div>
</nav>

<div class="row col-md-12" >
    <div class="col-md-9 col-md-offset-2" >
    <div class="panelbg panel panel-default" style="margin-top: 100px !important;min-height: 90% !important;">
        <h1 style="color: rgba(219,229,176,0.82);text-align: center;">WELCOME FROM NUS</h1>
            <div class="panel-body ">
                <div class="row">
                    <div class="col-md-7">

                    <div id="wowslider-container1">
                        <div class="ws_images"><ul>
                            <li><img src="/image/sliderimg/images/1.jpg" alt="" title="" id="wows0_0"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/cmimg_74093.jpg" alt="cmimg_74093" title="cmimg_74093" id="wows0_1"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/diplomacoursesinsingapore400x300.png" alt="diploma-courses-in-singapore-400x300" title="diploma-courses-in-singapore-400x300" id="wows0_2"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/hdinspirationalquotesforstudentswithhdwindowswallpaperfullhdwithinspirationalquotesforstudentsdownloadhdwallpaper.jpg" alt="HD-inspirational-quotes-for-students-With-HD-Windows-Wallpaper-Full-HD-with-inspirational-quotes-for-students-Download-HD-Wallpaper" title="HD-inspirational-quotes-for-students-With-HD-Windows-Wallpaper-Full-HD-with-inspirational-quotes-for-students-Download-HD-Wallpaper" id="wows0_3"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/laurea.jpg" alt="Laurea" title="Laurea" id="wows0_4"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/nussing661x340400x300.jpg" alt="nus-sing-661x340-400x300" title="nus-sing-661x340-400x300" id="wows0_5"/></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/servicemainland.png" alt="service-mainland" title="service-mainland" id="wows0_6"/></li>
                            <li><a href="http://wowslider.com/vi"><img src="${pageContext.request.contextPath}/image/sliderimg/images/servicesenior.png" alt="cssslider" title="service-senior" id="wows0_7"/></a></li>
                            <li><img src="${pageContext.request.contextPath}/image/sliderimg/images/thac.jpg" alt="thac" title="thac" id="wows0_8"/></li>
                        </ul></div>
                        <div class="ws_bullets"><div>
                            <a href="#" title=""><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/1.jpg" alt=""/>1</span></a>
                            <a href="#" title="cmimg_74093"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/cmimg_74093.jpg" alt="cmimg_74093"/>2</span></a>
                            <a href="#" title="diploma-courses-in-singapore-400x300"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/diplomacoursesinsingapore400x300.png" alt="diploma-courses-in-singapore-400x300"/>3</span></a>
                            <a href="#" title="HD-inspirational-quotes-for-students-With-HD-Windows-Wallpaper-Full-HD-with-inspirational-quotes-for-students-Download-HD-Wallpaper"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/hdinspirationalquotesforstudentswithhdwindowswallpaperfullhdwithinspirationalquotesforstudentsdownloadhdwallpaper.jpg" alt="HD-inspirational-quotes-for-students-With-HD-Windows-Wallpaper-Full-HD-with-inspirational-quotes-for-students-Download-HD-Wallpaper"/>4</span></a>
                            <a href="#" title="Laurea"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/laurea.jpg" alt="Laurea"/>5</span></a>
                            <a href="#" title="nus-sing-661x340-400x300"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/nussing661x340400x300.jpg" alt="nus-sing-661x340-400x300"/>6</span></a>
                            <a href="#" title="service-mainland"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/servicemainland.png" alt="service-mainland"/>7</span></a>
                            <a href="#" title="service-senior"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/servicesenior.png" alt="service-senior"/>8</span></a>
                            <a href="#" title="thac"><span><img src="${pageContext.request.contextPath}/image/sliderimg/images/thac.jpg" alt="thac"/>9</span></a>


                        </div>
                        </div>
                    </div>

                    </div>
                    <div class="col-md-5" >
                    <div class="jumbotron" style="max-height:293px !important;padding-top: 10px !important;background-color: #bdc3c7 !important;">
                        <h3 style="color: rgba(48,58,255,0.82);">Students Activities</h3>
                        <p class="text">Last weekend was a resounding success for NUS Resonance which bagged the Gold award at the International Kodaly A capella Festival in Korea! Congratulations Reso on your success!
                            May all of us achieve success like Reso for our finals 🙂</p>
                        <p><a class="btn-link" href="http://www.nuscac.net/v2/">View More</a></p>


                    </div>

                    </div>
                </div>
                <div class="row">
                      <div class="col-md-12">
                          <div class="jumbotron" style="height: 800px;">
                              <div class="col-md-6">
                              <div class="panel panel-collapse">
                                  <div class="panel-heading" style="padding-bottom: 0px !important;margin: 0px 0px 0px !important;padding-left: 10px; background-color: rgba(108,77,216,0.82);">
                                      Academic Matters​
                                      <span class="pull-right clickable"><i data-toggle="collapse" data-target="#one"></i></span>
                                  </div>
                                  <div id="one" class="panel-collapse collapse in">

                                  <div  class="panel-body " style="height: 300px !important;">
                                      <ul>
                                          <li><a class="btn btn-link" style="font-size: 18px;" href="http://www.nus.edu.sg/registrar/calendar.html">Academic Calendar</a></li>
                                          <li><a href="http://www.cdtl.nus.edu.sg/ta-handbook/academic-integrity.htm" class="btn btn-link" style="font-size: 18px;">Academic Integrity</a></li>
                                          <li><a href="http://scale.nus.edu.sg/programmes/btech.html" class="btn btn-link" style="font-size: 18px;">Continuing Education</a></li>
                                          <li><a href="http://www.nus.edu.sg/oam/programmes.html" class="btn btn-link" style="font-size: 18px;">Undergraduate Programmes (Part-time)</a></li>
                                          <li><a href="http://www.nus.edu.sg/education" class="btn btn-link" style="font-size: 18px;">Schools</a></li>
                                          <li><a href="http://www.nus.edu.sg/oam/apply/apply.html" class="btn btn-link" style="font-size: 18px;">Study at NUS</a></li>

                                      </ul>

                                  </div>

                                  </div>
                              </div>

                              </div>
                              <div class="col-md-6">
                                  <div class="panel panel-collapse">
                                      <div class="panel-heading" style="padding-bottom: 0px !important;margin: 0px 0px 0px !important; padding-left: 10px;background-color: rgba(108,77,216,0.82);">
                                          Fees / Financial Assistance​
                                          <span class="pull-right clickable"><i data-toggle="collapse" data-target="#sec"></i></span>
                                      </div>
                                      <div id="sec"  class="panel-collapse collapse in">

                                      <div class="panel-body " style="height: 300px;">
                                          <ul>
                                              <li> <a href="http://www.nus.edu.sg/oam/financialaid.html" class="btn btn-link" style="font-size: 18px;">Finicial Aid</a></li>
                                              <li> <a href="http://www.nus.edu.sg/oam/scholarships/freshmen/scholarship-international.html" class="btn btn-link" style="font-size: 18px;">Scholarships</a></li>
                                              <li> <a href="http://www.nusbizadclub.com/sponsorships/" class="btn btn-link" style="font-size: 18px;">Sponsorships</a></li>
                                              <li> <a href="http://www.nus.edu.sg/osa/iss/qaa/moe-tuition-grant" class="btn btn-link" style="font-size: 18px;">Study Grants</a></li>
                                              <li> <a href="http://www.nus.edu.sg/registrar/education-at-nus/undergraduate-education/fees.html" class="btn btn-link" style="font-size: 18px;">Tuition Fee and Subsidy</a></li>

                                          </ul>

                                      </div>

                                      </div>

                                  </div>
                              </div>
                              <div class="col-md-6">
                                  <div class="panel panel-collapse">

                                          <div class="panel-heading" style="padding-bottom: 0px !important;margin: 0px 0px 0px !important;padding-left: 10px; background-color: rgba(108,77,216,0.82);">
                                              Map
                                              <span class="pull-right clickable"><i data-toggle="collapse" data-target="#three"></i></span>
                                          </div>

                                          <div id="three" class="panel-collapse collapse in">
                                              <div class="panel-body"  style="height: 300px;">
                                                        <div id="map" style="height: 270px;">

                                                        </div>
                                              </div>
                                          </div>


                                  </div>

                              </div>
                              <div class="col-md-6">
                                  <div class="panel panel-collapse">

                                      <div class="panel-heading" style="padding-bottom: 0px !important;margin: 0px 0px 0px !important;padding-left: 10px; background-color: rgba(108,77,216,0.82);">
                                          Call Us (24/7)
                                          <span class="pull-right clickable"><i data-toggle="collapse" data-target="#four"></i></span>
                                      </div>

                                      <div id="four" class="panel-collapse collapse in">
                                          <div class="panel-body"  style="height: 300px;">
                                              <ul>
                                                  <li><h4>Tel: (65) 6601 2135</h4></li>
                                                  <li><h4>Email: rcadmissions@nus.edu.sg</h4> </li>
                                              </ul>
                                          </div>

                                      </div>
                          </div>


                      </div>
                </div>
            </div>

    </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/wowslider.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ImgEffect.js"></script>

<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script>
    function myMap() {
        var mapCanvas = document.getElementById("map");
        var mapOptions = {
            center: new google.maps.LatLng(1.292233, 103.776650), zoom: 18
        };
        var map = new google.maps.Map(mapCanvas, mapOptions);
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAWXNiL4O1crERHmGbGBy6UgfAcWZDWnfc&callback=myMap"></script>

</body>
</html>
