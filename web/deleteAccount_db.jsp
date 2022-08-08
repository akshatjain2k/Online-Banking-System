

<%@page import="com.bank.dao.AccountDao"%>
<jsp:useBean id="obj" class="com.bank.dto.Account" scope="request"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
      
      <% 
          
        long accountNo=Long.parseLong(request.getParameter("accountNo"));
        AccountDao dao=new AccountDao();
             boolean i= dao.deleteAccount(accountNo);
             if(i){
                  %>
    <center><h4>Account Deleted Successfully</h4></center>
    <%
                       response.sendRedirect("deleteAccount.jsp");
             
             }
        %>
     
    </body>
</html>
