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

//Below section checks to see if this page is being accessed with data sent via POST
//and if thats not the case and the user accesses the page by entering "/signup.php"
//they wont encounter a "undefined index" error!
if(!isset($_POST['meta'])) {
$meta = "NULL";
}
else {
$meta = $_POST['meta'];
}

//IF the header comes back with this result, insert the information that came with it in the header into the database!  
if($meta == 1) {
    $firstname= mysqli_real_escape_string($connect,$_POST['fname']);
    $surname= mysqli_real_escape_string($connect,$_POST['sname']);
    $email= mysqli_real_escape_string($connect,$_POST['email']);
    $dob= mysqli_real_escape_string($connect,$_POST['dob']);
    $password= mysqli_real_escape_string($connect,$_POST['upass']);
    $passcheck= mysqli_real_escape_string($connect,$_POST['confirmupass']);

    $sql_email = "SELECT * FROM users WHERE email='$email'";
    $res_email = mysqli_query($connect, $sql_email);

    $ins_sql="INSERT INTO users (firstname,surname,email,dob,password)
    VALUES
    ('$firstname','$surname','$email','$dob','$password')";

    //Code below is a safety net should the user be able to bypass the HTML forms "required" feature.  
    if($firstname == "" ||$surname == "" || $email == "" || $dob == "" ||$password == "" || $passcheck == "") {
    
        logcheck(); 
        echo "<form class='errtxt' action='signup.php' method='post'>
        
            Please ensure all fields are filled in! <br><hr>
                
            <div class='pageform'>  
            <label for='fname'><b>First Name</b></label>
            <input type='text' placeholder='First Name' name='fname' required>
      
            <label for='sname'><b>Surname</b></label>
            <input type='text' placeholder='Surname' name='sname' required>
    
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='dob'><b>Date of Birth</b></label><br>
            <input type='date' placeholder='Enter Date' name='dob' required><br>

            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
      
            <label for='upass'><b>Confirm Password</b></label>
            <input type='password' placeholder='Re-Enter Password' name='confirmupass' required>
            
            <input type='hidden' value='1' name='meta'>
        
            <button type='submit'>Sign Up!</button>
            </div>
            </form>";
    }
    
    //This Checks that both entries of the users chosen password are correct.
    elseif ($password !=  $passcheck) {
        logcheck();
        echo "<form class='errtxt' action='signup.php' method='post'>
        
            Passwords don't match! <br> Please try again... <br><hr>
                
            <div class='pageform'>  
            <label for='fname'><b>First Name</b></label>
            <input type='text' placeholder='First Name' name='fname' required>
      
            <label for='sname'><b>Surname</b></label>
            <input type='text' placeholder='Surname' name='sname' required>
    
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='dob'><b>Date of Birth</b></label><br>
            <input type='date' placeholder='Enter Date' name='dob' required><br>

            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
      
            <label for='upass'><b>Confirm Password</b></label>
            <input type='password' placeholder='Re-Enter Password' name='confirmupass' required>
            <input type='hidden' value='1' name='meta'>
        
            <button type='submit'>Sign Up!</button>
            </div>
            </form>";
	  }
    //This checks to see if the email the user is trying to sign up with is already in the database!
    else if(mysqli_num_rows($res_email) > 0){
  
        logcheck();
        echo "<form class='errtxt' action='signup.php' method='post'>
        
            This Email is already registered with us!<br> If you already have an account with us you can login <a class='formlink' href='login.php'><u>HERE</u></a>.<br><hr>
                
            <div class='pageform'>  
            <label for='fname'><b>First Name</b></label>
            <input type='text' placeholder='First Name' name='fname' required>
      
            <label for='sname'><b>Surname</b></label>
            <input type='text' placeholder='Surname' name='sname' required>
    
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='dob'><b>Date of Birth</b></label><br>
            <input type='date' placeholder='Enter Date' name='dob' required><br>

            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
      
            <label for='upass'><b>Confirm Password</b></label>
            <input type='password' placeholder='Re-Enter Password' name='confirmupass' required>
            <input type='hidden' value='1' name='meta'>
        
            <button type='submit'>Sign Up!</button>
            </div>
            </form>";
    }

    else { 
        if (mysqli_query($connect,$ins_sql)){
            header( "refresh:5;url=login.php" );
            logcheck();
            echo "<div class='errtxt'><b>Signup Successful!</b><br>You will be redirected to the login page after 5 seconds!<br>If the page doesnt load, <a class='formlink' href=\"login.php\"><u>Click Here!</u></a></div>";	  
        } 
        else {
            echo "Error: " . mysqli_error($connect);
        }
    }
}

//When the user loads this page this is the default form that loads!
else if ($meta == 0) {

      logcheck();
      echo "<form class='errtxt' action='signup.php' method='post'>
                
            <div class='pageform'>  
            <label for='fname'><b>First Name</b></label>
            <input type='text' placeholder='First Name' name='fname' required>
      
            <label for='sname'><b>Surname</b></label>
            <input type='text' placeholder='Surname' name='sname' required>
    
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='dob'><b>Date of Birth</b></label><br>
            <input type='date' placeholder='Enter Date' name='dob' required><br>

            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
      
            <label for='upass'><b>Confirm Password</b></label>
            <input type='password' placeholder='Re-Enter Password' name='confirmupass' required>
            <input type='hidden' value='1' name='meta'>
        
            <button type='submit'>Sign Up!</button>
            </div>
            </form>";
}

//Should for whatever reason the meta variable set at the top of the script not work
//the user will just be shown a new form regardless (just as if the meta was 0) 
else {
    logcheck();
    echo "<form class='errtxt' action='signup.php' method='post'>
                
            <div class='pageform'>  
            <label for='fname'><b>First Name</b></label>
            <input type='text' placeholder='First Name' name='fname' required>
      
            <label for='sname'><b>Surname</b></label>
            <input type='text' placeholder='Surname' name='sname' required>
    
            <label for='email'><b>Email</b></label>
            <input type='email' placeholder='Enter Email' name='email' required>
      
            <label for='dob'><b>Date of Birth</b></label><br>
            <input type='date' placeholder='Enter Date' name='dob' required><br>

            <label for='upass'><b>Password</b></label>
            <input type='password' placeholder='Enter Password' name='upass' required>
      
            <label for='upass'><b>Confirm Password</b></label>
            <input type='password' placeholder='Re-Enter Password' name='confirmupass' required>
            <input type='hidden' value='1' name='meta'>
        
            <button type='submit'>Sign Up!</button>
            </div>
            </form>";
}

mysqli_close($connect);

include_once 'Includes/footer.php';
?>
