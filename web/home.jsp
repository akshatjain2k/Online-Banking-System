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
                  <li class="active"><a href="home.jsp">Home</a></li>
                 
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
                    
                    <p>The banking industry handles finances in a country including cash and credit. Banks are the institutional bodies that accept deposits and grant credit to the entities and play a major role in maintaining the economic stature of a country. Given their importance in the economy, banks are kept under strict regulation in most of the countries. In India, the Reserve Bank of India (RBI) is the apex banking institution that regulates the monetary policy in the country.

                        <img src="images/bank3.jpg" width="1000px">
Banking Services in India

Classification of Banks in India
Banks are classified into classified into four categories –

Commercial Banks
Small Finance Banks
Payments Banks
Co-operative Banks
Commercial Banks can be further classified into public sector banks, private sector banks, foreign banks and Regional Rural Banks (RRB). On the other hand, cooperative banks are classified into urban and rural. Apart from these, a fairly new addition to the structure is payments bank.
<div class="form-group">
     <input type="button" name="submit" id="submit" class="form-submit" onclick="window.location.href='newAccount.jsp'" value="Get Started"/>
                          
                        </div>
Banking Classification in India

Commercial Banks
Commercial Banks are regulated under the Banking Regulation Act, 1949 and their business model is designed to make profit. Their primary function is to accept deposits and grant loans to the general public, corporate and government. Commercial banks can be divided into-

Public Sector Banks	Private Sector Banks
Foreign Banks	Regional Rural Banks
Public Sector Banks
These are the nationalised banks and account for more than 75 per cent of the total banking business in the country. Majority of stakes in these banks are held by the government. In terms of volume, SBI is the largest public sector bank in India and after its merger with its 5 associate banks (as on 1st April 2017) it has got a position among the top 50 banks of the world.

     <img src="images/bank22_1.jpg" width="1000px">

There are a total of 20 nationalised banks in the country namely below:

State Bank of India
sbi logo

Bank of India
boi logo

Allahabad Bank
allahabad logo

Bank of Maharashtra
bom logo

Canara Bank
canara logo

Indian Overseas Bank
iob logo

Punjab & Sind Bank
Punjab and Sind Bank	Punjab National Bank
pnb logo

Syndicate Bank
syndicate logo

Corporation Bank
corporation logo

Andhra Bank
andhra logo

UCO Bank
uco logo

Bank of Baroda
bob logo

Union Bank of India
Union Bank of India	United Bank of India
united logo

Vijaya Bank
vijaya logo

Dena Bank
dena logo

Indian Bank
indian logo

Oriental Bank of Commerce
oriental logo

Central Bank of India
central logo

Private Sector Banks
These include banks in which major stake or equity is held by private shareholders. All the banking rules and regulations laid down by the RBI will be applicable on private sector banks as well. Given below is the list of private-sector banks in India-

HDFC Bank
hdfc logo	ICICI Bank
icici logo	Axis Bank
axis logo
YES Bank
yes logo	IndusInd Bank
indusind icon	Kotak Mahindra Bankkotak logo
DCB Bank
DCB Bank	Bandhan Bank
bandhan logo	IDFC Bank
idfc logo
City Union Bank
City Union Bank	Tamilnad Mercantile Bank
tmb logo	Nainital Bank
Nainital bank
Catholic Syrian Bank
Catholic Syrian Bank	Federal Bank
federal logo	Jammu and Kashmir Bank
jk logo
Karnataka Bank
karnataka logo	Dhanlaxmi Bank
dhanlaxmi logo	South Indian Bank
south logo
Lakshmi Vilas BankLakshmi Vilas Bank	RBL Bank
rbl logo	Karur Vysya Bank
kvb logo
IDBI Bank
idbi logo  

Foreign Banks
A foreign bank is one that has its headquarters in a foreign country but operates in India as a private entity. These banks are under the obligation to follow the regulations of its home country as well as the country in which they are operating. Given below is the list of foreign banks operating in India –

List of Foreign Banks in India
Australia and New Zealand Banking Group Ltd.	National Australia Bank	Westpac Banking Corporation
Bank of Bahrain & Kuwait BSC	AB Bank Ltd.	Sonali Bank Ltd.
Bank of Nova Scotia	Industrial & Commercial Bank of China Ltd.	BNP Paribas
Credit Agricole Corporate & Investment Bank	Societe Generale	Deutsche Bank
HSBC Bank	PT Bank Maybank Indonesia TBK	Mizuho Bank Ltd.
Sumitomo Mitsui Banking Corporation	MUFG Bank, Ltd.	Cooperatieve Rabobank U.A.
Doha Bank Q.P.S.C	Qatar National Bank (Q.P.S.C.)	JSC VTB Bank
Sberbank	United Overseas Bank Ltd	FirstRand Bank Ltd
Shinhan Bank	Woori Bank	KEB Hana Bank
Industrial Bank of Korea	Bank of Ceylon	Credit Suisse A.G
CTBC Bank Co., Ltd.	Krung Thai Bank Public Co. Ltd.	Abu Dhabi Commercial Bank Ltd.
Mashreq Bank PSC	First Abu Dhabi Bank PJSC	Emirates Bank NBD
Barclays Bank Plc.	Standard Chartered Bank	The Royal Bank of Scotland plc
American Express Banking Corporation	Bank of America	Citibank
J.P. Morgan Chase Bank N.A	Kookmin Bank	SBM Bank (India) Limited
DBS Bank India Limited
  <img src="images/bank4.jpg" width="1000px">
Regional Rural Banks
These are also scheduled commercial banks but they are established with the main objective of providing credit to weaker sections of the society like agricultural labourers, marginal farmers and small enterprises. They usually operate at regional levels in different states of India and may have branches in selected urban areas as well. Other important functions carried out by RRBs include-

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
