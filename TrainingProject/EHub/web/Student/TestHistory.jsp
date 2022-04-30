
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ehub-Test History</title>
                  <style>
             .tb
             {
                 border:1px solid black;
                  width: 700px;
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
             }
             .TData
             {
                 text-align: center;
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
        
            
        <form action="TestHistory.jsp" name="f1" method="Post">
<%
    int testid=Integer.parseInt(request.getParameter("TID"));
    int studentid=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
    DataLayer.DALTests objDal2=new DALTests();
    beans.Tests t=objDal2.getTestHistory(testid,studentid);

%>

            <table class="tb">

                              
                
                    <th class="THeading">Test Date</th>
                    <th class="THeading">Category</th>
                    <th class="THeading">No. of Questions</th>
                    <th class="THeading">Attempted Questions</th>
                    
                    <th class="THeading">Correct Answers</th>
                    <th class="THeading">Wrong Answers</th>
                    <th class="THeading"></th>
                    
                </tr>
                      
                      
                      
                <tr>
                    <td class="TData"><%=t.getDate()%></td>
                   

                   
                       <td class="TData"><%=t.getCategoryName()%></td>
                   
                   
                   
                   
                       <td class="TData"><%=t.getNOQ()%></td>
                   
                   
                   
                   
                       <td class="TData"><%=t.getAttemptedQuestions()%></td>
                   
                   
                   
                   
                       <td class="TData"><%=t.getCorrectAnswers()%></td>
                   
                   
                   
                   
                       <td class="TData"><%=t.getWrongAnswers()%></td>
                       <td class="TData"><a href="TestDetails.jsp?TID=<%=testid%>">Details</a></td>
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
