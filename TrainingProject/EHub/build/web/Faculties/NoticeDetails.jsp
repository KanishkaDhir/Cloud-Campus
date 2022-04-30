<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Notice Details</title>
<style>
        .tb
             {
                 text-align: center;
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
                 text-align: center;
                 border-right:  1px solid black; 
                    border-bottom: 1px solid black;
             }
             .left
             {
                 text-align: center;
                 color: #890208;
                 background-color: pink;
             }
             .right
             {
                 text-align: center;
                 color: black;
                 background-color: violet;
             }
        </style>
    
        <script type="text/javascript">
           function deleteConfirmation()
           {
               var x = confirm("Do you want to Delete?");
               return x;
           }
           function editConfirmation()
           {
               var x = confirm("Do you want to Edit?");
               return x;
           }
           function hideConfirmation()
           {
               var x = confirm("Do you want to Hide?");
               return x;
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
        <%@include file="Options.html"%>								</li>
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
                  
                 int noticeid2=Integer.parseInt(request.getParameter("NID"));
                  DataLayer.DALNotices objDal2=new DALNotices();
             
                  
                  
                  

                 
                  beans.Notice A2= objDal2.getNoticeDetails(noticeid2);
              %>
        
                <table class="tb">

                   <tr><td class="left">Subject:</td>
                       <td class="right"><%=A2.getSubject()%></td>
                   </tr>

                   <tr><td class="left">Date:</td>
                       <td class="right"><%=A2.getDate()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Description:</td>
                       <td class="right"><%=A2.getDescription()%></td>
                   </tr>
                   
                    
                    <tr>
                       <td class="left">Faculty:</td>
                       <td class="right"><%=A2.getFacultyName()%></td>
                    
                    </tr>
        

            
               </table>
                       <br>
                       <input type="hidden" name="NID" value="<%=request.getParameter("NID")%>" >
                       <input type="submit" style="  margin-top: 10px; border-radius: 10px; cursor: pointer; border: 1px solid tomato;background-color: #890208;  color: white" name="btnDelete" value="Delete" onclick="return deleteConfirmation()">
                       
        <input type="submit" value="Edit" name="btnEdit" onclick='return editConfirmation()'style="  margin-top: 10px; border-radius: 10px; cursor: pointer; border: 1px solid tomato;background-color: #890208;  color: white">
        <input type="submit" onclick='return hideConfirmation()' name="btnHide" value="Hide" style="  margin-top: 10px; border-radius: 10px; cursor: pointer; border: 1px solid tomato;background-color: #890208;  color: white">    
          
            
            <%
                if(request.getParameter("btnDelete")!=null)
                {
                    objDal2.deleteNotice(noticeid2);
                    response.sendRedirect("NewNoticeList.jsp");
                }
                
                if(request.getParameter("btnEdit")!=null)
                {
                   noticeid2=Integer.parseInt(request.getParameter("NID"));
                    response.sendRedirect("UpdateNotice.jsp?EID="+noticeid2);
                }
                
                if(request.getParameter("btnHide")!=null)
                {
                    objDal2.hideNotice(noticeid2);
                    response.sendRedirect("NewNoticeList.jsp");
                }
                
                
            %>
            
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
