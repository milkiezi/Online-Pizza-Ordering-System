<?php
include '../includes/connect.php';
include '../includes/wallet.php';
$status = $_POST['status'];
$support_id = $_POST['support_id'];
$sql = "UPDATE supports SET status = '$status' WHERE support_id = $support_id;";
$con->query($sql);
header("location: ../view-support.php?id=".$support_id);
?>