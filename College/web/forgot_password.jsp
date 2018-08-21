<%-- 
    Document   : forgot_password
    Created on : 3 Apr, 2017, 12:08:02 AM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*;" %>
<%@ page import="javax.servlet.*;" %>
<%@ page import="java.sql.*;" %>
<%@ page errorPage="error.jsp" %>
<%@page import="nl.captcha.Captcha"%>
<%
    
    Captcha captcha=(Captcha)session.getAttribute(Captcha.NAME);
    request.setCharacterEncoding("UTF-8");
 
    String answer=request.getParameter("answer");
 
    if(captcha.isCorrect(answer)){
       
       String name = request.getParameter("name");
       String dob = request.getParameter("dob");
       String mobile = request.getParameter("mobile");
        
        Class.forName("org.apache.derby.jdbc.ClientDriver");  
        Connection con=DriverManager.getConnection(
            "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");  
     
        PreparedStatement ps=con.prepareStatement("SELECT * FROM User_Registration WHERE Username=? OR Email=? AND DOB=? AND Mobile=?");  
        ps.setString(1,name);  
        ps.setString(2,name);
        ps.setString(3,dob);
        ps.setString(4,mobile);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
                String password = rs.getString("Password");
                String temp = "alert('Your password is: "+password+" ');";
                out.println("<script type=\"text/javascript\">");
                out.println(temp);
                out.println("location='login.html';");
                out.println("</script>");
        }
        else{ 
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Please enter correct values');");
        out.println("</script>");
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
