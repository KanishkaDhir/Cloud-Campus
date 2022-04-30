<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Students Appeared</title>
                  <style>
             .tb
             {
                 border:1px solid black;
                  width: 500px;
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
        
            
        <form action="StudentsAppeared.jsp" name="f1" method="Post">
<%
    int testid=Integer.parseInt(request.getParameter("TID"));
    DataLayer.DALTests objDal2=new DALTests();
    ArrayList<beans.Tests> AQ=objDal2.getStudentsTestHistory(testid);
        
    
    
    
    
%>

            <table class="tb">

                              
                
                    <th class="THeading">Student Id</th>
                    <th class="THeading">Name</th>
                    <th class="THeading">Date</th>
                    <th class="THeading">NOQ</th>
                    
                    <th class="THeading">Correct Answers</th>
                    <th class="THeading"></th>
                    
                </tr>
                      
    <%
    
    if(AQ.size()==0)
    {
    %>                  
    <tr>
       <td> No student appeared for this test.</td>
    </tr>
    <%
    }
    else{
        for(beans.Tests t:AQ)
        {
    %>
                <tr>
                    <td class="TData"><%=t.getStudentId()%></td>
                    <td class="TData"><%=t.getStudentName()%></td>
                    <td class="TData"><%=t.getDate()%></td>
                    <td class="TData"><%=t.getNOQ()%></td>
                    <td class="TData"><%=t.getCorrectAnswers()%></td>
                    <td class="TData"><a href="TestDetails.jsp?TID=<%=testid%>&STUDID=<%=t.getStudentId()%>">Details</a></td>
                   </tr>
         <%
        }
         
    }
         %>   
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
