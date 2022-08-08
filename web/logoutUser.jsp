<%-- 
    Document   : logoutUser
    Created on : Apr 4, 2020, 3:16:22 PM
    Author     : ABHISHEK JAIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
