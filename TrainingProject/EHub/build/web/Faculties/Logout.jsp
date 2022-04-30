
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Contents.css" rel="stylesheet">
        <title>Ehub-Logout</title>
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
					<h2>Recent Comments</h2>
					<ul>
						<li><a href="#">Free CSS Templates</a> on <a href="#">Aliquam libero</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- start content -->
		<div id="content">
			<div class="flower"></div>
			<div class="post">
				<h1 class="title"><a href="#">Welcome to Our Website!</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                   <form name="f1" action="Logout.jsp" method="Post">
            
            
        <%
            String msg="";
            {
            session.removeAttribute("LoggedFacultyId");
            response.sendRedirect("../Login.jsp");
            msg="User Logout Succesfull";
            }
        %>
User Logged Out Succesful
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
							<h2>Site Search</h2>
							<input type="text" name="s" id="s" size="15" value="" />
						</div>
					</form>
				</li>
				<li>
					<h2>Tags</h2>
					<p class="tag"><a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a></p></li>
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
