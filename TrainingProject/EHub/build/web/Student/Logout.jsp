
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Contents.css" rel="stylesheet">
        <title>Ehub-Logout</title>
    </head>
    <body>
       
                
        <form action="Get">
            
            
        <%
            
            {
            session.removeAttribute("LoggedRegId");
            response.sendRedirect("../Login.jsp");
            }
        %>
        </form>
       
        </body>
</html>
