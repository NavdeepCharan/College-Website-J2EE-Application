<%-- 
    Document   : user
    Created on : 26 Mar, 2017, 4:02:55 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*;" %>
<%@ page import="javax.servlet.*;" %>
<%@ page import="java.sql.*;" %>
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
        String name = (String) session.getAttribute("username");
        String id = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
         for(Cookie cookie : cookies){
          if(cookie.getName().equals("JSESSIONID")) id = cookie.getValue();
         }
        }
        if(id == null)
            response.sendRedirect("login.html");
        
        byte[] ba = name.getBytes();
            String encrpt=name;
            StringBuilder str = new StringBuilder();
            for(int i = 0; i < ba.length; i++)
            str.append(String.format("%x", ba[i]));
            encrpt= str.toString();
        
        String fullname="", fathername="", dob="", address="", sex="", course="", mobile="";
    
        Class.forName("org.apache.derby.jdbc.ClientDriver");  
        Connection con=DriverManager.getConnection(
            "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");  
     
        PreparedStatement ps=con.prepareStatement("SELECT * FROM User_Registration WHERE Username=?"); 
        ps.setString(1,name);  
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
        fullname = rs.getString("Full_Name");
        fathername = rs.getString("Father_Name");
        dob = rs.getString("DOB");
        address = rs.getString("Address");
        sex = rs.getString("Gender");
        course = rs.getString("Course");
        mobile = rs.getString("Mobile");
        }
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/mbm-logo-129x128.png" type="image/x-icon">
  <meta name="description" content="User Details">
  <title>User Profile</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:700,400&amp;subset=cyrillic,latin,greek,vietnamese">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/mobirise/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <script type="text/javascript">
      function seetext(x){
           x.type = "text";
       }
       function seeasterisk(x){
          x.type = "password";
       }
      function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm_password").value;
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
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
    
    <div class="mbr-section__container mbr-section__container--std-padding container" style="padding-top: 93px; padding-bottom: 93px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="mbr-header mbr-header--center mbr-header--std-padding">
                            <h2 class="mbr-header__text">Edit your profile</h2>
                        </div>
                        <div> <div style="float: left; width: 30%;">
                        <form action="uploadfile.jsp" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <img src="profile_photo\<%out.print(encrpt);%>.jpg?<%out.print(Math.random());%>" alt="profile photo" height="165" width="215" style="display: block; margin: auto; border-radius: 10%"><br/>                             
                            </div>
                            <div class="form-group">
                                <input type="file" class="form-control" name="file" accept=".jpg,.png,.ico" size="50" required="">
                            </div>
                            <div class="mbr-buttons mbr-buttons--right"><button type="submit" value="Upload File" class="mbr-buttons__btn btn btn-lg btn-info">Change Photo</button></div>
                        </form>
                            </div>
                        <div style="float: right; width: 50%;">
                        <form action="change_password.jsp" method="post">
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="username" placeholder="Username: ( <%out.print(name);%> )" disabled>
                                <img border="0" src="assets\images\diamond.gif" alt="diamond_icon" width="75" height="75" style="position: absolute; top: -12px; right: -15px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="password" class="form-control" name="old_password" id="old_password" required="" placeholder="Old Password">
                                <img onmouseover="seetext(old_password)" onmouseout="seeasterisk(old_password)" border="0" src="assets\images\eye.gif" alt="view_pass" width="35" height="35" style="position: absolute; top: 8px; right: 5px; cursor: pointer; cursor: hand;">
                            </div>
                             <div class="form-group" style="position: relative;">
                                <input type="password" class="form-control" name="new_password" id="password" required="" placeholder="New Password">
                                <img onmouseover="seetext(password)" onmouseout="seeasterisk(password)" border="0" src="assets\images\eye.gif" alt="view_pass" width="35" height="35" style="position: absolute; top: 8px; right: 5px; cursor: pointer; cursor: hand;">
                             </div>
                            <div class="form-group" style="position: relative;">
                                <input type="password" class="form-control" name="confirm_password" id="confirm_password" required="" placeholder="Confirm New Password">
                                <img onmouseover="seetext(confirm_password)" onmouseout="seeasterisk(confirm_password)" border="0" src="assets\images\eye.gif"   alt="view_pass" width="35" height="35" style="position: absolute; top: 8px; right: 5px; cursor: pointer; cursor: hand;">
                            </div>
                            <div class="mbr-buttons mbr-buttons--right"><button type="submit" class="mbr-buttons__btn btn btn-lg btn-info" onclick="return Validate()">Change Password</button></div>
                        </form>   
                        </div></div>
                        <div style="float: right; width: 100%;"><br><br>
                        <form action="edit_details.jsp" method="post">
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="fullname" required="" placeholder="Please enter your full name here" value="<% out.print(fullname); %>">
                                <img border="0" src="assets\images\student.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="fathername" required="" placeholder="Please enter your father's name here" value="<% out.print(fathername); %>">
                                <img border="0" src="assets\images\father.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="dob" required="" placeholder="Enter your date of birth here(DD/MM/YYYY)" value="<% out.print(dob); %>">
                                <img border="0" src="assets\images\dob.png" alt="dob_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="address" required="" placeholder="Please enter your residential address here" value="<% out.print(address); %>">
                                <img border="0" src="assets\images\home.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="sex" required="" placeholder="Enter your gender here" value="<% out.print(sex); %>">
                                <img border="0" src="assets\images\male.png" alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                                <img border="0" src="assets\images\female.png"   alt="name_icon" width="35" height="35" style="position: absolute; top: 8px; right: 50px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="course" required="" placeholder="Enter your course here (eg. MCA, ME, BE etc.)" value="<% out.print(course); %>">
                                <img border="0" src="assets\images\course.png" alt="course_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <input type="text" class="form-control" name="mobile" required="" placeholder="Enter your 10 digits mobile number here" value="<% out.print(mobile); %>">
                                <img border="0" src="assets\images\mobile.png" alt="mobile_icon" width="35" height="35" style="position: absolute; top: 8px; right: 5px;">
                            </div>
                            <div class="form-group" style="position: relative;">
                                <p align="center"><img border="0" src="stickyImage" alt="captcha"></p>
                                <input type="text" class="form-control" name="answer" required="" placeholder="Enter your captcha answer here">
                            </div>
                            <div style="float: right;">
                                <div class="mbr-buttons mbr-buttons--right"><button type="submit" class="mbr-buttons__btn btn btn-lg btn-info">Update Details</button></div>
                            </div>
                        </form>    
                        </div>    
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
