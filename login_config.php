<?php

session_start();

if(isset($_POST['login'])){

	require('dbconnect.php');

	$username = $_POST['username'];
	$password = $_POST['password'];

	$queryUsername = "SELECT * FROM tblUsers WHERE user_id = '$username'";

	$resultUsername = mysqli_query($conn, $queryUsername);

	$row = mysqli_fetch_array($resultUsername);
	$userID = $row['user_id'];
	$userType = $row['user_type'];
	$queryPassword = "SELECT * FROM tblPasswords WHERE password = '$password' and user_id = '$userID'";
	$resultPassword = mysqli_query($conn, $queryPassword);
	if((mysqli_num_rows($resultUsername) > 0) && (mysqli_num_rows($resultPassword) > 0) )
	{
<<<<<<< HEAD
		if($userType == 'ADMINISTRATOR')
=======
		if($userType == 'ADMIN' || $userType == 'Admin')
>>>>>>> 21d7776e848dc86edddb93fd8c9d7040d5c5849a
		{
			header("location: admin_dashboard.php");
			$_SESSION['user_id'] = $userID;
		}

		elseif($userType == 'FACULTY' || $userType == 'Faculty')
		{
			header("location: faculty_dashboard.php");
			$_SESSION['user_id'] = $userID;
		}
		elseif($userType == 'STUDENT' || $userType == 'Student')
		{
			header("location: student_dashboard.php");
			$_SESSION['user_id'] = $userID;
		}
		elseif($userType == 'VISITOR' || $userType == 'Visitor')
		{
			header("location: visitor_dashboard.php");
			$_SESSION['user_id'] = $userID;
		}


	}

else{
	header("location: index.html");
	}	

}
?>