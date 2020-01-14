<?php include "inc/top.php"; ?>
<?php
		$r = frow("select * from users where id=1");
?>
<div class="container-fluid border">
	<div class="card mt-2">
		<div class="card-header bg-success text-light">
			<h4 class="mt-1"><i class="fa fa-tools"></i> General Settings</h4>
		</div>
		<div class="card-body">
			<?php $rs = q("select * from settings");
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
								    <span class="input-group-text bg-success text-light">Value</span>
								</div>
								<input type="number" min="0" step="any" id="value1<?=$r['id']?>" value="<?=$r['value1']?>" data-id="<?=$r['id']?>" data-clm="value1" data-old="<?=$r['value1']?>" class="value form-control">
								<div class="input-group-append">
								    <span class="input-group-text">Sec</span>
								</div>
							</div>
						</div>
						<div class="col-8"></div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<div class="card-footer">
			<button onclick="update_general_settings(this)" class="btn btn-success float-right">Save Settings</button>
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>
<script>
	$('.value').on('input',function(){
		$(this).attr('data-changed', '1');
		$(this).css('backgroundColor' , '#FFE5D4');
	});
	
</script>