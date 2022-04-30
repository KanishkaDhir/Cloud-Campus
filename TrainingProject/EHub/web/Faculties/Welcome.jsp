
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style>
            #WelDiv
            {
                height: 30px;
                width: 800px;
                background-color: greenyellow;
                border-radius: 0px 0px 10px 10px;
                margin: 0 auto;
                color: white;
            }
        </style>
    </head>
    <body>
                <div id="WelDiv">
            Welcome : <%=session.getAttribute("FacultyName").toString() %>
        </div>

    </body>
</html>
