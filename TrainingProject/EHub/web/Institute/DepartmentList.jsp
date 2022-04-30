
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALDepartments"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Department List</title>
        <link href="Contents.css" rel="stylesheet">
        <style>
                     
                        .tb
             {
                 border:1px solid black;
                  width: 300px;
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
                 cursor:pointer;
                 
             }
             
                 </style>


        
        <script type="text/javascript">
           function deleteConfirmation(department)
           {
               var x = confirm("Do you want to delete '"+department+"'?");
               return x;
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
				<h1 class="title"><a href="#">Department List!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                  <form action="DepartmentList.jsp" name="f1" method="Post">
                    <%!
                    int deptid;
                    %>   
        <%
             
            int regid=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
            DataLayer.DALDepartments objDAL = new DALDepartments();
            
            if(request.getParameter("DID")!=null)
            {
                deptid = Integer.parseInt(request.getParameter("DID"));
                objDAL.deleteDepartment(deptid);
            }

            ArrayList<beans.Departments> AC = objDAL.getDepartments(regid);
            
        %>
        
            <table class="tb">
                <tr>
                    <th class="THeading">Department Name</th>
                    <th class="THeading"></th>
                </tr>
                
                <%
            if(AC.size()>0){
            for(beans.Departments C : AC)
                {

                    %>
                <tr>
                    <td class="TData"><%=C.getDepartmentName()%></td>
                    <td class="TData"><a onclick='return deleteConfirmation("<%=C.getDepartmentName()%>")' href="DepartmentList.jsp?DID=<%=C.getDepartmentId()%>">Delete</td>
                </tr>
                    
                <%
                }}
            else{
                    %>
                <tr>
                    <td class="TData" colspan="7" >There is no department</td>

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
