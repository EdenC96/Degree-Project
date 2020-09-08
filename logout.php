<?php
function Logcheck() {
    if (isset($_COOKIE["user"])) {
        include_once 'Includes/loggedin_header.php';
    }
    else {
        include_once 'Includes/header.php';
    }
}
//Delete the user cookie.
setcookie("user","",time()-3600);
//Delete the profile checking cookie!
setcookie("profile","",time()-3600);
//Redirect the user back to the hame page!
header( "refresh:2;url=index.php" );
Logcheck();
?>
<div class="displaytext">
<?php
echo("Logout Successful<br>Redirecting in 2 seconds! If this fails click <a class='formlink' href='index.php'>HERE</a> "); 
include_once 'Includes/footer.php';
 
?>
</div>