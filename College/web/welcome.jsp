<%-- 
    Document   : welcome
    Created on : 27 Mar, 2017, 11:23:24 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>

<%      response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        
        if( session.getAttribute("username") == null ){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You are not logged in.');");
            out.println("location='login.html';");
            out.println("</script>");
        }
            
        
        String name = (String) session.getAttribute("username");
        String fullname = (String) session.getAttribute("fullname");
        String id = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
         for(Cookie cookie : cookies){
          if(cookie.getName().equals("JSESSIONID")) id = cookie.getValue();
         }
        }
        if(id == null)
            response.sendRedirect("login.html");
        session.setAttribute("uniqueId", id);
        
            byte[] ba = name.getBytes();
            String encrpt=name;
            StringBuilder str = new StringBuilder();
            for(int i = 0; i < ba.length; i++)
            str.append(String.format("%x", ba[i]));
            encrpt= str.toString();
       
 %>       
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/mbm-logo-129x128.png" type="image/x-icon">
  <meta name="description" content="welcome page">
       <title>Welcome <%out.print(fullname);%></title>
       <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <style>

            .text--line {
  font-size: .5em;
}
svg {
  position: absolute;
  width: 99%;
  height: 70%;
}

.text-copy {
  fill: none;
  stroke: white;
  stroke-dasharray: 7% 28%;
  stroke-width: 3px;
  -webkit-animation: stroke-offset 9s infinite linear;
          animation: stroke-offset 9s infinite linear;
}
.text-copy:nth-child(1) {
  stroke: #360745;
  stroke-dashoffset: 35%;
}
.text-copy:nth-child(2) {
  stroke: #D61C59;  
  stroke-dashoffset: 28%;
}
.text-copy:nth-child(3) {
  stroke: #E7D84B;
  stroke-dashoffset: 21%;
}
.text-copy:nth-child(4) {
  stroke: #EFEAC5;
  stroke-dashoffset: 14%;
}
.text-copy:nth-child(5) {
  stroke: #1B8798;
  stroke-dashoffset: 7%;
}

@-webkit-keyframes stroke-offset {
  50% {
    stroke-dashoffset: 35%;
    stroke-dasharray: 0 87.5%;
  }
}

@keyframes stroke-offset {
  50% {
    stroke-dashoffset: 35%;
    stroke-dasharray: 0 87.5%;
  }
}
</style>
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
<section class="mbr-section mbr-section--relative mbr-section--fixed-size mbr-after-navbar" id="form1-x" style="background-color: rgb(239, 239, 239);">  
    <div class="mbr-section__container mbr-section__container--std-padding container" style="height: 600px;">
        <img src="profile_photo\<%out.print(encrpt);%>.jpg?<%out.print(Math.random());%>" alt="profile photo" height="150" width="200" style="display: block; margin: auto; border-radius: 10%"><br/>                             
<font style="font-size: 12em; font-family: Arial;">
        <svg viewBox="0 0 800 600">
	preserveAspectRatio="xMinYMin slice"
  <symbol id="s-text">
    <text text-anchor="middle" x="50%" y="35%" class="text--line">
      Welcome
    </text>
    <text text-anchor="middle" x="50%" y="68%" class="text--line">
      <%
          out.print(fullname);%>
    </text>

  </symbol>

  <g class="g-ants">
    <use xlink:href="#s-text" class="text-copy"></use>
    <use xlink:href="#s-text" class="text-copy"></use>
    <use xlink:href="#s-text" class="text-copy"></use>
    <use xlink:href="#s-text" class="text-copy"></use>
    <use xlink:href="#s-text" class="text-copy"></use>
  </g>


</svg>
</font>
                        
    </div>
                
    
</section>
        <footer class="mbr-section mbr-section--relative mbr-section--fixed-size" id="footer1-w" style="background-color: rgb(0, 0, 0);">
    
    <div class="mbr-section__container container">
        <div class="mbr-footer mbr-footer--wysiwyg row" style="padding-top: 24.6px; padding-bottom: 12.3px;">
            <div class="col-sm-12">
                <p class="mbr-footer__copyright"></p><p>© 2017 MBM Site All Rights Reserved. Designed &amp; Developed By:&nbsp;<a href="https://www.facebook.com/navdeep.charan" target="_blank" class="text-info">Navdeep Charan</a></p><p></p>
            </div>
        </div>
    </div>
</footer>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="assets/cookies-alert-plugin/cookies-alert-core.js"></script>
  <script src="assets/cookies-alert-plugin/cookies-alert-script.js"></script>
  <!--[if lte IE 9]>
    <script src="assets/jquery-placeholder/jquery.placeholder.min.js"></script>
  <![endif]-->
  <script src="assets/mobirise/js/script.js"></script>
  
  
<input name="cookieData" type="hidden" data-cookie-text="We use cookies to give you the best experience. Read our <a href='privacy.html'>cookie policy</a>.">

    </body>
</html>
