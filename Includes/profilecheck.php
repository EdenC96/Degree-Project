<?php
//This page is included in login.php

//The code below checks if the logged in user has an associated profile linked to them and sets the cookie accordingly
$sql="SELECT * FROM userprofile WHERE userID = $userid";
$result= mysqli_query($connect, $sql);
$row=mysqli_fetch_assoc($result);
           
if  ($row["ProfileID"] > 0){
    setcookie("profile","yes",time()+30*24*60*60);
} 
else {(setcookie("profile","no",time()+30*24*60*60));
}

?>