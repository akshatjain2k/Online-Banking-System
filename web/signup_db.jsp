<%-- 
    Document   : admin_add_brand_db
    Created on : 13 Apr, 2019, 1:16:18 PM
    Author     : Dell
--%>

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
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           UserDao obj=new UserDao();
          boolean i= obj.addUser(name, email, password);
       if(i){
              %>
    <center><h4>Signup Successfully</h4></center>
    <%
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
       }
       else{
        RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.include(request, response);
       }
 %>
    </body>
</html>
