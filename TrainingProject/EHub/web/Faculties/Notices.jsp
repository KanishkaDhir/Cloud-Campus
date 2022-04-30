
<%@page import="beans.Notice"%>
<%@page import="DataLayer.DALNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Notices</title>
        <link href ="Contents.css" rel="stylesheet">
        <script type="text/javascript">
    function validateData()
            {
                
                var flag=true;
                var txt1=document.forms["f1"].elements["txtSubject"];
                var txt2=document.forms["f1"].elements["txtDate"];
                var txt3=document.forms["f1"].elements["txtDescription"];
                
            document.getElementById("msg1").innerHTML="";
            document.getElementById("msg2").innerHTML="";
            document.getElementById("msg3").innerHTML="";

          if(txt1.value=="")
                {
                    flag=false;
                    document.getElementById("msg1").innerHTML="Subject Empty";
                }
          if(txt2.value=="")
                {
                    flag=false;
                    document.getElementById("msg2").innerHTML="Date is Empty";
                }      
          if(txt3.value=="")
                {
                    flag=false;
                    document.getElementById("msg3").innerHTML="Description is Empty";
                }
          
         return flag;
            }
        </script>
        
         </head>
         
         <body>
     <%@include file="Header.html" %>
     
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
				<h1 class="title"><a href="#">Notices!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                <form action="Notices.jsp" name="f1" method="Post">
                    <%!
                        String j="yyyy/MM/dd";
                        
                    %>
                    <%
                         if(request.getParameter("btnOldNotices")!=null){
                        response.sendRedirect("OldNoticeList.jsp");
                        }
                        
                        
                        
                        if(request.getParameter("btnNewNotices")!=null)
                        {
                            response.sendRedirect("NewNoticeList.jsp");
                        }
                 
                        if(request.getParameter("btnAdd")!=null)
                        {
                            byte b=Byte.parseByte(request.getParameter("txtStatus"));
                            int factId=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                            DataLayer.DALNotices objDal2=new DALNotices();
                            beans.Notice r=new Notice();
                            r.setSubject(request.getParameter("txtSubject"));
                            r.setDate(request.getParameter("txtDate"));
                            r.setDescription(request.getParameter("txtDescription"));
                            r.setFacultyId(factId);
                            r.setStatus(b);
                            objDal2.addNotice(r);
                        }
                    %>

                    <table class="TB">
                            <tr>
                                <td>*Subject</td>
                                <td><input type="text" name="txtSubject" maxlength="50" ></td>
                                <td><span id="msg1"></span></td>
                            </tr>
                            <tr>    
                                <td>*Date:</td>
                                <td><input type="text" name="txtDate" placeholder="yyyy/MM/dd" maxlength="10" ></td>
                                <td><span id="msg2"></span></td>
                            </tr>
                        <tr>
                            <td>*Description:</td>
                            <td><textarea cols="30" rows="10" name="txtDescription" maxlength="300" ></textarea></td>
                            <td><span id="msg3"></span></td>
                         </tr>
                         
                         
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="btnAdd" onclick="return validateData()" style="color: green; border-radius: 10px;">  
                            <input type="submit" name="btnOldNotices" value="Old Notice List" style="color: green; border-radius: 10px;">
                            <input type="submit" name="btnNewNotices" value="New Notice List" style="color: green; border-radius: 10px;"></td>
                 
                        </tr>
                        
                        <input type="hidden" name="txtStatus" value="0">
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
