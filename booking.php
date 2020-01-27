<?php include "inc/top.php"; ?>
<form action="do_files/do_booking.php" method="post" id="booking-form">
<div class="container-fluid border">
	<div class="row border bg-light p-2">
		<div class="col-md-4">
			<img src="pics/logo.png" width="100" alt="" class="img-thumbnail">
		</div>
		<div class="col-md-8">
			<h3 class="text-success mt-2">Al Mustafa Catering</h3>
		</div>
	</div>
	<div class="row mt-2">
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Order No.</span>
				</div>
				<input type="text" name="orderno" class="form-control" value="<?php echo order_no() ?>" disabled="disabled">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Customer</span>
				</div>
				<input type="text" name="customer" id="customer" class="form-control" value="" required="required">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Persons</span>
				</div>
				<input type="number" name="persons" id="persons" value="25" min="25" oninput="count_tray();amount_cal();" class="form-control">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Phone 1</span>
				</div>
				<input type="text" name="phone1" id="phone1" value="" class="form-control">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Phone 2</span>
				</div>
				<input type="text" name="phone2" id="phone2" value="" class="form-control">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Address</span>
				</div>
				<input type="text" name="address" id="address" maxlength="50" class="form-control">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Shipping</span>
				</div>
				<select name="shipping" id="shipping" class="form-control">
					<option value="2">Pickup</option>
					<option value="1">Delivery</option>
				</select>
				<!-- <input type="datetime-local" id="pickup_time" name="pickup_time" class="form-control" value="" required="required"> -->
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Date & Time</span>
				</div>
				<input type="datetime-local" id="delivery_time" name="delivery_time" class="form-control" value="" required="required">
				<input type="hidden" id="date" name="date">
			</div>
		</div>
		<div class="col-md-4 py-1">
			<div class="input-group input-group-sm">
				<div class="input-group-prepend">
				    <span class="input-group-text">Remarks</span>
				</div>
				<input type="text" name="remark" id="remark" maxlength="50" class="form-control">
			</div>
		</div>
	</div>
	<hr>


	<!-- FOOD PACKAGES -->

	<?php 
		$rs = q("select * from food_main");
		$i=1;
		while($r = mysqli_fetch_array($rs))
		{
			$id = $r['id'];
			if($r['open']==1){
				$pkgval = 1;	$show = 'show';
				$dshow = '1';	$dis = "";
			}else{
				$pkgval = 0;	$show = '';
				$dshow = '0';	$dis = "disabled='disabled'";
			}
	 ?>	
	<h4 class="bg-success text-light text-center rounded">
		<button class="btn btn-success w-100" type="button" onclick="select_pkg(this)" data-toggle="collapse" data-target="#package<?=$i?>" aria-expanded="false" aria-controls="package<?=$i?>" data-pkg="#pkg<?=$i?>"><?=$r['name']?></button>
	</h4>
	<input type="hidden" name="pkgid[]" value="<?=$id?>">
	<input type="hidden" name="pkg[]" id="pkg<?=$i?>" value="<?=$pkgval?>">
	
	<div id="package<?=$i?>" class="row pkgs collapse <?=$show?>" data-show="<?=$dshow?>">
		<div class="col-md-12">
			<div class="form-row my-1">
				<div class="col-md-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<span class="input-group-text">Select</span>
						</div>
						<select class="form-control pkg" data-pkg="<?=$id?>" data-pkgprice_id="#pkgprice<?=$id?>" data-body="#tbody<?=$i?>" data-id="<?=$id?>" name="pkg_selected<?=$id;?>" onchange="fetch_pkg(this)" required="required" <?=$dis;?>>
							<option value="">Package</option>
							<?php  $qry="select id, name from food_packages where food_main =".$r['id'];
								options($qry); ?>
						</select>
					</div>
				</div>
				<div class="col-md-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<span class="input-group-text">Price/Person</span>
						</div>
						<input type="number" name="pkgprice<?=$id?>" id="pkgprice<?=$id?>" step="any" oninput="amount_cal()" class="form-control form-control-sm pkgprice" value="0.00">
					</div>
				</div>
				<div class="col-md-6">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<span class="input-group-text">Comment</span>
						</div>
						<input type="text" name="pkgcmt<?=$id?>" id="pkgcmt" class="form-control" placeholder="Extra comment">
					</div>
				</div>
			</div>
			
			<table id="t1" class="table table-hover small table-responsive table-bordered text-center w-100">
				<thead>
					<tr>
						<th width="4%">No.</th>
						<th width="15%">Category</th>
						<th width="20%">Items</th>
						<th width="5%">V.Mild</th>
						<th width="5%">Mild</th>
						<th width="5%">Spicy</th>
						<th width="5%">L</th>
						<th width="5%">M</th>
						<th width="5%">S</th>
						<th width="25%">Comment</th>
					</tr>
				</thead>
				<tbody id="tbody<?=$i?>">
					
				</tbody>
			</table>
		</div>
	</div>

	<?php $i++; } 



	// CUSTOM OFFERS


		$i = 1;
		$rs = q("select * from food_custom");
		while($r = mysqli_fetch_array($rs)){
		$id = $r['id'];
		
		if($r['open']==1){

			$pkgval = 1; $show = 'show';
			$dshow = '1'; $dis = "";
		}else{
			$pkgval = 0;	$show = '';
			$dshow = '0';	$dis = " disabled='disabled'";
		}
	 ?>

	<h4 class="bg-success text-light rounded">
		<button class="btn btn-success w-100" type="button" onclick="select_pkg(this)" data-toggle="collapse" data-target="#custom<?=$i?>" aria-expanded="false" aria-controls="custom<?=$i?>" data-pkg="#ctm<?=$i?>"><?=$r['name']?></button>
	</h4>
	<input type="hidden" name="ctm[]" id="ctm<?=$i?>" value="0">
	<input type="hidden" name="ctmid[]" value="<?=$id?>">


	<div id="custom<?=$i?>" class="row cstm collapse <?=$show?>" data-show="<?=$dshow?>">
		<div class="col-md-12">	
			<table id="t1" class="table table-hover small table-responsive table-bordered text-center w-100">
				<thead>
					<tr>
						<th width="4%">Mark</th>
						<th width="18%">Items List</th>
						<th width="4%">V.Mild</th>
						<th width="4%">Mild</th>
						<th width="4%">Spicy</th>
						<th width="4%">L</th>
						<?php if($id!=200){ ?>
						<th width="4%">M</th>
						<?php } ?>
						<th width="4%">S</th>
						<th width="11%">Total</th>
						<th width="11%">D.total</th>
						<th width="20%">Comment</th>
					</tr>
				</thead>
				<tbody id="tbody<?=$i?>">
					<?php $n=1;
					$c_items_rs = q("select * from food_custom_items where food_custom = $id");
					while($ci = mysqli_fetch_array($c_items_rs)){ $iid = $ci['id']; $cit = $ci['name'];
					?>
					<tr>
						<td>
							<label for="mark<?=$id.$iid?>">
								<input type="hidden" name="ctmiid<?=$id?>[]" value="<?=$iid?>">
								<input type="hidden" name="ctm_pp<?=$id.$iid?>" value="<?=$ci['pp']?>">
								<input type="hidden" name="ctm_list<?=$id.$iid?>" value="<?=$ci['list']?>">
								<input type="checkbox" id="mark<?=$id.$iid?>" class="mark" onchange="mark(this)" name="mark<?=$id?>[<?=$n-1?>]">
							</label>
						</td>
						<td class="text-left"><strong class="px-2"><?=$ci['name']?></strong><input type="hidden" value="<?=$ci['name']?>"><input type="hidden" name="ctm_item<?=$id.$iid?>" value="<?=$ci['id']?>"></td>
						<td>
							<label for="spicea_ctm<?=$id.$iid?>">
								<input type="radio" id="spicea_ctm<?=$id.$iid?>" name="spice_ctm<?=$id.$iid?>" value="1">
							</label>
						</td>
						<td>
							<label for="spiceb_ctm<?=$id.$iid?>">
								<input type="radio" id="spiceb_ctm<?=$id.$iid?>" name="spice_ctm<?=$id.$iid?>" value="2">
							</label>
						</td>
						<td>
							<label for="spicec_ctm<?=$id.$iid?>">
								<input type="radio" id="spicec_ctm<?=$id.$iid?>" name="spice_ctm<?=$id.$iid?>" value="3">
							</label>
						</td>


						<!-- TRAY ITEMS -->
						<?php if(!$ci['pp']){ ?>
						<td class="ctm_tray_price">
							<input type="number" id="tray_lg_ctm<?=$id.$iid?>" class="item-qty form-control form-control-sm" name="tray_lg_ctm<?=$id.$iid?>" value="0" min="0" oninput="ctm_total(this)" readonly="readonly">
							<!-- price -->
							<input type="hidden" name="lg_price<?=$id.$iid?>" class="price" value="<?=$ci['lg_price']?>">
						</td>
						<?php if($id!=200){?>
						<td class="ctm_tray_price">
							<input type="number" id="tray_md_ctm<?=$id.$iid?>" class="item-qty form-control form-control-sm" name="tray_md_ctm<?=$id.$iid?>" value="0" min="0" oninput="ctm_total(this)" readonly="readonly">
							<!-- price -->
							<input type="hidden" name="md_price<?=$id.$iid?>" class="price" value="<?=$ci['md_price']?>">
						</td>
						<?php } ?>
						<td class="ctm_tray_price">
							<input type="number" id="tray_sm_ctm<?=$id.$iid?>" class="item-qty form-control form-control-sm" name="tray_sm_ctm<?=$id.$iid?>" value="0" min="0" oninput="ctm_total(this)" readonly="readonly">
							<!-- price -->
							<input type="hidden" name="sm_price<?=$id.$iid?>" class="price" value="<?=$ci['sm_price']?>">
						</td>
						<?php }else{ ?>

						<!-- PER SERVING ITEMS -->
						<td><strong>QTY:</strong></td>
						<td colspan="2" class="ctm_tray_price">
							<input type="number" name="ctm_qty<?=$id.$iid?>" id="ctm_qty<?=$id.$iid?>" class="item item-qty form-control form-control-sm" min="0" value="0" oninput="ctm_pp_total(this)" readonly="readonly">
							<input type="hidden" name="ps_price<?=$id.$iid?>" class="price" value="<?=$ci['price']?>">
						</td>
						<?php } ?>


						<td class="ctm_total_and_persons">
							<input type="number" name="total_price_ctm<?=$id.$iid?>" id="ctm_total_price<?=$id.$iid?>" class="tray ctm_total_price" step="any" data-active="0" value="0.00" readonly="readonly">
						</td>
						<td>
							<input type="number" name="d_total_price_ctm<?=$id.$iid?>" class="d_ctm_total_price form-control form-control-sm" min="0" step="any" value="0.00" data-active="0" oninput="amount_cal()">
						</td>
						<td><input type="text" name="comment_ctm<?=$id.$iid?>" id="comment_ctm<?=$id.$iid?>" class="form-control form-control-sm">
							<input type="hidden" name="list<?=$id.$iid?>" class="list_num" value="<?=$ci['list']?>"></td>
					</tr>
					<?php $n++; } ?>
				</tbody>
			</table>
		</div>
	</div>

	<?php $i++; } ?>












