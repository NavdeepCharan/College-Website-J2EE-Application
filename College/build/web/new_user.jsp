<%-- 
    Document   : new_user
    Created on : 31 Mar, 2017, 11:03:44 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*;" %>
<%@ page import="javax.servlet.*;" %>
<%@ page import="java.sql.*;" %>
<%@ page import="java.util.regex.Matcher;"%>
<%@ page import="java.util.regex.Pattern;"%>
<%@ page errorPage="error.jsp" %>
<%@page import="nl.captcha.Captcha"%>
<%
    
    Captcha captcha=(Captcha)session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8");
 
    String answer=request.getParameter("answer");
 
    if(captcha.isCorrect(answer)){
    String username, email, password, fullname, fathername, dob, address, sex, course, mobile;
    int flag = 0;
    boolean valid = false ;
     username = request.getParameter("username");
     email = request.getParameter("email");
     password = request.getParameter("password");
     fullname = request.getParameter("fullname");
     fathername = request.getParameter("fathername");
     dob = request.getParameter("dob");
     address = request.getParameter("address");
     sex = request.getParameter("sex");
     course = request.getParameter("course");
     mobile = request.getParameter("mobile");
     
     Class.forName("org.apache.derby.jdbc.ClientDriver");  
     Connection con=DriverManager.getConnection(
     "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");  
     
     PreparedStatement ps=con.prepareStatement("SELECT * FROM User_Registration WHERE Username=? OR Email=?");  
     ps.setString(1,username);  
     ps.setString(2,email);
     ResultSet rs=ps.executeQuery();
     if(rs.next()){ 
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Username or Email is already taken.');");
        out.println("</script>");
        flag = 1;
     }
     String STRING_PATTERN =
              "((?=.*[.])(?=.*[@#$%]).{5,25})";
     Pattern pattern = Pattern.compile(STRING_PATTERN);
     Matcher matcher = pattern.matcher(email);
     valid = matcher.matches();
     if(valid == false){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('An Email must contains ( @ and . (dot) ) and should be atleast 5 characters long');");
        out.println("</script>");
        flag = 1;
     }
     STRING_PATTERN =
              "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";
     pattern = Pattern.compile(STRING_PATTERN);
     matcher = pattern.matcher(password);
     valid = matcher.matches();
     if(valid == false){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your password must contains one digit from 0-9, one lowercase character, one uppercase character, one special symbol [@#$%], length at least 6 characters and maximum of 20 characters');");
        out.println("</script>");
        flag = 1;
     }
     STRING_PATTERN =
             "([0-9]{2})/([0-9]{2})/([0-9]{4})";
     pattern = Pattern.compile(STRING_PATTERN);
     matcher = pattern.matcher(dob);
     valid = matcher.matches();
     if(valid == false){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Date Format is (DD/MM/YYYY)');");
        out.println("</script>");
        flag = 1;   
     }
     int m = sex.compareToIgnoreCase("Male");
     int f = sex.compareToIgnoreCase("Female");
     if(m!=0 && f!=0){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Gender can either be a Male or a Female');");
        out.println("</script>");
        flag = 1;
     }
     STRING_PATTERN =
             "([0-9]{10})";
     pattern = Pattern.compile(STRING_PATTERN);
     matcher = pattern.matcher(mobile);
     valid = matcher.matches();
     if(valid == false){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Mobile number must contains 10 digits');");
        out.println("</script>");
        flag = 1; 
     }   
     if(flag==0){
     ps=con.prepareStatement("INSERT INTO User_Registration VALUES(?,?,?,?,?,?,?,?,?,?)");  
     ps.setString(1,username);  
     ps.setString(2,email);
     ps.setString(3,password);  
     ps.setString(4,fullname);
     ps.setString(5,fathername);  
     ps.setString(6,dob);
     ps.setString(7,address);  
     ps.setString(8,sex);
     ps.setString(9,course);  
     ps.setString(10,mobile);
     rs=ps.executeQuery();
     out.println("<script type=\"text/javascript\">");
     out.println("alert('The new user has created successfully!');");
     out.println("location='login.html';");
     out.println("</script>");
     }
     else{
        out.println("<marquee width=530 behavior=alternate><img src=assets\\images\\back.png></marquee>");
        out.println("<h2>Go back Now!</h2>");
     }
    }
    else{
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your captcha answer is wrong');");
        out.println("</script>");
        out.println("<marquee width=530 behavior=alternate><img src=assets\\images\\back.png></marquee>");
        out.println("<h2>Go back Now!</h2>");
    } 
    
%>

