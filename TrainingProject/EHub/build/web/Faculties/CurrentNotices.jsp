
<%@page import="DataLayer.DALNotices"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style type="text/css">
        
            .MyLi
            {
                border: 1px solid white;
                
                list-style-type: none;
            }
            
        </style>
        
              <%
                  
                 int regid=Integer.parseInt(session.getAttribute("LoggedFacultyId").toString());
                  DataLayer.DALNotices objDal=new DALNotices();
             
                  ArrayList<beans.Notice> A= objDal.getCurrentNotices(regid);
              %>
              
                <marquee id='scroll_news1' direction="up" scrollamount="5" top="1" height="150" 
                         >

                    <div>
                <ul>
        
                <% 
                  for(beans.Notice C : A)
                {
                %>
                        
                        <li>
                            <ul><a href="CurrentNotices1.jsp?ID=<%=C.getNoticeId()%>">
                                <li class="MyLi"> <font color="#890208" size="4%"><%=C.getSubject()%></font> </li>
                                 <font color="red">
                                 <li class="MyLi"> <%=C.getDate()%> </li>

                                 <li class="MyLi">  <%=C.getFacultyName()%> </li>
                                 </font>
                            </ul></a>
                         </li>
                                <%
                }
                    %>
               </ul>
               </div>
                </marquee>