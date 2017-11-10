<?php
	//database connection
	require('dbconnect.php');

<<<<<<< HEAD
	//start of session
	session_start();

	//end of session
=======
	$userID = $_SESSION['user_id'];
	if(!isset($userID))
	{
	session_unset();
>>>>>>> 21d7776e848dc86edddb93fd8c9d7040d5c5849a
	session_destroy();

	//The page will be redirected to login page
	//when the session is ended.
	header('location:index.html');
?>