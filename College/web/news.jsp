<%-- 
    Document   : news
    Created on : 3 Apr, 2017, 10:02:10 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%     
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);  
    
    if( session.getAttribute("username") == null ){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You are not logged in.');");
            out.println("location='login.html';");
            out.println("</script>");
    }
    String course = (String) session.getAttribute("Course");
    String id = null;
    Cookie[] cookies = request.getCookies();
        if(cookies !=null){
         for(Cookie cookie : cookies){
          if(cookie.getName().equals("JSESSIONID")) id = cookie.getValue();
         }
        }
    if(id == null)
        response.sendRedirect("login.html");
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/mbm-logo-129x128.png" type="image/x-icon">
  <meta name="description" content="User Details">
  <title>Current News</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <link rel="stylesheet" href="assets/mobirise/css/rocket_style.css">
</head>
<body>
<section class="mbr-navbar mbr-navbar--freeze mbr-navbar--absolute mbr-navbar--sticky mbr-navbar--auto-collapse" id="ext_menu-v">
    <div class="mbr-navbar__section mbr-section">
        <div class="mbr-section__container container">
            <div class="mbr-navbar__container">
                <div class="mbr-navbar__column mbr-navbar__column--s mbr-navbar__brand">
                    <span class="mbr-navbar__brand-link mbr-brand mbr-brand--inline">
                        <span class="mbr-brand__logo"><img src="assets/images/mbm-logo-129x128.png" class="mbr-navbar__brand-img mbr-brand__img" alt="MBM_logo" title="MBM Engineering College"></span>
                        <span class="mbr-brand__name"><a class="mbr-brand__name text-white" href="#top">M.B.M. Engineering College</a></span>
                    </span>
                </div>
                <div class="mbr-navbar__hamburger mbr-hamburger"><span class="mbr-hamburger__line"></span></div>
                <div class="mbr-navbar__column mbr-navbar__menu">
                    <nav class="mbr-navbar__menu-box mbr-navbar__menu-box--inline-right">
                        <div class="mbr-navbar__column">
                            <ul class="mbr-navbar__items mbr-navbar__items--right float-left mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="user.jsp">PROFILE</a></li><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="news.jsp">NEWS</a></li><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="library.jsp">LIBRARY</a></li></ul>                            
                            <ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-inverse mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__btn btn btn-info" href="logout.jsp">Sign Out</a></li></ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<% int r = course.compareToIgnoreCase("MCA");
   if(r==0){
%>    
<section class="mbr-section mbr-section--relative mbr-section--fixed-size" id="features1-b" style="background-color: rgb(239, 239, 239);">
    
    <div class="mbr-section__container mbr-section__container--std-top-padding mbr-section__container--sm-bot-padding mbr-section-title container" style="padding-top: 193px; padding-bottom: 93px;">
        <div class="mbr-header mbr-header--center mbr-header--wysiwyg row">
            <div class="col-sm-8 col-sm-offset-2">
                <h2 class="mbr-header__text">Currently No News Available<br/>(For MCA Students)</h2>
            </div>
        </div>
    </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
 <div style="position: relative;">        
  
<svg version="1.1" id="cloud-animation" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 350 200" enable-background="new 0 0 158.8 105.8" xml:space="preserve">
	
	<!-- CLOUD SVG -->
	<path id="cloud" fill="#fff" stroke="#8cd2ff" stroke-width="10" stroke-miterlimit="10" d="M145,71.8c0.5-1.7,0.8-3.5,0.8-5.3c0-10.6-8.6-19.3-19.3-19.3c-2.6,0-5.1,0.5-7.3,1.5																													c-3.7-11-12.4-19.7-23.4-23.4c-0.1,0-0.2-0.1-0.3-0.1C90.5,10.5,76.7,0,60.4,0C39.8,0,23.2,16.6,23.2,37.2c0,3.5,0.5,7,1.4,10.2
	c4.6-1.5,9.5-1.5,13.8-0.2c-4.3-0.3-8.9,0.5-13.2,2.4c-1.1,0.5-2.1,1.1-3.1,1.7C16,55.6,12,62.7,11.7,70.7c3.2-0.8,6.5-0.7,9.6,0.2
	c-3.8-0.1-7.7,0.6-11.3,2.5c-1.3,0.7-2.5,1.5-3.7,2.3c-3.6,3.1-5.9,7.8-5.9,12.9c0,9.5,7.7,17.2,17.2,17.2h1.6h122.3
	c9.5,0,17.2-7.7,17.2-17.2C158.8,80.3,152.8,73.4,145,71.8z"/>
	
	<!-- ANIMATION PATH + OPTIONS -->
	<animateMotion xlink:href="#cloud" dur="20s" begin="0s" repeatCount="indefinite" path="M59.5,38.9c21.3-2.9,22.5-31.1,73.3-10.7s10.7,48.7-16.4,57.4s-56.1,22.1-95.1-4.5S38.2,41.8,59.5,38.9z" />
</svg>

<!-- ROCKET SVG ANIMATION -->
<svg version="1.1" id="rocket-animation" x="0px" y="0px" width="800px" height="800px" viewBox="0 0 800 800" > 
	<g id="rocket"> 
		<g> 
			<path class="fill-grey" d="M120.783,150.852l-0.028-0.269c6.563-8.526,12.536-34.443,13.354-38.156 c1.496-1.359,3.009-2.768,4.535-4.241c18.597-17.889,42.638-48.011,51.123-89.871c0.283-1.415-0.205-3.034-1.272-4.101 c-1.067-1.068-2.624-1.493-4.066-1.238c-41.811,8.436-71.933,32.448-89.85,51.102c-1.486,1.547-2.907,3.079-4.276,4.593 c-1.958,0.432-29.846,6.96-38.206,13.354c-8.345,6.505-23.83,23.687-24.466,24.465c-1.414,1.555-1.485,3.747-0.495,5.445 c0.142,0.282,0.424,0.564,0.637,0.777c1.202,1.201,2.899,1.625,4.455,1.202c13.717-4.102,27.966-6.612,32.703-5.835 c0.212,2.9,0.92,7.708,2.8,12.616c-4.172,7.565-7.792,15.004-8.506,16.425c-0.835,1.825-0.452,3.847,0.891,5.189l0.269,0.269 c1.314,1.514,3.535,2.052,5.423,1.139c1.365-0.657,8.026-3.924,15.132-7.82c4.052,1.974,8.747,2.808,14.022,2.524 c0.565,5.091-1.916,18.943-5.926,32.258c-0.474,1.605-0.043,3.296,1.11,4.448c0.269,0.269,0.537,0.452,0.778,0.636 c1.746,1.082,3.931,0.877,5.43-0.48C97.103,174.674,114.369,159.217,120.783,150.852z M79.927,123.675 c-0.196-0.23-0.387-0.469-0.574-0.712c-0.041-0.054-0.081-0.106-0.122-0.16c-0.453-0.606-0.876-1.243-1.256-1.889 c2.688-4.667,5.303-8.556,7-10.253l-0.071-0.085c4.88-4.88,12.8-8.98,18.88-11.667c-2.672,6.095-6.76,14.028-11.639,18.907 c-1.768,1.769-5.925,4.425-10.852,7.275c-0.173-0.158-0.347-0.315-0.514-0.483c-0.014-0.013-0.025-0.028-0.039-0.041 C80.457,124.281,80.189,123.98,79.927,123.675z M132.605,101.441c-17.119,16.512-32.965,25.682-36.356,27.551l-0.002-0.002 c-1.541,0.184-2.983,0.239-4.341,0.183c2.793-1.803,5.141-3.528,6.605-4.991c10.251-10.253,16.884-30.093,17.159-30.921 c0.588-1.576,0.142-3.395-1.061-4.597l-0.494-0.494c-1.202-1.202-2.949-1.576-4.596-1.061c-0.836,0.269-20.648,6.93-30.901,17.182 c-1.272,1.272-2.687,3.253-4.256,5.529c-0.212-1.485-0.269-2.702-0.312-3.507c4.045-7.581,32.428-55.054,86.307-76.692 c0.8,2.78,2.306,5.897,4.837,8.429c1.96,1.96,4.548,3.572,7.873,4.448C162.516,68.722,146.078,88.463,132.605,101.441z M168.805,26.489c3.407-1.136,6.902-2.173,10.497-3.082c-0.914,3.614-1.955,7.126-3.096,10.543 C170.942,32.969,169.309,28.866,168.805,26.489z M47.302,100.677l-0.135,0.021c-0.799,0.163-1.591,0.318-2.362,0.495 c4.456-4.596,9.44-9.439,12.82-12.112c3.955-2.967,14.119-6.356,22.881-8.76c-6.331,8.117-10.63,14.878-12.987,18.856 C63.904,98.416,57.907,98.5,47.302,100.677z M101.55,157.895l-0.027,0.015l0.51-2.348c2.15-10.602,2.287-16.602,1.512-20.269 c3.958-2.354,10.702-6.634,18.796-12.949c-2.43,8.769-5.736,18.889-8.699,22.753C111.053,148.448,106.146,153.44,101.55,157.895z" /> 
			<path class="fill-color" d="M173.164,42.526c-3.373-0.87-5.989-2.496-7.969-4.476c-2.531-2.531-4.037-5.649-4.837-8.429 c-53.879,21.638-82.262,69.111-86.307,76.692c0.043,0.805,0.1,2.021,0.312,3.507c1.569-2.276,2.983-4.257,4.256-5.529 c10.252-10.252,30.065-16.914,30.901-17.182c1.646-0.516,3.394-0.142,4.596,1.061l0.494,0.494 c1.202,1.202,1.648,3.021,1.061,4.597c-0.275,0.828-6.908,20.668-17.159,30.921c-1.465,1.463-3.812,3.188-6.605,4.991 c1.357,0.057,2.8,0.001,4.341-0.183l0.063,0.077c3.375-1.859,19.226-11.038,36.366-27.556 C146.154,88.486,162.629,68.759,173.164,42.526z M137.704,65.004c-2.949-2.949-2.949-7.729,0-10.677 c2.947-2.948,7.729-2.948,10.677,0c2.948,2.949,2.948,7.729,0,10.677C145.433,67.953,140.653,67.953,137.704,65.004z"/> 
			<path class="fill-grey" d="M154.569,48.126c-6.351-6.35-16.716-6.336-23.066,0.014c-6.35,6.35-6.35,16.701,0,23.052l0.028-0.001 c6.35,6.35,16.701,6.351,23.052,0C160.932,64.842,160.918,54.475,154.569,48.126z M137.866,64.828 c-2.843-2.843-2.828-7.495,0.015-10.338c2.842-2.842,7.48-2.843,10.323,0l0.014,0.014c2.843,2.843,2.828,7.495-0.015,10.338 C145.362,67.684,140.708,67.67,137.866,64.828z"/> 
		</g>
		<line fill="none" class="path stroke-color" stroke-width="7" stroke-miterlimit="10" x1="52.27" y1="122.222" x2="19.923" y2="154.569"/> 
		<line fill="none" class="path stroke-color" stroke-width="7" stroke-miterlimit="10" x1="80.698" y1="150.65" x2="48.351" y2="182.996"/>
	</g>
	
	
		<!-- ANIMATION PATH + OPTIONS -->
	<animateMotion xlink:href="#rocket" dur="20s"	 begin="0s" repeatCount="indefinite" path="M59.6,418.9c0,0,340.4-758.3,680.7,0" />
</svg>
    </div><br/><br/><br/>
</section> 
<%
    }
%> 
<footer class="mbr-section mbr-section--relative mbr-section--fixed-size" id="footer1-e" style="background-color: rgb(0, 0, 0);">
    
    <div class="mbr-section__container container">
        <div class="mbr-footer mbr-footer--wysiwyg row" style="padding-top: 24.6px; padding-bottom: 12.3px;">
            <div class="col-sm-12">
                <p class="mbr-footer__copyright"></p><p>© 2017 MBM Site All Rights Reserved. Designed &amp; Developed By: &nbsp;<a href="https://www.facebook.com/navdeep.charan" target="_blank" class="text-info">Navdeep Charan</a></p><p></p>
            </div>
        </div>
    </div>
</footer>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="assets/cookies-alert-plugin/cookies-alert-core.js"></script>
  <script src="assets/cookies-alert-plugin/cookies-alert-script.js"></script>
  <script src="assets/mobirise/js/script.js"></script>
  
  
<input name="cookieData" type="hidden" data-cookie-text="We use cookies to give you the best experience. Read our <a href='privacy.html'>cookie policy</a>.">
  </body>
</html>    