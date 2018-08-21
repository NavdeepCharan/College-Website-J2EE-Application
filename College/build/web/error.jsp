<%-- 
    Document   : error
    Created on : 30 Mar, 2017, 5:38:57 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Error: Either you are not logged in or there is an exception.');");
        out.println("location='login.html';");
        out.println("</script>");         
%>         

