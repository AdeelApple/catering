<?php include "inc/top.php"; ?>
<?php
		$r = frow("select * from users where id=1");
?>
<div class="container-fluid border">
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-dollar-sign"></i> Custom Prices Settings</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_custom_items");
			while($r = mysqli_fetch_array($rs)){ ?>
			<div class="row border border rounded p-2 m-0">
				<div class="col-md-4">
					<span><strong><?=$r['name']?></strong></span>
				</div>
				<div class="col-md-8">
					<div class="row">
						<?php if($r['pp']){ ?>
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
						<?php }else{ ?>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Larg</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="lg_price<?=$r['id']?>" value="<?=$r['lg_price']?>" data-id="<?=$r['id']?>" data-clm="lg_price" data-old="<?=$r['lg_price']?>" class="price form-control">
							</div>
						</div>
						<?php if($r['food_custom']!=200){ ?>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Med</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="md_price<?=$r['id']?>" value="<?=$r['md_price']?>" data-id="<?=$r['id']?>" data-clm="md_price" data-old="<?=$r['md_price']?>" class="price form-control">
							</div>
						</div>
						<?php } ?>
						<div class="col">
							<div class="input-group input-group-sm">
								<div class="input-group-prepend">
								    <span class="input-group-text bg-success text-light">Small</span>
								    <span class="input-group-text">$</span>
								</div>
								<input type="number" min="0" step="any" id="sm_price<?=$r['id']?>" value="<?=$r['sm_price']?>" data-id="<?=$r['id']?>" data-clm="sm_price" data-old="<?=$r['sm_price']?>" class="price form-control">
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_custom_prices(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>

	<!-- Pot Meat Rice Limits -->
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-hockey-puck"></i> Custom Pot Meat And Rice Limits</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_custom_items left join mr_limits on mr_limits = mr_limits.id where is_meat_cal=1 or is_rice_cal=1;");
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
			<button onclick="update_custom_mr_limit(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>

	<!-- Pot Meat Rice Limits -->
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-bone"></i> Custom Tray Meat And Rice</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from food_custom_items left join mr_limits on mr_limits = mr_limits.id where is_meat_cal=1 or is_rice_cal=1 order by is_meat_cal desc;");
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
			<button onclick="update_custom_mr(this)" class="btn btn-success float-right">Save Changes</button>
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>
<script>
	$('.price, .mr, .mr_limit').on('input',function(){
		$(this).attr('data-changed', '1');
		$(this).css('backgroundColor' , '#FFE5D4');
	});
	
	
</script>