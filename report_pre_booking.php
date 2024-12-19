<?php include "inc/top.php"; ?>
<div class="container-fluid border">
	<div class="row">
		<div class="col-md-12">
			<div class="row bg-light border p-2">
				<div class="col-md-4">
					<h5 class="text-success mb-0">Pre-Bookings Report</h5>
				</div>
				<div class="col-md-8 d-print-none">
					<?php include 'inc/font_settings.php'; ?>
				</div>
			</div>
			<div class="row bg-light border p-2">
				<div class="col-md-6">
					<small id="report-title" class="h6 text-muted"></small>
				</div>
				<div class="col-md-3"></div>
				<div class="col-md-3">
					<div class="input-group input-group-sm d-print-none">
						<div class="input-group-prepend">
						    <span class="input-group-text">Date</span>
						</div>
						<input type="date" id="date" onchange="prebooking_report()" class="form-control filter">
					</div>
				</div>
			</div>
			<div id="tbl" data-fun="8500"></div>
		</div>
	</div>
</div>


<?php include "inc/btm.php"; ?>
<script>
today_form_date();
prebooking_report();
</script>