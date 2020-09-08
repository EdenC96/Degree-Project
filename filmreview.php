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

$revid = $_GET['id'];


//This Query is pulling data from a view in the database instead of a table!
//Below is the query executed in the view should the view get deleted or an errors occur.
 
//View Query is as follows: SELECT  ReviewID, users.Firstname, users.Surname, films.FilmName, reviewcomment.Title, reviewcomment.Comment, reviewcomment.Rating 
//FROM review INNER JOIN users ON review.UserID = users.UserID INNER JOIN reviewcomment ON review.RevCommentID = reviewcomment.RevCommentID INNER JOIN films ON review.FilmID = films.FilmID
	
$query = "SELECT * FROM reviewdata WHERE ReviewID = '$revid'";
$result = mysqli_query($connect, $query)
	or die('Error querying the database!'); 

if (mysqli_num_rows($result) == 0) {
	echo("Error! <br> Review information not found!");
} 
else {

	while($row = mysqli_fetch_assoc($result)) {
		echo("<div class='displaytext'><h1>".$row["Title"]."</h1><hr><br>".$row["Comment"]."<br><br>Film: <b>".$row["FilmName"]."</b><br><br>Review by: <b>".$row["Firstname"]." ".$row["Surname"]."</b><br><br>Reviewer Rating: <b>".$row["Rating"]."</b><br><br><a href='javascript:history.go(-1)' class='formlink'><u>Return 
        to the Previous Page</u></a></div>");	
	}
} 

//Close the connection!	  
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
