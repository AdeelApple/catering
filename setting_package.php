<?php include "inc/top.php"; ?>
<?php
		$r = frow("select * from users where id=1");
?>
<div class="container-fluid border">
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-dollar-sign"></i> Package Prices Settings</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_packages");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row m-0">
				<div class="col-md-4 border border rounded p-2">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-8 border border rounded p-2">
					<div class="row">
						<div class="col-4">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Price</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="price<?=$r['id']?>" value="<?=$r['price']?>" data-id="<?=$r['id']?>" data-clm="price" data-old="<?=$r['price']?>" class="price form-control">
							</div>
						</div>
						<div class="col-8"></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_package_prices(this)" class="btn btn-success float-right">Save Package Prices</button>
		</div>
	</div>
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-dollar-sign"></i> Extra Prices Settings</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_package_items where is_extra = 1");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row m-0">
				<div class="col-md-4 border border rounded p-2">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-8 border border rounded p-2">
					<div class="row">
						<div class="col-4">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Price</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="extra_price<?=$r['id']?>" value="<?=$r['extra_price']?>" data-id="<?=$r['id']?>" data-clm="extra_price" data-old="<?=$r['extra_price']?>" class="extra_price form-control">
							</div>
						</div>
						<div class="col-8"></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_extra_prices(this)" class="btn btn-success float-right">Save Extra Prices</button>
		</div>
	</div>
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-dollar-sign"></i> Package Custom Selection Settings</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_cat where edit_none=1");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row m-0">
				<div class="col-md-4 border border rounded p-2">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-8 border border rounded p-2">
					<div class="row">
						<div class="col-4">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-danger text-light">Deduct</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="none<?=$r['id']?>" value="<?=$r['none']?>" data-id="<?=$r['id']?>" data-clm="none" data-old="<?=$r['none']?>" class="none form-control">
							</div>
						</div>
						<div class="col-8"></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_package_deductions(this)" class="btn btn-success float-right">Save Deductions</button>
		</div>
	</div>
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-layer-group"></i> Package Trays Ranges</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_cat where pp=0");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row">
				<div class="col-md-2 border rounded p-2 m-0">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-10 border rounded p-2 m-0">
					<div class="row">
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">sm</span>
								</div>
								<div class="input-group-prepend">
								    <span class="input-group-text">min</span>
								</div>
								<input type="number" min="0" step="any" id="sm_min<?=$r['id']?>" value="<?=$r['sm_min']?>" data-id="<?=$r['id']?>" data-clm="sm_min" data-old="<?=$r['sm_min']?>" class="tray_range form-control">
								<div class="input-group-prepend">
								    <span class="input-group-text">max</span>
								</div>
								<input type="number" min="0" step="any" id="sm_max<?=$r['id']?>" value="<?=$r['sm_max']?>" data-id="<?=$r['id']?>" data-clm="sm_max" data-old="<?=$r['sm_max']?>" class="tray_range form-control">
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">md</span>
								</div>
								<div class="input-group-prepend">
								    <span class="input-group-text">min</span>
								</div>
								<input type="number" min="0" step="any" id="md_min<?=$r['id']?>" value="<?=$r['md_min']?>" data-id="<?=$r['id']?>" data-clm="md_min" data-old="<?=$r['md_min']?>" class="tray_range form-control">
								<div class="input-group-prepend">
								    <span class="input-group-text">max</span>
								</div>
								<input type="number" min="0" step="any" id="md_max<?=$r['id']?>" value="<?=$r['md_max']?>" data-id="<?=$r['id']?>" data-clm="md_max" data-old="<?=$r['md_max']?>" class="tray_range form-control">
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">lg</span>
								</div>
								<div class="input-group-prepend">
								    <span class="input-group-text">min</span>
								</div>
								<input type="number" min="0" step="any" id="lg_min<?=$r['id']?>" value="<?=$r['lg_min']?>" data-id="<?=$r['id']?>" data-clm="lg_min" data-old="<?=$r['lg_min']?>" class="tray_range form-control">
								<div class="input-group-prepend">
								    <span class="input-group-text">max</span>
								</div>
								<input type="number" min="0" step="any" id="lg_max<?=$r['id']?>" value="<?=$r['lg_max']?>" data-id="<?=$r['id']?>" data-clm="lg_max" data-old="<?=$r['lg_max']?>" class="tray_range form-control">
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_tray_ranges(this)" class="btn btn-success float-right">Save Ranges</button>
		</div>
	</div>


	<!-- Pot Meat Rice Limits -->
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-hockey-puck"></i> Package Pot Meat And Rice Limits</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_package_items left join mr_limits on mr_limit_id = mr_limits.id where is_meat_cal=1 or is_rice_cal=1;");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row">
				<div class="col-md-4 border rounded p-2 m-0">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-8 border rounded p-2 m-0">
					<div class="row">
						<div class="col">
							<div class="input-group input-group-sm">
								<?php if($r['is_meat_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Meat Limit</span>
								</div>
								<input type="number" min="0" step="any" id="meat_limit<?=$r['id']?>" value="<?=$r['meat_limit']?>" data-id="<?=$r['id']?>" data-clm="meat_limit" data-old="<?=$r['meat_limit']?>" class="mr_limit form-control">
								<div class="input-group-append">
								    <span class="input-group-text">KG</span>
								</div>
								<?php } if($r['is_rice_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-primary text-light">Rice Limit</span>
								</div>
								<input type="number" min="0" step="any" id="rice_limit<?=$r['id']?>" value="<?=$r['rice_limit']?>" data-id="<?=$r['id']?>" data-clm="rice_limit" data-old="<?=$r['rice_limit']?>" class="mr_limit form-control">
								<div class="input-group-append">
								    <span class="input-group-text">KG</span>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_package_mr_limit(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>

	<!-- Pot Meat Rice -->
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-bone"></i> Package Tray Meat And Rice</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_package_items left join mr_limits on mr_limit_id = mr_limits.id where is_meat_cal=1 or is_rice_cal=1 order by is_meat_cal desc;");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row">
				<div class="col-md-2 border rounded p-2 m-0">
					<span class="text-capitalize"><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-10 border rounded p-2 m-0">
					<div class="row">
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">lg</span>
								</div>
								<?php if($r['is_meat_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-primary text-light">meat</span>
								</div>
								<input type="number" min="0" step="any" id="meat_lg<?=$r['id']?>" value="<?=$r['meat_lg']?>" data-id="<?=$r['id']?>" data-clm="meat_lg" data-old="<?=$r['meat_lg']?>" class="mr form-control">
								<?php } if($r['is_rice_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-info text-light">rice</span>
								</div>
								<input type="number" min="0" step="any" id="rice_lg<?=$r['id']?>" value="<?=$r['rice_lg']?>" data-id="<?=$r['id']?>" data-clm="rice_lg" data-old="<?=$r['rice_lg']?>" class="mr form-control">
								<?php } ?>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">md</span>
								</div>
								<?php if($r['is_meat_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-primary text-light">meat</span>
								</div>
								<input type="number" min="0" step="any" id="meat_md<?=$r['id']?>" value="<?=$r['meat_md']?>" data-id="<?=$r['id']?>" data-clm="meat_md" data-old="<?=$r['meat_md']?>" class="mr form-control">
								<?php } if($r['is_rice_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-info text-light">rice</span>
								</div>
								<input type="number" min="0" step="any" id="rice_md<?=$r['id']?>" value="<?=$r['rice_md']?>" data-id="<?=$r['id']?>" data-clm="rice_md" data-old="<?=$r['rice_md']?>" class="mr form-control">
								<?php } ?>
							</div>
						</div>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">sm</span>
								</div>
								<?php if($r['is_meat_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-primary text-light">meat</span>
								</div>
								<input type="number" min="0" step="any" id="meat_sm<?=$r['id']?>" value="<?=$r['meat_sm']?>" data-id="<?=$r['id']?>" data-clm="meat_sm" data-old="<?=$r['meat_sm']?>" class="mr form-control">
								<?php } if($r['is_rice_cal']){ ?>
								<div class="input-group-prepend">
								    <span class="input-group-text bg-info text-light">rice</span>
								</div>
								<input type="number" min="0" step="any" id="rice_sm<?=$r['id']?>" value="<?=$r['rice_sm']?>" data-id="<?=$r['id']?>" data-clm="rice_sm" data-old="<?=$r['rice_sm']?>" class="mr form-control">
								<?php } ?>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_package_mr(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>

	<!-- Manual Sweet Tray Qty String -->
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-hockey-puck"></i> Manual Sweet Trays</h4>
		</div>
		<div class="card-body" id="qty_strings">
			<?php $rs = q("select * from manual_sweet_trays");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row record">
				<div class="col-md-3 border rounded p-2 m-0 new_qty_people">
					<span class="text-capitalize"><strong><?=$r['people']?></strong></span>
				</div>
				<div class="col-md-8 border rounded p-2 m-0">
					<div class="row">
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">QTY String</span>
								</div>
								<input type="string" id="qty_string<?=$r['id']?>" value="<?=$r['qty_string']?>" data-id="<?=$r['id']?>" data-clm="qty_string" data-old="<?=$r['qty_string']?>" class="qty_string form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1 border rounded p-2 m-0">
					<div class="row">
						<div class="col">
							<button onclick="del_manual_tray_calc_record(this)" data-id="<?=$r['id'];?>" class="btn btn-sm btn-danger del-btn"><i class="fa fa-xs fa-trash"></i></button>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_package_manual_qty_string(this)" class="btn btn-success float-right">Save Changes</button>
			<button onclick="add_manual_sweet_qty_string()" class="btn btn-primary float-right mr-2">Add New</button>
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>
<script>
	$('.price,.none,.extra_price,.tray_range, .mr, .mr_limit, .qty_string').on('input',function(){
		$(this).attr('data-changed', '1');
		$(this).css('backgroundColor' , '#FFE5D4');
	});
	
</script>
<script>
	function add_manual_sweet_qty_string(){
		var lastChild = $('#qty_strings').children().last().clone();
		lastChild.find('input').val('');
		lastChild.find('input').attr('data-id', 'new');
		lastChild.find('.del-btn').attr('data-id', 'new');
		oldPeopleValue = lastChild.find('.new_qty_people strong').html();
		oldPeopleValue1 = lastChild.find('.new_qty_people input').val();
		newPeopleValue = parseInt(oldPeopleValue || oldPeopleValue1) + 5;
		newInput = `<input type="number" step="5" class="form-control form-control-sm qty-people" name="new_people" value="${newPeopleValue}" placeholder="Enter people">`;
		lastChild.find('.new_qty_people').html(newInput);
		$('#qty_strings').append(lastChild);
		
	}
</script>