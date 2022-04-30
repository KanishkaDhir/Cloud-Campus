
<%@page import="DataLayer.DALRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Update Institute</title>
        <link href="Contents.css" rel="stylesheet">
        <script type="text/javascript">
            function validateData()
            {
                var flag=true;
                var txt1=document.forms["f1"].elements["txtInstituteName"];
                document.getElementById("msg1").innerHTML="";
                
                if(txt1.value=="")
                    {
                        document.getElementById("msg1").innerHTML="Institute Name emoty!";
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
<%@include file="Options.html"%>				</li>
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
				<h1 class="title"><a href="#">Update Profile!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                      <form action="UpdateProfile.jsp" name="f1" method="Post">
                    <%!
                        String in;
                        String Address;
                        String City;
                        String email;
                    
                   %>
                    <%    DataLayer.DALRegistration objDal=new DALRegistration();
                        int regid=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
                        
                        if(request.getParameter("btnUpdate")==null)
                        {
                            beans.Registration r=objDal.getRegistartion(regid);
                            in=r.getInstituteName();
                            Address=r.getAddress();
                            City=r.getCity();
                            email=r.getEmailID();
                        }
                        else if(request.getParameter("btnUpdate")!=null)
                        {
                            beans.Registration r = new beans.Registration();
                            r.setRegistrationID( regid );
                            r.setInstituteName(request.getParameter("txtInstituteName"));
                            r.setAddress(request.getParameter("txtAddress"));
                            r.setCity(request.getParameter("txtCity"));
                            r.setEmailID(request.getParameter("txtEmail"));
                            objDal.UpdateProfile(r);
                            response.sendRedirect("Home.jsp");
                        }
                        
                    %>
                    
                    <table>
                        <tr>
                            <td>Institute Name</td>
                            <td><input type="text" style="border-radius: 18px;border: 1px solid violet;" name="txtInstituteName" value="<%=in%>" maxlength="100"></td>
                            <td><span id="msg1"></span></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" style="border-radius: 18px;border: 1px solid violet;"name="txtAddress" value="<%=Address%>"maxlength="50"></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><input type="text" style="border-radius: 18px;border: 1px solid violet;"name="txtCity" value="<%=City%>"maxlength="30"></td>
                        </tr>
                        <tr>
                            <td>Email-Id</td>
                            <td><input type="text" style="border-radius: 18px;border: 1px solid violet;"name="txtEmail" value="<%=email%>" maxlength="100"></td>
                        </tr>
                        <tr><td></td>
                            <td colspan="2"><input type="submit" style="color: green; border-radius: 10px;" name="btnUpdate" value="Update" onclick="validateData()"></td>
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
