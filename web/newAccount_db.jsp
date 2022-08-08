<%-- 
    Document   : newAccount_db
    Created on : Mar 30, 2020, 8:58:01 PM
    Author     : ABHISHEK JAIN
--%>
<%@page import="com.bank.dao.AccountDao"%>
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
           String fname=request.getParameter("fname");
           String email=request.getParameter("email");
           String panNo=request.getParameter("panNo");
           String aadharNo=request.getParameter("aadharNo");
           String address=request.getParameter("address");
           long accountNo=Long.parseLong(request.getParameter("accountNo"));
           long ammount=Long.parseLong(request.getParameter("ammount"));

           
           AccountDao obj=new AccountDao();
          boolean i= obj.addAccount(name, fname, email, panNo, aadharNo, address, accountNo, ammount);
       if(i){
              %>
    <center><h4>New Account Created Successfully</h4></center>
    <%
    RequestDispatcher rd = request.getRequestDispatcher("newAccount.jsp");
            rd.include(request, response);
       }
       else{
        RequestDispatcher rd = request.getRequestDispatcher("newAccount.jsp");
            rd.include(request, response);
       }
 %>
    </body>
</html>
