
<%@page import="DataLayer.DALStudents"%>
<%@page import="DataLayer.DALFaculty"%>
<%@page import="DataLayer.DALRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Login</title>
        <link href="Contents.css" rel="stylesheet">
                <script type="text/javascript">
        
        function validateData(){
            var flag=true;
            
            var txt1=document.forms["frmLogin"].elements["txtUserId"];
            var txt2=document.forms["frmLogin"].elements["txtPassword"];
            
            document.getElementById("msg1").innerHTML="";
            document.getElementById("msg2").innerHTML="";
            if(txt1.value=="")
                {
                    flag=false;
                    document.getElementById("msg1").innerHTML="User Id Empty";
                }
                if(txt2.value=="")
                    {
                        flag=false;
                    document.getElementById("msg2").innerHTML="Password Empty";
                }
                return flag;
        }
        </script>
    </head>
    <body>
        <%@include file="Header.html"%>
        	<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
                            <%@include file="Options.html"%>
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
				<h1 class="title"><a href="#">Login Page</a></h1>
				<div class="entry">
					<p>
                                            <%
                    String msg="";
                    if(request.getParameter("btnLogin")!=null)
                    {
                        if(request.getParameter("rdLoginAs").equals("Institute"))
                        {
                            DataLayer.DALRegistration objDal=new DALRegistration();
                            beans.Registration r=objDal.authenticateUser(request.getParameter("txtUserId"), request.getParameter("txtPassword"));
                            if(r.getRegistrationID()>0)
                            {
                              // System.out.print("inside if");
                                session.setAttribute("LoggedRegId", r.getRegistrationID());
                                session.setAttribute("InstituteName", r.getInstituteName());
                                session.setAttribute("PWD", r.getPassword());
                                response.sendRedirect("Institute/Home.jsp");
                            }
                            else
                                
                            {// System.out.print("inside else");
                                msg="UserId/Password Incorrect!";
                            }
                        }
                        else if(request.getParameter("rdLoginAs").equals("Faculty"))
                        {
                            DataLayer.DALFaculty objDal=new DALFaculty();
                            beans.Faculties r=objDal.authenticateUser(request.getParameter("txtUserId"), request.getParameter("txtPassword"));
                            if(r.getFacultyId()>0)
                            {
                                session.setAttribute("LoggedFacultyId", r.getFacultyId());
                                session.setAttribute("FacultyName", r.getName());
                                session.setAttribute("PWD",r.getPassword());
                                response.sendRedirect("Faculties/Home.jsp");
                            }
                            else
                            {
                                msg="UserId/Password Incorrect!";
                            }

                        }
                        else if(request.getParameter("rdLoginAs").equals("Student"))
                        {
                                   DataLayer.DALStudents objDal=new DALStudents();
                            beans.Students r=objDal.authenticateUser(request.getParameter("txtUserId"), request.getParameter("txtPassword"));
                            if(r.getStudentId()>0)
                            {
                                session.setAttribute("LoggedStudentId", r.getStudentId());
                                session.setAttribute("FacultyId", r.getFacultyId());
                                session.setAttribute("StudentName", r.getStudentName());
                                session.setAttribute("PWD", r.getPassword());
                                response.sendRedirect("Student/Home.jsp");
                            }
                            else
                            {
                                msg="UserId/Password Incorrect!";
                            }
                    
                        }
                    }
                %>
                <form action="Login.jsp" name="frmLogin" method="Post">
                    
                <table>
                    <tr>
                        <td>User-Id</td>
                        <td><input type="text" name="txtUserId" value="<%=request.getParameter("txtUserId")!=null?request.getParameter("txtUserId"):""%>"></td>
                        <td><span id="msg1"></span></td></tr>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtPassword"></td>
                        <td><span id="msg2"></span></td></tr>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Login as:<input type="radio" name="rdLoginAs" value="Institute" checked> Institute
                    <input type="radio" name="rdLoginAs" value="Faculty">Faculty
                    <input type="radio" name="rdLoginAs" value="Student">Student</td>
                    
                    </tr>
                    <tr>
                        
                        <td></td>
                        <td colspan="3"><input type="submit" style=" border-radius: 10px; color: green; " name="btnLogin" value="SignIn" onclick="return validateData()"></td>
                        
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><%=msg%></td>
                    </tr>
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
