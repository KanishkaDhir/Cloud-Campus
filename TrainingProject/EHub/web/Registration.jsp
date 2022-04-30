
<%@page import="DataLayer.DALRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Registration</title>
        <link href="Contents.css" rel="stylesheet">
        <script type="text/javascript">
            function validateData()
            {
                var flag=true;
                var txt1=document.forms["f1"].elements["txtUserId"];
                var txt2=document.forms["f1"].elements["txtPassword"];
                var txt3=document.forms["f1"].elements["txtConfirmPassword"];
                var txt4=document.forms["f1"].elements["txtInstituteName"];
                var txt5=document.forms["f1"].elements["txtAnswer"];
                var txt6=document.forms["f1"].elements["txtCode"];
                
            document.getElementById("msg1").innerHTML="";
            document.getElementById("msg2").innerHTML="";
            document.getElementById("msg3").innerHTML="";
            document.getElementById("msg4").innerHTML="";
            document.getElementById("msg5").innerHTML="";
            document.getElementById("msg6").innerHTML="";

          if(txt1.value=="")
                {
                    flag=false;
                    document.getElementById("msg1").innerHTML="User Id Empty";
                }
          if(txt2.value=="")
                {
                    flag=false;
                    document.getElementById("msg2").innerHTML="Password is Empty";
                }      
          if(txt3.value!=txt2.value)
                {
                    flag=false;
                    document.getElementById("msg3").innerHTML="Password/Confirm Password Mismatch!";
                }
          if(txt4.value=="")
                {
                    flag=false;
                    document.getElementById("msg4").innerHTML="Institute Name Empty";
                }
          if(txt5.value=="")
                {
                    flag=false;
                    document.getElementById("msg5").innerHTML="Answer Empty";
                }
          if(txt6.value=="")
                {
                    flag=false;
                    document.getElementById("msg6").innerHTML="Code Empty";
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
					<h2>&nbsp;</h2>
					<ul>
						<li></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- start content -->
		<div id="content">
			<div class="flower"></div>
			<div class="post"> 
				<h1 class="title"><a href="#">Institute Registration!</a></h1>
				<div class="entry">
					<p>
                <form action="Registration.jsp" name="f1" method="Post">
                    <%!
                        String msg="";
                        String j="";
                    %>
                    <%
                        if(request.getParameter("btnAdd")!=null)
                        {
                            System.out.print("on add click");
                            DataLayer.DALRegistration objDal=new DALRegistration();
                            String s=request.getParameter("txtUserId");
                            System.out.print(s);
                            boolean b=objDal.UserAvailability(s);
                            
                            if(b==false)
                                {
                                    msg="User Id Already Exist";
                                }
                            if(b==true)
                                {
                            
                                    if(objDal.CodeAvailability(request.getParameter("txtCode"))==false)
                                    {
                                    j="Code Not Available";
                                    }
                                    else
                                    {
                                        System.out.print("inside else for register");
                                    beans.Registration obj=new beans.Registration();
                                    obj.setUserID(request.getParameter("txtUserId"));
                                    obj.setPassword(request.getParameter("txtPassword"));
                                    obj.setInstituteName(request.getParameter("txtInstituteName"));
                                    obj.setAddress(request.getParameter("txtAddress"));
                                    obj.setCity(request.getParameter("txtCity"));
                                    obj.setEmailID(request.getParameter("txtEmail"));
                                    obj.setSecurityQuestion(request.getParameter("txtSecurityQuestion"));
                                    obj.setAnswer(request.getParameter("txtAnswer"));
                                    obj.setCode(request.getParameter("txtCode"));
                                    objDal.register(obj);
                                    response.sendRedirect("Login.jsp");
                                    }
                                }
                        }
                    %>
                    <table>
                        <tr>
                            <td><font color="red">*</font>User-Id</td>
                            <td><input type="text" name="txtUserId" maxlength="50" value="<%=request.getParameter("txtUserId")!=null?request.getParameter("txtUserId"):""%>"></td>
                            <td><font color="blue"><span id="msg1"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Password</td>
                            <td><input type="password" name="txtPassword" maxlength="50"></td>
                            <td><font color="blue"><span id="msg2"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Confirm Password</td>
                            <td><input type="password" name="txtConfirmPassword" maxlength="50"></td>
                            <td><font color="blue"><span id="msg3"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Institute-Name</td>
                            <td><input type="text" name="txtInstituteName" maxlength="100" value="<%=request.getParameter("txtInstituteName")!=null?request.getParameter("txtInstituteName"):""%>"></td>
                            <td><font color="blue"><span id="msg4"></span></font></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="txtAddress" maxlength="50" value="<%=request.getParameter("txtAddress")!=null?request.getParameter("txtAddress"):""%>"></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><input type="text" name="txtCity" maxlength="30" value="<%=request.getParameter("txtCity")!=null?request.getParameter("txtCity"):""%>"></td>
                        </tr>
                        <tr>
                            <td>Email-ID</td>
                            <td><input type="text" name="txtEmail" maxlength="100" value="<%=request.getParameter("txtEmail")!=null?request.getParameter("txtEmail"):""%>"></td>
                        </tr>
                        <tr>
                            <td>Security Question</td>
                            <td><select style="width: 143px;" name='txtSecurityQuestion'>
                                    <option>What's your pet Name?</option>
                                    <option>What company mobile do you own?</option>
                                    <option>How many floors are there in your home?</option>
                                    <option>What's your Birth Month?</option>
                                    <option>What's your Father Name?</option>                                    
                                </select></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Answer</td>
                            <td><input type="text" name="txtAnswer" maxlength="50" value="<%=request.getParameter("txtAnswer")!=null?request.getParameter("txtAnswer"):""%>"></td>
                            <td><font color="blue"><span id="msg5"></span></font></td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>Code</td>
                            <td><input type="text" name="txtCode" maxlength="5" value="<%=request.getParameter("txtCode")!=null?request.getParameter("txtCode"):""%>">
                            <%=j%></td>
                            <td><font color="blue"><span id="msg6"></span></font></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="3"><input type='submit' style="color: green; border-radius: 10px;" value='Add' name="btnAdd" onclick="return validateData()" ></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><%=msg%></td>
                        </tr>
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


        
        <%@include file="Footer.html"%>
    </body>
</html>
