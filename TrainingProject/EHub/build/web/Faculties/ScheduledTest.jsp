
<%@page import="DataLayer.DALTests"%>
<%@page import="beans.Tests"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALCategories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ehub-Scheduled Test</title>
                   <script type="text/javascript">
            function validateData(){
                var flag=true;
                var txt1=document.forms["f1"].elements["txtDate"];
                var txt2=document.forms["f1"].elements["txtLastDate"];
                var txt3=document.forms["f1"].elements["txtNOQ"];
                var txt4=document.forms["f1"].elements["txtDuration"];
                
                document.getElementById("msg1").innerHTML="";
                document.getElementById("msg2").innerHTML="";
                document.getElementById("msg3").innerHTML="";
                document.getElementById("msg4").innerHTML="";
                if(txt1.value==""){
                    flag=false;
                    document.getElementById("msg1").innerHTML="Date is empty!";
                }
                if(txt2.value==""){
                    flag=false;
                    document.getElementById("msg2").innerHTML="Last Date is empty!";
                }
                if(txt3.value==""){
                    flag=false;
                    document.getElementById("msg3").innerHTML="No. of Questions is empty!";
                }
                if(txt4.value==""){
                    flag=false;
                    document.getElementById("msg4").innerHTML="Duration is empty!";
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
				<h1 class="title"><a href="#">Schedule Tests!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
        <%!
            String msg="";
            String catName;
            %>
        <%
             int factid=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                        DataLayer.DALCategories objDal2=new DALCategories();
                        ArrayList<beans.Tests> AC= objDal2.getCategories();
                        
                        
                         catName=request.getParameter("txtCategory");
                        int i=objDal2.giveCategoryId(catName);
                if(request.getParameter("btnList")!=null) {
                        response.sendRedirect("ScheduledTestList.jsp");
                
                }       
                        
                        if(request.getParameter("btnAdd")!=null)
                        {

                            
                            
                        
                         beans.Tests r=new Tests();
                         r.setDate(request.getParameter("txtDate"));
                         r.setLastDate(request.getParameter("txtLastDate"));
                         
                         r.setFacultyId(Integer.parseInt(session.getAttribute("LoggedFacultyId").toString()));
                         r.setCategoryId(i);
                         r.setNOQ(Integer.parseInt(request.getParameter("txtNOQ")));
                         r.setDuration(Integer.parseInt(request.getParameter("txtDuration")));
                         DataLayer.DALTests objdal2=new DALTests();
                         objdal2.addScheduledTest(r);
                        response.sendRedirect("ScheduledTestList.jsp");
                        }
                        
                        
        %>
        <form name="f1" action="ScheduledTest.jsp" method="Post">
        <table>
            <tr>
                <td>Date:</td>
                <td><input type="text" name="txtDate" placeholder="mm/dd/yyyy" ></td>
                <td><span id="msg1"></span></td>
            </tr>
            <tr>
                <td>Last Date:</td>
                <td><input type="text" name="txtLastDate" placeholder="mm/dd/yyyy" ></td>
                <td><span id="msg2"></span></td>
            </tr>
            <tr>
                            <td>Category:</td>                                    
                            <td><select name='txtCategory' style="width: 143px;" >
                                   
                                    <%
                            for(beans.Tests b:AC){                                        
                                    %>
                                    <option value="<%=b.getCategoryName()%>">
                                         <%=b.getCategoryName()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select></td>
                           </tr>
            
            <tr>
                <td>No. of Questions:</td>
                <td><input type="text" name="txtNOQ" ></td>
                <td><span id="msg3"></span></td>
            </tr>
            <tr>
                <td>Duration:</td>
                <td><input type="text" name="txtDuration"  placeholder="Minutes"></td>
                <td><span id="msg4"></span></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" style="color: green; border-radius: 10px;" name="btnAdd" value="Schedule Test" onclick="return validateData()">
                
                
                    <input type="submit" style="color: green; border-radius: 10px;" name="btnList" value="Test List">
                </td>
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

        
        <%@ include file="Footer.html"%>

    </body>
</html>
