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
    <link rel="stylesheet" href="css/style_1.css">
    
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
                        <li><a href="debit.jsp">Debit</a></li>
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
                        <li><a href="logoutUser.jsp">Logout User</a></li>
                     </ul>
                  </li>
                     <li class="active"><a href="about.jsp">About Us</a></li>
                  </li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
                    <li class="divider"></li>
                  <li class="dropdown">
                      <a href="signup.jsp">Sign up </a>
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
                    
                    <p>
Providing banking and financial services to rural and semi-urban areas
Government operations like disbursement of wages of MGNREGA workers, distribution of pensions, etc.
Para-Banking facilities like debit cards, credit cards and locker facilities
Small Finance Banks
This is a niche banking segment in the country and is aimed to provide financial inclusion to sections of the society that are not served by other banks. The main customers of small finance banks include micro industries, small and marginal farmers, unorganized sector entities and small business units. These are licensed under Section 22 of the Banking Regulation Act, 1949 and are governed by the provisions of RBI Act, 1934 and FEMA.

Au Small Finance Bank Ltd.
AU Small Finance Bank	Capital Small Finance Bank Ltd.
Capital Small Finance Bank
Fincare Small Finance Bank Ltd.
fincare logo	Equitas Small Finance Bank Ltd.
Equitas Small Finance Bank
ESAF Small Finance Bank Ltd.
esaf logo	Suryoday Small Finance Bank Ltd.
suryoday logo
Ujjivan Small Finance Bank Ltd.
ujjivan icon	Utkarsh Small Finance Bank Ltd.
utkarsh logo
North East Small Finance Bank Ltd.
North East SFB	Jana Small Finance Bank Ltd.
jana logo
                    <h1>Customer Care: 1883 4979 7166</h1>
Payments Bank
This is a relatively new model of bank in the Indian Banking industry. It was conceptualised by the RBI and is allowed to accept a restricted deposit. The amount is currently limited to Rs. 1 Lakh per customer. They also offer services like ATM cards, debit cards, net-banking and mobile-banking.

Co-operative Banks
Co-operative banks are registered under the Cooperative Societies Act, 1912 and they are run by an elected managing committee. These work on no-profit no-loss basis and mainly serve entrepreneurs, small businesses, industries and self-employment in urban areas. In rural areas, they mainly finance agriculture-based activities like farming, livestock and hatcheries.

Urban Co-operative Banks	State Co-operative Banks
Urban Co-operative Banks
Urban Co-operative Banks refer to the primary cooperative banks located in urban and semi-urban areas. These banks essentially lent to small borrowers and businesses centered around communities, localities work place groups.

According to the RBI, on 31st March, 2003 there were 2,104 Urban Co-operative Banks of which 56 were scheduled banks. About 79% of these are located in five states, – Andhra Pradesh, Gujarat, Karnataka, Maharashtra and Tamil Nadu.

State Co-operative Banks
A State Cooperative Bank is a federation of the central cooperative bank which acts as custodian of the cooperative banking structure in the State.

Banks can also be classified on the basis of Scheduled and Non-Scheduled Banks. It is essential for every individual to check if they are holding their savings or deposit account with a Scheduled Bank or Non-Scheduled Bank. Scheduled Banks are also covered under the depositor insurance program of Deposit Insurance and Credit Guarantee Corporation (DICGC), which is beneficial for all the account holders holding a savings and fixed / recurring deposit account. Under DICGC, bank deposits of up to Rs 1 lakh, including the fixed, savings, current and recurring deposits, per depositor per bank in the event of bank failure are insured.

</p>
                    
                     </div>
        </section>
             </div>
        </div>
       
   </div>
</div>
    </body>
</html>
