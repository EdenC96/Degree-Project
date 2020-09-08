<?php
//Read browser for cookie to check if user is logged in!
if (isset($_COOKIE["user"])) {
      include_once 'Includes/loggedin_header.php';
   }
//If user isnt still logged in display default headder.
   else {
      include_once 'Includes/header.php';
   }
	
include_once "Includes/dbh.php";

//Checks to see if the page is being accessed with header information via GET method.
if(!isset($_GET['q'])) {
    $filter = 0;
}
else {
    $filter = $_GET['q'];
}

//If the header information is blank (Just accessed the page) run this code.
if($filter == 0){
    
    echo"<form action='reviews.php' method='GET' class='pageform'>
         <input type='text' name='search' placeholder='Search...'>
         <input type='hidden' name='q' value='1'>
        </form>";

    echo("<div class='listheader'><i><b>Displaying ALL Reviews!</b></i></div>");	
	$query = "SELECT review.reviewID, reviewcomment.Title, users.firstname, users.surname FROM review 
			INNER JOIN reviewcomment ON review.RevCommentID=reviewcomment.RevCommentID 
			INNER JOIN users ON review.userID=users.userID 
			ORDER BY review.reviewID DESC";
	
	$result = mysqli_query($connect, $query)
		or die('Error requesting Reviews!');

	if (mysqli_num_rows($result) == 0) {
		echo("No Reviews found with that title!");
	} 
    else {
		
		while($row = mysqli_fetch_assoc($result)) {
            $name = mysqli_real_escape_string($connect,$row['Title']); 	
		  echo'<table class="mainbox"><tr><td><div class="listcontainer"><a class="searchlink" href="filmreview.php?id='.$row['reviewID'].'"><h3>'.$name.'</h3></a> By: '.$row["firstname"].' '.$row["surname"].'</div></td></tr></table>';
        }  
    }
}

//If there is information sent in the header however run this code!
else if ($filter == 1) {

    $filmname= $_GET['search'];

    echo"<form action='reviews.php' method='GET' class='pageform'>
         <input type='text' name='search' placeholder='Search...'>
         <input type='hidden' name='q' value='1'>
        </form>";

    echo("<div class='listheader'><i><b>Displaying Films that match \"".$filmname."\"</b></i></div>");
        
	$query ="SELECT review.reviewID, reviewcomment.Title, users.firstname, users.surname FROM review 
			INNER JOIN reviewcomment ON review.RevCommentID=reviewcomment.RevCommentID 
			INNER JOIN users ON review.userID=users.userID
            WHERE reviewcomment.Title LIKE '%$filmname%' 
			ORDER BY review.reviewID DESC" ;
	
	$result = mysqli_query($connect, $query)
		or die("<div class='displaytext'>Error requesting Review information!</div>");
       
	if (mysqli_num_rows($result) == 0) {                                                                                             
		echo("<div class='displaytext'>No Reviews found with that name!</div>");
	} 
    else {
		
		while($row = mysqli_fetch_assoc($result)) {
        $name = mysqli_real_escape_string($connect,$row['Title']); 		
		echo'<table class="mainbox"><tr><td><div class="listcontainer"><a class="searchlink" href="filmreview.php?id='.$row['reviewID'].'"><h3>'.$name.'</h3></a> By: '.$row["firstname"].' '.$row["surname"].'</div></td></tr></table>';
        } 

    }
}
//Error handling.
else {
echo("There was an error. Please Refresh the page!"); 
}

//Close the connection!
mysqli_close($connect);
include_once 'Includes/footer.php';
?>
