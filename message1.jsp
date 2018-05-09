<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
</head>
<body>
<%! int flag=0; int n=0; String sql2; ResultSet rs1,rs2; String courses[]=new String[100];%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

Join Code 

<%
String jc=(String)session.getAttribute("joincode");

out.println(jc);
%>


<br><br><br>

You are being Redirected...

</body>
</html>