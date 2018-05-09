<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Classroom Management SystemInsert title here</title>
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
	
	String fname=request.getParameter("fn");
	session.putValue("fname",fname);
	String lname=request.getParameter("ln");
	session.putValue("lname",lname);
	String mail=request.getParameter("ma");
	session.putValue("mail",mail);
	String pswd=request.getParameter("pa");
	session.putValue("pswd",pswd);
	String status;
	status=request.getParameter("stat");
	if(status.equals("1"))
	{
	%>
	<%
		System.out.println("Enter 1st condition");
	PreparedStatement stmt=con.prepareStatement("insert into student_db values(?,?,?,?)");  
	stmt.setString(1,fname);
	stmt.setString(2,lname);
	stmt.setString(3,mail);
	stmt.setString(4,pswd);
	

	//stmt.setString(2,"nimar");
	//stmt.setString(3,"mankeerat");
	//stmt.setString(4,"singh");
	//stmt.setString(5,"mank123");
	//System.out.println(status);
	
		
	//System.out.println(status);
	
	Statement st= con.createStatement();
ResultSet resultSet=st.executeQuery("select * from student_db;");// where user_id="+userid+";");


while (resultSet.next()) 
{
	flag=0;
	String temp=resultSet.getString("s_email");
	if(mail.equals(temp))//&&rs.getString(4).equals(pswd))
	{
	//	System.out.println("YES");
			out.println("sorry "+mail+" already exists");
	    flag=1;	    
	    break;
	}
}

if(flag==0)
{
	  
	int i=stmt.executeUpdate();  
	System.out.println(i+" records inserted");  
 %>
	 <!--  Congrats....you are our new user
	   <button type="submit" />Get Started</button>
    -->
	  <%
}
	  con.close();
	  
	  if(flag==1)
	  {
	  	String redirectURL = "http://localhost:8080/NewOne/indexincorrect_signup.jsp";
	      response.sendRedirect(redirectURL);
	  }
	  else if(flag==0)
	  {
	  	String redirectURL = "http://localhost:8080/NewOne/student_dash.jsp";
	      response.sendRedirect(redirectURL);
	  }
	  
	}
	
	else if(status.equals("2"))
	{
	%>
	
	<%
		System.out.println("Enter 2nd condition");
	PreparedStatement stmt=con.prepareStatement("insert into teacher_db values(?,?,?,?)");  
	stmt.setString(1,fname);
	stmt.setString(2,lname);
	stmt.setString(3,mail);
	stmt.setString(4,pswd);
	

	//stmt.setString(2,"nimar");
	//stmt.setString(3,"mankeerat");
	//stmt.setString(4,"singh");
	//stmt.setString(5,"mank123");
	//System.out.println(status);
	
		
	//System.out.println(status);
	
	Statement st= con.createStatement();
ResultSet resultSet=st.executeQuery("select * from teacher_db;");// where user_id="+userid+";");


while (resultSet.next()) 
{
	flag=0;
	String temp=resultSet.getString("f_email");
	if(mail.equals(temp))//&&rs.getString(4).equals(pswd))
	{
	//	System.out.println("YES");
			out.println("sorry "+mail+" already exists");
	    flag=1;	    
	    break;
	}
}

if(flag==0)
{
	  
	int i=stmt.executeUpdate();  
	System.out.println(i+" records inserted");  
 %>
	Congrats....you are our new user
	 <button type="submit" />Get Started</button>
         
	  <%
}
if(flag==1)
{
	String redirectURL = "http://localhost:8080/NewOne/indexincorrect_signup.jsp";
    response.sendRedirect(redirectURL);
}
else if(flag==0)
{
	String redirectURL = "http://localhost:8080/NewOne/teacher_dash.jsp";
    response.sendRedirect(redirectURL);
}
	  con.close();  
	}//endof if
	  //Statement stat=con.createStatement();
	//stat.executeQuery("");
	//while(r.next())
	//{
	//	System.out.println(r.getString(1));
	//}
}
catch(Exception ex)
{
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
