<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Classroom Management System</title>
</head>
<body>
<form action="student_dash.jsp" method="post">
	
<%! int flag=0; %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","as");
	
	/*String fname=request.getParameter("fn");
	session.putValue("fname",fname);
	String lname=request.getParameter("ln");
	session.putValue("lname",lname);
	String mail=request.getParameter("ma");
	session.putValue("mail",mail);
	String pswd=request.getParameter("pa");
	session.putValue("pswd",pswd);
	String status;
	status=request.getParameter("stat");*/
	//if(status.equals("1"))

	String cs=request.getParameter("classnamefield");
	System.out.println(cs);

   String mail=(String)session.getAttribute("mail");
System.out.println("Mail id is "+mail);
		System.out.println("Enter 1st condition");
	
	//Statement st= con.createStatement();
	//ResultSet resultSet=st.executeQuery("select * from class;");
	//flag=0;

// while (resultSet.next()) {
	//String join_code=resultSet.getString("join_code");
	//String classname=resultSet.getString("classname");
	//if(join_code.equals(jc))
	//{
    //stmt.setString(2,"nimar");
	//stmt.setString(3,"mankeerat");
	//stmt.setString(4,"singh");
	//stmt.setString(5,"mank123");
	//System.out.println(status);
	
	//flag=1;	
	String join_code="";
	join_code+=cs.charAt(0);
	join_code+=cs.charAt(2);
	join_code+=cs.charAt(3);
	join_code+=cs.charAt(1);
	
	session.setAttribute("joincode",join_code);
	
	PreparedStatement stmt=con.prepareStatement("insert into class values(?,?,?)");  
	stmt.setString(1,join_code);
	stmt.setString(2,cs);
	stmt.setString(3,mail);
	
	int i=stmt.executeUpdate();  
	System.out.println(i+" records inserted");  

	//System.out.println(status);
//	}

	  
	  
	  	String redirectURL = "http://localhost:8080/NewOne/teacher_dash_final.jsp";
	      response.sendRedirect(redirectURL);
	  
	  	
	
con.close();

	
		  //Statement stat=con.createStatement();
	//stat.executeQuery("");
	//while(r.next())
	//{
	//	System.out.println(r.getString(1));
	//}
	}
catch(Exception ex)
{
	String redirectURL = "http://localhost:8080/NewOne/teacher_dash.jsp";
    response.sendRedirect(redirectURL);

	System.out.println("This is causing a problem "+ex);
}
/*
String userid=request.getParameter("user");
session.putValue("userid",userid);
String pwd=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","as");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users;");// where user_id="+userid+";");
if(rs.next())
{
if(rs.getString(2).equals(pwd))
{
out.println("welcome"+userid);

}
else
{
out.println("Invalid password try again");
}
}
else*/
%>
</form>
</body>
</html>
