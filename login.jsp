<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!--  <meta http-equiv="refresh" content="2; URL=http://localhost:8080/NewOne/student_dash.jsp">-->
<title>Classroom Management System</title>
</head>
<body>
<form action="student_dash.jsp" method="post">
<%! int flag=0,endresult=0; %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","as");
	
	String fname=request.getParameter("fn");
	session.putValue("fname",fname);
	String lname=request.getParameter("ln");
	session.putValue("lname",lname);
	String mail=request.getParameter("ma");
	session.putValue("mail",mail);
	String pswd=request.getParameter("pa");
	session.putValue("pswd",pswd);
	
	
	String status;
	status=request.getParameter("stat1");
	System.out.println(status);
	
	if(status.equals("1"))
		//if()
	{
System.out.println("Entered 1st condition");
		Statement st= con.createStatement();
		ResultSet resultSet=st.executeQuery("select * from student_db;");
		flag=0;

	while (resultSet.next()) {
		String temp=resultSet.getString("s_email");
		if(mail.equals(temp)&& resultSet.getString("s_password").equals(pswd))
		{
			//out.println("welcome "+mail);
			//String redirectURL = "http://localhost:8080/NewOne/student_dash.jsp";
   // response.sendRedirect(redirectURL);
			%>
			<!--  <button type="submit" />Get Started</button>-->
			  
		    <%
		    flag=1;	
		    break;
		}
	}

	if(flag==0)
	{
		%>
		Incorrect Username And Password!!
		<br>
		Automatically Directing you to the homepage in 3 sec!!
		<%
		//out.println("Incorrect Username & password");
		//Thread.sleep(3000);
		//String redirectURL = "http://localhost:8080/NewOne/index.jsp";
	    //response.sendRedirect(redirectURL);
	}
	if(flag==0)
	{
		String redirectURL = "http://localhost:8080/NewOne/indexincorrect_login.jsp";
	    response.sendRedirect(redirectURL);
	}
	else if(flag==1)
	{
		String redirectURL = "http://localhost:8080/NewOne/student_dash.jsp";
	    response.sendRedirect(redirectURL);
	}  
		con.close();
	
	}
	
		else if(status.equals("2"))
		//if()
	{
System.out.println("Entered 2nd condition");
		Statement st= con.createStatement();
		ResultSet resultSet=st.executeQuery("select * from teacher_db;");
		flag=0;

	while (resultSet.next()) {
		String temp=resultSet.getString("f_email");
		if(mail.equals(temp) &&resultSet.getString("f_password").equals(pswd))
		{
			out.println("welcome "+mail);
		    flag=1;	
		    break;
		}
	}

	if(flag==0)
	{
		out.println("Incorrect Username & password");
	}
	
	if(flag==0)
	{
		String redirectURL = "http://localhost:8080/NewOne/indexincorrect_login.jsp";
	    response.sendRedirect(redirectURL);
	}
	else if(flag==1)
	{
		String redirectURL = "http://localhost:8080/NewOne/teacher_dash.jsp";
	    response.sendRedirect(redirectURL);
	}
	 
		con.close();
	
	}
	
}
catch(Exception ex)
{
	System.out.println("This is causing a problem "+ex);
}


%>

</form>

</body>
</html>

