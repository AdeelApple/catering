<?php
session_start();
require 'inc/build.php';

$funs = array(
0 => function(){
	// Session Starage
	$val = $_POST['val'];
	if($val) $_SESSION['sb'] = 1; else  $_SESSION['sb'] = 0;
	// echo "<script>alert('value is ".$val."')</script>";
},
1 => function(){
},
4 => function(){
	// Prebooking Report Date title
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	echo show_prebooking_date_title($date);
},
5 => function(){
	// Report Date title
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	echo showWeek($date);
},
6 => function(){
	// Milk Bags
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	$starting_date = firstDayOfWeek($date);
	$ending_date = lastDayOfWeek($date);

	$rsps = "'Khoya Kheer','Fruit Trifle','Lab-e-Shireen'";
	$khoya_kheer = "'Khoya Kheer'";
	$trifle_lab_shireen = "'Fruit Trifle','Lab-e-Shireen'";
	$qry = "select sum(persons) from order_items where name in({$rsps}) and item != 0 and type=1 and list=6 and date(delivery_time) between '{$starting_date}' and '{$ending_date}'";
	$khoya_kheer_qry = "select sum(tray_lg) as lg,sum(tray_md) as md,sum(tray_sm) as sm from order_items where name in({$khoya_kheer}) and item != 0 and type in (2,3) and list=6 and date(delivery_time) between '{$starting_date}' and '{$ending_date}'";
	$trifle_lab_shireen_qry = "select sum(tray_lg) as lg,sum(tray_md) as md,sum(tray_sm) as sm from order_items where name in({$trifle_lab_shireen}) and item != 0 and type in (2,3) and list=6 and date(delivery_time) between '{$starting_date}' and '{$ending_date}'";
	
	$pp = getbit($qry);
	$milkbag = $pp/22;

	$data1 = frow($khoya_kheer_qry);
	$data2 = frow($trifle_lab_shireen_qry);

	$milkbag += ($data1['lg'] * 1.3) +  ($data1['md'] * 1) + ($data1['sm'] * 0.6);
	$milkbag += ($data2['lg'] * 1) +  ($data2['md'] * 0.7) + ($data2['sm'] * 0.4);

	echo "Milk Bag: ".round($milkbag,2);
},
7 => function(){
	// Milk Bags For Khoya Kheer
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";

	$starting_date = firstDayOfWeek($date);
	$ending_date = lastDayOfWeek($date);
	

	$rsps = "'Khoya Kheer'";
	$qry = "select sum(persons) from order_items where name in({$rsps}) and item != 0 and type=1 and list=6 and date(delivery_time) between '{$starting_date}' and '{$ending_date}'";
	$qry1 = "select sum(tray_lg) as lg,sum(tray_md) as md,sum(tray_sm) as sm from order_items where name in({$rsps}) and item != 0 and type in (2,3) and list=6 and date(delivery_time) between '{$starting_date}' and '{$ending_date}'";
	
	$pp = getbit($qry);
	$milkbag = $pp/22;

	$data1 = frow($qry1);
	$milkbag += ($data1['lg'] * 1.3) +  ($data1['md'] * 1) + ($data1['sm'] * 0.6);
	echo "Milk Bag For Khoya Kheer: ".round($milkbag,2);
},
// SELECT QUERIES
100 => function(){
	// Get food package price
	$pkg = $_POST['pkg'];
	echo food_pkg_price($pkg);
},
// INSERT QUERIES
200 => function(){
	// Create New User
	$fullname = $_POST['fullname'];
	$username = $_POST['username'];
	$pass = $_POST['pass'];
	$type = $_POST['type'];
	if(bit("select count(id) from users where username like '{$username}' ")){
		echo "Sorry! User already exist!";
	}else{
		q("insert into users(fullname,username,pass,type) value('$fullname','$username','$pass','$type')");
		echo "success";
	}

},
// UPDATE QUERIES
300 => function(){
	//Update admin setting
	$un = $_POST['un'];
	$fn = $_POST['fn'];
	$pass = $_POST['pass'];
	$em = $_POST['em'];

	q("update users set username = '{$un}', fullname = '{$fn}', pass = '{$pass}', email = '{$em}'; ");
	echo "success";
},
301 => function(){
	// Update Users
	$arr = json_decode($_POST['arr']);
	$tbl = "users";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = '{$val[1]}' where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
310 => function(){
	// Update Package item prices
	$arr = json_decode($_POST['arr']);
	$tbl = "food_packages";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
311 => function(){
	// Update Extra Prices
	$arr = json_decode($_POST['arr']);
	$tbl = "food_package_items";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
312 => function(){
	// Update Package Deductions
	$arr = json_decode($_POST['arr']);
	$tbl = "food_cat";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
313 => function(){
	// Update Tray Ranges
	$arr = json_decode($_POST['arr']);
	$tbl = "food_cat";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
315 => function(){
	// Update Custom item prices
	$arr = json_decode($_POST['arr']);
	$tbl = "food_custom_items";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
320 => function(){
	// Update Package item Tray Meat and Rice
	$arr = json_decode($_POST['arr']);
	$tbl = "mr_limits";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
321 => function(){
		// Update Package item Meat and Rice Limits
	$arr = json_decode($_POST['arr']);
	$tbl = "mr_limits";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
322 => function(){
		// Update Custom item Tray Meat and Rice

	$arr = json_decode($_POST['arr']);
	$tbl = "mr_limits";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
323 => function(){
	// Update Custom item Meat and Rice Limits
	$arr = json_decode($_POST['arr']);
	$tbl = "mr_limits";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
325 => function(){
	// Update Pakage and  Custom item Meat and Rice Limits and Refresh kitchen
	$arr = json_decode($_POST['arr']);
	$tbl = "mr_limits";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
326 => function(){
	// Update Package Manual Qty String
	$arr = json_decode($_POST['arr']);
	$tbl = "manual_sweet_trays";
	foreach ($arr as $key => $val) {
		if($val[2] == 'new'){
			$qry = "insert into {$tbl} (people,qty_string) values({$val[0]},'{$val[1]}');";
		}else{
			$qry = "update {$tbl} set {$val[0]} = '{$val[1]}' where id = {$val[2]};";
		}
		q($qry);
	}
	echo "success";
},
345 => function(){
	// Update Update Privileges
	$id = $_POST['id'];
	$clm = $_POST['clm'];
	$val = $_POST['val'];
	$tbl = $_POST['tbl'];
	q("update {$tbl} set {$clm} = {$val} where id = {$id} ");
	echo "success";
},
350 => function(){
	// Update General Settings
	$arr = json_decode($_POST['arr']);
	$tbl = "settings";
	foreach ($arr as $key => $val) {
		$qry = "update {$tbl} set {$val[0]} = {$val[1]} where id = {$val[2]};";
		q($qry);
	}
	echo "success";
},
355 => function(){
	// Update Purchased Items
	$id = $_POST['ingredient_id'];
	$val = $_POST['value'];
	$date = firstDayOfWeek($_POST['date']);
	$tbl = "purchased_items";
	if(bit("select count(*) from {$tbl} where ingredient_id = {$id} AND DATE(date) = '{$date}'"))
		$qry = "update {$tbl} set value = {$val} where ingredient_id = {$id} AND DATE(date) = '{$date}';";
	else
		$qry = "insert into {$tbl}(ingredient_id,value,date) values({$id},{$val},'{$date}');";
	q($qry);
	echo "success";
},
// DELETE QUERIES
400 => function(){
	// Delete User
	$uid = $_POST['uid'];
	$tbl = "users";
	del($uid,$tbl);
	echo "success";
},
410 => function(){
	// Delete order
	$tbls = array(1 => "orders");
	$id = $_POST['id'];
	$tbl = $tbls[$_POST['tbl']];
	del($id,$tbl);
},
4000 => function(){
	// Fetch Food Pakae Categories and Items

	$pkg = $_POST['pkg'];
	$id = $_POST['id'];
	$qry = "";
	$price = food_pkg_price($pkg);
	$cats = food_pkg_cat($pkg);
	$n = 1;
	
	while($cat = mysqli_fetch_array($cats)) {  
		$pp = $cat['pp']; $iid = $cat['id'];
		if($pp){		$cls2 = "d-none";	$cls1 = ""; 	}
		else{			$cls1 = "d-none";	$cls2 = "";		}
		$read = (!$cat['edit'])? "readonly='readonly'":NULL;
	?>	
	<tr>
		<td>
			<?=$n;?>
			<input type="hidden" name="pkgiid<?=$id;?>[]" value="<?=$cat['id']?>">
		</td>
		<td class="text-left">
			<span class="text-uppercase font-weight-bold p-2 cat_name"><?=$cat['name']?></span>
			<input type="hidden" name="category<?=$id.$iid;?>" value="<?=$cat['id']?>">
			<input type="hidden" name="list<?=$id.$iid;?>" class="list" value="1">
		</td>
		<td>
			<select name="item<?=$id.$iid;?>" id="item<?=$n?>" data-pkgid="<?=$id;?>" onchange="<?=$cat['fun'];?>pack_cat_change(this)"  data-previous="" data-cls="<?=$id.$cat['id'];?>" class="cat_select form-control form-control-sm" required="required">
				<?php cat_items_options($cat['id']); ?>
			</select>
			<input type="hidden" name="is_pp<?=$id.$cat['id']?>" id="is_pp<?=$id.$cat['id']?>" value="0">
		</td>
		<td>
			<label for="spicea<?=$id.$cat['id'];?>">
				<input type="radio" id="spicea<?=$id.$cat['id']?>" name="spice<?=$id.$cat['id']?>" value="1">
			</label>
		</td>
		<td>
			<label for="spiceb<?=$id.$cat['id'];?>">
				<input type="radio" id="spiceb<?=$id.$cat['id']?>" name="spice<?=$id.$cat['id']?>" value="2">
			</label>
		</td>
		<td>
			<label for="spicec<?=$id.$cat['id'];?>">
				<input type="radio" id="spicec<?=$id.$cat['id']?>" name="spice<?=$id.$cat['id']?>" value="3">
			</label>
		</td>
		<!-- Per Person Elements -->
		<td class="pp-cell<?=$id.$cat['id']?> <?=$cls1?>"><b>Qty:</b></td>
		<td class="pp-cell<?=$id.$cat['id']?> <?=$cls1?> ppinp">
			<input type="number" name="total_qty<?=$id.$iid?>" class="tray total_qty" readonly="readonly">
		</td>
		<td class="pp-cell<?=$id.$cat['id']?> <?=$cls1?> ppinp">
			<input type="number" name="extra_qty<?=$id.$iid?>" class="form-control form-control-sm extra_qty" placeholder="extra" step="any" min="0" oninput="cal_extra_qty($(this).closest('tr'));" <?=$read;?>>
			<input type="hidden" name="extra_price<?=$id.$iid?>" value="0.00" class="extra_price">
		</td>

		<!-- Trays Elements -->
		<td class="non-pp<?=$id.$cat['id']?> <?=$cls2;?>"><input type="number" name="tray_lg<?=$id.$iid?>" class="tray lg_tray" value="0" readonly="readonly"></td>
		<td class="non-pp<?=$id.$cat['id']?> <?=$cls2;?>"><input type="number" name="tray_md<?=$id.$iid?>" class="tray md_tray" value="0" readonly="readonly"></td>
		<td class="non-pp<?=$id.$cat['id']?> <?=$cls2;?>"><input type="number" name="tray_sm<?=$id.$iid?>" class="tray sm_tray" value="0" readonly="readonly"></td>
		<td><input type="text" name="comment<?=$id.$iid?>" id="comment<?=$n?>" class="form-control form-control-sm">
	</tr>

	<?php	$n++; }
},
5000 => function(){ 
	// Table Ingredients
	// Meat Report

	$d = $_POST['date'];
	$qry = "select * from food_ingredients";
	$rs = q($qry);
	$cols = 6;
	?>
	<table class="table table-hover small table-responsive w-100 d-block d-md-table table-bordered text-center">
		<thead>
			<tr>
				<th width="5%">No.</th>
				<th width="30%" class="text-left">Ingredients</th>
				<th width="5%">Persons</th>
				<th width="10%">Req Qty</th>
				<th width="10%">Req Qty</th>
				<th width="10%">-</th>
				<th width="10%">Total</th>
			</tr>
		</thead>
		<tbody>
			<?php $n=1;
			while($r = mysqli_fetch_array($rs)){
				$wt = getweight($r['recipes'],$r['cal'],$d); ?>
				<tr>
					<td><?=$n++?></td>
					<td class="text-left" contenteditable="true"><?=$r['name'];?></td>
					<td contenteditable="true"><?=$wt['per']?></td>
					<td contenteditable="true"><?=$wt['kg']?></td>
					<td contenteditable="true"><?=$wt['lb'];?></td>
					<?php if($r['rowspan']!=0){ ?>
					<td rowspan="<?=$r['rowspan']?>" class="align-middle font-weight-bold" contenteditable="true"><?=$r['description'];?></td>
					<td rowspan="<?=$r['rowspan']?>" class="align-middle font-weight-bold total" contenteditable="true"></td>
					<?php } ?>
				</tr>
			<?php }  norecord($rs,$cols); ?>
		</tbody>
	</table>
	<script>$("#date-selected").html("<?=date('l -d-M-y',strtotime($d));?>");</script>

	<?php 
},
5005 => function(){ 
	// Weekly Meat Report

	$d = $_POST['date'];
	$qry = "select * from food_ingredients";
	$rs = ingredientRs($qry,$d);
	$cols = 8;
	?>
	<table class="table table-hover small table-responsive w-100 d-block d-md-table table-bordered text-center">
		<thead>
			<tr>
				<th width="5%">No.</th>
				<th width="30%" class="text-left">Ingredients</th>
				<th width="10%">Req Qty</th>
				<th width="10%">Req Qty</th>
				<th width="10%">Unit</th>
				<th width="10%">Total</th>
			</tr>
		</thead>
		<tbody>
			<?php $n=1;
			foreach ($rs as $key => $val) { ?>
				<tr>
					<td><?=$n++?></td>
					<td class="text-left" contenteditable="true"><?=$val['name'];?></td>
					<td contenteditable="true"><?=$val['val1'].$val['unit1']?></td>
					<td contenteditable="true"><?=$val['val2'].$val['unit2'];?></td>
					<?php if($val['rowspan']){ ?>
					<td rowspan="<?=$val['rowspan']?>" class="align-middle font-weight-bold" contenteditable="true"><?=$val['description'];?></td>
					<td rowspan="<?=$val['rowspan']?>" class="align-middle font-weight-bold" contenteditable="true"><?=$val['total'].$val['unit2'];?></td>
					<?php } ?>
				</tr>
			<?php }  norecord_arr($rs,$cols); ?>
		</tbody>
	</table>
	<script>$("#date-selected").html("<?=date('l -d-M-y',strtotime($d));?>");</script>

	<?php 

},
5010 => function(){ 
	// Weekly Meat Report

	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	$qry = "select * from food_ingredients";
	$wrs = ingredientWeeklyRs($qry,$date);
	$cols = 12;
	
	?>
	<table class="table table-hover small table-responsive w-100 d-block d-md-table table-bordered text-center">
		<thead>
			<tr>
				<th width="5%">No.</th>
				<th width="10%" class="text-left">Ingredients</th>
				<th width="5%">Mon</th>
				<th width="5%">Tue</th>
				<th width="5%">Wed</th>
				<th width="5%">Thu</th>
				<th width="5%">Fri</th>
				<th width="5%">Sat</th>
				<th width="5%">Sun</th>
				<th width="10%">WTotal</th>
				<th width="10%">Ordered</th>
				<th width="10%">Remaining</th>
			</tr>
		</thead>
		<tbody>
			<?php
			foreach ($wrs as $wkey => $wval) { ?>
				<tr>
					<th><?=(++$wkey)?></th>
					<th class="text-left" contenteditable="true"><?=$wval['name'];?></th>
					<?php foreach ($wval['qty'] as $key => $val) { ?>
					<td contenteditable="true"><?=$val?></td>
					<?php } ?>
					<td class="align-middle font-weight-bold" contenteditable="true"><span class="wtotal"><?=round($wval['wtotal'],2)?></span> <?=get_unit_for_report($wval);?></td>
					<td class="align-middle font-weight-bold"><input type="number" class="form-control form-control-sm purchased" onchange="calRemainingQty(this)" onblur="savePurchasedQty(this)" data-old="<?=$wval['purchased'];?>" data-id="<?=$wval['id'];?>" value="<?=round($wval['purchased'],1);?>"></td>
					<td class="align-middle font-weight-bold"><span contenteditable="true" class="remaining"><?=round($wval['remaining'],1)?></span> <?=get_unit_for_report($wval);?></td>
					
				</tr>
			<?php }  norecord_arr($wrs,$cols); ?>
		</tbody>
	</table>
	<script>$("#date-selected").html("<?=showWeek($date)?>");$('.purchased').keydown(function(e){if(e.keyCode===13)$(this).blur()})</script>

	<?php 
},
5100 => function(){
	// Orders list table

	$qry = "select * from orders";
	
	$rs = flt_qry($qry,"order by id desc");
	
	
	$qry2 = "select count(id) from orders";
	$filtered_query = get_filter_query($qry2,"order by id desc", false);
	$total_count = getbit($filtered_query);
	$cols=9;

	?>
	<thead>
		<tr>
			<th>Edit/Receipt<span id="total_order_count" class="d-none"><?=$total_count?></th>
			<th>Order No.</th>
			<th class="text-left">Customer Name</th>
			<th>Phone no.1</th>
			<th>Phone no.2</th>
			<th>total</th>
			<th>Advance</th>
			<th>Balance</th>
			<th>Delivery/Pickup Time</th>
			<th>Del</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<?php $n=1; while($r = mysqli_fetch_array($rs)){ $oid=$r['id']; ?>
		<tr>
			<td><a href="booking_edit.php?oid=<?=$oid;?>" class="btn-sm btn-success c-pointer"><i class="fa fa-pen"></i></a>
			<?php
				if($r['is_pre_booking']==1){
			?>
				<a href="pre_booking.php?oid=<?=$oid;?>" class="btn-sm btn-primary c-pointer"><i class="fa fa-calendar-check"></i></a>
			<?php } else{ ?>
				<a href="receipt.php?oid=<?=$oid;?>" class="btn-sm btn-warning c-pointer"><i class="fa fa-file-invoice"></i></a>
			<?php } ?>
			</td>
			<td><?=$r['id']?></td>
			<td class="text-left"><span class="c-p h-blue font-weight-bold" data-toggle="collapse" data-target="#a<?=$n?>"><?=$r['name']?></span></td>
			<td><?=empty($r['phone1'])?'-':$r['phone1'];?></td>
			<td><?=empty($r['phone2'])?'-':$r['phone2'];?></td>
			<td><?=$r['total']?></td>
			<td><?=$r['advance']?></td>
			<td><?=$r['balance']?></td>
			<td><?=date('l d-M-y h:iA',strtotime($r['delivery_time']))?></td>
			<td valign="align-middle"><button onclick="del_order(this,<?=$oid;?>)" class="btn btn-sm btn-danger"><i class="fa fa-xs fa-trash"></i></button></td>
		</tr>
		<tr id="a<?=$n;?>" class="collapse">
			<td colspan="<?=$cols;?>" class="p-0">
				<table class="table table-sm table-light m-0">
					<thead>
						<tr>
							<th width="10%">No</th>
							<th width="10%" class="text-left">Recipe</th>
							<th width="10%">Type</th>
							<th width="10%">Spice</th>
							<th width="10%">Person</th>
							<th width="10%">Tray_lg</th>
							<th width="10%">Tray_md</th>
							<th width="10%">Tray_sm</th>
							<th width="10%">Comment</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$i=1;
							$rs1 = q("select * from order_items where order_id={$oid} and item != 0 ");
							while($r1 = mysqli_fetch_array($rs1)){
						 ?>
						<tr>
							<td><?=$i++;?></td>
							<td class="text-left"><?=item_nm($r1['item'],$r1['type'],$r1)?></td>
							<td><?=order_type($r1['type'])?></td>
							<td><?=spice($r1['spice'])?></td>
							<td><?php if($r1['type']==1) echo $r1['persons']; else echo "-";?></td>
			 				<?php if(!$r1['pp']){ ?>
							<td><?php if($r1['tray_lg']>0) echo $r1['tray_lg'];?></td>
							<td><?php if($r1['tray_md']>0) echo $r1['tray_md'];?></td>
							<td><?php if($r1['tray_sm']>0) echo $r1['tray_sm'];?></td>
				 			<?php }else{ ?>
			 				<td colspan="3">Quantity: <?=$r1['qty']?></td>
				 			<?php } ?>
			 				<td><?=$r1['description']?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</td>
		</tr>
		
	<?php $n++;}  norecord($rs,$cols);?>
	</tbody>
	<tfoot>
		<?php tbl_pagination($cols); ?>
	</tfoot>

	<?php
},
6000 => function(){
	// Table Kitchen Items
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";	
	$pots_list = get_all_pots(1,$d);
	if(count($pots_list)>0){ ?>
	<div class="col p-0">
		<div id="k-1" class="col border p-0 k-items">
		<?php	foreach ($pots_list as $key => $val) { ?>
			<div class="black-border">
				<div class="text-center h4 p-2 font-weight-bold" contenteditable="true"><?=($key+1)."- ".$val['potname']."(".$val['potnum']."/".$val['totalpots'].")<span class='mx-4'>".date('h:iA',strtotime($val['delivery_time']))."</span>"?></div>
				<?php foreach ($val['potitems'] as $key1 => $v) { ?>
				<div class="row m-0 border">
					<div class="col-4 p-0 pl-2" contenteditable="true"><?=customer_name($v['order_id']);?></div>
					<div class="col pr-1" contenteditable="true"><?=date('h:i',strtotime($v['delivery_time']));?></div>
					<div class="col p-0" contenteditable="true"><?=spice($v['spice'])?></div>
					<div class="col p-0" contenteditable="true"><?php if($v['type']==1 || ($v['type']==3 && $v['meat_type']==1)) echo intval($v['persons']).'pp'; ?></div>
					<?php if($v['pp']){ ?>
					<div class="col p-0" contenteditable="true">qty: <?=$v['qty']?></div>
					<?php }else{ $trays=""; ?>
					<?php if($v['tray_lg']>0) $trays.= "<span class='px-2' contenteditable='true'>".round($v['tray_lg'],1).'L</span>'; ?>
					<?php if($v['tray_md']>0) $trays.= "<span class='px-2' contenteditable='true'>".round($v['tray_md'],1).'M</span>'; ?>
					<?php if($v['tray_sm']>0) $trays.= "<span class='px-2' contenteditable='true'>".round($v['tray_sm'],1).'S</span>'; ?>
					<div class='col p-0'><?=$trays?></div>
					<?php } ?>
					<div class="col p-0" contenteditable="true"><?php echo $v['description']; ?></div>
				</div>
					<?php } if(isset($val['pot'])){ ?>
				<div class="row m-0 fc p-fc pot">
					<div class="col p-0 text-center" contenteditable="true"><?php if($val['pot']['rice']>0) echo "Rice: ".round($val['pot']['rice'],2)."kg"; ?></div>
					<div class="col p-0 text-center" contenteditable="true"><?php if($val['pot']['meat']>0) echo "Meat: ".round($val['pot']['meat'],2)."kg"; ?></div>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
	<div id="k-2" class="col p-0"></div>
	<?php }else{ ?>
	<div class="col p-0">
		<h6 class="text-center bg-danger text-light pblack mb-0 p-2 border">Sorry! No Item Ordered yet!</h6>
	</div>
	<?php } ?>
	<!-- <div class="col p-0"><div id="k-2" class="row m-0"></div></div> -->
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");organize();</script>
	<?php
},
6001 => function(){
	// Kitchen BBQ Items
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";
	$bbqlist = bbq_items_list_by_name($d);
	if(mysqli_num_rows($bbqlist)<1) { ?>
	<div class="col p-0">
		<h6 class="text-center bg-danger text-light pblack mb-0 p-2 border">Sorry! No BBQ Item Ordered yet!</h6>
		<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");</script>
	</div>	
	<?php return; }
	$n=1; ?>
	<div class="col p-0">		
		<div class="row m-0">
			<div class="col-12 border p-0">
				<table class="table table-sm small table-bordered mb-0 text-center font-weight-bold">
				 	<thead>
				 		<tr>
				 			<th width="8%" class="text-left">Time</th>
				 			<th width="20%" class="text-left">BBQ</th>
				 			<th width="20%" class="text-left">Customer</th>
				 			<th width="5%" class="text-left">QTY</th>
				 			<th width="5%" class="text-left">Spice</th>
				 			<th width="20%" class="text-left">Cmnt</th>
				 		</tr>
				 	</thead>
				 	<tbody>
						<?php while($r = mysqli_fetch_assoc($bbqlist)){ ?>
			 			<tr>
			 				<td class="text-left"><?=date('h:i',strtotime($r['delivery_time']));?></td>
			 				<th class="text-left"><?=$r['name']?></th>
			 				<td class="text-left"><?=customer_name($r['order_id']);?></td>
			 				<td class="text-left"><?=round(bbq_pcs($r),2)?></td>
			 				<td class="text-left"><?=spice($r['spice'])?></td>
			 				<td class="text-left"><?=$r['description']?></td>
			 			</tr>
			 			<?php } ?>
				 	</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>")</script>
	<?php
},
6002 => function(){
	// Table Kitchen Naan Orders
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";	
	$pots_list = get_naan_pots(5,$d);
	// die(print_r($pots_list));
	if(count($pots_list)>0){ ?>
	<div class="col p-0">
		<!-- <div id="k-1" class="row m-0"> -->		
		<div id="k-1" class="col border p-0 k-items">
		<?php
		foreach ($pots_list as $key => $val) { ?>
			<div class="black-border">
				<div class="text-center h4 p-2 font-weight-bold"><?=$val['potname'];?></div>
				<?php $ttl = 0; $cus = 0;
				foreach ($val['potitems'] as $key1 => $v) { 
					$ttl += $v['qty']; $cus++;?>
				
				<div class="row m-0 border">
					<div class="col p-0 pl-1"><?=customer_name($v['order_id']);?></div>
					<div class="col col-2 p-1"><?=date('h:i',strtotime($v['delivery_time']));?></div>
					<?php if($v['pp']){ ?>
					<div class="col col-2 p-0"><?=$v['qty']?></div>
					<?php }else{ $trays=""; ?>
					<?php if($v['tray_lg']>0) $trays.= "<span class='px-2'>".round($v['tray_lg'],1).'L</span>'; ?>
					<?php if($v['tray_md']>0) $trays.= "<span class='px-2'>".round($v['tray_md'],1).'M</span>'; ?>
					<?php if($v['tray_sm']>0) $trays.= "<span class='px-2'>".round($v['tray_sm'],1).'S</span>'; ?>
					<div class='col p-0'><?=$trays?></div>
					<?php } ?>
					<div class="col col-2 p-0"><?=$v['description']; ?></div>
				</div>
				<?php } ?>
				<div class="row m-0 fc p-fc pot">
					<div class="col p-0 font-weight-bold text-center">Customers: <?=$cus;?></div>
					<div class="col p-0 font-weight-bold text-center">Total: <?=$ttl;?></div>
				</div>
			</div>
		<?php } ?>
		</div>
	</div>
	<div id="k-2" class="col p-0"></div>
	<?php }else{ ?>
	<div class="col p-0">
		<h6 class="text-center bg-danger text-light pblack mb-0 p-2 border">Sorry! No Item Ordered yet!</h6>
	</div>
	<?php } ?>
	<!-- <div class="col p-0"><div id="k-2" class="row m-0"></div></div> -->
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");organize();</script>
	<?php
	
},
6003 => function(){
	// Kitchen Salad Raita List
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";
	$salads = misc_items_of_day(4,$d);
	$n=1; ?>
	<div class="col p-0">
		<div id="k-1" class="col border p-0 k-items">
			<?php
			foreach ($salads as $key => $val) { 
			$s = salads($val); ?>
			<div class="black-border">
				<div class="text-center h4 p-2 font-weight-bold"><?=$val['name'];?></div>
				<div class="row m-0 border">
					<div class='col'>Medium Salad: <?=$s[0]?></div>
					<div class='col'>Small Salad: <?=$s[1]?></div>
				</div>
			</div>
		<?php } ?>
			<div class="black-border">
				<div class="text-center h4 p-2 font-weight-bold">RAITA</div>
				<div class="row m-0 border">
		 			<div class="col text-center">Total Raita: <?=total_raita($d)?></div>
		 		</div>
		 	</div>
		</div>
	</div>
	<div id="k-2" class="col p-0"></div>
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");organize();</script>
	<?php
},
6004 => function(){
	// Sweets Items List
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";	
	$pots_list = get_all_pots(6,$d);
	if(count($pots_list)>0){ ?>
	<div class="col p-0">
		<!-- <div id="k-1" class="row m-0"> -->		
		<div id="k-1" class="col border p-0 k-items">
		<?php	foreach ($pots_list as $key => $val) { ?>
			<div class="black-border">
				<div class="text-center h4 p-2 font-weight-bold"><?=$val['potname']."(".$val['potnum'].")<span class='mx-4'>".date('h:iA',strtotime($val['delivery_time']))."</span>"?></div>
				<?php foreach ($val['potitems'] as $key1 => $v) { ?>
				<div class="row m-0 border">
					<div class="col-3 p-0 pl-2"><?=customer_name($v['order_id']);?></div>
					<div class="col pr-1"><?=date('h:i',strtotime($v['delivery_time']));?></div>
					<div class="col p-0"><?=spice($v['spice'])?></div>
					<div class="col p-0"><?php if($v['type']==1) echo intval($v['persons']).'pp'; ?></div>
					<?php if($v['pp']){ ?>
					<div class="col p-0">qty: <?=$v['qty']?></div>
					<?php }else{ $trays=""; ?>
					<?php if($v['tray_lg']>0) $trays.= "<span class='px-2'>".round($v['tray_lg'],1).'L</span>'; ?>
					<?php if($v['tray_md']>0) $trays.= "<span class='px-2'>".round($v['tray_md'],1).'M</span>'; ?>
					<?php if($v['tray_sm']>0) $trays.= "<span class='px-2'>".round($v['tray_sm'],1).'S</span>'; ?>
					<div class='col p-0'><?=$trays?></div>
					<?php } ?>
					<div class="col p-0"><?php if($v['type']==2) echo "(ctm)"; echo $v['description']; ?></div>
				</div>
					<?php } if(isset($val['pot'])){ ?>
				<div class="row m-0 fc p-fc pot">
					<div class="col p-0 text-center"><?php if($val['pot']['rice']>0) echo "Rice: ".round($val['pot']['rice'],2)."kg"; ?></div>
					<div class="col p-0 text-center"><?php if($val['pot']['meat']>0) echo "Meat: ".round($val['pot']['meat'],2)."kg"; ?></div>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
	</div>
	<div id="k-2" class="col p-0"></div>
	<?php }else{ ?>
	<div class="col p-0">
		<h6 class="text-center bg-danger text-light pblack mb-0 p-2 border">Sorry! No Item Ordered yet!</h6>
	</div>
	<?php } ?>
	<!-- <div class="col p-0"><div id="k-2" class="row m-0"></div></div> -->
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");organize();</script>
	<?php
},
6005 => function(){
	// Basmatti And Sella
	$d = isset($_POST['delivery_time'])? $_POST['delivery_time']:"0000-00-00";	
	$pots_list = get_all_pots(1,$d);
	if(count($pots_list)>0){ 
		$basmati = array();
		$sella = array();
		foreach ($pots_list as $key => $val) {
			if(isset($val['pot'])){
				if($val['potitems'][0]['rice_type']==1){
					array_push($basmati, array('name' => $val['potitems'][0]['name'],'val'=>$val['pot']['rice']));
				}
				if($val['potitems'][0]['rice_type']==2){
					array_push($sella, array('name' => $val['potitems'][0]['name'],'val'=>$val['pot']['rice']));
				}
			}
		}


	$n=1; $inc=0; ?>
	<div class="col p-0">
		<div class="row m-0">
			<?php  ?>
			<div class="col black-border p-0">
				<div class="text-center font-weight-bold py-2 border">Sella</div>
		 		<?php foreach ($sella as $key => $val) { ?>
				<div class="row m-0 black-border">
		 			<div class="col text-left"><?=$val['name']?></div>
		 			<div class="col"><?=round($val['val'],2)?> KG</div>
			 	</div>
		 		<?php } ?>
			</div>
			<div class="col black-border p-0">
				<div class="text-center font-weight-bold py-2 border">Basmati</div>
		 		<?php foreach ($basmati as $key => $val) { ?>
				<div class="row m-0 black-border">
		 			<div class="col text-left"><?=$val['name']?></div>
		 			<div class="col"><?=round($val['val'],2)?> KG</div>
			 	</div>
		 		<?php } ?>
			</div>
		</div>
	</div>
	<?php }else{ ?>
	<div class="col p-0">
		<h6 class="text-center bg-danger text-light pblack mb-0 p-2 border">Nothing!</h6>
	</div>
	<?php } ?>
	<!-- <div class="col p-0"><div id="k-2" class="row m-0"></div></div> -->
	<script>$("#date-selected").html("<?=date('l d-M-y',strtotime($d));?>");</script>
	<?php
},
7003 => function(){
	// Get food package price
},
7004 => function(){
	// Get food package price
},
7005 => function(){
	// Get food package price
},
7006 => function(){
	// Get food package price
},
8000 => function(){
	// weekly Report
	$items = isset($_POST['items'])?$_POST['items']:die("No items choosed for report...");
	$items = json_decode($items);
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	$weekday = date("l",strtotime($date));
	while($weekday!="Monday"){
		$date = date("Y-m-d",strtotime($date."-1 day"));
		$weekday = date("l",strtotime($date));
	} $firstday = $date;?>
	<div id="r-1" class="row report-row">
		<?php foreach($items as $key=>$val){ ?>
		<div class="col p-0 rcol">
			<div class="text-center font-weight-bold report-top-header py-2 blr"><?=$val;?></div>
			<div class="row m-0 py-2 px-1 report-header blr">
				<div class="col p-0"><b>Cus</b></div>
				<div class="col p-0"><b>sp</b></div>
				<?php if(is_pp($val)){ ?>
				<div class="col p-0"><b>QTY</b></div>
				<?php }else{ ?>
				<div class="col p-0"><b>pp</b></div>
				<div class="col p-0"><b>L</b></div>
				<div class="col p-0"><b>M</b></div>
				<div class="col p-0"><b>S</b></div>
				<?php } ?>
				<div class="col p-0"><b>Cmnt</b></div>
			</div>

			<?php $date = $firstday; $c=0; $p=0; $l=0; $m=0; $s=0; $q=0;   $ct=0; $pt=0; $lt=0; $mt=0; $st=0; $qt=0; 
			for($i=1;$i<=7;$i++){ ?>

				<div class="day-header bg-light text-center py-1 blr"><?=$GLOBALS['day'][$i]?></div>
				<?php 
				$rs = get_item_from_all_orders($val,$date);
				$date = date("Y-m-d",strtotime("+1 day",strtotime($date))); 
				while($r = mysqli_fetch_array($rs)){ ?>

					<div class="row m-0 px-1 body-row blr">
						<div class="col p-0"><?=cus_nm($r['order_id'])?></div>
						<div class="col p-0"><?=spice($r['spice'])?></div>
						<?php if(is_pp($val)){ ?>
						<div class="col p-0"><?=bbq_pcs($r)?></div>
						<?php $q+=bbq_pcs($r); }else{ ?>
						<div class="col p-0"><?=$r['persons']?></div>
						<div class="col p-0"><?=$r['tray_lg']?></div>
						<div class="col p-0"><?=$r['tray_md']?></div>
						<div class="col p-0"><?=$r['tray_sm']?></div>
						<?php $p+=$r['persons']; $l+=$r['tray_lg']; $m+=$r['tray_md']; $s+=$r['tray_sm']; } ?>
						<div class="col p-0"><?=$r['description']?></div>
					</div>

				<?php $c++; } ?>
				<div class="row m-0 px-1 day-footer blr">
					<div class="col p-0">T. <?=$c;?></div>
					<div class="col p-0"></div>
					<?php if(is_pp($val)){ ?>
					<div class="col p-0"><?=$q;?></div>
					<?php $qt+=$q; }else{ ?>
					<div class="col p-0"><?=$p?></div>
					<div class="col p-0"><?=$l;?></div>
					<div class="col p-0"><?=$m;?></div>
					<div class="col p-0"><?=$s;?></div>
					<?php $pt+=$p; $lt+=$l; $mt+=$m; $st+=$s; } ?>
					<div class="col p-0"></div>
				</div>

			<?php $ct += $c; $c=0; $q=0; $p=0; $l=0; $m=0; $s=0; } ?>

			<div class="row m-0 px-1 week-footer blr">
				<div class="col p-0">W.<?=$ct;?></div>
				<div class="col p-0"></div>
				<?php if(is_pp($val)){ ?>
				<div class="col p-0"><?=$qt;?></div>
				<?php }else{ ?>
				<div class="col p-0"><?=$pt?></div>
				<div class="col p-0"><?=$lt;?></div>
				<div class="col p-0"><?=$mt;?></div>
				<div class="col p-0"><?=$st;?></div>
				<?php } ?>
				<div class="col p-0"></div>
			</div>
			<?php $ct=0; $qt=0; $pt=0; $lt=0; $mt=0; $st=0; ?>
		</div>
		<?php } ?>
	</div>
	<div id="r-2" class="row"></div>
	<div id="r-3" class="row"></div>
	<div id="r-4" class="row"></div>
	<div id="r-5" class="row"></div>
	<div id="r-6" class="row"></div>
	<div id="r-7" class="row"></div>
	<div id="r-8" class="row"></div>

	<?php
},
8050 => function(){
	// weekly Report
	$items = isset($_POST['items'])?$_POST['items']:die("No items choosed for report...");
	$items = json_decode($items);
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	$weekday = date("l",strtotime($date));
	while($weekday!="Monday"){
		$date = date("Y-m-d",strtotime($date."-1 day"));
		$weekday = date("l",strtotime($date));
	}
	$firstday = $date;
	$date_from = $firstday;
	$date_to = date("Y-m-d",strtotime("+6 day",strtotime($date_from)));
	?>
	<div id="r-1" class="row report-row">
		<?php foreach($items as $key=>$val){ 
		
		$rs = get_item_from_all_orders_weekly($val,$date_from,$date_to);
		$weekly_report_items = get_calculate_weekly_sweet_report($rs); 
		
		?>
		<div class="col p-0 rcol">
			<div class="text-center font-weight-bold report-top-header py-2 blr"><?=$val;?></div>
			<div class="row m-0 py-2 px-1 report-header blr">
				<div class="col p-0"><b>People/Tray</b></div>
				<div class="col p-0"><b>QTY</b></div>
			</div>
			<?php foreach ($weekly_report_items as $key => $val) { ?>
			<div class="row m-0 px-1 body-row blr">
				<div class="col p-0"><?=$key?></div>
				<div class="col p-0"><?=$val?></div>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<div id="r-2" class="row"></div>
	<div id="r-3" class="row"></div>
	<div id="r-4" class="row"></div>
	<div id="r-5" class="row"></div>
	<div id="r-6" class="row"></div>
	<div id="r-7" class="row"></div>
	<div id="r-8" class="row"></div>

	<?php
},

8500 => function(){
	// pre booking Report
	$date = isset($_POST['date'])? $_POST['date']:"1975-01-01";
	$months = 6;
	
	?>
	<div class="row p-0 m-0">
		<?php while($months>0){ ?>
		<div class="col col-12 col-lg-6 p-4 m-0">
			<div class="row p-0 m-0 border bg-success text-light">
				<div class="col">
					<div class="text-center font-weight-bold py-2"><?=date('F Y', strtotime($date));?></div>
				</div>
			</div>
			<div class="row p-0 m-0">
				<?php
				foreach (['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] as $day) { ?>
					<div class="col-calender border">
						<div class="text-center small py-1"><?=$day?></div>
					</div>
				<?php } ?>
			</div>
			<div class="row p-0 m-0">
				<?php
				$daysInMonth = date('t', strtotime($date));
				$month_days = date("Y-m-01", strtotime($date));
				$first_day_number = date('N', strtotime($month_days));
				for ($i = 2 - $first_day_number; $i <= $daysInMonth; $i++) {
					if($i > 0){

						$pp = get_total_pp($month_days);
						$trays = get_total_trays($month_days);
						$month_days = date("Y-m-d", strtotime($month_days . " +1 day"));
							
						?>
						<div class="col-calender border <?=$pp > 1000? 'highligh-order-cell': '' ?>">
							<div class="row m-0 p-0 border-bottom">
								<div class="col">
									<div class="text-center font-weight-bold py-2"><?=$i?></div>
								</div>
							</div>
							<div class="row m-0 p-0">
								<div class="col-6 m-0 p-0 border-right">
									<div class="text-center small py-2"><?=$pp?></div>
								</div>
								<div class="col-6 m-0 p-0">
									<div class="text-center small py-2"><?=$trays?></div>
								</div>
							</div>
						</div>
					<?php } else { ?>
						<div class="col-calender border">
							<div class="row m-0 p-0">
							</div>
						</div>
					<?php } ?>
				<?php } ?>
			</div>
		</div>
		<?php
			$date = date("Y-m-d", strtotime($date . " +1 month"));
			$months--; 
		}?>
	</div>
	<?php
});
$funs[$_POST['fun']](); ?>