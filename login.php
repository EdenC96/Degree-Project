<?php

echo("<div id='content'>");

include_once "Includes/dbh.php";

//This function gets the users IP that they connected to the server with!
function getUserIpAddr(){
    if(!empty($_SERVER['HTTP_CLIENT_IP'])){
        //ip from share internet
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        //ip pass from proxy
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }else{
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

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

//Set the users IP to a variable.
$userip = getUserIpAddr();

//Check if data is being sent to this page via POST. If not then set the variable to 0 to avoid an "undefined index" error.	
if (!isset($_POST["loginmodal"])){ 
    $loginmodal = 0;
}
else {
    $loginmodal= $_POST["loginmodal"] ;
}

//If the data sent via POST is from the modal form in the sidenav then run this code.
if ($loginmodal == 1){
	
    //Error handling should the user bypass the built in HTML validation!
	if (isset($_POST["email"]) && isset($_POST["upass"])) {
    
	$email = $_POST["email"];
	$password = $_POST["upass"];
		
	$query = "SELECT * FROM users WHERE email='$email'";
		
	$result = mysqli_query($connect,$query)
		or die('SQL Query failed!');
    //If a record has been found with that entered email do the following:	
    if(mysqli_num_rows($result) == 1) {
			
	 while($row = mysqli_fetch_assoc($result)) {

		if ($password == $row["Password"]) {
      
			// Set session variables
			$_SESSION["username"] = "webuser";
			//Set Cookie to identify user!
			$userid = $row["UserID"];
      		//Cookie time currently set to 30 days.
			setcookie("user","$userid",time()+30*24*60*60);
            //Check if the user already has a profile. 
            include_once "Includes/profilecheck.php";
			
			if(isset($userid)) {
      
                $loginsert = "INSERT INTO log (UserID,IpAddress) VALUES ('$userid','$userip')";
      
                    if(mysqli_query($connect,$loginsert)) {
      
                    }
                    else {
                        echo "Error: " . mysqli_error($connect);
                    }
            }  			
      		header( "refresh:3;url=index.php" );
            logcheck();
            echo"<div class='displaytext'>Login Successful! <br> Returning to home page in 3 seconds.</div>";
            
		}
        //If the passwords dont match up run this section of code! 
		else if($password != $result) {
            
            logcheck();	
			echo("<form class='errtxt' action='login.php' method='post'>

             Password is incorrect!<br>Please Try Again.<br><hr>
    
            <div class='pageform'>  
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
            
            <input type='hidden' name='loginmodal' value='1'>
        
            <button type='submit'>Login</button>
            </div>
            </form>");
		}
		

	 }
    }
//If no record is found for the entered email run this!
else if(mysqli_num_rows($result) == 0) {

            logcheck();
			echo("<form class='errtxt' action='login.php' method='post'>

             Email not registered with us.<br>You can <a class='formlink' href='signup.php'>sign up</a> today for free!<br><hr>
    
            <div class='pageform'>  
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
            
            <input type='hidden' name='loginmodal' value='1'>
        
            <button type='submit'>Login</button>
            </div>
            </form>");
			
		}  
  
  
	}
}

//The Default Form to load on the page!
else {
    logcheck();
    echo "<form class='errtxt' action='login.php' method='post'>
                    
            <div class='pageform'>  
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
            
            <input type='hidden' name='loginmodal' value='1'>
        
            <button type='submit'>Login</button>
            </div>
            </form>";


}

include_once 'Includes/footer.php';
?>
