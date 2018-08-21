<%-- 
    Document   : change_password
    Created on : 29 Mar, 2017, 7:12:03 PM
    Author     : Navdeep Charan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*;" %>
<%@ page import="javax.servlet.*;" %>
<%@ page import="java.sql.*;" %>
<%@ page import="java.util.regex.Matcher;"%>
<%@ page import="java.util.regex.Pattern;"%>
<%@ page errorPage="error.jsp" %>
<%!
          public class PasswordValidator{

	  private Pattern pattern;
	  private Matcher matcher;

	  private static final String PASSWORD_PATTERN =
              "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";

	  public PasswordValidator(){
		  pattern = Pattern.compile(PASSWORD_PATTERN);
	  }

	  /**
	   * Validate password with regular expression
	   * @param password password for validation
	   * @return true valid password, false invalid password
	   */
	  public boolean validate(final String password){

		  matcher = pattern.matcher(password);
		  return matcher.matches();

	  }
}
private PasswordValidator passwordValidator;
%>


<%          
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setHeader("Pragma","no-cache");
            response.setDateHeader ("Expires", 0);
            
            String oldpwd = request.getParameter("old_password");
            String newpwd = request.getParameter("new_password");
           
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
            passwordValidator = new PasswordValidator();
            boolean valid = passwordValidator.validate(newpwd);
            if(valid == false)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your password must contains one digit from 0-9, one lowercase character, one uppercase character, one special symbol [@#$%], length at least 6 characters and maximum of 20 characters');");
                out.println("location='user.jsp';");
                out.println("</script>");
            }    
                
            Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection(
            "jdbc:derby://localhost:1527/myDB","navdeep", "nav5365");  
      
            PreparedStatement ps=con.prepareStatement("SELECT * FROM User_Registration WHERE Username=? OR Email=? AND Password=?");  
            ps.setString(1,name);  
            ps.setString(2,name);  
            ps.setString(3,oldpwd);
      
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int r;
                ps=con.prepareStatement("UPDATE User_Registration SET Password=? WHERE Username=? OR Email=?");
                ps.setString(1,newpwd);  
                ps.setString(2,name);
                ps.setString(3,name);
                r = ps.executeUpdate();
                if(r>0){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Your password has been changed successfully!');");
                    out.println("location='user.jsp';");
                    out.println("</script>");
                }
            }
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Old password does not match');");
            out.println("location='user.jsp';");
            out.println("</script>");
            
            
            
%>