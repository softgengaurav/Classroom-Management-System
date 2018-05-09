<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Classroom Management System</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="css/font-awesome.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />
 <link href="css/jc1.css" rel="stylesheet" />
 <style>
 body {font-family: Arial, Helvetica, sans-serif;}



/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.button {
color: #179b77;
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #179b77;
    color: white;
}

.modal-body {padding: 4px 16px;}


}
 
 </style>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jc2.js"></script>
</head>
<body>
<%! int flag=0; int n=0; String sql2; ResultSet rs1,rs2; String courses[]=new String[100];%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
    <header>
        <div class="container">
            <div class="row">
                <div class="left_column">
                     <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                      
                        
                            <!-- <li><a class="menu-top-active" href="joinclass.jsp">Join Class</a></li>-->
                                           <button id="myBtn" class="button">Join Class</button>
                                           
       
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center">Join a New Class</h2>
    </div>
    <div class="modal-body" align="center">
      <strong><p>Enter the Class Join Code</p></strong>
      <form action="joinclass.jsp" method="get">
        <input type="Join Code"  name="joincodefield" class="button" required autocomplete="off"/>
        <input type="submit" class="button"/>Join Class</button>
    </form>

    </div>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>


                                           
                            
                        </ul>
                     </div>
                </div>
    <strong>Welcome&nbsp;&nbsp;&nbsp;&nbsp; </strong><%= (String)session.getAttribute("mail") %>
            <form action="logout.jsp" method="post">
            <button id="myBtn" class="button">Log Out</button>
                                   </form>
           </div>
        </div>
    </header>
    <!-- HEADER END-->

    <!-- LOGO HEADER END-->
    <!-- <section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    
                </div>

            </div>
        </div>
      </section>  -->
    <!-- MENU SECTION END-->
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Dashboard</h4>

                </div>

            </div>
            
        
        <!--     <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success">
                        This is a simple admin template that can be used for your small project or may be large projects. This is free for personal and commercial use.
                    </div>
                </div>

            </div> -->
 <%           
try
{
	for(int j=0;j<=99;j++)
	{
		courses[j]="";
	}
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
	{
		System.out.println("Enter 1st condition");

	System.out.println((String)session.getAttribute("mail"));
	String mail="\'"+(String)session.getAttribute("mail")+"\'";
	System.out.println(mail);
	Statement st= con.createStatement();
String sql1="select * from student_db where s_email="+mail;
ResultSet resultSet=st.executeQuery(sql1);// where user_id="+userid+";");

 
{
	//print the details of the user
}
sql2="select count(*) from student_class where s_email="+mail+" group by s_email";
rs1=st.executeQuery(sql2);
rs1.next();
n=0;
n=Integer.parseInt(rs1.getString(1));
sql2="select * from student_class where s_email="+mail+"";
rs2=st.executeQuery(sql2);
String temp=String.valueOf(n);
System.out.println(temp);
session.setAttribute("count",temp);
System.out.println(n);
for(int i=0;i<=n-1;i++)
{
rs2.next();
System.out.println(rs2.getString(2));
courses[i]=rs2.getString(2);
session.setAttribute(String.valueOf(i),"1");
String temp1=String.valueOf(session.getAttribute(String.valueOf(i)));
System.out.println("This is value in i"+temp1);
}
}
	  con.close();  

	
}//endof try
catch(Exception ex)
{
	System.out.println("This is causing a problem "+ex);
}


%>
            
            <div class="row">
                   <%
                   for(int i=0;i<=n-1;i++)
                   {
                   %>
                 <div class="col-md-3 col-sm-3 col-xs-6">
                 
                    <div class="dashboard-div-wrapper bk-clr-one">
                        <i  class="fa fa-venus dashboard-div-icon" ></i>
                        <div class="progress progress-striped active">
  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
  </div>
                           
</div>
<%
//String value=String.valueOf(i);
//session.setAttribute("value",courses[i]);
%>
                         <h5> <a href="class_dash_student.jsp?param=<%=courses[i]%>" ><%=courses[i] %> </a></h5>
                    </div>
                </div>
                <%
                }
                %>


            </div>
           
       
    <script src="js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
