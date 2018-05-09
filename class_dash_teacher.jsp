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
    <!-- CUSTOM STYLE  -->
    <link href="css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.*"%>

<%! String fileName; %>    
    
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

		
		String temp=String.valueOf(session.getAttribute("count"));
	System.out.println(temp);
		//System.out.println(String.valueOf(session.getAttribute("count")));
	for(int i=0;i<=Integer.parseInt(temp);i++)
		{
			System.out.println(session.getAttribute("value"));
		}

	
}//endof try
catch(Exception ex)
{
	System.out.println("This is causing a problem "+ex);
}


%>

   <header>
        <div class="container">
            <div class="row">
                <div class="left_column">
                     <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                      
                        
                            <!-- <li><a class="menu-top-active" href="joinclass.jsp">Join Class</a></li>-->
                                           <button id="myBtn" class="button">Post Announcement</button>
                                           
       
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center">Enter the Announcement</h2>
    </div>
    <div class="modal-body" align="center">
      <strong><p> Enter The Announcement</p></strong>
      <% System.out.println("Class_Dash before sending: "+request.getParameter("param")); %>
      <form action="postannouncement.jsp?param=<%=request.getParameter("param") %>" method="post">
        <input type="Post_Announcement"  name="postannouncement" class="button" required autocomplete="off"/>
        <input type="submit" class="button"/>Create Class</button>
        
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
                    <h4 class="page-head-line">Announcements <%= request.getParameter("param") %></h4>

                </div>

            </div>
                       <%
try
                       {
     /*                 
            File file = new File("/home/gaurav/ClassAnnouncements.txt");
            BufferedReader reader = new BufferedReader(new FileReader(file));
            //BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
          }
         out.println(sb.toString()); */
         
                       }
                       catch(Exception ex)
                       {
                    	   System.out.println(ex);
                       }
        
                     String param=request.getParameter("param");
                     //session.setAttribute("paramnew",param);  
                     //System.out.println("Session is: "+(String)session.getAttribute("paramnew"));         
                     // The name of the file to open.
                               fileName="/home/gaurav/CMS/"+request.getParameter("param")+".txt";
                       // fileName = "/home/gaurav/Desktop/temp.txt";

                               // This will reference one line at a time
                               String line = null;

                               try {
                                   // FileReader reads text files in the default encoding.
                                   FileReader fileReader = 
                                       new FileReader(fileName);

                                   // Always wrap FileReader in BufferedReader.
                                   BufferedReader bufferedReader = 
                                       new BufferedReader(fileReader);

                                   while((line = bufferedReader.readLine()) != null) {
                                  %>
                                  <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-warning">
           
                                	  <%= line %> 
                                	                           <br />
                      
                  
                    </div>
                </div>
                  </div>
                                   <%
                                   }   

                                   // Always close files.
                                   bufferedReader.close();         
                               }
                               catch(FileNotFoundException ex) {
                                   System.out.println(
                                       "Unable to open file '" + 
                                       fileName + "'");                
                               }
                               catch(IOException ex) {
                                   System.out.println(
                                       "Error reading file '" 
                                       + fileName + "'");                  
                                   // Or we could just do this: 
                                   // ex.printStackTrace();
                               }
                           
                       
        
        %>
                       
                       
                  

          
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
       <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
