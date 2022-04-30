
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>EHub-New Notice List</title>
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
				<h1 class="title"><a href="#">Notices</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
              <form action="Notices.jsp" name="f1" method="Post">
                    <%!
                    int noticeid;
                    %>   
              <%
                  
                 int regid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
                  DataLayer.DALNotices objDal=new DALNotices();
             
                  
                  
                  ArrayList<beans.Notice> A= objDal.getStudentNotices(regid);
              %>
        
                <table class="tb">
                <tr>
                    <th class="THeading">Notice Id</th>
                    <th class="THeading">Subject</th>
                    <th class="THeading">Date</th>

                </tr>
                    <% 
                  if(A.size()>0){
                  for(beans.Notice C : A)
                {

                    %>

               <tr onclick="window.document.location='NoticeDetails.jsp?NID=<%=C.getNoticeId()%>'">
                    <td class="TData"><%=C.getNoticeId()%></td>
                    <td class="TData"><%=C.getSubject()%></td>
                     <td class="TData"><%=C.getDate()%></td>

                </tr>
                                <%
                }}
                  else{
                    %>
                <tr>
                    <td class="TData" colspan="7" >There is no Notice</td>

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
