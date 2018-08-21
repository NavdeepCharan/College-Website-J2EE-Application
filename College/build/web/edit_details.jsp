<%-- 
    Document   : edit_details
    Created on : 3 Apr, 2017, 10:39:34 AM
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
    String username = (String) session.getAttribute("username");

    Captcha captcha=(Captcha)session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8");
 
    String answer=request.getParameter("answer");
 
    if(captcha.isCorrect(answer)){
    String fullname, fathername, dob, address, sex, course, mobile;
    int flag = 0;
    boolean valid = false ;
     fullname = request.getParameter("fullname");
     fathername = request.getParameter("fathername");
     dob = request.getParameter("dob");
     address = request.getParameter("address");
     sex = request.getParameter("sex");
     course = request.getParameter("course");
     mobile = request.getParameter("mobile");
     
     
     String STRING_PATTERN =
             "([0-9]{2})/([0-9]{2})/([0-9]{4})";
     Pattern pattern = Pattern.compile(STRING_PATTERN);
     Matcher matcher = pattern.matcher(dob);
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
     Class.forName("org.apache.derby.jdbc.ClientDriver");  
     Connection con=DriverManager.getConnection(
     "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");    
     PreparedStatement ps=con.prepareStatement("UPDATE User_Registration SET Full_Name=?, Father_Name=?, DOB=?, Address=?, Gender=?, Course=?, Mobile=? WHERE Username=?");  
     ps.setString(1,fullname);
     ps.setString(2,fathername);  
     ps.setString(3,dob);
     ps.setString(4,address);  
     ps.setString(5,sex);
     ps.setString(6,course);  
     ps.setString(7,mobile);
     ps.setString(8,username);  
     int r =ps.executeUpdate();
     if(r>0){
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your details has been updated successfully!');");
        out.println("location='user.jsp';");
        out.println("</script>");
        }
     else{
         out.println("<script type=\"text/javascript\">");
         out.println("alert('An error occurred while accessing the database');");
         out.println("</script>");
     }
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