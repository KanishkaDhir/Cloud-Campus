
<%@page import="DataLayer.DALStudents"%>
<%@page import="DataLayer.DALFaculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Faculty Home</title>
        <link href="Contents.css" rel="stylesheet">
                 <style>
            .tb
             {
                 border:1px solid black;
                 width: 500px;
                 
             }
             .tb th
             {
                 border-right:  1px solid black;
                 border-bottom: 1px solid black; 
             }
             .tb td
             {
                 
                 border-right:  1px solid black; 
                    border-bottom: 1px solid black;
             }
             .left
             {
                 color: white;
                 background-color: #890208;
             }
             .right
             {
                 color: black;
                 background-color: white;
             }
        </style>

    </head>
    <body>
        <%@include file="Header.html"%>
        
        <div id="wrapper">
	<!-- start page -->
	<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
				<li>
                                        <h2>Options</h2>
                                        <%@include file="Options.html"%>
                                </li>
				<li>
					<h2></h2>
					<ul>
					</ul>
				</li>
			</ul>
		</div>
		<!-- start content -->
		<div id="content">
			<div class="flower"></div>
			<div class="post">
				<h1 class="title"><a href="#">Home</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                    <form action="Home.jsp" name="frmProfile" method="Post">
               <%!String d;%>
               <%
                    DataLayer.DALStudents objDal=new DALStudents();
                   int regid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
                   d=objDal.giveFacultyName(regid);
                   beans.Students R = objDal.getData(regid);
                   
                   
        
                   
               %>
               
               <table class="tb">


                   <tr><td class="left">Student Id:</td>
                       <td class="right"><%=regid%></td>
                   </tr>

                   <tr><td class="left">Name:</td>
                       <td class=" right"><%=R.getStudentName()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Gender:</td>
                       <td class=" right"><%=R.getGender()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Date of Birth:</td>
                       <td class=" right"><%=R.getDOB()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">Contact No:</td>
                       <td class=" right"><%=R.getContact()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">EMail Id:</td>
                       <td class=" right"><%=R.getEmailId()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Faculty Name:</td>
                       <td class=" right"><%=d%></td>
                   </tr>
                   
                      
                 
               </table>
                               </form>  
                                 
                                    </p>
				</div>
			</div>
			<div class="post">
			</div>
		</div>
		<!-- end content -->
		<!-- start sidebars -->
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
        
        <%@include file="Footer.html"%>
    </body>
</html>
