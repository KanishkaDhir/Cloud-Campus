
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ehub-Test</title>
        <style>
             .tb
             {
                 border:1px solid black;
                  width: 600px;
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
				<h1 class="title"><a href="#">Scheduled Tests</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                                        <form action="Test.jsp" name="f1" method="Post">
                    <%!
                    int factid;
                    int studentid;
                    %>   
              <%

                  
                 factid=Integer.parseInt(session.getAttribute("FacultyId").toString());
                 studentid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
                  DataLayer.DALTests objDal2=new DALTests();
             
                  
    
                 
                  ArrayList<beans.Tests> A2= objDal2.getTestList(factid);
              %>
        
              <table class="tb">
                <tr a href>
                    <th class="THeading">Test-Id</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">Last-Date</th>
                    <th class="THeading">Category</th>
                    
                    <th class="THeading">Duration (Mints)</th>
                    <th class="THeading"></th>
                    <th class="THeading"></th>
                    
                </tr>
                               <%
                  if(A2.size()>0){
                  for(beans.Tests C : A2)
                {

                    %>

                <tr>
                    <td class="TData"><%=C.getSTID()%></td>
                     <td class="TData"><%=C.getDate()%></td>
                      <td class="TData"><%=C.getLastDate()%></td>
                      <td class="TData"><%=C.getCategoryName()%></td>
                      
                      <td class="TData"><%=C.getDuration()%></td>
                      <%
                    if(objDal2.checkTestAvailability(C.getSTID(), studentid)==true){
                      %>
                      <td class="TData"><a href="StartTest.jsp?TID=<%=C.getSTID()%>">Take Test<a></td>
                      <%
                    }
                    else{
                      %>
                      <td class="TData">Test Attempted</td>
                      <td class="TData"><a href="TestHistory.jsp?TID=<%=C.getSTID()%>">Test-History</a></td>
                                  <%
                    }
                                  %>
                </tr>
                
                                <%
                }
                  }
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
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
        
        <%@include file="Footer.html"%>
    
    </body>
</html>
