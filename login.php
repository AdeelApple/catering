<?php session_start();   session_destroy();?>
<!DOCTYPE html>
<html>
<head>
  <title>Al Mustafa Catering</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="pics/favicon.png">
  <link rel="stylesheet" type="text/css" media="print" href="css/print.css">
  <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="bootstrap/css/font-awesome.css">
  <link rel="stylesheet" type="text/css" href="css/sb-admin.css">
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body id="page-top">
  <nav class="navbar navbar-expand bg-primary static-top">
      <a class="navbar-brand mr-1 text-light" href="">
      <img src="pics/logo.png" width="40" alt="" class="img-thumbnail">
        Al Mustafa Catering
      </a>
  </nav>

  <!-- WRAPPER START -->


<div class="container">
  <div class="card card-login mx-auto mt-5">
    <div class="card-header">Login</div>
    <div class="card-body">
      <form method="post" action="do_files/do_login.php">
        <div class="form-group">
          <div class="form-label-group">
            <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Email address" required="required">
            <label for="inputEmail">Username</label>
          </div>
        </div>
        <div class="form-group">
          <div class="form-label-group">
            <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Password" required="required">
            <label for="inputPassword">Password</label>
          </div>
        </div>
        <div class="form-group">
          <div class="checkbox">
            <label>
              <input type="checkbox" value="remember-me">
              Remember Password
            </label>
          </div>
        </div>
        <span class="text-danger small text-center d-block p-1"><?php if(isset($_GET['fail'])) echo "Wrong Username/Password"; ?></span>
        <button type="submit" class="btn btn-primary w-100">Login</button>
      </form>
      <div class="text-center">
        <a class="d-block small mt-3" href="#">Register an Account</a>
        <a class="d-block small" href="#">Forgot Password?</a>
      </div>
    </div>
  </div>
</div>



<script src="bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Core plugin JavaScript-->



<script src="js/sb-admin.js"></script>
<script src="ranges.js"></script>
<script src="script.js"></script>
<script src="ajax.js"></script>
</body>
</html>