
<%@page import="com.bank.dao.UserDao"%>

<jsp:useBean id="obj" class="com.bank.dto.User" scope="page"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
    

    <%
        
        UserDao reg = new UserDao();
        boolean b = reg.loginUser(obj);
        if (b) { 
            session.setAttribute("user",obj.getId());
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
            
        } else {
             RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
                  %>
    <center><h4>Email And Password is Wrong</h4></center>
    <%
        }
            
           
       
       
        
    %>
</body>
</html>
