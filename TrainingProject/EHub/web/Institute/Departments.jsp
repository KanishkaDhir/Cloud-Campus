
<%@page import="DataLayer.DALDepartments"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Add Department</title>
        <link href="Contents.css" rel="stylesheet">
        <script type="text/javascript">
            function validateData(){
                var flag=true;
                 var txt1=document.forms["f1"].elements["txtDepartmentName"];
                document.getElementById("msg1").innerHTML="";
                
                if(txt1.value=="")
                    {
                        document.getElementById("msg1").innerHTML="Department Name empty!";
                        flag=false;
                    }
                    return flag;
            
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
				<h1 class="title"><a href="#">Add Department!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                <form action="Departments.jsp" name="f1" method="Post">
                    <%!
                        String msg="";
                    %>
                    <%
                        if(request.getParameter("btnList")!=null)
                     
                        
                        {
                            response.sendRedirect("DepartmentList.jsp");
                        }
                        DataLayer.DALDepartments objDal=new DALDepartments();
                        if(request.getParameter("btnAdd")!=null)
                        {
                            String s=request.getParameter("txtDepartmentName");
                            int regid=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
                            if(objDal.checkDepartment(s,regid)==false)
                            {
                            msg="Department already exist";
                            }
                            else
                            {
                                objDal.addDepartment(s, regid);
                                
                            }
                        }
                    %>
                    <table>
                        <tr>
                            <td>Department Name</td>
                            <td><input type="text" name="txtDepartmentName" ></td>
                             <td><span id="msg1"></span></td>
                        </tr>
                        
                        <tr><td>  </td></tr>
                        <tr><td>  </td></tr>
                        <tr><td>  </td></tr>
                        
                        <tr><td>  </td></tr>
                        <tr><td>  </td></tr>
                            
                        <tr><td></td>
                        <td><input type="submit" name="btnAdd" style="color: green; border-radius: 10px;" value="Add" onclick="return validateData()">
                        <input type="submit" name="btnList" style="color: green; border-radius: 10px;" value="List" ></td></tr>
                        <tr><td></td>
                            <td><%=msg%></td></tr>
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
