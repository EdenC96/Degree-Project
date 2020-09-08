<?php
//Read browser for cookie to check if user is logged in!
if (isset($_COOKIE["user"])) {
      include_once 'Includes/loggedin_header.php';
   }
//If user isnt still logged in display default headder.
   else {
      include_once 'Includes/header.php';
   }
?>

<!--HTML CODE HERE!-->

<?php
	
include_once "Includes/dbh.php";
//This code like other pages on the website checks to see if the user is actually logged in or not for security and error handling purposes.
if(!isset($_COOKIE['profile'])) {
    $profile= 0;
    echo("<div class='displaytext'>Please check you are logged in!<br>If not you can do so <a href='login.php' class='formlink'>HERE</a></div>"); 

}
else{
    $profile= $_COOKIE['profile'];
}
//-------------------------------------------------------------

// This is to check if this page has any data being sent to it via POST on load.
if(isset($_POST['meta'])) {
    $metatag = $_POST['meta'];
}
else{
    $metatag = 0; 
}
//-------------------------------------------------------------

// Error handling for if the user attempts to come back to this page once they have created their profile!
//This helps avoid a user having multiple profiles linked to them. 
if($profile == "yes"){

    echo("<div class='displaytext'>You already have a profile setup!<br>To get to your profile, click <a href='login.php' class='formlink'>HERE</a>.</div>");
}

//If data is sent to this page via POST run this code!
else if ($metatag == 1){

    $biotext= mysqli_real_escape_string($connect,$_POST['bio']);
    $favmovie= mysqli_real_escape_string($connect,$_POST['favmov']);

    $insertquery="INSERT INTO profile (Bio, FavMovie) VALUES ('$biotext','$favmovie')";


    if (mysqli_query($connect,$insertquery)){

        $getidquery="SELECT * FROM profile ORDER BY ProfileID DESC LIMIT 1";
        $runidquery= mysqli_query($connect,$getidquery);
        
        $row= mysqli_fetch_assoc($runidquery);
        
        $profileid= $row['ProfileID'];
        $userid= $_COOKIE['user'];
        
        $UserProfIns= "INSERT INTO userprofile (ProfileID, UserID) VALUES ('$profileid','$userid')";
        
        mysqli_query($connect,$UserProfIns);
        
        header( "refresh:3;url=profile.php" );
        echo("<div class='displaytext'>Profile Created.<br>Redirecting in 3 seconds.<br>If this fails <a class='formlink' href='profile.php'>Click Here!</a></div>");
    }
    else {
        echo("<div class='displaytext'>There was an error with submitting your data<br>Please <a class='formlink' href='createprofile.php'>try again</a></div>");
    }


}

//If the user hasn't got a profile, display the following form allowing them to make one!
else if ($profile == "no"){

    echo("<form class='errtxt' action='createprofile.php' method='post'>
                     
        <div class='pageform'>  
        <label for='bio'><b>Bio</b></label><br>
        <textarea type='text' placeholder='Say something about yourself!' name='bio' maxheight='5'></textarea><br>
      
        <label for='favmov'><b>Favorite Movie</b></label>
        <input type='text' placeholder='Whats your favorite movie?' name='favmov'>

        <input type='hidden' value='1' name='meta'>
        
        <button type='submit'>Create Profile!</button>
        </div></form>");
}

//Backup error handling should all other methods fail!
else {
    echo("<div class='displaytext'>Please check you are logged in!<br>If not you can do so <a href='login.php' class='formlink'>HERE</a></div>");
}

//Close the connection!
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
