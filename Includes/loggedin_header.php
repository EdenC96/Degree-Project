<?php
//session_start();
?>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Below are links to all the stylesheets  -->
  <link rel="stylesheet" type="text/css" href="./Stylesheets/mainstyle.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/sidenav.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/mainnav.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/modelforms.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/pageforms.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/mainbanner.css">
  <link rel="stylesheet" type="text/css" href="./Stylesheets/mainlist.css">  
<!--Icon Below can also be a PNG File format-->
  <link rel="icon" href="Resources/icon.png" />
  <title>Mesmerizing Movie</title>
 </head>
 <body>

<!-- Below is the HTML for the pop-out side navigation bar that displays user information --> 
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<!-- User Avatar img to go in here to appear at top of sidenav  -->

<!----------->
<?php

$profile= $_COOKIE['profile'];
if($profile == "yes"){
echo("<a href='profile.php'>Your<br>Profile</a>");
}
else{
echo("<a href='profile.php'>Create<br>Profile</a>");
}

?>  
  
  <a href="logout.php">Log Out</a>
  <hr>
  <a href="createpost.php?Type=dispost">Post<br>Discussion</a>
  <a href="createpost.php?Type=review">Post<br>Review</a>
  
  <!-- Allows for potential addition!-->
  <!--<a href="review.php">Your<br>Reviews</a>-->
<?php

//include_once "Includes/dbh.php";

//if the cookie is set then check to see if the user is an admin and display 
//admin area button if they are!
//Uncomment the code below to enable admin area access (admin.php required!)
//-----------------------------------------------------------------------------
//if (isset($_COOKIE['user'])) {
//$userid = $_COOKIE['user'];
//$admindql = "Select * FROM users WHERE UserID = '$userid'";
 

    //if ($adminquery = mysqli_query($connect, $admindql)) {
    
       // while($row = mysqli_fetch_assoc($adminquery)) {
        //$isAdmin = $row['Admin'];
        
           // if ($isAdmin == 1) {
           // echo("<hr>");
            //echo("<a href='admin.php'>Admin<br>Area</a>");
            //}
            //else {
            //}
        //}
    //}
//}
//else {
//}

?>  

</div>

<!-- Below is the main navigation bar that runs horrizontally accross the top of the page! -->
 <ul>
  <li class="mainnav_li"><a href="filmlist.php">Films</a></li>
  <li class="mainnav_li"><a href="reviews.php">Reviews</a></li>
  <li class="mainnav_li"><a href="discussion.php">Discussions</a></li>
  <li class="mainnav_li"><a href="index.php">Home</a></li>
  <li></li>
  <li></li>
  <span class="listbtn" style="font-size:30px;cursor:pointer;color: white;" onclick="openNav()">&#9776;</span>
</ul>
<!-- Pop-up Box for Login form! -->
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="login.php" method="POST">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Box">&times;</span>
      
    </div>

    <div class="container">
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required>

      <label for="upass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="upass" required>
      
      <input type="hidden" name="loginmodal" value="1">
        
      <button type="submit">Login</button>
      
    </div>

    
  </form>
</div>

<!-- Pop-up Box for Sign Up form! -->
<div id="id02" class="modal">
  
  <form class="modal-content animate" action="signup.php" method="POST">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Box">&times;</span>
    </div>
    
    <div class="container">
    
      <label for="fname"><b>First Name</b></label>
      <input type="text" placeholder="First Name" name="fname" required>
      
      <label for="sname"><b>Surname</b></label>
      <input type="text" placeholder="Surname" name="sname" required>
    
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required>
      
      <label for="dob"><b>Date of Birth</b></label><br>
      <input type="date" placeholder="Enter Date" name="dob" required><br>

      <label for="upass"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="upass" required>
      
      <label for="upass"><b>Confirm Password</b></label>
      <input type="password" placeholder="Re-Enter Password" name="confirmupass" required>
      <input type='hidden' value='1' name='meta'>
        
      <button type="submit">Sign Up!</button>
      
    </div>

    
  </form>
</div>