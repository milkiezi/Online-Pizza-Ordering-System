<?php
include '../includes/connect.php';
$subject = htmlspecialchars($_POST['subject']);
$description =  htmlspecialchars($_POST['description']);
$type = $_POST['type'];
$user_id = $_POST['id'];
if($type != ''){
	$sql = "INSERT INTO supports (user_id, subject, description, type) VALUES ($user_id, '$subject', '$description', '$type')";
	if ($con->query($sql) === TRUE){
		$support_id =  $con->insert_id;
		$sql = "INSERT INTO support_details (support_id, user_id, description) VALUES ($support_id, $user_id, '$description')";
		$con->query($sql);
	}
}
header("location: ../support.php");
?>