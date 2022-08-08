<%-- 
    Document   : Reg_Customer
    Created on : 4 Apr, 2019, 1:18:38 AM
    Author     : anoop
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.bank.dao.AccountDao"%>
<%@page import="com.bank.dto.Account"%>
<%@page import="java.util.ArrayList"%>

<jsp:useBean id="u" class="com.bank.dto.Account" scope="request"></jsp:useBean>
<jsp:setProperty name="u" property="*"></jsp:setProperty>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
  margin-top: 30px;
}

#login-nav input {
  margin-bottom: 15px;
}

.navbar-brand {
  margin-top: -10px;
}
        </style>
        
        <script>
            $(document).ready(function(){
//Handles menu drop down
  $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
  });
});
    </script>
    
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
       <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    
    
    <body>
        
        <div class="container">
   <div class="row">
     
         <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
              
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li><a href="home.jsp">Home</a></li>
                
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">Banking <b class="caret"></b></a>
                     <ul class="dropdown-menu">
                        <li><a href="credit.jsp">Credit</a></li>
                        <li><a href="debit.jsp">Debit</a></li>
                        <li><a href="miniStatement.jsp">Mini Statement</a></li>
                        <li><a href="transfer.jsp">Money Transfer</a></li>
                         <li class="active"><a href="balance.jsp">Balance Enquiry</a></li>
                        <li class="divider"></li>
                        <li><a href="newAccount.jsp">Create New Account</a></li>
                     </ul>
                      <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu <b class="caret"></b></a>
                     <ul class="dropdown-menu">
                        <li><a href="updateAccount.jsp">Change Account Detail</a></li>
                        <li><a href="accountDetail.jsp">Account Detail</a></li>
                     </ul>
                  </li>
                       <li><a href="about.jsp">About Us</a></li>
                  </li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                    <li class="divider"></li>
                  <li class="dropdown">
                      <a href="signup.jsp">Sign up <b class="caret"></b></a>
                  <li class="dropdown">
                     <a href="index.jsp">Sign in <b class="caret"></b></a>
                     
                  </li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </nav>
     
  

</script>
</head>
<body>
    <div class="container">
    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
           
                <div class="signup-content">
                    
                    
    
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2><b> Balance Enquiry</b></h2>
                    </div>
                </div>
            </div>
            
            
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Account Number</th>
                        <th>Ammount</th>
                        
                                               
                        


                    </tr>
                </thead>
                <tbody>
                    <% try {
                         long accountNo = Long.parseLong(request.getParameter("accountNo"));
                            AccountDao dao = new AccountDao();
                           Account ac = dao.getBalance(accountNo);

                    %>

                    <tr>
                        <td><%=ac.getName() %></td>
                        <td><%=ac.getAccountNo()%></td>
                        <td><%=ac.getAmmount()  %></td>
                        
                        
                        <%}
                        catch(Exception e){

}%>
  
                </tbody>
            </table>
           </div>
            </div>
        </section>
             </div>
        </div>
    </div>
          </div>

</div>
    </body>
</html>
