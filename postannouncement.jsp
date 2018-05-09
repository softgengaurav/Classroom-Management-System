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
	
<%! int flag=0; String fileName; %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>

<%

// The name of the file to open.
System.out.println("Param in postannouncement "+request.getParameter("param"));
fileName = "/home/gaurav/CMS/"+request.getParameter("param")+".txt";
//fileName = "/home/gaurav/Desktop/temp.txt";

try {
    // Assume default encoding.
    FileWriter fileWriter =
        new FileWriter(fileName,true);

    // Always wrap FileWriter in BufferedWriter.
    BufferedWriter bufferedWriter =
        new BufferedWriter(fileWriter);

    // Note that write() does not automatically
    // append a newline character.
    String text=request.getParameter("postannouncement");
  //  bufferedWriter.write("Hello there,");
   // bufferedWriter.write(" here is some text.");
   bufferedWriter.write(text); 
   bufferedWriter.newLine();
   // bufferedWriter.write("We are writing");
   // bufferedWriter.write(" the text to the file.");

    // Always close files.
    bufferedWriter.close();
}
catch(IOException ex) {
    System.out.println(
        "Error writing to file '"
        + fileName + "'");
    // Or we could just do this:
    // ex.printStackTrace();
}
	  
	  String param=request.getParameter("param");
	  System.out.println("PostAnnouncement before sending: "+param);
	  	String redirectURL = "http://localhost:8080/NewOne/class_dash_teacher.jsp?param="+param;
	      response.sendRedirect(redirectURL);
	  
	  	%>
</form>
</body>
</html>
