<?php
session_start();
$servername = "localhost";
$server_user = "root";
$server_pass = "";
$dbname = "pizza";
$con = new mysqli($servername, $server_user, $server_pass, $dbname);
$name = $_SESSION['name'];
$role = $_SESSION['role'];

?>