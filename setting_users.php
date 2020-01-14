<?php include "inc/top.php"; ?>
<?php include "inc/roles.php"; ?>
<div class="container-fluid border">
	<div class="card mt-2">
		<div class="card-header">
			<h5 class="mt-1"><i class="fa fa-users-cog"></i> Users Settings <button type="button" class="btn btn-success float-right" data-toggle="modal" data-target="#usermodal">New User</button></h5>
		</div>
		<div class="card-body">
			<?php foreach ($types as $tp => $description){ ?>
			<div class="row border border rounded p-2 m-0 my-2">
				<div class="col-md-12">
					<h6 class="bg-primary text-light mb-0 p-2 text-uppercase rounded"><?=$tp?><small class="ml-4"><?=$description?></small></h6>
					<?php $rs = q("select * from users where allow=1 and type like '{$tp}' ");
					while($r = mysqli_fetch_array($rs)){ ?>
					<div class="row border m-0 py-3">
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text">Name</span>
								</div>
								<input type="text" id="fullname<?=$r['id']?>" value="<?=$r['fullname']?>" data-id="<?=$r['id']?>" data-clm="fullname" data-old="<?=$r['fullname']?>" class="price form-control">
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text">UserName</span>
								</div>
								<input type="text" id="username<?=$r['id']?>" value="<?=$r['username']?>" data-id="<?=$r['id']?>" data-clm="username" data-old="<?=$r['username']?>" class="price form-control">
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text">Passwod</span>
								</div>
								<input type="password" id="pass<?=$r['id']?>" value="<?=$r['pass']?>" data-id="<?=$r['id']?>" data-clm="pass" data-old="<?=$r['pass']?>" class="price form-control">
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text">Role</span>
								</div>
								<input type="text" id="type<?=$r['id']?>" value="<?=$r['type']?>" data-id="<?=$r['id']?>" data-clm="type" data-old="<?=$r['type']?>" class="price form-control" readonly="readonly">
							</div>
						</div>
						<div class="col-1">
							<button class="btn btn-danger btn-sm" data-id="<?=$r['id']?>" onclick="del_user(this)">Del</button>
						</div>
					</div>
					<?php } if(mysqli_num_rows($rs)<1){ ?>
					<div class="row border m-0 py-3">
						<div class="col">
							<h6 class="text-danger text-center">No user created as <?=$tp?></h6>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_users(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>
</div>


<!-- MODEL START -->


<div class="modal fade" id="usermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Creat New User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row m-0">
      		<div class="col p-2 border rounded">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Full Name</span>
					</div>
					<input type="text" id="new_fullname" data-clm="fullname" class="form-control">
				</div>
			</div>
      	</div>
      	<div class="row m-0">
      		<div class="col p-2 border rounded">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">UserName</span>
					</div>
					<input type="text" id="new_username" data-clm="username" class="form-control">
				</div>
			</div>
      	</div>
      	<div class="row m-0">
      		<div class="col p-2 border rounded">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Passwod</span>
					</div>
					<input type="password" id="new_pass" data-clm="pass" class="form-control">
				</div>
			</div>
      	</div>
      	<div class="row m-0">
      		<div class="col p-2 border rounded">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Role</span>
					</div>
					<select name="" id="new_type" data-clm="type" class="form-control">
						<?php foreach ($types as $key => $desc) { ?>
						<option value="<?=$key?>"><?=$key?></option>
						<?php } ?>
					</select>
				</div>
			</div>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="create_user(this)">Creat User</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- MODEL END -->

<?php include "inc/btm.php"; ?>
<script>
	$('.price').on('input',function(){
		$(this).attr('data-changed', '1');
		$(this).css('backgroundColor' , '#FFE5D4');
	});
	$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').trigger('focus');
	});
	
</script>