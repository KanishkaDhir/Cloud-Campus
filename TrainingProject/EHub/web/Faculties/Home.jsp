

<%@page import="DataLayer.DALFaculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Faculty Home</title>
        <link href ="Contents.css" rel="stylesheet">
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
                 color: #890208;
                 background-color: whitesmoke;
             }
             .right
             {
                 color: black;
                 background-color: whitesmoke;
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
				<h1 class="title"><a href="#">Home!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
               <form action="Home.jsp" name="frmProfile" method="Post">
                                <%!String d;%>
               <%
                    DataLayer.DALFaculty objDal2=new DALFaculty();
                   int facid2=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                   d=objDal2.giveDeptName(facid2);
                   beans.Faculties R = objDal2.getData(facid2);
                   
                   
        
                   
               %>
               
               <table class="tb">
                   <tr><td class="left">Faculty Name:</td>
                       <td class="right"><%=R.getName()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Address:</td>
                       <td class="right"><%=R.getAddress()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">City</td>
                       <td class="right"><%=R.getCity()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">Contact No</td>
                       <td class="right"><%=R.getContactNo()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">Email Id:</td>
                       <td class="right"><%=R.getEmailId()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Department Name:</td>
                       <td class="right"><%=d%></td>
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
		<div id="sidebar2" class="sidebar">
			<ul>
				<li>
									<form id="searchform" method="get" action="#">
						<div>
							<h2>Notice Board</h2>
                                                        <%@include file="CurrentNotices.jsp"%>
                                                </div>
					</form>
				</li>
				<li>
					<form id="searchform1" method="get" action="#">
						<div>
							<h2>Events</h2>
                                                        <%@include file="CurrentEvents.jsp"%>
                                                </div>
					</form>
	<li>
					<div id="calendar_wrap">
					</div>
				</li>
			</ul>
		</div>
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
 <%@include file="Footer.html"%>
    </body>
</html>
