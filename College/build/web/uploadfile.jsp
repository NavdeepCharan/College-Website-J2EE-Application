<%-- 
    Document   : uploadfile
    Created on : 26 Mar, 2017, 5:55:36 PM
    Author     : Navdeep Charan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
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

%>
<%
 File file ;
 int maxFileSize = 5000 * 1024;
 int maxMemSize = 5000 * 1024;
 ServletContext context = pageContext.getServletContext();
 String filePath = context.getInitParameter("file-upload");
 // Verify the content type
 String contentType = request.getContentType();
 if ((contentType.indexOf("multipart/form-data") >= 0)) {
 DiskFileItemFactory factory = new DiskFileItemFactory();
 // maximum size that will be stored in memory
 factory.setSizeThreshold(maxMemSize);
 // Location to save data that is larger than maxMemSize.
 factory.setRepository(new File("c: \\temp"));
 // Create a new file upload handler
 ServletFileUpload upload = new ServletFileUpload(factory);
 // maximum file size to be uploaded.
 upload.setSizeMax( maxFileSize );
 try{
 // Parse the request to get file items.
 List fileItems = upload.parseRequest(request);
 // Process the uploaded file items
 Iterator i = fileItems.iterator();
 while ( i.hasNext () )
 {
 FileItem fi = (FileItem)i.next();
 if ( !fi.isFormField () )
 {
 // Get the uploaded file parameters
 String fieldName = "image";
 String fileName = encrpt+".jpg";
 boolean isInMemory = fi.isInMemory();
 long sizeInBytes = fi.getSize();
 // Write the file
 if( fileName.lastIndexOf(" \\") >= 0 ){
 file = new File( filePath +
 fileName.substring( fileName.lastIndexOf(" \\"))) ;
 }else{
 file = new File( filePath +
 fileName.substring(fileName.lastIndexOf(" \\")+1)) ;
 }
 fi.write( file ) ;
 }
 }  
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Your profile picture has been changed successfully!');");
    out.println("location='user.jsp';");
    out.println("</script>");
 }catch(Exception ex) {
 System.out.println(ex);
 }
 }
%>
