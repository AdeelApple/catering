<?php session_start();
if (!isset($_SESSION['userid']))
  header("Location: login.php");



$uname = $_SESSION['uname'];
$fname = $_SESSION['fname'];
$uid = $_SESSION['userid'];
$type = $_SESSION['type'];


include "inc/build.php";
$pgnm = basename($_SERVER['PHP_SELF']);
if (access($type, $pgnm) or $pgnm == "index.php") {
} else {
  die("<center>Sorry! You have not access to this page.</center>");
}


?>
<!DOCTYPE html>
<html>

<head>
  <title>Al Mustafa Catering</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="pics/favicon.png">
  <link rel="stylesheet" type="text/css" media="print" href="css/print.css">
  <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
  <script src="bootstrap/js/popper.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="script.js"></script>

  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="bootstrap/css/fontawesome.css">
  <link rel="stylesheet" type="text/css" href="css/common.css">
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" type="text/css" href="plugin/typeahead/jquery.typeahead.min.css">


</head>

<body id="page-top" onload="ready()">
  <!-- WRAPPER START -->
  <div id="wrapper" class="wrapper <?php if (!$sb)
    echo 'pl-0'; ?>">
    <nav class="navbar navbar-expand bg-primary static-top">
      <button class="btn btn-primary text-white order-1 order-sm-0 mr-3" onclick="sidebar_tgl_session()"
        id="sidebarToggle">
        <i class="fas fa-bars"></i>
      </button>
      <a class="navbar-brand mr-1 text-light" href="index.php">
        <img src="pics/logo.png" width="30" alt="" class="img-thumbnail">
        Al Mustafa Catering
      </a>
      <!-- Navbar Search -->
      <div class="w-100 d-flex d-sm-none"></div>
      <div class="row w-100 m-0 d-none d-sm-flex">
        <div class="col p-2">
          <h6 class="text-light text-nowrap mb-0 small text-right">Welcome: <span
              class="text-uppercase font-weight-bold"><?= $fname ?></span><br>Logged as: <span
              class="text-uppercase font-weight-bold"><?= $type ?></span></h6>
        </div>
      </div>
      <!-- Navbar -->
      <ul class="navbar-nav float-right">
        <li class="nav-item dropdown no-arrow">
          <a class="btn btn-light dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <?php if ($type == "admin") { ?>
              <a class="dropdown-item" href="settings_admin.php"><i class="fa fa-user-cog"></i> Settings</a>
              <a class="dropdown-item" href="download.php"><i class="fa fa-save"></i> Download Backup File</a>
              <!-- <a class="dropdown-item" href="#">Activity Log</a> -->
              <div class="dropdown-divider"></div>
            <?php } ?>
            <a class="dropdown-item text-danger" href="do_files/do_logout.php"><i class="fa fa-power-off"></i>
              Logout</a>
          </div>
        </li>
      </ul>

    </nav>

    <!-- TOP NAVBAR END -->

    <!-- Sidebar START-->
    <?php include 'sidebar.php'; ?>
    <!-- SIDEBAR END -->



    <!-- CONTERNT CONTAINER START -->
    <div id="content-wrapper" class="content-wrapper">