<?php
$user_id=$_SESSION['user_id'];
$sql = mysqli_query($con, "SELECT * FROM wallets where user_id = $user_id");
try{
	while($row1 = mysqli_fetch_array($sql)){
	$wallet_id = $row1['wallet_id'];
	}
	$sql = mysqli_query($con, "SELECT * FROM wallet_details where wallet_id = $wallet_id");
	while($row1 = mysqli_fetch_array($sql)){
	$balance = $row1['balance'];
	}
}
catch (TypeError $e){
	header("location:login.php");
}
?>