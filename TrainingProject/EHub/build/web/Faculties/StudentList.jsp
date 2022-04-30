<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALStudents"%>
<%@page import="DataLayer.DALFaculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Student List</title>
        <link href="Contents.css" rel="stylesheet">
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
        </style>                <script type="text/javascript">
           function deleteConfirmation(faculty)
           {
               var x = confirm("Do you want to delete '"+Student+"'?");
               return x;
           }
                      function details(userid,password)
           {
               
               alert("User-Id:      "+userid+"\n\n"+"Password:  "+password);
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
				<h1 class="title"><a href="#">Students List!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
    <form action="StudentList.jsp" name="f1" method="Post">
                    <%!
                    int stdid;
                    %>   
              <%
                 int regid2=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALStudents objDal2=new DALStudents();
             
                  if(request.getParameter("SID")!=null)
                {
                    stdid = Integer.parseInt(request.getParameter("SID"));
                    objDal2.deleteStudent(stdid);
                }


                 
                  ArrayList<beans.Students> A2= objDal2.getStudents(regid2);
              %>
        
                <table class="tb">
                    <tr class="left">
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Date of Birth</th>
                    <th>Contact</th>
                    <th>Email-ID</th>
                    <th></th>
                    <th></th>
                </tr>
                  <%
                  if(A2.size()>0)
                  {
                for(beans.Students C : A2)
                {

                    %>

                <tr>
                     <td class="right"><%=C.getStudentId()%></td>
                    <td class="right"><%=C.getStudentName()%></td>
                     <td class="right"><%=C.getDOB()%></td>
                      <td class="right"><%=C.getContact()%></td>
                       <td class="right"><%=C.getEmailId()%></td>
                    <td class="right"><a onclick='return deleteConfirmation("<%=C.getStudentName()%>")' href="StudentList.jsp?SID=<%=C.getStudentId()%>">Delete</td>
                    <td class="right"><a style="cursor: pointer" onclick='return details("<%=C.getUserId()%>","<%=C.getPassword()%>")' >Details</td>

                  </tr>
                                <%
                }
                  }
                  else
                  {
                    %>
                <tr>
                    <td class="right" colspan="7" >There is no student</td>

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
