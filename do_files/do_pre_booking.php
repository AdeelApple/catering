<?php 

session_start();
include '../inc/build.php';


	$order_id = $_POST['orderno'];
	$date = $_POST['date'];
	$customer = pr($_POST['customer']);
	$phone1 = pr($_POST['phone1']);
	$phone2 = pr($_POST['phone2']);
	$persons = zifnull($_POST['persons']);
	$trays = pr($_POST['trays']);
	$shipping = $_POST['shipping'];
	$address = pr($_POST['address']);
	$delivery_time = $_POST['delivery_time'];

	$order_qry = "";
	$order_check_qry = "SELECT COUNT(*) as count FROM orders WHERE id=$order_id";
	if (bit($order_check_qry)) {
		$order_qry = "update orders set name='$customer', persons=$persons, phone1='$phone1',phone2='$phone2', shipping=$shipping, address='$address', trays=$trays, delivery_time='$delivery_time' where id=$order_id";
	} else {
		$order_qry = "INSERT INTO orders (id, name, persons, phone1, phone2, shipping, address, trays, delivery_time, date, is_pre_booking) VALUES ($order_id, '$customer', $persons, '$phone1', '$phone2', $shipping, '$address', $trays, '$delivery_time', '$date', 1)";
	}

	q($order_qry);

	header("Location: ../orders.php");

 ?>