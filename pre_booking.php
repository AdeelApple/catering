<?php include "inc/top.php";

	if(isset($_GET['oid'])){
		$oid = $_GET['oid'];
		$or = frow("select * from orders where id = $oid");
	}else{
		$oid = order_no();
		$or = array('name'=>'','persons'=>0,'phone1'=>'','phone2'=>'','shipping'=>1,'address'=>'','trays'=>'','delivery_time'=>'');
	}

 ?>
<form action="do_files/do_pre_booking.php" method="post" id="booking-form">
	<div class="container-fluid border">
		<div class="row border bg-light p-2">
			<div class="col-md-4">
				<img src="pics/logo.png" width="100" alt="" class="img-thumbnail">
			</div>
			<div class="col-md-8">
				<h3 class="text-success mt-2">Al Mustafa Catering</h3>
			</div>
		</div>
		<div class="row pt-2">
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Order No.</span>
					</div>
					<input type="text" name="orderno" class="form-control" value="<?=$oid;?>" readonly="readonly">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Customer</span>
					</div>
					<input type="text" name="customer" id="customer" class="form-control" value="<?=$or['name']?>" required="required">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Persons</span>
					</div>
					<input type="number" name="persons" id="persons" value="<?=$or['persons']?>" min="15" oninput="count_tray();amount_cal();" class="form-control">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Phone 1</span>
					</div>
					<input type="text" name="phone1" id="phone1" value="<?=$or['phone1']?>" class="form-control">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Phone 2</span>
					</div>
					<input type="text" name="phone2" id="phone2" value="<?=$or['phone2']?>" class="form-control">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Trays</span>
					</div>
					<input type="number" name="trays" id="trays" min="0" value="<?=$or['trays']?>" class="form-control">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Shipping</span>
					</div>
					<select name="shipping" id="shipping" class="form-control">
						<option value="1" <?php if($or['shipping']==1) echo "selected='selected'";?>>Delivery</option>
						<option value="2" <?php if($or['shipping']==2) echo "selected='selected'";?>>Pickup</option>
					</select>
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Delivery Time</span>
					</div>
					<input type="datetime-local" id="delivery_time" name="delivery_time" class="form-control" value="<?=str_replace(' ','T',$or['delivery_time'])?>" required="required">
					<input type="hidden" id="date" name="date">
				</div>
			</div>
			<div class="col-md-4 py-1">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">Address</span>
					</div>
					<input type="text" name="address" id="address" maxlength="50" value="<?=$or['address']?>" class="form-control">
				</div>
			</div>
		</div>
		<div class="row pt-2">
			<div class="col-md-11">
				<button type="submit" id="submitbtn" class="btn btn-success float-right m-4"><i class="fa fa-save"></i> Save Pre Booking</button>
				<button type="reset" id="resetbtn" class="btn btn-info m-4"><i class="fa fa-sync"></i> Reset</button>
			</div>
		</div>
	</div>
</form>
<?php include "inc/btm.php"; ?>
<script>
	today_form_date();
</script>