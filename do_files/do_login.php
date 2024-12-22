<?php
session_start();
include '../inc/build.php';
$username = pr($_POST['username']);
$pass = pr($_POST['pass']);

if (login($username, $pass)) {

	$uid = userid($username, $pass);
	$_SESSION['userid'] = $uid;

	$_SESSION['uname'] = uname($uid);
	$_SESSION['fname'] = fname($uid);
	$_SESSION['type'] = utype($uid);

	header("Location: ../index.php");

} else {

	header("Location: ../login.php?fail=1");
}

?>