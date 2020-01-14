<?php include "inc/top.php"; ?>
<div class="container-fluid border">
	<div class="row">
		<div class="col-md-12 p-0">
			<div class="row bg-light border m-0 p-2">
				<div class="col-12">
					<h4 class="">Cooking List (<span id="date-selected"></span>)</h4>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 d-print-none">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
						    <span class="input-group-text">Cooking List</span>
						</div>
						<select name="list" id="list" class="form-control" onchange="order_list_kitchen()">
							<?php $listrs = q("select * from kitchen_list where {$type}=1");
							while($li = mysqli_fetch_array($listrs)){ ?>
							<option value="<?=$li['fun']?>"><?=$li['name']?></option>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 d-print-none">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
						    <span class="input-group-text">Date</span>
						</div>
						<input type="date" id="delivery_time" onchange="order_list_kitchen()" class="form-control filter">
						<input type="hidden" id="refresh_rate" value="<?=time_interval();?>">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 d-print-none">
					<div class="input-group input-group-sm float-right mx-1">
						<div class="input-group-prepend">
							<span class="input-group-text">Weight</span>
						</div>
						<select id="weight" class="form-control" onchange="bold_font(this)">
							<option value="1">Normal</option>
							<option value="2">Bold</option>
						</select>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-12 d-print-none">
					<div class="input-group input-group-sm float-left mx-1" style="width: 65px;">
						<select id="font" class="form-control" onchange="change_font_size(this)">
							<option value="8">8</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14" selected="selected">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="18">18</option>
							<option value="18">20</option>
							<option value="22">22</option>
						</select>
					</div>
					<button onclick="window.print()" class="btn btn-sm btn-success float-left"><i class="fa fa-print"></i></button>
				</div>
			</div>
			<div id="tbl" class="row px-3 kitchen">
			</div>
		</div>
	</div>
</div>
<?php include "inc/btm.php"; ?>
<script>
order_list_kitchen();
function organize() {
	var len = $("#k-1").children().length;
	var col1 = Math.ceil(len/2);
	if(len<=2) col1 = 1;
	var col2 = $("#k-1").children().splice(col1);
	$('#k-2').append(col2);
}
</script>