
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>EHub-Old Notice List</title>
                <link href="Contents.css" rel="stylesheet">
                 <style>             .tb
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
                 text-align: center;
             }

             .tb tr:hover
             {
                 background-color: pink;
                 
             }
             
                 </style>

        <script type="text/javascript">
           function deleteConfirmation()
           {
               var x = confirm("Do you want to delete?");
               return x;
           }
           function description(desc)
           {
               alert("Description:  "+desc);
           }
        </script>


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
				<h1 class="title"><a href="#">Hidden Notices!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
<form action="OldNoticeList.jsp" name="f1" method="Post">
                    <%!
                    int noticeid2;
                    %>   
              <%
                 int facid2=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALNotices objDal2=new DALNotices();
             
                  
                  if(request.getParameter("SID")!=null)
                {
                    noticeid2 = Integer.parseInt(request.getParameter("SID"));
                    objDal2.deleteNotice(noticeid2);
                    response.sendRedirect("OldNoticeList.jsp");
                }


                 
                  ArrayList<beans.Notice> A2= objDal2.getNotices( facid2 );
              %>
        
                <table class="tb">
                <tr>
                    <th class="THeading">Notice Id</th>
                    <th class="THeading">Subject</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">Description</th>
                    <th class="THeading"></th>
                </tr>
                               <% if(A2.size()>0){
                                   for(beans.Notice C : A2)
                {

                    %>

                <tr>
                    <td class="TData"><%=C.getNoticeId()%></td>
                     <td class="TData"><%=C.getSubject()%></td>
                      <td class="TData"><%=C.getDate()%></td>
                        <td class="TData"><a style="cursor: pointer"onclick='description("<%=C.getDescription()%>")'>Click for details</td>
                       <td class="TData"><a onclick='return deleteConfirmation()' href="OldNoticeList.jsp?SID=<%=C.getNoticeId()%>">Delete</td>
                </tr>
                                <%
                }}
                               else{
                    %>
<tr>
                    <td class="TData" colspan="5" >There is no Notice</td>

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
