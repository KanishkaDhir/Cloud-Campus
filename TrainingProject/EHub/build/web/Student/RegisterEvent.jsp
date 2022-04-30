
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Events Registered</title>
                <style>
            .tb
             {
                 
                 width: 500px;
                 
                 
             }
             .left
             {
                 padding: 0px auto;
                 color: white;
                 background-color: #890208;
                 text-align: center;
             }
             .right
             {
                 text-align: center;
                 color: black;
                 background-color: pink;
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
				<h1 class="title"><a href="#">Events Registered</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->

        <%
            DataLayer.DALEvents objdal2=new DALEvents();
            ArrayList<beans.Events> r=objdal2.registeredEvents(Integer.parseInt(session.getAttribute("LoggedStudentId").toString()));
            
            
        %>
                                    <table class="tb">
                                        <tr class="left">
            <th>Event</th>
            <th>Date</th>
            <th>Venue</th>
            <th>Faculty-Organising</th>
               </tr>
              <%
                  if(r.size()>0)
                  {
                    for(beans.Events C : r)
                        {

                    %>

                <tr>
                    <td class="right"><%=C.getEventName()%></td>
                     <td class="right"><%=C.getDate()%></td>
                      <td class="right"><%=C.getVenue()%></td>
                        <td class="right"><%=C.getFacultyName()%></td>
                        
                </tr>
                                <%
                         }
                  }
                  else
                    {
                    %>
                <tr>
                    <td class="right" colspan="8" >There is no Event</td>

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
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>

                    <%@include file="Footer.html"%>

    </body>
</html>
