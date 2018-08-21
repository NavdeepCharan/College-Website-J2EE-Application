<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/mbm-logo-129x128.png" type="image/x-icon">
  <meta name="description" content="M.B.M. Engineering College Login Page">
  <title>Registration Form</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <script>
      function seetext(x){
           x.type = "text";
       }
       function seeasterisk(x){
          x.type = "password";
       }
  </script>
  
  
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
                            <ul class="mbr-navbar__items mbr-navbar__items--right float-left mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-decorator mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="index.html">HOME</a></li><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="about.html">ABOUT</a></li><li class="mbr-navbar__item"><a class="mbr-buttons__link btn text-white" href="contact.html">CONTACT</a></li></ul>                            
                            <ul class="mbr-navbar__items mbr-navbar__items--right mbr-buttons mbr-buttons--freeze mbr-buttons--right btn-inverse mbr-buttons--active"><li class="mbr-navbar__item"><a class="mbr-buttons__btn btn btn-info" href="login.html">Sign in</a></li></ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="mbr-section mbr-section--relative mbr-section--fixed-size mbr-after-navbar" id="form1-x" style="background-color: rgb(239, 239, 239);">
    
    <div class="mbr-section__container mbr-section__container--std-padding container" style="padding-top: 93px; padding-bottom: 93px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="mbr-header mbr-header--center mbr-header--std-padding">
                            <h2 class="mbr-header__text">Registration Form</h2>
                        </div>
                        
                        <form action="new_user.jsp" method="post">
                            
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="username" required="" placeholder="Username (eg. geek007, learner55 etc.)">
                                <img border="0" src="assets\images\new-user.png" alt="new-user_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="email" required="" placeholder="Email (someone@site.com)">
                                <img border="0" src="assets\images\email.png" alt="email_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="password" class="form-control" name="password" required="" placeholder="Password (eg. Bravo$77#) ">
                                <img border="0" src="assets\images\key.png" onmouseover="seetext(password)" onmouseout="seeasterisk(password)" alt="key_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px; cursor: pointer; cursor: hand;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="fullname" required="" placeholder="Please enter your full name here">
                                <img border="0" src="assets\images\student.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="fathername" required="" placeholder="Please enter your father's name here">
                                <img border="0" src="assets\images\father.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="dob" required="" placeholder="Enter your date of birth here(DD/MM/YYYY)">
                                <img border="0" src="assets\images\dob.png" alt="dob_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="address" required="" placeholder="Please enter your residential address here">
                                <img border="0" src="assets\images\home.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="sex" required="" placeholder="Enter your gender here">
                                <img border="0" src="assets\images\male.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                                <img border="0" src="assets\images\female.png"   alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 50px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="course" required="" placeholder="Enter your course here (eg. MCA, ME, BE etc.)">
                                <img border="0" src="assets\images\course.png" alt="course_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="mobile" required="" placeholder="Enter your 10 digits mobile number here">
                                <img border="0" src="assets\images\mobile.png" alt="mobile_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <p align="center"><img border="0" src="stickyImage" alt="captcha"></p>
                                <input type="text" class="form-control" name="answer" required="" placeholder="Enter your captcha answer here">
                                
                            </div>
                            <div style="float: right;">
                                <div class="mbr-buttons mbr-buttons--right"><button type="submit" class="mbr-buttons__btn btn btn-lg btn-info">Submit</button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
