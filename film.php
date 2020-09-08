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
//Get the film specific ID from the header!
$idnum = $_GET['id'];

//Select the record from the database that matches the ID number.	
$query = "SELECT * FROM films WHERE FilmID = '$idnum'";
$result = mysqli_query($connect, $query)
	or die('Error querying the database!'); 
//If no results found run the following.
if (mysqli_num_rows($result) == 0) {
	echo("Error, Film information not found!");
}
//Otherwise assume the relevant record has been found and display the information to the user. 
else {
    while($row = mysqli_fetch_assoc($result)) {
		echo("<div class='displaytext'><h1>".$row["FilmName"]."</h1><br><img src='".$row["FilmImg"]."'><br><br>".$row["Description"]."<br><br>Film Rating: <b>".$row["FilmRating"]."</b><br><br><a href='javascript:history.go(-1)' class='formlink'><u>Return to the Previous Page</u></a></div>");	
	}
}  

//Close the connection!	  
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
