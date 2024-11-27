<?php include "inc/top.php";?>
<div class="container-fluid border">
	<div class="row border bg-light p-2">
		<?php include "inc/title.php"; ?>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="row bg-light border p-2">
				<div class="col-md-8">
					<h5 class="text-success">Orders List</h5>
				</div>
				<div class="col-md-4">
					<?php include "inc/records_limit_dropdown.php"; ?>
					<a href="booking.php" class="btn btn-primary btn-sm float-right mx-1" title="Book a new order"><i class="fa fa-book"></i></a>
				</div>
			</div>
			<div class="row bg-light border p-2">
				<div class="col-md-3">
					<div class="input-group input-group-sm d-print-none">
						<div class="input-group-prepend">
						    <span class="input-group-text">Search</span>
						</div>
						<input type="search" id="search" onkeyup="filter()" class="form-control filter" placeholder="name or order-no...">
					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group input-group-sm d-print-none">
						<div class="input-group-prepend">
						    <span class="input-group-text">Total Orders</span>
						</div>
						<input type="text" id="total_order_count_input" class="form-control filter" disabled="true" placeholder="none">
					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
						    <span class="input-group-text">Phone</span>
						</div>
						<input type="text" id="phone" oninput="filter()" class="form-control filter">
					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
						    <span class="input-group-text">Date</span>
						</div>
						<input type="date" id="delivery_time" onchange="filter()" class="form-control filter">
					</div>
				</div>
			</div>
			<table id="tbl" data-fun="5100" class="table table-hover small table-bordered text-center table-responsive w-100 d-block d-md-table"></table>
		</div>
	</div>
</div>

<?php include "inc/btm.php"; ?>

<script>filter()</script>