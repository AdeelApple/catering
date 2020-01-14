<?php include "inc/top.php"; ?>
<?php include "inc/roles.php"; ?>
<div class="container-fluid border">
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-users-cog"></i> Role Privileges</h4>
		</div>
		<div class="card-body">
			<div class="row m-0 my-2">
				<div class="col-md-12">
					<h6 class="bg-primary text-light mb-0 p-2 text-uppercase rounded">Side Pages</h6>
					<?php $rs = q("select * from sidebar where super!=1");
					while($r = mysqli_fetch_array($rs)){ ?>
					<div class="row border m-0 py-1">
						<div class="col">
							<h6 class=""><?=$r['name']?></h6>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Manager</span>
								</div>
								<input type="checkbox" id="manager<?=$r['id']?>" value="<?=$r['manager']?>" data-id="<?=$r['id']?>" data-clm="manager" class="form-control mt-2" data-tbl="sidebar" onchange="update_privileges(this)" <?=chk($r['manager']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Operator</span>
								</div>
								<input type="checkbox" id="operator<?=$r['id']?>" value="<?=$r['operator']?>" data-id="<?=$r['id']?>" data-clm="operator" class="form-control mt-2" data-tbl="sidebar" onchange="update_privileges(this)" <?=chk($r['operator']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Chef</span>
								</div>
								<input type="checkbox" id="chef<?=$r['id']?>" value="<?=$r['chef']?>" data-id="<?=$r['id']?>" data-clm="chef" class="form-control mt-2" data-tbl="sidebar" onchange="update_privileges(this)" <?=chk($r['chef']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Tondoor</span>
								</div>
								<input type="checkbox" id="tandoor<?=$r['id']?>" value="<?=$r['tandoor']?>" data-id="<?=$r['id']?>" data-clm="tandoor" class="form-control mt-2" data-tbl="sidebar" onchange="update_privileges(this)" <?=chk($r['tandoor']); ?>>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<div class="row m-0 my-2">
				<div class="col-md-12">
					<h6 class="bg-primary text-light mb-0 p-2 text-uppercase rounded">Sub_Side Pages</h6>
					<?php $rs = q("select * from sub_sidebar");
					while($r = mysqli_fetch_array($rs)){ ?>
					<div class="row border m-0 py-1">
						<div class="col">
							<h6 class=""><?=$r['name']?></h6>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Manager</span>
								</div>
								<input type="checkbox" id="manager<?=$r['id']?>" value="<?=$r['manager']?>" data-id="<?=$r['id']?>" data-clm="manager" class="form-control mt-2" data-tbl="sub_sidebar" onchange="update_privileges(this)" <?=chk($r['manager']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Operator</span>
								</div>
								<input type="checkbox" id="operator<?=$r['id']?>" value="<?=$r['operator']?>" data-id="<?=$r['id']?>" data-clm="operator" class="form-control mt-2" data-tbl="sub_sidebar" onchange="update_privileges(this)" <?=chk($r['operator']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Chef</span>
								</div>
								<input type="checkbox" id="chef<?=$r['id']?>" value="<?=$r['chef']?>" data-id="<?=$r['id']?>" data-clm="chef" class="form-control mt-2" data-tbl="sub_sidebar" onchange="update_privileges(this)" <?=chk($r['chef']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Tondoor</span>
								</div>
								<input type="checkbox" id="tandoor<?=$r['id']?>" value="<?=$r['tandoor']?>" data-id="<?=$r['id']?>" data-clm="tandoor" class="form-control mt-2" data-tbl="sub_sidebar" onchange="update_privileges(this)" <?=chk($r['tandoor']); ?>>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<div class="row m-0 my-2">
				<div class="col-md-12">
					<h6 class="bg-primary text-light mb-0 p-2 text-uppercase rounded">Kitchen List</h6>
					<?php $rs = q("select * from kitchen_list");
					while($r = mysqli_fetch_array($rs)){ ?>
					<div class="row border m-0 py-1">
						<div class="col">
							<h6 class=""><?=$r['name']?></h6>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Manager</span>
								</div>
								<input type="checkbox" id="manager<?=$r['id']?>" value="<?=$r['manager']?>" data-id="<?=$r['id']?>" data-clm="manager" class="form-control mt-2" data-tbl="kitchen_list" onchange="update_privileges(this)" <?=chk($r['manager']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Operator</span>
								</div>
								<input type="checkbox" id="operator<?=$r['id']?>" value="<?=$r['operator']?>" data-id="<?=$r['id']?>" data-clm="operator" class="form-control mt-2" data-tbl="kitchen_list" onchange="update_privileges(this)" <?=chk($r['operator']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Chef</span>
								</div>
								<input type="checkbox" id="chef<?=$r['id']?>" value="<?=$r['chef']?>" data-id="<?=$r['id']?>" data-clm="chef" class="form-control mt-2" data-tbl="kitchen_list" onchange="update_privileges(this)" <?=chk($r['chef']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Tondoor</span>
								</div>
								<input type="checkbox" id="tandoor<?=$r['id']?>" value="<?=$r['tandoor']?>" data-id="<?=$r['id']?>" data-clm="tandoor" class="form-control mt-2" data-tbl="kitchen_list" onchange="update_privileges(this)" <?=chk($r['tandoor']); ?>>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
			<div class="row m-0 my-2">
				<div class="col-md-12">
					<h6 class="bg-primary text-light mb-0 p-2 text-uppercase rounded">Home Cards</h6>
					<?php $rs = q("select * from home_cards");
					while($r = mysqli_fetch_array($rs)){ ?>
					<div class="row border m-0 py-1">
						<div class="col">
							<h6 class=""><?=$r['name']?></h6>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Manager</span>
								</div>
								<input type="checkbox" id="manager<?=$r['id']?>" value="<?=$r['manager']?>" data-id="<?=$r['id']?>" data-clm="manager" class="form-control mt-2" data-tbl="home_cards" onchange="update_privileges(this)" <?=chk($r['manager']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Operator</span>
								</div>
								<input type="checkbox" id="operator<?=$r['id']?>" value="<?=$r['operator']?>" data-id="<?=$r['id']?>" data-clm="operator" class="form-control mt-2" data-tbl="home_cards" onchange="update_privileges(this)" <?=chk($r['operator']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Chef</span>
								</div>
								<input type="checkbox" id="chef<?=$r['id']?>" value="<?=$r['chef']?>" data-id="<?=$r['id']?>" data-clm="chef" class="form-control mt-2" data-tbl="home_cards" onchange="update_privileges(this)" <?=chk($r['chef']); ?>>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm border rounded">
								<div class="input-group-prepend">
								    <span class="input-group-text">Tondoor</span>
								</div>
								<input type="checkbox" id="tandoor<?=$r['id']?>" value="<?=$r['tandoor']?>" data-id="<?=$r['id']?>" data-clm="tandoor" class="form-control mt-2" data-tbl="home_cards" onchange="update_privileges(this)" <?=chk($r['tandoor']); ?>>
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<div class="card-footer">
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>
<script>
	$('.price').on('input',function(){
		$(this).attr('data-changed', '1');
		$(this).css('backgroundColor' , '#FFE5D4');
	});
	
	
</script>