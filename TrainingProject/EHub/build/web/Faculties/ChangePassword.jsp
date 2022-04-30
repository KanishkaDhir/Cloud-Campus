
<%@page import="DataLayer.DALFaculty"%>
<%@page import="DataLayer.DALRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Change Password</title>
        <link href="Contents.css" rel="stylesheet">
        <script type="text/javascript">
            function validateData()
            {
                 var flag=true;
                 var txt1=document.forms["f1"].elements["txtNewPassword"];
                 var txt2=document.forms["f1"].elements["txtConfirmPassword"];
                document.getElementById("msg1").innerHTML="";
                
                
                
                if(txt1.value!=txt2.value)
                    {
                        document.getElementById("msg2").innerHTML="Password-Confirm Password Mismatch!";
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
				<h1 class="title"><a href="#">Change Password!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
 <form name="f1" action="ChangePassword.jsp" method="Post">
            
                                        <%
                    String msg="";
                    if(request.getParameter("btnSignIn")!=null)
                    {
                        String pwd=session.getAttribute("PWD").toString();
                        String op=request.getParameter("txtOldPassword");
                        String p=request.getParameter("txtNewPassword");
                        
                        if(pwd.equals(op))
                        {
                            int FacultyId=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                            session.setAttribute("PWD", p);
                            DataLayer.DALFaculty objdal=new DALFaculty();
                            objdal.changePassword(p,FacultyId);
                            
                            response.sendRedirect("Home.jsp");
                        }
                        else{
                            msg="Old Password Incorrect";
                        }
                    }
                %>
                <table>
                    <tr>
                        <td>Old Password</td>
                        <td><input type="password" name="txtOldPassword" required="required"></td>
                        <td><%=msg%></td>
                    </tr>
                <tr>
                        <td>New Password</td>
                        <td><input type="password" name="txtNewPassword" required="required"></td>
                        <td><span id="msg1"></span></td>
                </tr>
                <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="txtConfirmPassword" required="required"></td>
                        <td><span id="msg2"></span> </td>
                </tr>
                                
                <tr>
                    <td colspan="3"><input type="submit" style="color: green; border-radius: 10px;" name="btnSignIn" value="Confirm" onclick="return validateData()"></td>
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
