
<%@page import="DataLayer.DALNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Notice Details</title>
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
                 background-color:#890208;
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
				<h1 class="title"><a href="#">Notice Details</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
        
            
        <form action="NoticeDetails.jsp" name="f1" method="Post">

            <%
            DataLayer.DALNotices objdal2=new DALNotices();
            int noticeid=Integer.parseInt(request.getParameter("NID"));
            
            
            
            beans.Notice R=objdal2.getNoticeDetails(noticeid);
            
            

            
            %>
        
            <table class="tb">

                   <tr><td class="left">Subject:</td>
                       <td class="right"><%=R.getSubject()%></td>
                   </tr>

                   <tr><td class="left">Date:</td>
                       <td class="right"><%=R.getDate()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Description:</td>
                       <td class="right"><%=R.getDescription()%></td>
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
