<?php include "inc/top.php"; ?>
<?php
		$r = frow("select * from users where id=1");
?>
<div class="container-fluid border">
	<div class="card mt-5">
		<div class="card-header">
			<h4 class="mt-3">Administrator Settings</h4>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-6">
					<label for="user">Full Name</label>
				</div>
				<div class="col-md-6">
					<input type="text" id="fullname" class="form-control form-control-sm" value="<?=$r['fullname']?>" required="required">
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="email">Email</label>
				</div>
				<div class="col-md-6">
					<input type="email" id="email" class="form-control form-control-sm" value="<?=$r['email']?>" required="required">
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="user">User Name</label>
				</div>
				<div class="col-md-6">
					<input type="text" id="user" class="form-control form-control-sm" value="<?=$r['username']?>" required="required">
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="pass">Password</label>
				</div>
				<div class="col-md-6">
					<input type="password" id="pass" class="form-control form-control-sm" value="<?=$r['pass']?>" required="required">
				</div>
			</div>
		</div>
		<div class="card-footer">
			<button onclick="save_settings()" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>