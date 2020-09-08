<?php
//Read browser for cookie to check if user is logged in!
if (isset($_COOKIE["user"])) {
      include_once 'Includes/loggedin_header.php';
      echo("<div class='displaytext'>Welcome to the discussion board! <br> 
      To add a comment <a style='color:#777;' class='formlink' href='createpost.php?Type=dispost'><u>Click Here</u></a>!</div>");
   }
//If user isnt still logged in display default headder.
   else {
      include_once 'Includes/header.php';
      echo("<div class='displaytext'>Welcome to the discussion board! <br> 
      To contribute you need to be <a class='formlink' href='login.php'><u>Logged in!</u></a>.
      <br> If you haven't already, <a style='color:#777;' href='signup.php' class='formlink'>Sign Up</a> with us today!</div>");
   }
?>

<div class='discussionbox'>
<?php
	
include_once "Includes/dbh.php";

if(isset($_COOKIE['profile'])){
    $profileset = $_COOKIE['profile']; 
}
else{
    $profileset = "NULL";
}


//The $datasql below is selecting data from a VIEW in the database.
//In the event the view is deleted or lost the SQL statement below is what created the view!
//------------------------------------------------------------------------------
//CREATE VIEW disdata AS
//SELECT DiscussionID, Firstname, Surname, profile.Avatar, discussioncomment.Comment, discussioncomment.Time 
//FROM discussion 
//INNER JOIN users ON discussion.UserID = users.UserID 
//LEFT JOIN userprofile ON discussion.UserID = userprofile.UserID 
//LEFT JOIN profile ON userprofile.ProfileID = profile.ProfileID 
//INNER JOIN discussioncomment ON discussion.DisCommentID = discussioncomment.DisCommentID
//-----------------------------------------------------------------------------
$datasql = "SELECT * FROM disdata ORDER BY DiscussionID DESC";
$getdata = mysqli_query($connect,$datasql)
    or die("");

while ($row = mysqli_fetch_assoc($getdata)){

    if(!isset($row['Avatar'])) {

    echo("<div class='discussionsec'> <div class='discusisonimg'><img class='disimg' src='Resources/defaultavatar.png'>
    
        </div>
        <div class='discussiontxt'><b>".$row['Firstname']." ".$row['Surname']."</b> - <span style='font-size:12px;'>".$row['Time']."</span><br>".$row['Comment']."</div>
        </div>");
    }
    else{
        echo("<div class='discussionsec'>
        <div class='discusisonimg'><img class='disimg' src='".$row['Avatar']."'></div>
        <div class='discussiontxt'><b>".$row['Firstname']." ".$row['Surname']."</b> - <span style='font-size:12px;'>".$row['Time']."</span><br>".$row['Comment']."</div>
        </div>"); 
    }
}

//Close the connection!
mysqli_close($connect);

?>
</div>
<?php
include_once 'Includes/footer.php';
?>
