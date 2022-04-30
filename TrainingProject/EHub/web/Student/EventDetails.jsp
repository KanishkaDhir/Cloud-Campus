
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Event Details</title>
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
				<h1 class="title"><a href="#">Event Details</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
        
            
        <form action="EventDetails.jsp" name="f1" method="Post">

            <input type="hidden" name="EID" value="<%=request.getParameter("EID")%>">
    <%!
        String msg="";
    %>
            
            <%
            DataLayer.DALEvents objdal2=new DALEvents();
            int eventid=Integer.parseInt(request.getParameter("EID"));
            int factid=Integer.parseInt( session.getAttribute("FacultyId").toString() );
            int stid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString() );
            
            
            
            beans.Events R=objdal2.getEventDetails(eventid);
            
            

            
            %>
        
            <table class="tb">

                   <tr><td class="left">Event:</td>
                       <td class="right"><%=R.getEventName()%></td>
                   </tr>

                   <tr><td class="left">Date:</td>
                       <td class="right"><%=R.getDate()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Venue:</td>
                       <td class="right"><%=R.getVenue()%></td>
                   </tr>
                   
                   <tr>
                       <td class="left">Description:</td>
                       <td class="right"><%=R.getDescription()%></td>
                       
                    </tr>
                    
                    <tr>
                       <td class="left">Faculty:</td>
                       <td class="right"><%=R.getFacultyName()%></td>
                    
                    </tr>
            
            
               </table>
                       <%
                        if(factid==R.getRefId() || R.getIsOpened()==1)
                        {
                            if(objdal2.checkRegistration(stid, eventid)==true)
                            {   msg="";
                    %>
                    
                        <input style=" width: 125px; margin-top: 10px; border-radius: 5px; cursor: pointer; border: 1px solid tomato;background-color: #890208;  color: white" type="submit" name="btnRegister" value="Register">
                       
                     <%}    else
                                {
                                    msg="You have already registered for this Event!";
                                }
                        
                        }
                        %>
                      <br>  
                       
                       <font color="red"><%=msg%>   
                     
                     <%   if(request.getParameter("btnRegister")!=null)
                        {
                            
                        
                        
                                objdal2.registerEvent(stid, factid, eventid);
                                response.sendRedirect("RegisterEvent.jsp");
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
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>

                    <%@include file="Footer.html"%>
                    
                      
    </body>
</html>
