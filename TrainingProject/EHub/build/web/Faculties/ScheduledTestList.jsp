
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Test List</title>
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
                 cursor: pointer;
                 
             }
             
                 </style>

    </head>
    <body>
        <%@include file="Header.html" %>

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
				<h1 class="title"><a href="#">Scheduled Test List!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
          <form action="ScheduledTestList.jsp" name="f1" method="Post">
                    <%!
                    int factid;
                    %>   
              <%

                  
                 factid=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALTests objDal2=new DALTests();
             
                  
    
                 
                  ArrayList<beans.Tests> A2= objDal2.getTestList(factid);
              %>
        
              <table class="tb">
                <tr>
                    <th class="THeading">Test-Id</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">Last-Date</th>
                    <th class="THeading">Category</th>
                    <th class="THeading">NOQ</th>
                    <th class="THeading">Duration (Minutes)</th>
                    
                </tr>
                               <%
                  if(A2.size()>0){
                  for(beans.Tests C : A2)
                {

                    %>

                <tr  onclick="window.document.location='StudentsAppeared.jsp?TID=<%=C.getSTID()%>'">
                    <td class="TData"><%=C.getSTID()%></td>
                     <td class="TData"><%=C.getDate()%></td>
                      <td class="TData"><%=C.getLastDate()%></td>
                      <td class="TData"><%=C.getCategoryName()%></td>
                      <td class="TData"><%=C.getNOQ()%></td>
                      <td class="TData"><%=C.getDuration()%></td>
                      
                </tr>
                                <%
                }}
                  else{
                    %>
                <tr>
                    <td class="TData" colspan="8" >There is no Scheduled Test.</td>

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

        
        <%@ include file="Footer.html"%>


    </body>
</html>
