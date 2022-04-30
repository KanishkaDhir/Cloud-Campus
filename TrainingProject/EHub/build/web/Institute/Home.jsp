
<%@page import="DataLayer.DALRegistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Hub-Home</title>
        <link href="Contents.css" rel="stylesheet">
         <style>                 
            .tb
             {
                 border:1px solid black;
                 width: 500px;
                 
             }
             .tb th
             {
                 border-right:  1px solid black;
                 border-bottom: 1px solid black; 
             }
             .tb td
             {
                 
                 border-right:  1px solid black; 
                    border-bottom: 1px solid black;
             }
             .left
             {
                 color: white;
                 background-color: #890208;
             }
             .right
             {
                 color: black;
                 background-color: white;
             }
        </style>

       
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
				<h1 class="title"><a href="#">Home</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
      <form action="Home.jsp" name="frmProfile" method="Post">
               <%
                    DataLayer.DALRegistration objDal2=new DALRegistration();
                   int regid2=Integer.parseInt(session.getAttribute("LoggedRegId").toString());
                   beans.Registration R = objDal2.getData(regid2);
                   
        
                   
               %>
               
               <table class="tb">
                   <tr><td class="left">Institute Name:</td>
                       <td class="right"><%=R.getInstituteName()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Address:</td>
                       <td class="right"><%=R.getAddress()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">City</td>
                       <td class="right"><%=R.getCity()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">EMail Id:</td>
                       <td class="right"><%=R.getEmailID()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Code</td>
                       <td class="right"><%=R.getCode()%></td>
                   </tr>
                   
                      
                   
               </table><br>
                   <a href="UpdateProfile.jsp">Update Profile--></a>
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
