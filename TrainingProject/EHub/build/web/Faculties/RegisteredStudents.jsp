
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Registered Students</title>
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
				<h1 class="title"><a href="#">Students Registered</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->


        <%
            int eventid2=Integer.parseInt(request.getParameter("EID"));
            DataLayer.DALEvents objdal2=new DALEvents();
            
            ArrayList<beans.Students> r=objdal2.registeredStudents(eventid2);
        %>
                                    <table class="tb">
                                        <tr class="left">
            <th>Student Name:</th>
            <th>Contact:</th>
            <th>Email Id:</th>
            
            </tr>
            
              <%
                  if(r.size()>0)
                  {
                    for(beans.Students C : r)
                        {

                    %>

                <tr>
                    <td class="right"><%=C.getStudentName()%></td>
                     <td class="right"><%=C.getContact()%></td>
                      <td class="right"><%=C.getEmailId()%></td>
                        
                </tr>
                                <%
                         }
                  }
                  else
                    {
                    %>
                <tr>
                    <td class="right" colspan="8" >There is no Student</td>

                  </tr>

                    
                    <%}%>

        </table>
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
							<h2>Site Search</h2>
							<input type="text" name="s" id="s" size="15" value="" />
						</div>
					</form>
				</li>
				<li>
					<h2>Tags</h2>
					<p class="tag"><a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a></p></li>
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
