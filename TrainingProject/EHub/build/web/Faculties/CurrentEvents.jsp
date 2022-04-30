
<%@page import="java.util.ArrayList"%>
<%@page import="DataLayer.DALEvents"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EHub-Current Events</title>
                <link href="Contents.css" rel="stylesheet">


<style type="text/css">
        
            .MyLi
            {
                border: 1px solid white;
                list-style-type: none;
                
            }
            
        </style>
        
              <%
                  
                 int regid1=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALEvents objDal1=new DALEvents();
             
                  
                  
                  ArrayList<beans.Events> A1= objDal1.getCurrentEvents(regid1);
              %>
              
    <marquee id='scroll_news1' direction="up" scrollamount="5" top="1" height="150" ></marquee>
                     

                    <div>
                <ul>
        
                               <% for(beans.Events C1 : A1)
                {

                    %>

                        
                        <li>
                           <a href="CurrentEvents1.jsp?ID=<%=C1.getEventId()%>"> <ul>
                                <li class="MyLi"> <font  color="#890208" size="4%"><%=C1.getEventName()%></font> </li>
                                 <font color="red">
                                 <li class="MyLi"> <%=C1.getDate()%> </li>

                                 <li class="MyLi">  <%=C1.getFacultyName()%> </li>
                                 </font>
                             </ul></a>
                         </li>
                                <%
                }
                    %>
               </ul>
               </div>
                </marquee>