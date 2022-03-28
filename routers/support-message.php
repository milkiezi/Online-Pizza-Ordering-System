<?php
include '../includes/connect.php';
include '../includes/wallet.php';
$message = htmlspecialchars($_POST['message']);
$support_id = $_POST['support_id'];
$role = $_POST['role'];
if($role == 'Administrator'){
	$sql = "UPDATE supports SET status = 'Answered' WHERE id=$support_id;";
	$con->query($sql);
}
else{
	$sql = "UPDATE supports SET status = 'Open' WHERE id=$support_id;";
	$con->query($sql);	
}
if($message != ''){
	$sql = "INSERT INTO support_details (support_id, user_id, description) VALUES ($support_id, $user_id, '$message')";
	$con->query($sql);
}
header("location: ../view-support.php?id=".$support_id);
?>