<%-- 
    Document   : newAccount_db
    Created on : Mar 30, 2020, 8:58:01 PM
    Author     : ABHISHEK JAIN
--%>

<%@page import="com.bank.dto.Account"%>
<%@page import="com.bank.dao.AccountDao"%>
<jsp:useBean id="u" class="com.bank.dto.Account" scope="request"></jsp:useBean>
<jsp:setProperty name="u" property="*"></jsp:setProperty>
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
//           long accountNo=Long.parseLong(request.getParameter("accountNo"));
           long ammount=Long.parseLong(request.getParameter("ammount"));

            //  out.print(u.getAmmount());
           
           AccountDao obj=new AccountDao();
          boolean i= obj.credit(u, ammount);
       if(i){
    %>
    <center><h4>Credited Successfully</h4></center>
    <%
    RequestDispatcher rd = request.getRequestDispatcher("credit.jsp");
            rd.include(request, response);
       }
       else{
            %>
    <center><h4>Account Number is not present</h4></center>
    <%
        RequestDispatcher rd = request.getRequestDispatcher("credit.jsp");
            rd.include(request, response);
       }
 %>
    </body>
</html>
