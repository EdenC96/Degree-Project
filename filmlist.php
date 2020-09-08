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

//Check to see if a query has been requested.    
if(!isset($_GET['q'])) {
    $filter = 0;
}
else {
    $filter = $_GET['q'];
}

//If no query is requested and the user has just accessed the page via navigation display ALL films.
if($filter == 0){
    
    echo"<form action='filmlist.php' method='GET' class='pageform'>
         <input type='text' name='search' placeholder='Search...'>
         <input type='hidden' name='q' value='1'>
        </form>";

    echo("<div class='listheader'><i><b>Displaying ALL Films!</b></i></div>");	
	$query = "SELECT * FROM films";
	
	$result = mysqli_query($connect, $query)
		or die('Error requesting Film information!');

	if (mysqli_num_rows($result) == 0) {
		echo("No Films found with that name!");
	} 
    else {
		
		while($row = mysqli_fetch_assoc($result)) {
    
            $name = $row['FilmName']; 	
	        echo'<table class="mainbox"><tr><td><div class="listcontainer"><a class="searchlink" href="film.php?id='.$row['FilmID'].'"><h3>'.$name.'</h3></a> Film Rating: '.$row["FilmRating"].'</div></td></tr></table>';
        }  
    }
}
//If the user has requested a search run this code.
else if ($filter == 1) {

    $filmname= $_GET['search'];

    echo"<form action='filmlist.php' method='GET' class='pageform'>
         <input type='text' name='search' placeholder='Search...'>
         <input type='hidden' name='q' value='1'>
        </form>";

    echo("<div class='listheader'><i><b>Displaying Films that match \"".$filmname."\"</b></i></div>");	
	$query = "SELECT * FROM films WHERE FilmName LIKE '%$filmname%'";
	
	$result = mysqli_query($connect, $query)
		or die('Error requesting Film information!');

	if (mysqli_num_rows($result) == 0) {                                                                                             
		echo("No Films found with that name!");
	} 
    else {
		
		while($row = mysqli_fetch_assoc($result)) {
        $name = mysqli_real_escape_string($connect,$row['FilmName']); 		
		echo'<table class="mainbox"><tr><td><div class="listcontainer"><a class="searchlink" href="film.php?id='.$row['FilmID'].'"><h3>'.$name.'</h3></a> Film Rating: '.$row["FilmRating"].'</div></td></tr></table>';
        } 
    }
}
//Error handling should something unexpected go wrong!
else {
    echo("There was an error. Please Refresh the page!"); 
}	
  
//Close the connection!
mysqli_close($connect);

include_once 'Includes/footer.php';
?>