<?php 

	// full_custom OFFERS


		$i = 1;
		$rs = q("select * from food_full_custom");
		while($r = mysqli_fetch_array($rs)){
		$id = $r['id'];
		
		if($r['open']==1){

			$pkgval = 1; $show = 'show';
			$dshow = '1'; $dis = "";
		}else{
			$pkgval = 0;	$show = '';
			$dshow = '0';	$dis = " disabled='disabled'";
		}
	 ?>

	<h4 class="bg-success text-light rounded">
		<button class="btn btn-success w-100" type="button" onclick="select_pkg(this)" data-toggle="collapse" data-target="#full_custom<?=$i?>" aria-expanded="false" aria-controls="full_custom<?=$i?>" data-pkg="#fullctm<?=$i?>"><?=$r['name']?></button>
	</h4>
	<input type="hidden" name="fullctm[]" id="fullctm<?=$i?>" value="0">
	<input type="hidden" name="fullctmid[]" value="<?=$id?>">


	<div id="full_custom<?=$i?>" class="row fullctm collapse <?=$show?>" data-show="<?=$dshow?>">
		<div class="col-md-12">	
			<?php $iid = "row1";

			?>
			<table id="t1" class="table table-hover small table-responsive table-bordered text-center w-100">
				<thead>
					<tr>
						<th width="3%"><i class="fa fa-plus btn btn-success btn-sm" data-rows="2" onclick="create_fullctm(this)"></i></th>
						<th width="14%">Recipe</th>
						<th width="9%">Type&List</th>
						<th width="9%">Meat</th>
						<th width="3%">V.Mild</th>
						<th width="3%">Mild</th>
						<th width="3%">Spicy</th>
						<th width="5%">PP</th>
						<th width="5%">L</th>
						<th width="5%">M</th>
						<th width="5%">S</th>
						<th width="16%" colspan="3">Prices(L-M-S)</th>
						<th width="6%">Total</th>
						<th width="14%">Comment</th>
					</tr>
				</thead>
				<tbody>
					<tr class="fullctm_row">
						<td>
							<i class="fa fa-times btn btn-danger btn-sm delbtn d-none" onclick="del_fullctm(this)"></i>
							<input type="hidden" name="fullctmiid<?=$id?>[]" class="fullctmiid" value="<?=$iid?>">
						</td>
						<td class="text-left">
							<input type="text" name="fullctm_name<?=$id.$iid?>" class="fullctm_name addiid emp form-control form-control-sm" oninput="fullctm_named(this)" placeholder="New Recipe..." required="required" <?=$dis?>>
						</td>
						<!-- Type And Kitchen List -->
						<td>
							<select name="fullctm_pp<?=$id.$iid?>" class="pp addiid form-control form-control-sm" onchange="fullctm_changed(this);" <?=$dis?>>
								<option value="0">Trays</option>
								<option value="1">Per Serving</option>
							</select>
							<select name="fullctm_list<?=$id.$iid?>" class="list addiid form-control form-control-sm" <?=$dis?>>
								<?php options("select list,name from kitchen_list where custom=1 order by rank"); ?>
							</select>
						</td>
						<!-- Meat and Type -->
						<td>
							<select name="fullctm_mr_cal<?=$id.$iid?>" class="mrcal addiid form-control form-control-sm" <?=$dis?>>
								<option value="none">none</option>
								<?php options("select mr_cal,food_package_items.name,food_cat.name from food_package_items left join food_cat on food_cat_id=food_cat.id where mr_cal is not null order by rank","",1); ?>
							</select>
							<select name="fullctm_meat_type<?=$id.$iid?>" class="meat_type addiid form-control form-control-sm" onchange="fullctm_meat_type_changed(this);" <?=$dis?>>
								<option value="none">none</option>
								<option value="1">Package</option>
								<option value="2">Custom</option>
							</select>
						</td>
						<td>
							<label for="spicea_fullctm<?=$id?>row1" class="spicelabel">
								<input type="radio" name="spice_fullctm<?=$id.$iid?>" id="spicea_fullctm<?=$id?>row1" class="spice addiid" value="1" <?=$dis?>>
							</label>
						</td>
						<td>
							<label for="spiceb_fullctm<?=$id?>row1" class="spicelabel">
								<input type="radio" name="spice_fullctm<?=$id.$iid?>" id="spiceb_fullctm<?=$id?>row1" class="spice addiid" value="2" <?=$dis?>>
							</label>
						</td>
						<td>
							<label for="spicec_fullctm<?=$id?>row1" class="spicelabel">
								<input type="radio" name="spice_fullctm<?=$id.$iid?>" id="spicec_fullctm<?=$id?>row1" class="spice addiid" value="3" <?=$dis?>>
							</label>
						</td>

						<!-- Persons -->
						<td>
							<input type="number" name="persons_fullctm<?=$id.$iid?>" class="person d-none addiid v0 form-control form-control-sm" min="0" value="" placeholder="PP" oninput="fullctm_tray_cal(this)" <?=$dis?>>
						</td>
						<!-- TRAY ITEMS -->
						<td class="fullctm_tray">
							<input type="number" name="tray_lg_fullctm<?=$id.$iid?>" class="lg_qty addiid v0 form-control form-control-sm" min="0" value="0" placeholder="L" oninput="fullctm_total(this)" <?=$dis?>>
						</td>
						<td class="fullctm_tray">
							<input type="number" name="tray_md_fullctm<?=$id.$iid?>" class="md_qty addiid v0 form-control form-control-sm" min="0" value="0" placeholder="M" oninput="fullctm_total(this)" <?=$dis?>>
						</td>
						<td class="fullctm_tray">
							<input type="number" name="tray_sm_fullctm<?=$id.$iid?>" class="sm_qty addiid v0 form-control form-control-sm" min="0" value="0" placeholder="S" oninput="fullctm_total(this)" <?=$dis?>>
						</td>

						<td class="fullctm_tray">
							<input type="number" name="lg_price_fullctm<?=$id.$iid?>" class="lg_price addiid vnull form-control form-control-sm" step="any" placeholder="L" oninput="fullctm_total(this)" <?=$dis?>>
						</td>
						<td class="fullctm_tray">
							<input type="number" name="md_price_fullctm<?=$id.$iid?>" class="md_price addiid vnull form-control form-control-sm" step="any" placeholder="M" oninput="fullctm_total(this)" <?=$dis?>>
						</td>
						<td class="fullctm_tray">
							<input type="number" name="sm_price_fullctm<?=$id.$iid?>" class="sm_price addiid vnull form-control form-control-sm" step="any" placeholder="S" oninput="fullctm_total(this)" <?=$dis?>>
						</td>







						<!-- PER SERVING ITEMS -->
						<td class="fullctm_qty d-none"><strong>QTY:</strong></td>
						<td colspan="2" class="fullctm_qty d-none">
							<input type="number" name="fullctm_qty<?=$id.$iid?>" class="ps_qty addiid v0 form-control form-control-sm" min="0" value="0" placeholder="qty" oninput="fullctm_total(this)" <?=$dis?>>
						</td>
						<!-- Per serving price -->
						<td class="fullctm_qty d-none" colspan="3">
							<input type="number" name="ps_price_fullctm<?=$id.$iid?>" class="ps_price addiid vnull form-control form-control-sm" placeholder="price per item" step="any" oninput="fullctm_total(this)" <?=$dis?>>
						</td>


						
						<td>
							<input type="number" name="total_price_fullctm<?=$id.$iid?>" class="fullctm_total_price addiid v0 form-control form-control-sm" min="0" step="any" value="0.00" data-active="0" <?=$dis?>>
						</td>
						
						<td><input type="text" name="comment_fullctm<?=$id.$iid?>" class="form-control addiid emp form-control-sm" oninput="fullctm_total(this)" <?=$dis?>></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<?php $i++; } ?>







	<!-- order calculation -->
	<div class="row">
		<div class="col-md-6 col-sm-12 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Delivery/Extra</span>
					    <span class="input-group-text">$</span>
					</div>
					<input type="number" name="extra" id="extra" class="form-control" step="any" value="0.00" oninput="amount_cal()">
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Total</span>
					    <span class="input-group-text">$</span>
					</div>
					<input type="number" name="total" id="total" class="form-control" min="0" step="any" value="0.00">
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Advance</span>
					    <span class="input-group-text">$</span>
					</div>
					<input type="number" name="advance" id="advance" class="form-control" step="any" value="0.00" oninput="amount_cal()">
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12 col-lg-3">
			<div class="form-group">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
					    <span class="input-group-text">Balance</span>
					    <span class="input-group-text">$</span>
					</div>
					<input type="number" name="balance" id="balance" class="form-control" min="0" step="any" value="0.00">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-11">
			<button type="submit" id="submitbtn" class="btn btn-success float-right m-4"><i class="fa fa-paper-plane"></i> Place Order</button>
			<button type="reset" id="resetbtn" class="btn btn-info m-4"><i class="fa fa-sync"></i> Reset</button>
		</div>
	</div>
	
</div>

</form>
<script>
	$('#booking-form').on('reset',function(event) {
		$('#submitbtn').attr('disabled', true);
	});
</script>
<?php include "inc/btm.php"; ?>
<script>today_form_date();
	ranges = JSON.parse('<?php echo json_ranges(); ?>');
</script>