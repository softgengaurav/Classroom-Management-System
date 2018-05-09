<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expiress" Content="0">
<!--  <meta http-equiv="refresh" content="2; URL=http://localhost:8080/NewOne/student_dash.jsp">-->
<title>Classroom Management System</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
 // session.invalidate();
//System.out.println("MAil is "+(String)session.getAttribute("mail"));
//  if(session.getAttribute("mail")==null)
{
	String redirectURL = "http://localhost:8080/NewOne/index.jsp";
	response.sendRedirect(redirectURL);
}
	//      response.sendRedirect("index.jsp");

  %> 
<%
//session.invalidate();
//String redirectURL = "http://localhost:8080/NewOne/index.jsp";
//response.sendRedirect(redirectURL);
%>
<h1>Logged out</h1>

</body>
</html>

