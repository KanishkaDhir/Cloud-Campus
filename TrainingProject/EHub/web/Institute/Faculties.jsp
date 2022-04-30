
<%@page import="DataLayer.DALFaculty"%>
<%@page import="beans.Faculties"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALDepartments"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Faculty</title>
        <link href="Contents.css" rel='stylesheet'>
        <script type="text/javascript">
            function validateData(){
                var flag=true;
                var txt1=document.forms["f1"].elements["txtName"];
                var txt2=document.forms["f1"].elements["txtUserId"];
                var txt3=document.forms["f1"].elements["txtPassword"];
                var txt4=document.forms["f1"].elements["txtConfirmPassword"];
                
                document.getElementById("msg1").innerHTML="";
                document.getElementById("msg2").innerHTML="";
                document.getElementById("msg3").innerHTML="";
                document.getElementById("msg4").innerHTML="";
                if(txt1.value==""){
                    flag=false;
                    document.getElementById("msg1").innerHTML="Name is empty!";
                }
                if(txt2.value==""){
                    flag=false;
                    document.getElementById("msg2").innerHTML="UserId is empty!";
                }
                if(txt3.value==""){
                    flag=false;
                    document.getElementById("msg3").innerHTML="Password is empty!";
                }
                if(txt4.value!=txt3.value){
                    flag=false;
                    document.getElementById("msg4").innerHTML="Password/Confirm Password Mismatch!";
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
				<h1 class="title"><a href="#">Add Faculty!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                     <form action="Faculties.jsp" name="f1" method='Post'>
                    <%!
                        String msg="";
                    %>
                    <%
                        
                       int regid=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
                        DataLayer.DALDepartments objDal=new DALDepartments();
                        ArrayList<beans.Departments> AC= objDal.getDepartments(regid);
                        
                        if(request.getParameter("btnList")!=null)
                        {
                            response.sendRedirect("FacultyList.jsp");
                        }
                        if(request.getParameter("btnAdd")!=null)
                        {
                           System.out.print("on add click");
                            String dname=request.getParameter("txtDepartment");
                            int i=objDal.giveDeptId(dname, regid);
                            System.out.print(i);
                            
                        DataLayer.DALFaculty obj=new DALFaculty();
                        if(obj.UserAvailability(request.getParameter("txtUserId"), i)==false){
                        msg="UserId unavailable!";
                        }
                        
                        if(obj.UserAvailability(request.getParameter("txtUserId"), i)==true){
                            msg="";
                        beans.Faculties f=new Faculties();
                        f.setName(request.getParameter("txtName"));
                        f.setGender(request.getParameter("txtRadio"));
                        f.setAddress(request.getParameter("txtAddress"));
                        f.setCity(request.getParameter("txtCity"));
                        f.setContactNo(request.getParameter("txtContactNo"));
                        f.setEmailId(request.getParameter("txtEmail"));
                        f.setUserId(request.getParameter("txtUserId"));
                        f.setPassword(request.getParameter("txtPassword"));
                        f.setDepartmentId(i);
                        
                        obj.addFaculty(f);
                        response.sendRedirect("FacultyList.jsp");
                        }
                        }
                       
                        %>
                    <table>
                        <tr>
                            <td><font color="red">*</font>Name</td>
                            <td><input type="text" name='txtName' maxlength="50" value="<%=request.getParameter("txtName")!=null?request.getParameter("txtName"):""%>"></td>
                            <td><font color="blue"><span id='msg1'></span></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><input type="radio" name='txtRadio' value='Male' checked>Male
                            <input type="radio" name='txtRadio' value='Female'>Female</td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name='txtAddress' maxlength="50" value="<%=request.getParameter("txtAddress")!=null?request.getParameter("txtAddress"):""%>"></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><input type="text" name='txtCity' maxlength="50" value="<%=request.getParameter("txtCity")!=null?request.getParameter("txtCity"):""%>"></td>
                        </tr>
                        <tr>
                            <td>Contact-Number</td>                                                   
                            <td><input type="text" name='txtContactNo' maxlength="50" value="<%=request.getParameter("txtContactNo")!=null?request.getParameter("txtContactNo"):""%>"></td>
                        </tr>
                        <tr>
                            <td>Email-ID</td>                                                   
                            <td><input type="text" name='txtEmail' maxlength="100" value="<%=request.getParameter("txtEmail")!=null?request.getParameter("txtEmail"):""%>"></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>User-Id</td>                                             
                            <td><input type="text" name='txtUserId' maxlength="50" value="<%=request.getParameter("txtUserId")!=null?request.getParameter("txtUserId"):""%>"></td>
                            <td><font color="blue"><span id="msg2"></span></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Password</td>                                            
                            <td><input type="password" name='txtPassword' maxlength="50"></td>
                            <td><font color="blue"><span id="msg3"></span></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Confirm-Password</td>                                    
                            <td><input type="password" name='txtConfirmPassword' maxlength="50"></td>
                            <td><font color="blue"><span id="msg4"></span></td>
                        </tr>
                        <tr>
                            <td>Department-Name</td>                                             
                            <td><select name='txtDepartment' style="width: 143px;">
                                   
                                    <%   if(AC.size()>0){
                                        for(beans.Departments b:AC){                                        
                                    %>
                                     <option>
                                         <%=b.getDepartmentName()%>
                                    </option>
                                    <%
                                        }}
                                    %>
                                </select></td>
                            <td><span id="msg2"></span></td>
                        </tr>
                        <tr><td></td>
                            <td><input type="submit"  style="color: green; border-radius: 10px;" name="btnAdd" value="Add" onclick='return validateData()'>
                            <input type="submit" style="color: green; border-radius: 10px;" name="btnList" value="List"></td></tr>
                        <tr><td></td>
                            <td><%=msg%></td></tr>

                        
                    </table>
                </form>
                         
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
