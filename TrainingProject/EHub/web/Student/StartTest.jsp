
<%@page import="beans.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALQuestions"%>
<%@page import="DataLayer.DALTests"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Start Test</title>
    </head>
    <body>        <%@include file="Header.html"%>
        
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
				<h1 class="title"><a href="#">Test Begin</a></h1>
				<div class="entry">
                                    <p>
                                        
                                        <!--Put Page contents in this section -->
                                    <form action="StartTest.jsp" name="f1" method="Post">
                                                           
        <%
            int StudentID=Integer.parseInt(session.getAttribute("LoggedStudentId").toString());
            int TestID=Integer.parseInt(request.getParameter("TID"));
            DataLayer.DALTests objDal2=new DALTests();
            beans.Tests t=objDal2.getTestDetails(TestID);
            
            DataLayer.DALQuestions objdal3=new DALQuestions();
            
            ArrayList<beans.Questions> allQuestions=objdal3.getQuestions(t.getCategoryId(), t.getNOQ());
             int i=1;
             
            if(request.getParameter("btnSubmit")!=null)
            {
                
                 
                
                
                 ArrayList<beans.Questions> b=new ArrayList<Questions>();                    
                beans.Questions attempts;
                for(int m=1;m<=Integer.parseInt(request.getParameter("NOQ"));m++)
                {
               
                    if(request.getParameter("Option"+m)!=null)
                    {
                        attempts=new beans.Questions();
                        attempts.setQuestionId(Integer.parseInt(request.getParameter("Question"+m)));
                        attempts.setOptionId(Integer.parseInt(request.getParameter("Option"+m)));
                            
                       
                        b.add(attempts);
                    }//add in arrayalist b
                }//for loop

                objDal2.addConductedTest(TestID,StudentID,b);
                
                response.sendRedirect("Test.jsp");
                
                
            }//submit button
        %>
        <input type="hidden" name="TID" value="<%=TestID%>">
        <input type="hidden" name="NOQ" value="<%=allQuestions.size()%>">
        
        
        <%
             for(beans.Questions Q : allQuestions)
             {
        %>

            <br/>Q <%=i%>. - <%=Q.getQuestionText()%> <br/><br/>
            <input type="hidden" name="Question<%=i%>" value="<%=Q.getQuestionId()%>">
        
                <%
                 for(beans.Options O : Q.options)
                 {
                 %>
                    
                    <input type="radio" name="Option<%=i%>" value="<%=O.getOptionId()%>"> <%=O.getOptionText() %> <br>
                 
                 <%
                 }
                 %>
        <%
                 i++;
             }
                 %>
                 <br/>
                 <input type="submit" value="Submit" name="btnSubmit">
                 
                 
                 <%
            
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
