<%-- 
    Document   : newAccount_db
    Created on : Mar 30, 2020, 8:58:01 PM
    Author     : ABHISHEK JAIN
--%>
<%@page import="com.bank.dao.AccountDao"%>
<jsp:useBean id="obj" class="com.bank.dto.Account" scope="request"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
   
 long accountNo= Long.parseLong(request.getParameter("accountNo"));
        AccountDao dao=new AccountDao();
           boolean i = dao. updateAccount(obj);
       if(i){
              %>
    <center><h4>Updated Successfully</h4></center>
    <%
    RequestDispatcher rd = request.getRequestDispatcher("updateAccount.jsp");
            rd.include(request, response);
       }
       else{
        RequestDispatcher rd = request.getRequestDispatcher("updateAccount.jsp");
            rd.include(request, response);
                %>
    <center><h4>Account Number is Wrong</h4></center>
    <%
       }
 %>
    </body>
</html>
