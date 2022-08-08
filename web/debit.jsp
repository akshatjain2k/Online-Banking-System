<%-- 
    Document   : home
    Created on : Mar 30, 2020, 2:02:53 PM
    Author     : ABHISHEK JAIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
    </head>
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
                        <li class="active"><a href="debit.jsp">Debit</a></li>
                        <li><a href="miniStatement.jsp">Mini Statement</a></li>
                        <li><a href="transfer.jsp">Money Transfer</a></li>
                         <li><a href="balance.jsp">Balance Enquiry</a></li>
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
                      <a href="signup.jsp">Sign up</a>
                  <li class="dropdown">
                     <a href="index.jsp">Sign in</a>
                     
                  </li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </nav>
     
  
             <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                      <form method="POST" id="signup-form" class="signup-form" action="debit_db.jsp">
                        <h2 class="form-title">Debit Money</h2>
                        
                         <div class="form-group">
                            <input type="text" class="form-input" name="accountNo" id="name" placeholder="Account Number" required/>
                        </div>
                              
                         <div class="form-group">
                            <input type="text" class="form-input" name="ammount" id="name" placeholder="Enter Ammount" required/>
                        </div>
                              
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Debit"/>
                        </div>
                    </form>
                </div>
            </div>
        </section>
             </div>
        </div>
</div>
    </body>
</html>
