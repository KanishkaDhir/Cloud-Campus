
<%@page import="beans.Students"%>
<%@page import="DataLayer.DALStudents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ehub-Add Student</title>
        <link href="Contents.css" rel="stylesheet">
         <script type="text/javascript">
            function validateData(){
                var flag=true;
                var txt1=document.forms["f1"].elements["txtName"];
                var txt2=document.forms["f1"].elements["txtDOB"];
                var txt3=document.forms["f1"].elements["txtUserId"];
                var txt4=document.forms["f1"].elements["txtPassword"];
                var txt5=document.forms["f1"].elements["txtConfirmPassword"];
                
                document.getElementById("msg1").innerHTML="";
                document.getElementById("msg2").innerHTML="";
                document.getElementById("msg3").innerHTML="";
                document.getElementById("msg4").innerHTML="";
                document.getElementById("msg5").innerHTML="";
                if(txt1.value==""){
                    flag=false;
                    document.getElementById("msg1").innerHTML="Name is empty!";
                }
                if(txt2.value==""){
                    flag=false;
                    document.getElementById("msg2").innerHTML="Date of Birth is empty!";
                }
                if(txt3.value==""){
                    flag=false;
                    document.getElementById("msg3").innerHTML="User-Id is empty!";
                }
                if(txt4.value==""){
                    flag=false;
                    document.getElementById("msg4").innerHTML="Password is empty!";
                }
                if(txt5.value!=txt4.value){
                    flag=false;
                    document.getElementById("msg5").innerHTML="Password/Confirm Password Mismatch!";
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
				<h1 class="title"><a href="#">Students!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                      <form action="Students.jsp" name="f1" method='Post'>
                    <%!
                        String msg="";
                    %>
                    <%
                       int regid2=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                        DataLayer.DALStudents objDal2=new DALStudents();
                        if(request.getParameter("btnList")!=null)
                        {
                            response.sendRedirect("StudentList.jsp");
                        }
                        if(request.getParameter("btnAdd")!=null)
                        {
                        
                            
                            
                        DataLayer.DALStudents obj=new DALStudents();
                        if(obj.UserAvailability(request.getParameter("txtUserId"), regid2)==false){
                        msg="UserId unavailable!";
                        }
                        
                        if(obj.UserAvailability(request.getParameter("txtUserId"), regid2)==true){
                        beans.Students f=new Students();
                        f.setStudentName(request.getParameter("txtName"));
                        f.setGender(request.getParameter("txtRadio"));
                        f.setDOB(request.getParameter("txtDOB"));
                        f.setContact(request.getParameter("txtContactNo"));
                        f.setEmailId(request.getParameter("txtEmail"));
                        f.setUserId(request.getParameter("txtUserId"));
                        f.setPassword(request.getParameter("txtPassword"));
                        f.setFacultyId(regid2);
                        
                        obj.addStudents(f);
                        response.sendRedirect("StudentList.jsp");
                        }
                        }
                        %>
                
                 <table>
                        <tr>
                            <td><font color="red">*</font>Name</td>
                            <td><input type="text" name='txtName' maxlength="50" value="<%=request.getParameter("txtName")!=null?request.getParameter("txtName"):""%>"></td>
                            <td><font color="blue"><span id='msg1'></span></font></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><input type="radio" name='txtRadio' value='Male' checked>Male
                            <input type="radio" name='txtRadio' value='Female'>Female</td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Date of Birth</td>
                            <td><input type="text" name='txtDOB' maxlength="10" placeholder="mm/dd/yyyy" value="<%=request.getParameter("txtDOB")!=null?request.getParameter("txtDOB"):""%>"></td>
                            <td><font color="blue"><span id='msg2'></span></font></td>
                        </tr>
                        <tr>
                            <td>Contact-Number</td>                                                   
                            <td><input type="text" name='txtContactNo' maxlength="50"value="<%=request.getParameter("txtContactNo")!=null?request.getParameter("txtContactNo"):""%>"></td>
                        </tr>
                        <tr>
                            <td>Email-ID</td>                                                   
                            <td><input type="text" name='txtEmail' maxlength="100"value="<%=request.getParameter("txtEmail")!=null?request.getParameter("txtEmail"):""%>"></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>User-Id</td>                                             
                            <td><input type="text" name='txtUserId' maxlength="50" value="<%=request.getParameter("txtUserId")!=null?request.getParameter("txtUserId"):""%>"></td>
                            <td><font color="blue"><span id="msg3"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Password</td>                                            
                            <td><input type="password" name='txtPassword' maxlength="50"></td>
                            <td><font color="blue"><span id="msg4"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Confirm-Password</td>                                    
                            <td><input type="password" name='txtConfirmPassword' maxlength="50"></td>
                            <td><font color="blue"><span id="msg5"></span></font></td>
                        </tr>
                        
                        
                        </tr>
                        <tr><td><input type="submit" style=" border-radius: 10px; color: green; " name="btnAdd" value="Add" onclick='return validateData()'>
                            <input type="submit" style=" border-radius: 10px; color: green; " name="btnList" value="List"></td></tr>
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
</div>                <%@include file="Footer.html"%>
    </body>
</html>
