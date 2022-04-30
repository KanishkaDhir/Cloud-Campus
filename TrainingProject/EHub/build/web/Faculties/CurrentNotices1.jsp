
<%@page import="DataLayer.DALNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Notices</title>
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
				<h1 class="title"><a href="#">Notices</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                                        <%!
                                            String sub;
                                            String Date;
                                            String Desc;
                                            String nm;
                                            int noticeid;
                                        %>
                                        <% if(request.getParameter("ID")!=null)
                                        {
                                            noticeid=Integer.parseInt(request.getParameter("ID").toString());
                                            DataLayer.DALNotices objDal=new DALNotices();
                                            beans.Notice e=objDal.getNoticeDetails(noticeid);
                                            sub=e.getSubject();
                                            Date=e.getDate();
                                            Desc=e.getDescription();
                                            nm=e.getFacultyName();
                                        }
                                                                       
                            %>     
                            <ul style="background-color: #890208; border: 2px solid #000000;">
                                        <li style="font-size: 12pt; color: white; list-style-type: none;"> Notice ID: <%=noticeid%></li>
                                        <li style="color: burlywood;"><u><b>Subject:</u></b>   <%=sub%></li>
                                        <li style="color: burlywood;"><u><b>Date:   </u></b>   <%=Date%></li>
                                        <li style="color: burlywood;"><u><b>Description:</u></b>   <%=Desc %></li>
                                        <li style="color: burlywood;"><u><b>Faculty Name: </u></b> <%=nm%></li>
                                    </ul>
                                    
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
                                                <h2>Events</h2>
                            <%@include file="CurrentEvents.jsp"%>
         	
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
