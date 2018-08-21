<%-- 
    Document   : login
    Created on : 30 Mar, 2017, 12:00:42 AM
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
            
            
            String lname = request.getParameter("name");
            String pass = request.getParameter("pass");
            String email = lname;
            String name="";
            String username="";
            String course="";
                        
            Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection(
            "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");  
      
            PreparedStatement ps=con.prepareStatement("SELECT * FROM User_Registration WHERE Username=? OR Email=? AND Password=?");  
            ps.setString(1,lname);  
            ps.setString(2,lname);
            ps.setString(3,pass);
            
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){
            ps=con.prepareStatement("SELECT Username, Full_Name, Course FROM User_Registration WHERE Username=? OR Email=? AND Password=?");  
            ps.setString(1,lname);  
            ps.setString(2,lname);
            ps.setString(3,pass);    
            rs=ps.executeQuery();
            if(rs.next()){
             name = rs.getString("Full_Name");
             username = rs.getString("Username");
             course = rs.getString("Course");
            }
            session.setAttribute("username", username);
            session.setAttribute("fullname", name);
            session.setAttribute("Course", course);
            byte[] ba = name.getBytes();
            String encrpt=name;
            StringBuilder str = new StringBuilder();
            for(int i = 0; i < ba.length; i++)
            str.append(String.format("%x", ba[i]));
            encrpt= str.toString();
            Cookie cookie = new Cookie("un",encrpt);
            response.addCookie(cookie);
            response.sendRedirect("welcome.jsp");
            }
            else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login Failed');");
            out.println("location='login.html';");
            out.println("</script>");
            }
%>