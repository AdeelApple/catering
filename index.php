<?php include "inc/top.php"; ?>
<div class="container-fluid border">
	<div class="col-md-12">
		<!-- Icon Cards-->
		<div class="row p-5">
			<?php $rs = q("select * from home_cards where {$type} = 1");
			while ($r = mysqli_fetch_array($rs)) { ?>
				<div class="col-xl-3 col-sm-6 mb-3">
		    <div class="card text-white <?=$r['bg']?> o-hidden h-100">
		      <div class="card-body">
		        <div class="card-body-icon">
								<i class="<?= $r['icon'] ?>"></i>
							</div>
							<div class="mr-5"><?= $r['text'] ?> 	<?= $r['name'] ?></div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="<?= $r['link'] ?>">
							<span class="float-left"><?= $r['title'] ?></span>
							<span class="float-right">
								<i class="fas fa-angle-right"></i>
							</span>
						</a>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>
<script>$('#orders').html("<?= total_rec('orders') ?>");</script>
<?php include "inc/btm.php"; ?>