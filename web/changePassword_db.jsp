

<%@page import="com.bank.dto.User"%>
<%@page import="com.bank.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%
            String email = request.getParameter("email");

            String oldPassword = request.getParameter("oldPassword");

            String newPassword = request.getParameter("newPassword");

            UserDao obj = new UserDao();
            boolean i = obj.changePassword(email, oldPassword, newPassword);
            if (i) {
                  %>
    <center><h4>Password Changed Successfully</h4></center>
    <%
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
               
            } else {
                  %>
    <center><h4>Email And Password is Wrong</h4></center>
    <%
                RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
                rd.forward(request, response);
               
            }

        %>
    </body>
</html>
