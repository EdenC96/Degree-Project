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

<!--WELCOME TO MESMERIZING MOVIES!-->


<?php
//The Following code was created by a 3rd party!!!
//The Original version of this web banner can be found at: http://codyhouse.co/gem/hero-slider/
//----------------------------------------------------------------------------------------------
?>	
<section class="cd-hero js-cd-hero js-cd-autoplay">
	<ul class="cd-hero__slider">
	  <!-- First Slide -->
		<li class="cd-hero__slide cd-hero__slide--selected js-cd-slide">
			<div class="cd-hero__content cd-hero__content--full-width">
				<h2>Welcome to Mesmerizing Movies</h2>
				<p>A small local movie theater based in Southport.<br>Feel free to browse our film reviews, join our discussions board or even sign up!</p>
			</div>
		</li>
    
    <!-- Second Slide -->
		<li class="cd-hero__slide js-cd-slide">
			<div class="cd-hero__content cd-hero__content--half-width">
				<h2>Recent Films?</h2>
				<p>We feature a large number of the biggest and newest films out right now! To see all recent additions to our list check out the films section! </p>
        			<a href="filmlist.php" class="cd-hero__btn cd-hero__btn--secondary">Check out Films!</a>
			</div> 

			<div class="cd-hero__content cd-hero__content--half-width cd-hero__content--img">
				<img src="resources/icon.png" alt="Mesmerizing Movies">
        			</div> <!-- .cd-hero__content -->
		</li>

    <!-- Third Slide -->
		<li class="cd-hero__slide js-cd-slide">
			<div class="cd-hero__content cd-hero__content--half-width cd-hero__content--img">
				<img src="resources/signup.png" alt="Join Today!">
			</div>

			<div class="cd-hero__content cd-hero__content--half-width">
				<h2>Why not sign up today?</h2>
				<p>Join the club and make an acount with us today! You can join in the convorsations and review films we show!</p>
				<a href="signup.php" class="cd-hero__btn">Sign Up!</a>
			</div>
		</li>

    <!-- Fourth Slide(Video) -->
		<li class="cd-hero__slide cd-hero__slide--video js-cd-slide">
			<div class="cd-hero__content cd-hero__content--full-width">
				<h2>Upcoming Releases</h2>
				<p>Remember to check back for new releases!<br> We have new releases coming out every week.</p>
			</div>
			
      <!-- video element will be loaded using JavaScript -->
			<div class="cd-hero__content cd-hero__content--bg-video js-cd-bg-video" data-video="Resources/video"></div>
		</li>			
	</ul> 

	 <div class="cd-hero__nav js-cd-nav">
		<nav>
			<span class="cd-hero__marker cd-hero__marker--item-1 js-cd-marker"></span>
				
			<ul>
				<li class="cd-selected"><a href="#0">Welcome</a></li>
				<li><a href="#0">What's on?</a></li>
				<li><a href="#0">Join the club!</a></li>
				<li><a href="#0">Coming soon!</a></li>
			</ul>
		</nav> 
	</div>
</section> 

<?php	
include_once "Includes/dbh.php";

// This section displays the 3 newest films on the site!
$getfilms = "SELECT * FROM films ORDER BY FilmID DESC LIMIT 3";
$runfilms = mysqli_query($connect, $getfilms);
echo("<div class='contentarea lfloat'><h2><u>New Films now showing!</u></h2>");
while ($row = mysqli_fetch_assoc($runfilms)){
 echo("<a class='whitelink' href='film.php?id=".$row['FilmID']."'><div class='subcontent whitelink'><h3>".$row['FilmName']."</h3><br>".$row['Description']." </div></a>"); 
}
echo("</div>");

//This section displays the 3 newest reviews from users!
$getreviews = "SELECT review.reviewID, reviewcomment.Title, reviewcomment.Comment, users.firstname, users.surname FROM review 
			INNER JOIN reviewcomment ON review.RevCommentID=reviewcomment.RevCommentID 
			INNER JOIN users ON review.userID=users.userID 
			ORDER BY review.reviewID DESC LIMIT 3";
$runreviews = mysqli_query($connect, $getreviews);
echo("<div class='contentarea rfloat'><h2><u>Check out some of our recent reviews!</u></h2>");
while ($row2 = mysqli_fetch_assoc($runreviews)){
 echo("<a class='whitelink' href='filmreview.php?id=".$row2['reviewID']."'><div class='subcontent'><h3>".$row2['Title']."</h3><span style='font-size:12px;'> - by: ".$row2['firstname']." ".$row2['surname']."</span></div></a>");

}  
echo("</div>");	  

//Close the connection...
mysqli_close($connect);
 
include_once 'Includes/footer.php';
?>
