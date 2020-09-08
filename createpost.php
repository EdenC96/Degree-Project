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

//On the off chance the user's cookie showing they are logged in is deleted in between the form loading and the data being sent via POST
//the code below is there to catch this and avoid errors when inserting data into the database!
if(!isset($_COOKIE['user'])) {
echo("<div class='errtxt'>You appear to be signed out!<br> Click <a class='formlink' href='login.php'>Here</a> to sign in again!</div>");
}

//Check if the user has arrived at the page as a result of a link or not.
//If there is no type declared in the url set to NULL causing error handling to kick in!
if(!isset($_GET['Type'])) {
    $type = "NULL";
}
else {
    $type = $_GET['Type'];
}

if(isset($_POST['formsub'])){
$form = $_POST['formsub'];
}
else{
$form = "NULL";
}
//If the user arrives at this page from the links for posting a review display the following form.  
if($type == "review" && isset($_COOKIE['user'])) { 

    logcheck();
    echo "<form class='displaytext' action='createpost.php' method='post'>
     
            <div class='pageform'>
            
            <label for='title'><b>Review Title</b></label>
            <input type='text' placeholder='Title...' name='title' required>
      
            <label for='comment'><b>Comment</b></label>
            <textarea type='text' placeholder='Comment...' name='comment' required></textarea>            
                       
            <label for='film'><b>Film</b></label><br>
            <select style='width:60%;height:40px;' name='film'>";
            
    $filmSQL = "SELECT FilmID, FilmName FROM films";
    $SQLrun = mysqli_query($connect, $filmSQL);
    while ($row = mysqli_fetch_array($SQLrun)) {     
        echo("<option value='".$row['FilmID']."'>".$row['FilmName']."</option>");
    }
              
    echo   "</select><br><br>

            <label for='rating'><b>Rating</b></label><br>
            <select style='width:20%;height:40px;' name='rating'>
            <option value='1'>1</option>
            <option value='2'>2</option>
            <option value='3'>3</option>
            <option value='4'>4</option>
            <option value='5'>5</option>
            </select>
            
            <input type='hidden' value='1' name='formsub'>
        
            <button type='submit'>Submit Review!</button>
            </div>
            </form>";      
}

//If the user arrives at this page from the links for making a discusiion post, display the following form.      
else if ($type == "dispost" && isset($_COOKIE['user'])) {

    logcheck();
    echo "<form class='displaytext' action='createpost.php' method='post'>
                
        <div class='pageform'>
              
        <label for='comment'><b>Comment</b></label>
        <textarea type='text' placeholder='What do you want to say?' name='comment' required></textarea>
            
        Posting comment as: ";
    $userid = $_COOKIE['user'];
    $grabuname = "SELECT UserID, Firstname, Surname FROM users WHERE UserID = '$userid'";
    $runquery = mysqli_query($connect,$grabuname);
    $row = mysqli_fetch_assoc($runquery);
    $fname = $row['Firstname'];
    $sname = $row['Surname'];
    echo " ".$fname." ".$sname."";    
    
    echo "

        <input type='hidden' value='2' name='formsub'>
        
        <button type='submit'>Submit Comment!</button>
        </div>
        </form>";
}

//When the page recieves POST information with value 1 its data from the review form.
else if ($form == 1 && isset($_COOKIE['user'])) {

       
    $title = mysqli_real_escape_string($connect,$_POST['title']);
    $comment = mysqli_real_escape_string($connect,$_POST['comment']);
    $rating = $_POST['rating'];
    
    $userid = $_COOKIE['user'];
    $filmid = $_POST['film'];
    
    $datainsert = "INSERT INTO reviewcomment(Title, Comment, Rating) VALUES ('$title','$comment','$rating')";
    
    if(mysqli_query($connect, $datainsert)) {
    
        $getrevcom = "SELECT * FROM reviewcomment ORDER BY RevCommentID DESC LIMIT 1";
        $runrevcom = mysqli_query($connect, $getrevcom)
            or die("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:S.01</div>");
        $row = mysqli_fetch_assoc($runrevcom);
        $revcomid = $row['RevCommentID'];
        
        if (mysqli_num_rows($runrevcom) > 0) {
            $reviewsql = "INSERT INTO review(RevCommentID, UserID, FilmID) VALUES ('$revcomid','$userid','$filmid')";
            $reviewins = mysqli_query($connect, $reviewsql)
                or die("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:I.02</div>");
            
            header( "refresh:3;url=reviews.php" );
            logcheck();
            echo("<div class='displaytext'>Review Submitted!<br>Redirecting in 3 seconds. If this doesn't work click <a class='formlink' href='reviews.php'>Here.</a></div>");
            }
        else{
            echo("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:NR.01</div>");
        }    
    }
    else {
        logcheck();
        echo("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:I.01</div>");
    }
}
//When the page recieves POST information with value 2 its data from the discusison form.
else if ($form == 2 && isset($_COOKIE['user'])) {
    
    
    $comment = mysqli_real_escape_string($connect,$_POST['comment']);
    $userid = $_COOKIE['user'];
    
    $datainsert = "INSERT INTO discussioncomment(Comment) VALUES ('$comment')";
    if(mysqli_query($connect, $datainsert)) {
        
        $getdiscom = "SELECT * FROM discussioncomment ORDER BY DisCommentID DESC LIMIT 1";
        $rundiscom = mysqli_query($connect, $getdiscom)
            or die("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:S.02</div>");
        $row = mysqli_fetch_assoc($rundiscom);
        $discomid = $row['DisCommentID'];
        
        if (mysqli_num_rows($rundiscom) > 0) {
            $discussionsql = "INSERT INTO discussion(DisCommentID, UserID) VALUES ('$discomid','$userid')";
            $discussionins = mysqli_query($connect, $discussionsql)
                or die("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:I.04</div>");
    
            header( "refresh:2;url=discussion.php" );
            logcheck();
            echo("<div class='displaytext'>Post Submitted!<br>Redirecting in 2 seconds. If this doesn't work click <a class='formlink' href='discussion.php'>Here.</a></div>");
    
        }
        else{
            echo("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:NR.02</div>");
        }

    }
    else {
        logcheck();
        echo("<div class='displaytext'>There was an error with the request! <br> To go back to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here.</a><br>Error code:I.03</div>");
    }

}
else {
    logcheck();    
    echo "<div class='displaytext'>There was an Error with the page! <br> To go to the previous page, click <a class='formlink' href='javascript:history.go(-1)'>Here!</a> </div>";
}
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
