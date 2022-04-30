
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-New Events List</title>
                <link href="Contents.css" rel="stylesheet">
                 <style>
             .tb
             {
                 border:1px solid black;
                  width: 500px;
             }
             .tb th td
             {
                 border-right:  1px solid black;
                 border-bottom: 1px solid black; 
             }

             .tb td a
             {
                 
             }   

             .THeading
             {
                 background-color:  #8C0209;
                 color: white;
             }

             .tb tr:hover
             {
                 background-color: pink;
                 cursor:pointer;
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
        <%@include file="Options.html"%>								</li>
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
				<h1 class="title"><a href="#">Active Events!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
          <form action="NewEventList.jsp" name="f1" method="Post">
                    <%!
                    int eventid2;
                    %>   
              <%

                  
                 int regid2=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALEvents objDal2=new DALEvents();
             
                  
    
                 
                  ArrayList<beans.Events> A2= objDal2.getNewEvents(regid2);
              %>
        
              <table class="tb">
                <tr>
                    <th class="THeading">Event Name</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">Venue</th>
                    
                </tr>
                               <%
                  if(A2.size()>0){
                  for(beans.Events C : A2)
                {

                    %>

                <tr onclick="window.document.location='EventDetails.jsp?EID=<%=C.getEventId()%>'">
                    <td class="TData"><%=C.getEventName()%></td>
                     <td class="TData"><%=C.getDate()%></td>
                      <td class="TData"><%=C.getVenue()%></td>
                </tr>
                                <%
                }}
                  else{
                    %>
                <tr>
                    <td class="TData" colspan="8" >There is no Event</td>

                  </tr>

                    
                    <%}%>
                
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
