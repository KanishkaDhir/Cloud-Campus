
<%@page import="DataLayer.DALEvents"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>EHub- Events List</title>
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
				<h1 class="title"><a href="#">Events</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
        
                
                    <%!
                    int eventid;
                    %>   
              <%
                  
                 int stid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
                 int factid=Integer.parseInt(session.getAttribute("FacultyId").toString());
                  DataLayer.DALEvents objDal=new DALEvents();
             
                
                 
                  ArrayList<beans.Events> A= objDal.getStudentEvents(factid);
              %>
        
              <table class="tb" >
                <tr>
                    <th class="THeading">Event</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">Venue</th>
                    <th class="THeading">Faculty</th>
                    
                    
                </tr>
                <% if(A.size()>0)
                {
                  for(beans.Events C : A)
                {

                    %>

                    <tr onclick="window.document.location='EventDetails.jsp?EID=<%=C.getEventId()%>'">
                    <td class="TData"><%=C.getEventName()%></td>
                     <td class="TData"><%=C.getDate()%></td>
                      <td class="TData"><%=C.getVenue()%></td>
                        <td class="TData"><%=C.getFacultyName()%></td>
                </tr>    
                
                <%
                    }}
                
                else
                {
                    %>
                  <tr>
                    <td class="TData" colspan="7" >There is no event</td>

                  </tr>

                    
                    <%}%>
                </table>
<br>

<input style="border-radius: 5px; box-shadow: 0px 0px 20px #8C0209; color: #8C0209;cursor: pointer; font-style: italic " type="submit" value="Registered Events" name="btnEvents" onclick="window.document.location='RegisterEvent.jsp'">                            
        

       
                         
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
