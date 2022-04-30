
<%@page import="beans.Events"%>
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>EHub-Events</title>
        <link href ="Contents.css" rel="stylesheet">
        <style type="text/css">

        </style>
        <script type="text/javascript">

            function validateData()
            {
                
                var flag=true;
                var txt1=document.forms["f1"].elements["txtName"];
                var txt2=document.forms["f1"].elements["txtDate"];
                var txt3=document.forms["f1"].elements["txtVenue"];
                var txt4=document.forms["f1"].elements["txtDescription"];
                
            document.getElementById("msg1").innerHTML="";
            document.getElementById("msg2").innerHTML="";
            document.getElementById("msg3").innerHTML="";
            document.getElementById("msg4").innerHTML="";

          if(txt1.value=="")
                {
                    flag=false;
                    document.getElementById("msg1").innerHTML="Event Name Empty";
                }
          if(txt2.value=="")
                {
                    flag=false;
                    document.getElementById("msg2").innerHTML="Date is Empty";
                }      
          if(txt3.value=="")
                {
                    flag=false;
                    document.getElementById("msg3").innerHTML="Venue is Empty";
                }
          if(txt4.value=="")
                {
                    flag=false;
                    document.getElementById("msg4").innerHTML="Description Empty";
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
				<h1 class="title"><a href="#">Update Events!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                      <form action="UpdateEvents.jsp" name="f1" method="Post">
                    <%!
                        String nm="";
                        String Date="";
                        String venue="";
                        String cat="";
                        String desc="";
       
                    %>
                    <%
                        DataLayer.DALEvents obj=new DALEvents();
                        int eventid2=Integer.parseInt(request.getParameter("EID"));
                        if(request.getParameter("btnAdd")==null)
                        {
                        

                                    beans.Events j=obj.getEventDetails(eventid2);
                           
                                    nm=j.getEventName();  
                                    Date=j.getDate();
                                    venue=j.getVenue();
                                    cat=j.getCategory(); 
                                    desc=j.getDescription();
                                    
                        }
                        if(request.getParameter("btnAdd")!=null)
                            {   beans.Events k=new Events();
                                k.setEventId(eventid2);
                                k.setEventName(request.getParameter("txtName"));
                                k.setDate(request.getParameter("txtDate"));
                                k.setVenue(request.getParameter("txtVenue"));
                                k.setCategory(request.getParameter("txtCategory"));
                                k.setDescription(request.getParameter("txtDescription"));
                                k.setImageName("1.jpg");
                                if(request.getParameter("isOpen")!=null)
                                {
                                    k.setIsOpened(Byte.parseByte("1"));
                                }
                                else{
                                    k.setIsOpened(Byte.parseByte("0"));
                                }

                                obj.updateEvent(k);
                                response.sendRedirect("NewEventList.jsp");
                            }
                        
                    %>
                    
                    <input type="hidden" name="EID" value="<%=request.getParameter("EID")%>">
                    
                    <table class="TB">
                            <tr>
                                <td>*Event Name:</td>
                                <td><input type="text" name="txtName" maxlength="80" value="<%=nm%>"></td>
                                <td><span id="msg1"></span></td>
                            </tr>
                            <tr>    
                                <td>*Date:</td>
                                <td><input type="text" name="txtDate" placeholder="mm/dd/yyyy" maxlength="10" value="<%=Date%>"><font color="red"></font></td>
                                <td><span id="msg2"></span></td>
                            </tr>
                            <tr>
                                <td>*Venue:</td>
                                <td><input type="text" name="txtVenue" maxlength="50"value="<%=venue%>"></td>
                                <td><span id="msg3"></span></td>
                            </tr>
                            <tr>
                                <td>Category:</td>
                                <td><select name="txtCategory" style="width:143px" value="<%=cat%>">
                                        <option>Placement</option>
                                        <option>Seminar</option>
                                        <option>Sports</option>
                                        <option>Function</option>
                                    </select></td>
                            </tr>
                        <tr>
                            <td>*Description:</td>
                            <td><textarea  cols="30" rows="10" name="txtDescription" value="<%=desc%>"></textarea></td>
                            <td><span id="msg4"></span></td>
                        </tr>
                        <tr>    
                            <td></td>
                            <td><input type="checkbox" name="isOpen">Open Event</td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="btnAdd" onclick="return validateData()" style="color: green; border-radius: 10px;">
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
