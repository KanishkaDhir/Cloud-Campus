
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Current Events</title>
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
				<h1 class="title"><a href="#">Events</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                                        <%!
                                            String EName;
                                            String Date;
                                            String venue;

                                            String cat;
                                            String desc;
                                            String fname;
                                        %>
                                        <% if(request.getParameter("ID")!=null)
                                        {
                                            int eventid=Integer.parseInt(request.getParameter("ID").toString());
                                            DataLayer.DALEvents objDal1=new DALEvents();
                                            beans.Events e=objDal1.getEventDetails(eventid);
                                            EName=e.getEventName();
                                            Date=e.getDate();
                                            venue=e.getVenue();
                                            cat=e.getCategory();
                                            desc=e.getDescription();
                                            fname=e.getFacultyName();
                                        }
                                                                       
                            %>     
                                    <ul style="background-color: #890208; border: 2px solid #000000;">
                                        <li style="font-size: 12pt; color: white; list-style-type: none;">  <%=EName%></li>
                                        <li style="color: burlywood;">Date:  <%=Date%></li>
                                        <li style="color: burlywood;">Venue:  <%=venue%></li>
                                        <li style="color: burlywood;">Category:  <%=cat%></li>
                                        <li style="color: burlywood;">Description:  <%=desc%></li>
                                        <li style="color: burlywood;">Faculty Name:  <%=fname%></li>
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
                                <h2>Notice Board</h2>
                    <%@include file="CurrentNotices.jsp"%>
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

        
        <%@ include file="Footer.html"%>

    </body>
</html>
