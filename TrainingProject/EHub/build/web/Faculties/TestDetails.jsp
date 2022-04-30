
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

                  height: 50px;
             }
             .tb th td
             {
                 border-right:  1px solid black;
                 border-bottom: 1px solid black; 

             }
             .THeading
             {
                 background-color:  #8C0209;
                 color: white;
                 text-align: center;
                 font-size: 15px;
                 font-weight: normal;
             }
             .TData
             {
                 font-size: 13px;
                 text-align: center;
             }
             .tb1
             {
                 border:1px solid black;
                  width: 600px;
                 
             }
             .TData1
             {
                 font-size: 13px;
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
    int studentid=Integer.parseInt(request.getParameter("STUDID"));
    DataLayer.DALTests objDal2=new DALTests();
        beans.Tests t=objDal2.getTestHistory(testid,studentid);
    ArrayList<beans.Questions> AP=objDal2.giveAnswers(testid,studentid);
        
    
    
    
%>

<table class="tb">

                              
                
                    <th class="THeading">Category</th>
                    <th class="THeading">Attempted Questions</th>
                    
                    <th class="THeading">Correct Answers</th>
                    <th class="THeading">Wrong Answers</th>
                    
                </tr>
                      
                      
                      
                <tr>
                    
                    <td class="TData"><%=t.getCategoryName()%></td>
                    <td class="TData"><%=t.getAttemptedQuestions()%></td>
                    <td class="TData"><%=t.getCorrectAnswers()%></td>
                    <td class="TData"><%=t.getWrongAnswers()%></td>
                       
                   </tr>
            
               </table>
<br/>
<br/>
<table class="tb1">

                              
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
                    <td class="TData1"><%=q.getQuestionText()%></td>
                    <td class="TData1"><%=q.getOptionText()%></td>
                </tr>
            
        
    <%
    }
    }
    else{
    %>   
    <tr>No Question Attempted.</tr>
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
