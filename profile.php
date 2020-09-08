<?php
function logcheck() {
    //Read browser for cookie to check if user is logged in!
    if (isset($_COOKIE["user"])) {
        include_once 'Includes/loggedin_header.php';
    }
    //If user isnt still logged in display default headder.
    else {
        include_once 'Includes/header.php';
    }
}
	
include_once "Includes/dbh.php";
//This code like other pages on the website checks to see if the user is actually logged in or not for security and error handling purposes.
if(!isset($_COOKIE['user'])) {
    $userid= 0; 

}
else{
    $userid= $_COOKIE['user'];
}


if(isset($_COOKIE['profile'])){
    $DoesUserProf = $_COOKIE['profile'];
}
else {
    $DoesUserProf = "NULL";
}
//Checks for new profile information being sent over POST.
if (isset($_POST['np'])) {
    $NewProfile= $_POST['np'];
}
else{
    $NewProfile= 0;
}

//Below is the error handling code should the user attempt to access this page by typing "profile.php" in the url while not logged in!
if($userid == 0){
    logcheck();
    echo("<div class='displaytext'>You aren't currently signed in!<br>If you recently logged out or deleted your cookies please<a class='formlink' href='login.php'> Sign in </a>again.</div>");
}
//This is a failsafe should the user delete the profile cookie but not the user cookie. 
else if (!isset($_COOKIE['profile'])){
    logcheck();
    echo("<div class='displaytext'>There was an error loading your profile!<br>Please<a class='formlink' href='login.php'> Sign in </a>again.</div>");
}
//If Profile data is being sent via POST run the following code!
else if ($NewProfile == 1) {

    $biotext = $_POST['biotext']; 
    $favmovtxt = $_POST['fmtext'];

    $insSql = "INSERT INTO profile (Bio,FavMovie) VALUES ('$biotext','$favmovtxt')";

    if(mysqli_query($connect, $insSql)) {
        
        $grabprof = "SELECT * FROM profile ORDER BY ProfileID DESC LIMIT 1";
        $grabprofrun = mysqli_query($connect, $grabprof);
        
        if (mysqli_num_rows($grabprofrun) > 0) {
        
            $fetch= mysqli_fetch_assoc($grabprofrun)
                or die("help");
            $profid = $fetch['ProfileID'];
            
            $usprins = "INSERT INTO userprofile (UserID, ProfileID) VALUES ('$userid','$profid')";
            if(mysqli_query($connect, $usprins)) {
               
                header( "refresh:5;url=profile.php" );
                include_once "Includes/profilecheck.php";
                logcheck();
                echo("<div class='displaytext'>Profile Submitted!<br>Redirecting in 3 Seconds!</div>");     
             }
            else {
                logcheck();
                echo("<div class='displaytext'>There was an error configuring your profile!<br>Please<a class='formlink' href='profile.php'> try again</a>.</div>");
                
            }
        
        }
    
    }
    else{
        logcheck();
        echo("There was an error submitting your profile!");
    }
}
//If the user already has a profile the following code will be executed.
else if ($DoesUserProf == "yes"){
    logcheck();

    $uquery="SELECT * FROM userprofile INNER JOIN users ON userprofile.UserID = users.UserID WHERE users.UserID ='$userid'";

    $uqueryrun= mysqli_query($connect,$uquery)
        or die ("There was an error! Try refreshing the page.");



       
    if(mysqli_num_rows($uqueryrun) == 1){
        $row= mysqli_fetch_assoc($uqueryrun);     
        $uprofid= $row["ProfileID"];

        if($uprofid > 0){
    
            $pquery="SELECT * FROM profile WHERE ProfileID = '$uprofid'"; 
            $pqueryrun= mysqli_query($connect,$pquery);
            $row2= mysqli_fetch_assoc($pqueryrun);
        
            //This code will display the logged in user's profile.
            echo("<div class='displaytext'>
        
                <div name='ProfileImg' class=''><img height='250' width='250' src='".$row2['Avatar']."'></img></div>
                <br><h3>Name</h3>
                <div name='UserName' class=''>".$row['Firstname']." ".$row['Surname']."</div>
                <br><h3>Bio</h3>
                <div name='ProfileBio' class=''>".$row2['Bio']."</div>
                <br><h3>Favorite Movie</h3>
                <div name='ProfileFavGenre' class=''>".$row2['FavMovie']."</div>
                <br><h3>Date Joined!</h3>
                <div name='DateJoined' class=''>".$row['DateJoined']."</div><br>
                <!--<a href='editprofile.php' class='formlink borderbox'>Edit Profile!</a>-->
                </div>");  
      

        }
   
    }
    //Error Handling
    else{
        logcheck();
        echo("<div class='displaytext'>There was an error fetching your profile.<br>If you haven't created one you can do so <a class='formlink' href='createprofile.php'>Here</a>!</div>");
    }  
}
//If the user doesn't have a profile, display a page for them to create one!
else if ($DoesUserProf == "no"){
    
    logcheck();
    echo("<form class='errtxt' action='profile.php' method='post'>
    
            <div class='pageform'>  
            <label for='biotext'><b>Bio</b></label>
            <textarea placeholder='Enter your Bio here!' name='biotext'></textarea>
      
            <label for='fmtext'><b>Favorite Movie</b></label>
            <input type='text' placeholder='Favorite Movie...' name='fmtext'>
            
            <input type='hidden' name='np' value='1'>
        
            <button type='submit'>Create Profile!</button>
            </div>
            </form>");

}
//Error Handle should the user access this page while logged out or cookies deleted! 
else {
    echo("<div class='displaytext'>There was an error fetching your profile!<br>Are you <a class='formlink' href='login.php'>Logged in?</a>!</div>");
}	  

//Close the connection
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
