<%-- 
    Document   : logout
    Created on : 27 Mar, 2017, 5:13:04 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<% 
    session.invalidate(); 
    Cookie[] cookies = request.getCookies();
         if(cookies !=null){
         for(Cookie cookie : cookies){
          if(cookie.getName().equals("JSESSIONID")){ cookie.setMaxAge(0); response.addCookie(cookie);}
          if(cookie.getName().equals("un")){ cookie.setMaxAge(0); response.addCookie(cookie);}

         }
        }
%>
<%          out.println("<script type=\"text/javascript\">");
            out.println("alert('You have successfully logged out!');");
            out.println("location='login.html';");
            out.println("</script>");
%>
