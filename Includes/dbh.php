<?php
	define('DB_SERVER', 'localhost');
	define('DB_USERNAME', '40067505');
	define('DB_PASSWORD', 'password');
	define('DB_DATABASE', '40067505_mmoviesDB');
	$connect = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
	if (!$connect){
        die('Error connecting to the database: ' . mysqli_connect_error());
    } 
?>