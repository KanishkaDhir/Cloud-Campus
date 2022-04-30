
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Test Details</title>
                          <style>
             .tb
             {
                 border:1px solid black;
                  width: 600px;
             }
             .tb th td
             {
                 border-right:  1px solid black;
                 border-bottom: 1px solid black; 
             }

             .tb td a
             {
                 
             }   

             .THeading
             {
                 background-color:  #8C0209;
                 color: white;
                 text-align: center;
             }
             .TData
             {
                 
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
				<h1 class="title"><a href="#">Test History</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
        
            
<%
    int testid=Integer.parseInt(request.getParameter("TID"));
    int studentid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
    DataLayer.DALTests objDal2=new DALTests();
    ArrayList<beans.Questions> AP=objDal2.giveAnswers(testid,studentid);
        
    
    
    
%>

            <table class="tb">

                              
                <tr>
                    <th class="THeading">Question Text</th>
                    <th class="THeading">Option Chosen</th>
                    
                </tr>
                      
    <%
    if(AP.size()>0)
    {
        for(beans.Questions q:AP)
        {
    %>                  
                      
                <tr>
                    <td class="TData"><%=q.getQuestionText()%></td>
                    <td class="TData"><%=q.getOptionText()%></td>
                </tr>
            
        
    <%
    }
    }
    else{
    %>   
    <tr><td>No Question Attempted.</td></tr>
    <%}%>
               </table>    
            
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
