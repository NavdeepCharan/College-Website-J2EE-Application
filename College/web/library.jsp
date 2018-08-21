<%-- 
    Document   : library
    Created on : 3 Apr, 2017, 4:04:24 PM
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
  <title>Course Library</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
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
                <h2 class="mbr-header__text">eBooks Available<br/>(For MCA Students)</h2>
            </div>
        </div>
    </div>
    <div class="mbr-section__container container">
        <div class="mbr-section__row row">
            <div class="mbr-section__col col-xs-12 col-md-3 col-sm-6">
                <div class="mbr-section__container mbr-section__container--center mbr-section__container--middle">
                    <figure class="mbr-figure"><img src="4d4341/C_Plus_Plus.jpg" width="250" height="320" class="mbr-figure__img"></figure>
                </div>
                <div class="mbr-section__container mbr-section__container--middle">
                    <div class="mbr-header mbr-header--reduce mbr-header--center mbr-header--wysiwyg">
                        <a href="4d4341/C_Plus_Plus.pdf"><h3 class="mbr-header__text">C++<br>The Complete Reference</h3></a>
                    </div>
                </div>
                <div class="mbr-section__container mbr-section__container--last" style="padding-bottom: 124px;">
                    <div class="mbr-article mbr-article--wysiwyg">
                        <p>"Herbert Schildt is the world’s leading programming
author. He is an authority on the C, C++, Java, and C#
languages, and is a master Windows programmer. His
programming books have sold more than 3 million
copies worldwide and have been translated into all
major foreign languages. He is the author of numerous
bestsellers."<br></p>
                    </div>
                </div>
                
            </div>
            <div class="mbr-section__col col-xs-12 col-md-3 col-sm-6">
                <div class="mbr-section__container mbr-section__container--center mbr-section__container--middle">
                    <figure class="mbr-figure"><img src="4d4341/Java.jpg" width="250" height="320" class="mbr-figure__img"></figure>
                </div>
                <div class="mbr-section__container mbr-section__container--middle">
                    <div class="mbr-header mbr-header--reduce mbr-header--center mbr-header--wysiwyg">
                        <a href="4d4341/Java.pdf"><h3 class="mbr-header__text">Java<br>The Complete Reference</h3></a>
                    </div>
                </div>
                <div class="mbr-section__container mbr-section__container--last" style="padding-bottom: 124px;">
                    <div class="mbr-article mbr-article--wysiwyg">
                        <p>"Best-selling author Herbert Schildt has written extensively about programming
for nearly three decades and is a leading authority on the Java language. His
books have sold millions of copies worldwide and have been translated into all
major foreign languages."</p>
                    </div>
                </div>
                
            </div>
            <div class="clearfix visible-sm-block"></div>
            <div class="mbr-section__col col-xs-12 col-md-3 col-sm-6">
                <div class="mbr-section__container mbr-section__container--center mbr-section__container--middle">
                    <figure class="mbr-figure"><img src="4d4341/SQL.jpg" width="250" height="320" class="mbr-figure__img"></figure>
                </div>
                <div class="mbr-section__container mbr-section__container--middle">
                    <div class="mbr-header mbr-header--reduce mbr-header--center mbr-header--wysiwyg">
                        <a href="4d4341/SQL.pdf"><h3 class="mbr-header__text">SQL<br>The Complete Reference<br></h3></a>
                    </div>
                </div>
                <div class="mbr-section__container mbr-section__container--last" style="padding-bottom: 124px;">
                    <div class="mbr-article mbr-article--wysiwyg">
                        <p>"James R. Groff is CEO of PBworks, whose hosted collaboration software helps teams of people
work together more effectively and efficiently. Paul N. Weinberg is a senior vice president at SAP, where he runs core MDM (Master Data
Management) development. Andrew J. (Andy) Oppel is lead data modeler at Blue Shield of California."</p>
                    </div>
                </div>
                
            </div>
            
            <div class="mbr-section__col col-xs-12 col-md-3 col-sm-6">
                <div class="mbr-section__container mbr-section__container--center mbr-section__container--middle">
                    <figure class="mbr-figure"><img src="4d4341/Linux.jpg" width="250" height="320" class="mbr-figure__img"></figure>
                </div>
                <div class="mbr-section__container mbr-section__container--middle">
                    <div class="mbr-header mbr-header--reduce mbr-header--center mbr-header--wysiwyg">
                        <a href="4d4341/Linux.pdf"><h3 class="mbr-header__text">Linux<br>The Complete Reference</h3></a>
                    </div>
                </div>
                <div class="mbr-section__container mbr-section__container--last" style="padding-bottom: 124px;">
                    <div class="mbr-article mbr-article--wysiwyg">
                        <p>"Richard Petersen, MLIS, teaches Unix and C/C++
courses at the University of California at Berkeley. He
is the author of Linux: The Complete Reference (all six
editions), Red Hat Enterprise and Fedora Linux: The
Complete Reference, Red Hat Linux, Linux Programming,
Red Hat Linux Administrator's Reference, Linux
Programmer's Reference."</p>
                    </div>
                </div>
                
            </div>
            
            
            
        </div>
    </div>
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