<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALFaculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Faculty List</title>
        <link href="Contents.css" rel="stylesheet">
        <style>
                     
                        .tb
             {
                 border:1px solid black;
                  width: 700px;
             }
             .tb th td
             {
                 text-align: center;
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
           function deleteConfirmation(faculty)
           {
               var x = confirm("Do you want to delete '"+faculty+"'?");
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
				<h1 class="title"><a href="#">Faculty List!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
             <form action="FacultyList.jsp" name="f1" method="Post">
                    <%!
                    int factid;
                    %>   
              <%
                 int regid=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
                  DataLayer.DALFaculty objDal=new DALFaculty();
             
                  if(request.getParameter("FID")!=null)
                {
                    factid = Integer.parseInt(request.getParameter("FID"));
                    objDal.deleteFaculty(factid);
                }


                 
                  ArrayList<beans.Faculties> A= objDal.getFaculties(regid);
              %>
        
                <table class="tb">
                <tr>
                    <th class="THeading">Faculty Name</th>
                    <th class="THeading">Address</th>
                    <th class="THeading">Contact No.</th>
                    <th class="THeading">Email-Id</th>
                    <th class="THeading">Department Name</th>
                    <th class="THeading"></th>
                    <th class="THeading"></th>
                </tr>
                  <%
                  if(A.size()>0){
                for(beans.Faculties C : A)
                {

                    %>

                <tr>
                    <td class="TData"><%=C.getName()%></td>
                    <td class="TData"><%=C.getAddress()%></td>
                    <td class="TData"><%=C.getContactNo()%></td>
                    <td class="TData"><%=C.getEmailId()%></td>
                    <td class="TData"><%=C.getDepartmentName()%></td>
                    <td><a onclick='return deleteConfirmation("<%=C.getName()%>")' href="FacultyList.jsp?FID=<%=C.getFacultyId()%>">Delete</td>
                    <td><a style="cursor: pointer"onclick='return details("<%=C.getUserId()%>","<%=C.getPassword()%>")' >Details</td>
                </tr>
                                <%
                }}else{
                    %>
                <tr>
                    <td class="TData" colspan="7" >There is no faculty</td>

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
