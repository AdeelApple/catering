<?php include "inc/top.php"; ?>
<div class="container-fluid border">
	<div class="row">
		<div class="col-md-12 p-0">
			<div class="row bg-light border m-0 p-2">
				<div class="col-md-6">
					<h5 class="text-success">Weekly Meat Report (<span id="date-selected"></span>)</h5>
				</div>
				<div class="col-md-4">
					<div class="input-group input-group-sm d-print-none">
						<div class="input-group-prepend">
							<span class="input-group-text">Date</span>
						</div>
						<input type="date" id="date" onchange="ingredients()" class="form-control filter">
					</div>
				</div>
				<div class="col-md-2 d-print-none">
					<button onclick="window.print()" class="float-right btn btn-sm btn-success"><i
							class="fa fa-print"></i></button>
					<div class="input-group input-group-sm float-right mx-1" style="width: 60px;">
						<select id="font" class="form-control" onchange="change_font_size(this)">
							<option value="8">8</option>
							<option value="10">10</option>
							<option value="12" selected="selected">12</option>
							<option value="14">14</option>
							<option value="18">18</option>
							<option value="22">22</option>
						</select>
					</div>
				</div>
			</div>
			<div id="tbl" data-fun="5010">

			</div>
		</div>
	</div>
</div>
<?php include "inc/btm.php"; ?>
<script>today_form_date(); ingredients();</script>