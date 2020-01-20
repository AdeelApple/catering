<?php 
	


	$database = "am_catering";
	// $database = "encoders_encodersolution";
	$conn = mysqli_connect("localhost", "root", "", $database);
	// $conn = mysqli_connect("localhost", "adeelapple", "adeel@5", $database);
	// $conn = mysqli_connect("localhost", "encoders_encoder", "1MRBDoSP@W)W", $database);


	// Global Variables
	$pages=0;
	$sb=1;
	if(isset($_SESSION['sb'])){		$sb = $_SESSION['sb']?1:0;	}

	function login($username,$pass){
		
		if(getbit("select count(*) from users where username like '$username' and pass like '$pass' ")>0)
			return true;
		else
			return false;
	}
	function userid($username,$pass){
		return getbit("select id from users where username like '$username' and pass like '$pass'");
	}
	function fname($uid){
		return getbit("select fullname from users where id = {$uid}");
	}
	function uname($uid){
		return getbit("select username from users where id = {$uid}");
	}
	function utype($uid){
		return getbit("select type from users where id={$uid}");
	}
	function access($type,$pg){
		return bit("select {$type} from sidebar where link like '$pg' union select {$type} from sub_sidebar where link like '$pg' ");
	}
	function order_no(){
		$db = $GLOBALS['database'];
		return getbit("select `auto_increment`from  information_schema.tables where table_schema = '$db' and   table_name   = 'orders';");
	}
	function q($qry){	if($rs=mysqli_query($GLOBALS['conn'], $qry)){return $rs;	}else{	die("<b>Die:</b>".$qry);	}}
	function q2($qry){	if($rs=mysqli_query($GLOBALS['conn'], $qry)){return $rs;	}else{	die("fail");	}}
	function bit($qry){	  return intval(getbit($qry))>0?true:false;	}
	function frow($qry){   return mysqli_fetch_array(q($qry));	}
	function getbit($qry){	return frow($qry)[0];	}
	function incval($tbl,$clm){ return getbit("select $clm from $tbl order by $clm desc limit 1")+1; }
	function del($id,$tbl){ q("delete from $tbl where id=$id");	 }
	function eq($inp){	echo $inp; }
	function eeq($inp){	echo $inp;	return q($inp); }
	function ar($qry){
		$rs = q($qry); $arr = array();
		while($r = mysqli_fetch_array($rs)){	$arr[] = $r[0];	}
		return $arr;
	}
	function qry_arr($qry){
		$rs = q($qry); $arr = array();
		while($r = mysqli_fetch_assoc($rs)){	array_push($arr,$r); 	}
		return $arr;
	}
	
	function rand_name(){ return date("dmY").time().rand_str(5); }
	function rand_str($length, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
	{
    	$str = '';
    	$max = mb_strlen($keyspace, '8bit') - 1;
    	for ($i = 0; $i < $length; ++$i) {
    	    $str .= $keyspace[random_int(0, $max)];
    	}
    	return $str;
	}
	




	$sec = array(1 => 'A',2 => 'B',3 => 'C',4 => 'D',5 => 'E',6 => 'F');
	$day = array(1 => 'Monday',2 => 'Tuesday',3 => 'Wednessday',4 => 'Thursday',5 => 'Friday',6 => 'Saturday',7 => 'Sunday');



	function pr($inp) { 
	    return mysqli_real_escape_string($GLOBALS['conn'], $inp);
	}

	function item_package_name($item_id){
		return getbit("select name from food_package_items where id = $item_id");
	}

function json_ranges(){

	$pkg_ranges = array();
	$rs = q("select name,lg_min,lg_max,md_min,md_max,sm_min,sm_max from food_cat where lg_min is not null");
	while($r = mysqli_fetch_array($rs)){
		$nm = $r['name'];
		$pkg_ranges[$nm] = array('lg' => array('min'=>intval($r['lg_min']),'max'=>intval($r['lg_max'])),'md' => array('min'=>intval($r['md_min']),'max'=>intval($r['md_max'])),'sm' => array('min'=>intval($r['sm_min']),'max'=>intval($r['sm_max'])));
	}
	return json_encode($pkg_ranges);
}

function zifnull($val){
	if($val=="")
		return 0.00;
	else
		return $val;
}
function nullifunset($val){
	if(isset($_POST[$val]))
		return $_POST[$val];
	else
		return "NULL";
}

	
function options($qry,$sl=""){
	$rs = q($qry);
	while($r = mysqli_fetch_array($rs)){
		if($sl==$r[0]) $select = "selected='selected'"; else $select = "";
		echo "<option value='".$r[0]."' $select>  ".$r[1]."</option>";
	}
}
	
function options_nm($rs,$nm){
	while($r = mysqli_fetch_array($rs)){
		$sl = ($r['name']==$nm)? "selected='selected'":"";
		echo "<option value='".$r['id']."' $sl>".$r['name']."</option>";
	}
}

	
function options_id($rs,$id){
	while($r = mysqli_fetch_array($rs)){
		$sl = ($r['id']==$id) ? "selected='selected'":"";
		echo "<option value='".$r['id']."' $sl>".$r['name']."</option>";
	}
}


function true_after($n,$lim){
	if($n%$lim==0) return true; else return false;
}

	// Functions

function open($id,$oid,$tp){ 
	return bit("select count(id) from order_items where order_id=$oid and type=$tp and main=$id");
}
function shipping($id){
	if($id==1) return "Delivery";
	if($id==2) return "Pickup";
}
function pkgid_order($oid,$tp,$main){
	return getbit("select package from order_items where order_id = $oid and type=$tp and main=$main limit 1");
}
function pkgprice_order($oid,$tp,$main,$pkgid){
	return getbit("select pkgprice from order_items where order_id = $oid and type=$tp and main=$main and package={$pkgid} limit 1");
}
function is_cat_pp($cat){
	return getbit("select pp from food_cat where name like '$cat'");
}
function is_item_pp($id,$tp){
	if($tp==1) return getbit("select pp from food_package_items where id=$id");
	if($tp==2) return getbit("select pp from food_custom_items where id=$id");
}
function item_list($id){
	if($id==0) return 1;
	else
	return getbit("select list from food_package_items where id=$id");
}
function sel_item($oid,$tp,$main,$pkg='NULL',$cat='NULL'){
	// echo "select item from order_items where order_id = $oid and type=$tp and category=$cat and package=$pkg and main=$main limit 1";
	return getbit("select item from order_items where order_id = $oid and type=$tp and category=$cat and package=$pkg and main=$main limit 1");
 }
function chk($v,$i=1){
	if($v==$i) return "checked='checked'";
 }
function editid($oid,$tp,$item){
	return getbit("select id from order_items where order_id = $oid and type=$tp and item=$item limit 1");
 }
function editrow($id){	return frow("select * from order_items where id = $id");	}
function mark_edit($oid,$tp,$item){
	return bit("select count(id) from order_items where order_id=$oid and item=$item and type=$tp");
 }
function default_edit_row(){
	return array('ctmprice'=> '','spice' => 0,'tray_lg' => 0,'tray_md' => 0,'tray_sm' => 0,'total' => 0.00,'d_total' => 0.00,'description' => '','qty' => 0, 'lg_price' => '', 'md_price' => '', 'sm_price' => '', 'name' => '', 'pp' => 0, 'list' => 1);
 }
function fullctm_default_arr(){
	return array('spice' => 0,'tray_lg' => 0,'tray_md' => 0,'tray_sm' => 0,'total' => 0.00,'d_total' => 0.00,'description' => '','qty' => 0, 'lg_price' => '', 'md_price' => '', 'sm_price' => '', 'name' => '', 'pp' => 0, 'list' => 1,'ctmprice' => 0.00);

 }
function del_pkg_order($oid,$tp,$pkg,$main){
	q("delete from order_items where order_id=$oid and type=$tp and package=$pkg and main=$main");
	echo "delete from order_items where order_id=$oid and type=$tp and package=$pkg and main=$main"."<br>";
 }
function pkg_exist($oid,$tp,$pkg,$main){
	return bit("select count(id) from order_items where order_id=$oid and type=$tp and package=$pkg and main=$main");
 }
function is_ctm_pp($it){
	return bit("select pp from food_custom_items where id=$it");
 }
function get_item_from_all_orders($nm,$dt){

	$qry = "select * from order_items where name like '{$nm}' and item != 0 and date(delivery_time) = '{$dt}'";
	// $qry .= " union select {$clms}{$clm2} from {$t1} where {$t1}.custom like '{$nm}' and type=3 and {$t1}.list={$list} and date(delivery_time) = '{$dt}' order by TIMESTAMP(delivery_time)";
	return q($qry);

 }
function oit_of_date($list,$dt){

	$clms = "{$t1}.id, {$t1}.order_id, {$t1}.item, {$t1}.category, {$t1}.package, {$t1}.main, {$t1}.type, {$t1}.persons, {$t1}.spice, {$t1}.tray_lg, {$t1}.tray_md, {$t1}.tray_sm, {$t1}.description, {$t1}.qty, {$t1}.pkgprice, {$t1}.sm_price, {$t1}.lg_price, {$t1}.pkgcmt, {$t1}.total, {$t1}.list, {$t1}.delivery_time,name,pp,meat_limit,rice_limit";

	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where item!=0 and list={$list} and DATE(delivery_time) = '{$dt}' order by delivery_time";
	return q($qry);

 }
function is_pp($it){
	return getbit("select pp from food_package_items where name like '$it' union select pp from food_custom_items where name like '$it' limit 1");
 }
function is_pp_id($it,$tp){
	if($tp==1)
	return bit("select pp from food_package_items where id=$it");
	if($tp==2)
	return bit("select pp from food_custom_items where id=$it");
 }
function cus_nm($oid){
	return getbit("select name from orders where id=$oid");
 }
function pkgcmt($oid,$main){
	return getbit("select pkgcmt from order_items where order_id = {$oid} and main = {$main}");
 }


// Quries Functoins

function update_pkg_item($item_id,$category,$package,$main,$persons,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$total_qty,$pkgprice,$pkg_total,$delivery_time,$order_items_id,$meatrice,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank){
	$qry = "update order_items set item=$item_id, category=$category,  package=$package,  main=$main, persons=$persons, spice=$spice, tray_lg=$tray_lg, tray_md=$tray_md, tray_sm=$tray_sm, description='$comment', qty=$total_qty, pkgprice=$pkgprice, total=$pkg_total, delivery_time='$delivery_time' where id=$order_items_id,mr_cal = $meatrice,rice_type = $rice_type,is_meat_cal = $is_meat_cal, is_rice_cal = $is_rice_cal";
	q($qry);
 }
function insert_pkg_item($order_id,$item_id,$item_name,$category,$package,$main,$persons,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$total_qty,$extra_qty,$extra_price,$pkgprice,$pkgcmt,$pkg_total,$pp,$list,$delivery_time,$mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank){
		$qry = "insert into order_items(order_id,item,name,category, package, main,persons,type,spice,tray_lg,tray_md,tray_sm,description,qty,extra_qty,extra_price,pkgprice,pkgcmt,total,pp,list,delivery_time,mr_cal,mr_limit_id,ingredient_id,rice_type,is_meat_cal,is_rice_cal,tspan,rank) values($order_id,$item_id,'$item_name',$category,$package,$main,$persons,1,$spice,$tray_lg,$tray_md,$tray_sm,'$comment',$total_qty,$extra_qty,$extra_price,$pkgprice,'$pkgcmt',$pkg_total,$pp,$list,'$delivery_time',$mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank)";
	q($qry);
 }
function insert_ctm_item($order_id,$item_id,$item_name,$main,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_ctm,$d_total_price_ctm,$ctm_pp,$ctm_list,$delivery_time,$mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank){
	$qry = "insert into order_items(order_id,item,name,main,type,spice,tray_lg,tray_md,tray_sm,description,qty,lg_price,md_price,sm_price,ctmprice,total,d_total,pp,list,delivery_time,mr_cal,mr_limit_id,ingredient_id,rice_type,is_meat_cal,is_rice_cal,tspan,rank) values($order_id,$item_id,'$item_name',$main,2,$spice,$tray_lg,$tray_md,$tray_sm,'$comment',$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_ctm,$d_total_price_ctm,$ctm_pp,$ctm_list,'$delivery_time',$mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank)";
	q($qry);
 }

function insert_fullctm_item($order_id,$fullctm_name,$main,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_fullctm,$fullctm_pp,$fullctm_list,$delivery_time,$fullctm_mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank){
	$items3_qry = "insert into order_items(order_id,item,name,main,type,spice,tray_lg,tray_md,tray_sm,description,qty,lg_price,md_price,sm_price,ctmprice,total,d_total,pp,list,delivery_time,mr_cal,mr_limit_id,ingredient_id,rice_type,is_meat_cal,is_rice_cal,tspan,rank) values($order_id,1,'$fullctm_name',$main,3,$spice,$tray_lg,$tray_md,$tray_sm,'$comment',$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_fullctm,$total_price_fullctm,$fullctm_pp,$fullctm_list,'$delivery_time',$fullctm_mr_cal,$mr_limit_id,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank)";
	q($items3_qry);
 }









function time_interval(){
	return getbit("select value1 from settings where name like 'refresh_interval' ");
}

function order_type($tp){	if($tp==1) $tpnm='Package'; else if($tp==2 or $tp==3) $tpnm='Custom'; else $tpnm='Unknown type'; return $tpnm;	}
function total_rec($tbl){	return getbit("select count(id) from $tbl"); }
function customer_name($oid){	return getbit("select name from orders where id = $oid"); }
function food_pkg_price($pkg){	return getbit("select price from food_packages where id=$pkg"); }
function food_pkg_name($id){	return getbit("select name from food_packages where id = ".$id); }
function spice($sp){	if($sp==1) return 'V.Mild'; if($sp==2) return 'Mild'; if($sp==3) return 'Spicy'; if($sp==0) return '';	}
function pkg_nm($id){	return getbit("select name from food_packages where id=$id");	}
function item_nm($id,$tp=1,$r=NULL){	
	if($tp==1) $nm=getbit("select name from food_package_items where id=$id");	else 
	if($tp==2) $nm=getbit("select name from food_custom_items where id=$id"); else
	if($tp==3) $nm=$r['name'];
	else $nm = "Unknown type";
	return $nm;
 }
function pkgitem_nm($id,$tp,$pkg=0,$ctm_nm){	
	if($tp==1){
		if($pkg!=0) $id = $pkg;
		$nm=pkg_nm($id);
	} 
	else if($tp==2) $nm=getbit("select name from food_custom_items where id=$id");
	else if($tp==3) $nm=$ctm_nm;
	else $nm = "Unknown type";
	return $nm;
 }
function item_id($nm,$tp){	
	if($tp==1) $id=getbit("select id from food_package_items where name like '%$nm%' ");	else 
	if($tp==2) $id=getbit("select id from food_custom_items where name like '%$nm%' ");
	else $id = "0";
	return $id;
 }
function food_pkg_cat($pkg){
	$cat_ids = ar("select food_cat_id from food_package_cat where food_package_id=$pkg");
	$cat_ids = implode(',', $cat_ids);
	if($cat_ids=="")
	echo "<tr><td colspan='12'><span style='color:red;'>No any item addedd yet</span></td></tr>";
	return q("select * from food_cat where id IN($cat_ids)");
 }
function none_val($cat){	return getbit("select none from food_cat where id={$cat}"); }
function cat_items_options($cat,$id=""){
	$rs = q("select id,name,pp,reduce,increase,extra_price,selected,list from food_package_items where food_cat_id = $cat");
	if($id=="") echo "<option value=''>choose</option>";
	while($r = mysqli_fetch_array($rs)){
		$sl = $id==$r['id']? "selected='selected'":"";
		$pre = ($id=="")? 0: $id;
		$catid = $r['id'];
		$list = $r['list'];
		$catnm = $r['name'];
		if(!is_null($r['selected']) and $id=="")
			$selected = "selected='selected'";
		else
			$selected = $r['selected'];
		// $selected = $r['selected'];
		// if(!is_null($r['selected'])) $dcls = "class='default_opt'"; else $dcls = "";
		$pp = $r['pp'];
		$reduce = $r['reduce'];
		$increase = $r['increase'];
		$extra_price = $r['extra_price'];
		echo "<option value='{$catid}' data-pp='{$pp}' data-list='{$list}' data-reduce='{$reduce}' data-increase='{$increase}' data-extra-price='{$extra_price}' $sl {$selected} >{$catnm}</option>";
	}
	$sl = ($id=="0") ? "selected='selected'":"";
	$nnval = none_val($cat);
	echo "<option value='0' data-pp='0' data-list='1' data-reduce='{$nnval}' data-increase='0.00' {$sl}>None</option>";
 }
function bbq_items_list_by_name($dt){

	$qry = "select * from order_items where item != 0 and list=2 and date(delivery_time)='{$dt}' order by TIMESTAMP(delivery_time)";
	return q($qry);
 }
function bbq_pcs($r){
	if($r['type']==1) return $r['qty'];
	if($r['type']==2) 
		if($r['name']=="Tandoori Chicken Tikka")
			return $r['qty']*3;
		else
			return $r['qty'];
}
function salads($val){
	$nm = $val['name'];
	$it = $val['item'];
	$list = $val['list'];
	$dt = $val['dt'];

	$qry = "select sum(md), sum(sm) from (select sum(tray_md) as md,sum(tray_sm) as sm from order_items where name like '{$nm}' and item != 0 and list={$list} and date(delivery_time) = '{$dt}') as salads";
	return frow($qry);
 }

function total_raita($dt){
	$t1 = "order_items";
	$qry = "select sum(qty) from {$t1} where list=3 and item != 0 and date(delivery_time)='{$dt}'";
	$v = getbit($qry);
	return is_null($v)? 0 : $v; 
 }
function pot_items_of_day($list,$dt){
	$qry = "select * from order_items where item != 0 and mr_cal is not null and list={$list} and date(delivery_time)='{$dt}' group by name order by TIMESTAMP(delivery_time)";
	$rs = q($qry);
	$list = array();
	while($r = mysqli_fetch_array($rs)){ 
		array_push($list, array('name' => $r['name'],'item' => $r['item'],'type' => $r['type'],'pp' => $r['pp'],'list' => $r['list'],'dt' => tday_str($r['delivery_time'])));	}
	return $list;
 }
function pot_item_of_day($val){
	$nm = $val['name'];
	$it = $val['item'];
	$type = $val['type'];
	$list = $val['list'];
	$dt = $val['dt'];

	$qry = "select * from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where name like '{$nm}' and type={$type} and item != 0 and list={$list} and DATE(delivery_time) = '{$dt}' order by TIMESTAMP(delivery_time)";
	// die($qry);
	return qry_arr($qry);
 }
function non_mr_items_of_day($list,$dt){

	$qry = "select * from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where item != 0 and mr_cal is null and list={$list} and date(delivery_time)='{$dt}' group by name order by TIMESTAMP(delivery_time)";
	$rs = q($qry);
	$list = array();
	while($r = mysqli_fetch_array($rs)){ 
		array_push($list, array('name' => $r['name'],'item' => $r['item'],'type' => $r['type'],'pp' => $r['pp'],'list' => $r['list'],'dt' => tday_str($r['delivery_time'])));	}
	return $list;
 }
function tday($tm){	return strtotime(date('Y-m-d',strtotime($tm)));	}
function tday_str($tm){	return date('Y-m-d',strtotime($tm));	}
function sameday($d1,$d2){	return tday($d1) == tday($d2) ? true: false;	}
function add_hours_str($tst,$tspan){	return date('Y-m-d H:i:s',strtotime($tst." + {$tspan} hours"));	}
function add_hours_tm($tst,$tspan){	return strtotime($tst." + {$tspan} hours ");	}
function tm_range($r){	return strtotime($r['delivery_time']." + ".$r['tspan']." hours ");	}

function item_in_day($val){
	$nm = $val['name'];
	$it = $val['item'];
	$list = $val['list'];
	$dt = $val['dt'];
	$qry = "select * from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where name like '{$nm}' and item != 0 and list={$list} and date(delivery_time) = '{$dt}' order by TIMESTAMP(delivery_time)";
	return q($qry);
 }

function prefill(&$r,&$potitems,&$pots_list,&$pot,&$pot_num){

	array_push($potitems, $r);
	fillpot($potitems,$pots_list,$pot,$pot_num);
}
function postfill(&$r,&$potitems,&$pots_list,&$pot,&$pot_num){

	$npot = get_mr($r);
	sub_pot($pot,$npot);
	fillpot($potitems,$pots_list,$pot,$pot_num);
	array_push($potitems, $r);
	$pot = $npot;
}
function sub_pot(&$pot,&$npot){
	$pot['rice'] -= $npot['rice'];
	$pot['meat'] -= $npot['meat'];
}
function fillpot(&$potitems,&$pots_list,&$pot,&$pot_num){
	array_push($pots_list, array('potitems' => $potitems, 'pot'=> $pot,'potnum' => $pot_num++));
	$pot = array('meat'=>0.0,'rice'=>0.0);
	$potitems = array();
}
function is_potfull($r,$pot){
	if($r['is_meat_cal']){
		return $pot['meat']==$r['meat_limit'] ? true : false;
	}
	if($r['is_rice_cal']){
		return $pot['rice']==$r['rice_limit'] ? true : false;
	}
}
function fill_within_pot_time(&$r,&$potitems,&$pots_list,&$pot,&$pot_num,$nr){
	if(is_potfull($r,$pot)){
		prefill($r,$potitems,$pots_list,$pot,$pot_num);
	}
	else{
		if(is_null($nr)){
			prefill($r,$potitems,$pots_list,$pot,$pot_num);
		}else
		{
			if(within_pot_time($nr,$r)){
				array_push($potitems, $r);
			}else{
				prefill($r,$potitems,$pots_list,$pot,$pot_num);
			}
		}
	}
}
function fill_outof_pot_time(&$r,&$potitems,&$pots_list,&$pot,&$pot_num){
	postfill($r,$potitems,$pots_list,$pot,$pot_num);
}

function fill_in_potitem(&$r,&$potitems,&$pots_list,&$pot,&$pot_num,$nr){
	if(isset($potitems[0]))
	{
		if(within_pot_time($r,$potitems[0]))
			fill_within_pot_time($r,$potitems,$pots_list,$pot,$pot_num,$nr);
		else
			fill_outof_pot_time($r,$potitems,$pots_list,$pot,$pot_num);
	}else{
		fill_within_pot_time($r,$potitems,$pots_list,$pot,$pot_num,$nr);
		
	}

}
function empty_pot_if_outof_pot_time(&$r,&$potitems,&$pots_list,&$pot,&$pot_num){
	if(isset($potitems[0])) 
		if(!within_pot_time($r,$potitems[0]))
			fillpot($potitems,$pots_list,$pot,$pot_num);
}
function empty_pot(&$pot){
		$pot = array('meat'=>0.0,'rice'=>0.0);
}
function get_all_pots($list,$d){
	$n=1; $inc=0;
	$all_items_list = array();
	$pots  = array();
	$pot_items_list = pot_items_of_day($list,$d);
	$pots_list  = array();

	foreach ($pot_items_list as $key => $pot_item) {
			
		$pot = array('meat'=>0.0,'rice'=>0.0);
		$r2 = array();
		$nr = array();
		$potitems = array();
		$rs = pot_item_of_day($pot_item);
		$pot_ind = 0;
		$pot_num = 1;

		foreach($rs as $ind => $r)
		{
			$nr = isset($rs[$ind+1])? $rs[$ind+1]: NULL; 
			$r['split'] = 0;
			repeat:
			empty_pot_if_outof_pot_time($r,$potitems,$pots_list,$pot,$pot_num);
 			$r = pot_filling($pot,$r2,$r);

			if($r['split']==1)
			{			
				fill_in_potitem($r,$potitems,$pots_list,$pot,$pot_num,$nr);
				$r = $r2;
				$r['split'] = 0;
				goto repeat;
			}else{
				fill_in_potitem($r,$potitems,$pots_list,$pot,$pot_num,$nr);
			}
		}
		if (count($potitems)>0) {
			array_push($pots_list, array('potitems' => $potitems, 'pot'=> $pot,'potnum' => $pot_num++));
		}

	}



	$day_list = non_mr_items_of_day($list,$d);
	foreach ($day_list as $key => $val)
	{
		$potitems = array();
		$rs = item_in_day($val);
		$pot_ind = 0;
		$pot_num = 1;

		while($r = mysqli_fetch_assoc($rs))
		{
			if(isset($potitems[0]))
			{
				if(!within_pot_time($r,$potitems[0])){
					array_push($pots_list, array('potitems' => $potitems,'potnum' => $pot_num++));
					$potitems = array();
				}
			}
			array_push($potitems, $r);
		}
		if (count($potitems)>0){
			array_push($pots_list, array('potitems' => $potitems,'potnum' => $pot_num++));
		}
	}
	if(count($pots_list)>0){

		foreach ($pots_list as $key => $value) {
			$pots_list[$key]['delivery_time'] = $value['potitems'][0]['delivery_time'];
			$pots_list[$key]['potname'] = $value['potitems'][0]['name'];
			$pots_list[$key]['rank'] = $value['potitems'][0]['rank'];
		}
		foreach ($pots_list as $key => $val){
			$sort_dt[$key] = strtotime($val['delivery_time']);
			$sort_rank[$key] = $val['rank'];
			$sort_num[$key] = $val['potnum'];
		}

		array_multisort($sort_dt, SORT_ASC,$sort_rank, SORT_ASC, $sort_num, SORT_ASC, $pots_list);
		
		return $pots_list;
	}
	return array();
}

function misc_items_of_day($list,$dt){
	$qry = "select * from order_items where item !=0 and list={$list} and date(delivery_time)='{$dt}' group by name order by TIMESTAMP(delivery_time)";
	$rs = q($qry);
	$list = array();
	while($r = mysqli_fetch_array($rs)){ 
		array_push($list, array('name' => $r['name'],'item' => $r['item'],'type' => $r['type'],'pp' => $r['pp'],'list' => $r['list'],'dt' => tday_str($r['delivery_time'])));	}
	return $list;
}
function get_naan_pots($list,$d){
	$n=1; $inc=0;
	$pots_list  = array();

	$day_list = misc_items_of_day($list,$d);
	// die(print_r($day_list));
	foreach ($day_list as $key => $val)
	{
		$potitems = array();
		$rs = item_in_day($val);
		// die(print_r($rs));

		while($r = mysqli_fetch_assoc($rs)){	array_push($potitems, $r);	}
		if (count($potitems)>0){ array_push($pots_list, array('potitems' => $potitems));	}
	}
	// die(print_r($pots_list));
	if(count($pots_list)>0){

		foreach ($pots_list as $key => $value) {
			$pots_list[$key]['delivery_time'] = $value['potitems'][0]['delivery_time'];
			$pots_list[$key]['potname'] = $value['potitems'][0]['name'];
		}
		foreach ($pots_list as $key => $val){
			$sort_dt[$key] = strtotime($val['delivery_time']);
		}
		array_multisort($sort_dt, SORT_ASC, $pots_list);
		
		// die(print_r($pots_list));
		return $pots_list;
	}
	return array();
}



function within_pot_time($r,$rt){
	if(strtotime($r['delivery_time']) <= tm_range($rt))
		return true;
	else
		return false;
}
function outof_pot_time($r,$tm){
	if(strtotime($r['delivery_time']) > strtotime($tm." + ".$r['tspan']." hours "))
		return true;
	else
		return false;
}
function pot_filling(&$pot,&$r2,$r){

	$mr = get_mr($r);
	if($r['is_rice_cal']==1){
		if(($pot['rice']+$mr['rice']) <= $r['rice_limit']){

			$pot['rice'] += $mr['rice'];
			$pot['meat'] += $mr['meat'];

		}else{

			$r2 = $r;
			$r['split'] = 1;
			$r = fit_tray_with_rice($pot,$r2,$r);

		}
	}

	if($r['is_meat_cal']==1){
		if(($pot['meat']+$mr['meat']) <= $r['meat_limit']){

			$pot['meat'] += $mr['meat'];
			$pot['rice'] += $mr['rice'];
		}else{

			$r2 = $r;
			$r['split'] = 1;
			$r = fit_tray_with_meat($pot,$r2,$r);
		}
	}

	return $r;
 }

function fit_tray_with_rice(&$pot,&$r2,$r){

	$space_rice = $r['rice_limit'] - $pot['rice'];
	$pot['rice'] += $space_rice;
	$lg_rice = tray_to_rice($r,'lg');
	if($space_rice-$lg_rice>0){

		$r2['tray_lg'] -= $r['tray_lg'];
		$space_rice -= $lg_rice;

		$md_rice = tray_to_rice($r,'md');
		if($space_rice-$md_rice>0){

			$r2['tray_md'] -= $r['tray_md'];
			$space_rice -= $md_rice;


			$space_sm_tray = rice_to_tray($r,$space_rice,'sm');
			$r['tray_sm'] = $space_sm_tray;
			$r2['tray_sm'] -= $space_sm_tray;

		}else{

			$space_md_tray = rice_to_tray($r,$space_rice,'md');
			$r['tray_md'] = $space_md_tray;
			$r2['tray_md'] -= $space_md_tray;

			$r['tray_sm'] = 0;
		}
	}else{

		$space_lg_tray = rice_to_tray($r,$space_rice,'lg');
		$r['tray_lg'] = $space_lg_tray;
		$r2['tray_lg'] -= $space_lg_tray;

		$r['tray_md'] = 0;
		$r['tray_sm'] = 0;
	}
	if($r['type']==1) $r = fit_per($pot,$r2,$r);
	$pot['meat']  += get_mr($r)['meat'];
	
	return $r;

 }
function fit_tray_with_meat(&$pot,&$r2,$r){

	$space_meat = $r['meat_limit'] - $pot['meat'];
	$old_meat = $pot['meat'];
	$pot['meat'] += $space_meat;
	$lg_meat = tray_to_meat($r,'lg');
	if($space_meat-$lg_meat>0){
		$r2['tray_lg'] -= $r['tray_lg'];
		$space_meat -= $lg_meat;

		$md_meat = tray_to_meat($r,'md');
		if($space_meat-$md_meat>0){
			$r2['tray_md'] -= $r['tray_md'];
			$space_meat -= $md_meat;

			$space_sm_tray = meat_to_tray($r,$space_meat,'sm');
			$r['tray_sm'] = $space_sm_tray;
			$r2['tray_sm'] -= $space_sm_tray;

		}else{

			$space_md_tray = meat_to_tray($r,$space_meat,'md');
			$r['tray_md'] = $space_md_tray;
			$r2['tray_md'] -= $space_md_tray;

			$r['tray_lg'] = 0;
		}
		
	}else{

		$space_lg_tray = meat_to_tray($r,$space_meat,'lg');
		$r['tray_lg'] = $space_lg_tray;
		$r2['tray_lg'] -= $space_lg_tray;

		$r['tray_md'] = 0;
		$r['tray_sm'] = 0;
	}
	if($r['type']==1) $r = fit_per($pot,$r2,$r,$old_meat);

	return $r;

 }

function fit_per(&$pot,&$r2,$r,$old_meat=0){

	if($pot['meat']>0)
		$space_meat = $pot['meat']-$old_meat;
	else
		$space_meat = $r['meat_limit'];
	// $pot['meat'] += $space_meat;

	if($r['is_meat_cal']){

		$overflow_per = intval(meat_to_per($r,$space_meat));
	}
	if($r['is_rice_cal']){

		$overflow_per = intval(tray_to_per($r));
	}
	$r['persons'] = $overflow_per;
	$r2['persons'] -= $overflow_per;

	return $r;

 }

function get_mr($r){
	$mr_funs = array(
		1 => function($r){ //Chicken Biryani
			if($r['type']==1){	$meat = $r['persons']/10;	}
			if($r['type']==2||$r['type']==3){	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);	}
			$rice = (($r['tray_lg']*$r['rice_lg']) + ($r['tray_md']*$r['rice_md']) + ($r['tray_sm']*$r['rice_sm']));
			return array('rice' => $rice,'meat' => $meat);
		},2 => function($r){ //Veal Biryani
			if($r['type']==1){	$meat = $r['persons']/10;	}
			if($r['type']==2||$r['type']==3){	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);	}
			$rice = (($r['tray_lg']*$r['rice_lg']) + ($r['tray_md']*$r['rice_md']) + ($r['tray_sm']*$r['rice_sm']));
			return array('rice' => $rice,'meat' => $meat);
		},3 => function($r){ //Chicken Pulao
			if($r['type']==1){	$meat = $r['persons']/10;	}
			if($r['type']==2||$r['type']==3){	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);	}
			$rice = (($r['tray_lg']*$r['rice_lg']) + ($r['tray_md']*$r['rice_md']) + ($r['tray_sm']*$r['rice_sm']));
			return array('rice' => $rice,'meat' => $meat);
		},4 => function($r){ //Veal Pulao
			if($r['type']==1){	$meat = $r['persons']/10;	}
			if($r['type']==2||$r['type']==3){	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);	}
			$rice = (($r['tray_lg']*$r['rice_lg']) + ($r['tray_md']*$r['rice_md']) + ($r['tray_sm']*$r['rice_sm']));
			return array('rice' => $rice,'meat' => $meat);
		},5 => function($r){ //Chicken Korma
			if($r['type']==1)	$meat = $r['persons']/8;
			if($r['type']==2||$r['type']==3)	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);
			return array('rice' => 0.0,'meat' => $meat);
		},6 => function($r){ //Veal Korma
			if($r['type']==1)	$meat = $r['persons']/8;
			if($r['type']==2||$r['type']==3)	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);
			return array('rice' => 0.0,'meat' => $meat);
		},7 => function($r){ //Chicken Karahi
			if($r['type']==1)	$meat = $r['persons']/8;
			if($r['type']==2||$r['type']==3)	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);
			return array('rice' => 0.0,'meat' => $meat);
		},8 => function($r){ //Veal Karahi
			if($r['type']==1)	$meat = $r['persons']/8;
			if($r['type']==2||$r['type']==3)	$meat = ($r['tray_lg']*$r['meat_lg'])+($r['tray_md']*$r['meat_md'])+($r['tray_sm']*$r['meat_sm']);
			return array('rice' => 0.0,'meat' => $meat);
		},9 => function($r){ //Zarda
			$rice = ($r['tray_lg']*$r['rice_lg'])+($r['tray_md']*$r['rice_md'])+($r['tray_sm']*$r['rice_sm']);
			return array('rice' => $rice,'meat' => 0.0);
		}
	);
	return $mr_funs[$r['mr_cal']]($r);
 }
function tray_to_meat($r,$tray){
	$meat_funs = array(
		1 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},2 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},3 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},4 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},5 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},6 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},7 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},8 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['meat_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['meat_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['meat_sm'];
		},9 => function($r,$tray){
			if($tray=="lg") return $r['tray_lg']*$r['rice_lg']; else 
			if($tray=="md") return $r['tray_md']*$r['rice_md']; else
			if($tray=="sm") return $r['tray_sm']*$r['rice_sm'];
		}
	);
	return $meat_funs[$r['mr_cal']]($r,$tray);
 }
function meat_to_tray($r,$meat,$tray){
	$tray_funs = array(
		1 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},2 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},3 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},4 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},5 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},6 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},7 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		},8 => function($r,$meat,$tray){
			if($tray=="lg") return $meat/$r['meat_lg']; else 
			if($tray=="md") return $meat/$r['meat_md']; else
			if($tray=="sm") return $meat/$r['meat_sm'];
		}
	);
	return $tray_funs[$r['mr_cal']]($r,$meat,$tray);
 }
function rice_to_tray($r,$rice,$tray){
	$tray_funs = array(
		1 => function($r,$rice,$tray){
			if($tray=="lg") return ($rice/$r['rice_lg']); else
			if($tray=="md") return ($rice/$r['rice_md']); else
			if($tray=="sm") return ($rice/$r['rice_sm']);
		},2 => function($r,$rice,$tray){
			if($tray=="lg") return ($rice/$r['rice_lg']); else
			if($tray=="md") return ($rice/$r['rice_md']); else
			if($tray=="sm") return ($rice/$r['rice_sm']);
		},3 => function($r,$rice,$tray){
			if($tray=="lg") return ($rice/$r['rice_lg']); else
			if($tray=="md") return ($rice/$r['rice_md']); else
			if($tray=="sm") return ($rice/$r['rice_sm']);
		},4 => function($r,$rice,$tray){
			if($tray=="lg") return ($rice/$r['rice_lg']); else
			if($tray=="md") return ($rice/$r['rice_md']); else
			if($tray=="sm") return ($rice/$r['rice_sm']);
		},9 => function($r,$rice,$tray){
			if($tray=="lg") return ($rice/$r['rice_lg']); else
			if($tray=="md") return ($rice/$r['rice_md']); else
			if($tray=="sm") return ($rice/$r['rice_sm']);
		}
	);
	return $tray_funs[$r['mr_cal']]($r,$rice,$tray);
 }
function tray_to_rice($r,$tray){
	$rice_funs = array(
		1 => function($r,$tray){
			if($tray=="lg") return ($r['tray_lg']*$r['rice_lg']); else 
			if($tray=="md") return ($r['tray_md']*$r['rice_md']); else
			if($tray=="sm") return ($r['tray_sm']*$r['rice_sm']);
		},2 => function($r,$tray){
			if($tray=="lg") return ($r['tray_lg']*$r['rice_lg']); else 
			if($tray=="md") return ($r['tray_md']*$r['rice_md']); else
			if($tray=="sm") return ($r['tray_sm']*$r['rice_sm']);
		},3 => function($r,$tray){
			if($tray=="lg") return ($r['tray_lg']*$r['rice_lg']); else 
			if($tray=="md") return ($r['tray_md']*$r['rice_md']); else
			if($tray=="sm") return ($r['tray_sm']*$r['rice_sm']);
		},4 => function($r,$tray){
			if($tray=="lg") return ($r['tray_lg']*$r['rice_lg']); else 
			if($tray=="md") return ($r['tray_md']*$r['rice_md']); else
			if($tray=="sm") return ($r['tray_sm']*$r['rice_sm']);
		},9 => function($r,$tray){
			if($tray=="lg") return ($r['tray_lg']*$r['rice_lg']); else 
			if($tray=="md") return ($r['tray_md']*$r['rice_md']); else
			if($tray=="sm") return ($r['tray_sm']*$r['rice_sm']);
		}
	);
	return $rice_funs[$r['mr_cal']]($r,$tray);
 }
function meat_to_per($r,$meat){
	$per_funs = array(
		1 => function($meat){
			return $meat*10;
		},2 => function($meat){
			return $meat*10;
		},3 => function($meat){
			return $meat*10;
		},4 => function($meat){
			return $meat*10;
		},5 => function($meat){
			return $meat*8;
		},6 => function($meat){
			return $meat*8;
		},7 => function($meat){
			return $meat*8;
		},8 => function($meat){
			return $meat*8;
		}
	);
	return $per_funs[$r['mr_cal']]($meat);
 }
function tray_to_per($r){
	$food_cat = $r['category'];
	$persons = frow("select lg_max,md_max,sm_max from food_cat where id = {$food_cat}");
	return $persons['lg_max']*$r['tray_lg']+$persons['md_max']*$r['tray_md']+$persons['sm_max']*$r['tray_sm'];
}


function pkg_meat(&$r,$dt,$div){
	$qry = "select sum(persons) from order_items where ingredient_id = {$r['id']} and type=1 and date(delivery_time)='{$dt}' ";
	return round(getbit($qry)/$div,2);
 }
function ctm_meat(&$r,$dt){
	$clms = "sum(tray_lg*meat_lg),sum(tray_md*meat_md),sum(tray_sm*meat_sm),sum(qty)";
	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=2 and date(delivery_time)='{$dt}'";
	$row = frow($qry);
	return round($row[0]+$row[1]+$row[2],2);
 }
function fullctm_meat(&$r,$dt){
	$clms = "sum(tray_lg*meat_lg),sum(tray_md*meat_md),sum(tray_sm*meat_sm),sum(qty)";
	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=3 and date(delivery_time)='{$dt}'";
	$row = frow($qry);
	return round($row[0]+$row[1]+$row[2],2);
 }
function pkg_rice(&$r,$dt){
	$clms = "sum(tray_lg*rice_lg),sum(tray_md*rice_md),sum(tray_sm*rice_sm),sum(qty)";
	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=1 and date(delivery_time)='{$dt}'";
	$row = frow($qry);
	return round($row[0]+$row[1]+$row[2],2);
 }
function ctm_rice(&$r,$dt){
	$clms = "sum(tray_lg*rice_lg),sum(tray_md*rice_md),sum(tray_sm*rice_sm),sum(qty)";
	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=2 and date(delivery_time)='{$dt}'";
	$row = frow($qry);
	return round($row[0]+$row[1]+$row[2],2);
 }
function fullctm_rice(&$r,$dt){
	$clms = "sum(tray_lg*rice_lg),sum(tray_md*rice_md),sum(tray_sm*rice_sm),sum(qty)";
	$qry = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=2 and date(delivery_time)='{$dt}'";
	$row = frow($qry);
	return round($row[0]+$row[1]+$row[2],2);
 }
function ctm_meat_for_all(&$r,$dt){
	$clms = "sum(tray_lg*meat_lg),sum(tray_md*meat_md),sum(tray_sm*meat_sm)";
	$qry1 = "select {$clms} from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and date(delivery_time)='{$dt}'";
	$row1 = frow($qry1);
	return round($row1[0]+$row1[1]+$row1[2],2);
 }
function all_qty(&$r,$dt){
	$qry = "select sum(qtysum) from (select sum(qty) as qtysum from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and date(delivery_time)='{$dt}') as allqty";
	$qty = getbit($qry);
	return is_null($qty)? 0:$qty;
 }
 function qty_pkg(&$r,$dt){
	$qry = "select sum(qtysum) from (select sum(qty) as qtysum from order_items LEFT JOIN mr_limits on mr_limit_id=mr_limits.id where ingredient_id = {$r['id']} and type=1 and date(delivery_time)='{$dt}') as allqty";
	$qty = getbit($qry);
	return is_null($qty)? 0:$qty;
 }
  function qty_ctm(&$r,$dt){
	$qry = "select sum(qtysum) from (select sum(qty) as qtysum from order_items where ingredient_id = {$r['id']} and type=2 and date(delivery_time)='{$dt}') as allqty";
	$qty = getbit($qry);
	return is_null($qty)? 0:$qty;
 }
  function qty_fullctm(&$r,$dt){
	$qry = "select sum(qtysum) from (select sum(qty) as qtysum from order_items where ingredient_id = {$r['id']} and type=3 and date(delivery_time)='{$dt}') as allqty";
	$qty = getbit($qry);
	return is_null($qty)? 0:$qty;
 }

 // Get values
function getIngVal(&$r,$dt){
	$wt = array('kg' => 0.0,'lb' => 0.0,'per' => 0, 'qty' => NULL);
	$meat_funs = array(
		1 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,10)+ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*3,2));
		},2 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,8)+ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*3,2));
		},3 => function(&$r,$dt){
			$pcs =  qty_ctm($r,$dt) * 3;
			$pcs +=  qty_fullctm($r,$dt) * 3;
			$pcs += qty_pkg($r,$dt);
			$legs = round($pcs / 3, 2);
			return array('val1' => $pcs,'val2' => $legs);
		},4 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,10)+ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},5 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,8)+ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},6 => function(&$r,$dt){
			$kg = round(all_qty($r,$dt)*0.08,2);
			return array('val1' => $kg,'val2' =>round($kg*2.2,2));
		},7 => function(&$r,$dt){
			$kg = ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},8 => function(&$r,$dt){
			$kg = round(all_qty($r,$dt)*0.08,2);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},9 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,8)+ctm_meat($r,$dt)+fullctm_meat($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},10 => function(&$r,$dt){
			$lb = round(all_qty($r,$dt)*0.70,2);
			return array('val1' => 0, 'val2' => $lb);
		},11 => function(&$r,$dt){
			$kg = pkg_meat($r,$dt,8);
			$kg += round(ctm_meat($r,$dt),2);
			$kg += round(fullctm_meat($r,$dt),2);
			return array('val1' => $kg,'val2' => round($kg*2.2,2));
		},12 => function(&$r,$dt){
			$lb = round(all_qty($r,$dt)*0.70,2);
			return array('val1' => 0,'val2' => $lb);
		},13 => function(&$r,$dt){
			$lb = round(all_qty($r,$dt)*0.50,2);
			return array('val1' => 0,'val2' => $lb);
		},14 => function(&$r,$dt){
			$pcs = all_qty($r,$dt);
			return array('val1' => $pcs,'val2' => 0);
		},15 => function(&$r,$dt){
			$kg = pkg_rice($r,$dt)+ctm_rice($r,$dt)+fullctm_rice($r,$dt);
			return array('val1' => $kg,'val2' => round($kg*3,2));
		}
	);
	return $meat_funs[$r['cal']]($r,$dt);
 }

	// Ingredients Daily RS
	function ingredientRs($qry,$dt)
	{
		$rs = q($qry); $arr = array();
		while($r = mysqli_fetch_assoc($rs)){
			$res = getIngVal($r,$dt);
			$r['val1'] = $res['val1'];
			$r['val2'] = $res['val2'];
			$r['total'] = 0.0;
			array_push($arr,$r);
		}

		foreach ($arr as $key => $val) {
			$limit = $val['rowspan'];
			if($limit==1) $arr[$key]['total'] = $val['val2'];
			elseif ($limit>1) for ($i=0; $i < $limit; $i++) $arr[$key]['total'] += $arr[$key+$i]['val2'];
		}
		return $arr;
	}

	// Ingredients Weekly RS
	function ingredientWeeklyRs($qry,$dt)
	{
		$rs = q($qry); $arr = array();
		while($r = mysqli_fetch_assoc($rs)){
			// $r['val1'] = weeklyIngVals($r,$dt,'val1');
			$r['val2'] = weeklyIngVals($r,$dt);
			$r['wtotal'] = arrTotal($r['val2']);
			$r['purchased'] = getPurchasedItems($r['id'],$dt);
			$r['remaining'] = 0;
			$r['total'] = 0;
			array_push($arr,$r);
		}

		foreach ($arr as $key => $val) {
			$limit = $val['rowspan'];
			if($limit==1){

				$arr[$key]['total'] = $val['wtotal'];
				$arr[$key]['remaining'] = $arr[$key]['total'] - $arr[$key]['purchased'];

			}elseif ($limit>1) {
				for ($i=0; $i < $limit; $i++)	$arr[$key]['total'] += $arr[$key+$i]['wtotal'];
				$arr[$key]['remaining'] = $arr[$key]['total'] - $arr[$key]['purchased'];
			}
		}
		return $arr;
	}


function weeklyIngVals($r,$dt,$val="val2"){
	$monday = firstDayOfWeek($dt);
	$arr = array();
	for ($i=0; $i < 7; $i++) { 
		array_push($arr, getIngVal($r,incDay($monday,$i))[$val]);
	}
	return $arr;
}

function getPurchasedItems($id,$dt){
	$dt = firstDayOfWeek($dt);
	return getbit("select value from purchased_items where ingredient_id = {$id} and DATE(date) = '$dt' ") ?? 0;
}


function p($qry,$lim=26){
	if(isset($_POST['page'])){
		$pgno = (int) $_POST['page'];
	}else{	$pgno = 1;	}
	$rows = mysqli_num_rows(q($qry));
	$GLOBALS['pages'] = ceil($rows/$lim);
	$offset = ($pgno-1) * $lim;
	$qry.=" limit $offset,$lim";
	return	q($qry);
 }
function norecord($rs,$num){
	if(mysqli_num_rows($rs)<1){
		echo "<tr><td colspan='$num'>";
		echo "<span class='text-danger font-weight-bold'>No record found!</span>";
		echo "</td></tr>";
	}
 }
function norecord_arr($rs,$num){
	if(count($rs)<1){
		echo "<tr><td colspan='$num'>";
		echo "<span class='text-danger font-weight-bold'>No record found!</span>";
		echo "</td></tr>";
	}
 }
function tbl_pagination($num){
	echo "<tr class='d-print-none'><td colspan='$num'>";
	include 'inc/pagination.php';
	echo "</td></tr>";
 }
function flt_qry($qry,$ex="",$rpp=15){
	$GLOBALS['sr'] = isset($_POST['page'])? (int) ($_POST['page']-1)*$_POST['rpp']:1;
	$clause = array();
		if(isset($_POST['search'])){
			$srch = $_POST['search'];
			$q = " name like '%$srch%'";		
			if(is_numeric($srch)) $q .= " or id=$srch";		
			$clause[] = $q;
		}
		if(isset($_POST['searchid'])){
			$clause[] = " id = ".$_POST['searchid'];			
		}
		if(isset($_POST['delivery_time'])){
			$clause[] = " DATE(delivery_time) = '".$_POST['delivery_time']."'";			
		}
		if(isset($_POST['pickup_time'])){
			$clause[] = " pickup_time like '%".$_POST['pickup_time']."%'";			
		}
		if(isset($_POST['phone'])){
			$clause[] = " phone1 like '%".$_POST['phone']."%' or phone2 like '%".$_POST['phone']."%'";			
		}
		if(isset($_POST['rpp'])){
			$rpp = $_POST['rpp'];			
		}

		if(count($clause)>0)
		{
			$cls = implode(" and ", $clause);
			$qry .= " where ".$cls;
		}

		return p($qry." ".$ex,$rpp);
 }
function qbuild($qry){
	$clause = array();
	if(isset($_POST['search'])){
		$clause[] = " name like '%".$_POST['search']."%'";			
	}
	if(isset($_POST['delivery_time'])){
		$clause[] = " DATE(delivery_time) = '".$_POST['delivery_time']."'";			
	}
	if(isset($_POST['searchid'])){
		$clause[] = " id = ".$_POST['searchid'];			
	}
	if(count($clause)>0)
	{
		$cls = implode(" and ", $clause);
		$qry .= " where ".$cls;
	}
	return $qry;
 }
function fsum($clm,$tbl,$ex=""){
	$qry = "select ROUND(SUM($clm),2) from $tbl ";
	$qry = qbuild($qry);
	return getbit($qry." ".$ex);
 }
function qsum($clm,$tbl,$ex=""){
	$qry = "select ROUND(SUM($clm),2) from $tbl ";
	return getbit($qry.$ex);
 }
function fnum($tbl,$ex=""){
	$qry = "select count(id) from $tbl ";
	$qry = qbuild($qry);
	return getbit($qry." ".$ex);
 }

function firstDayOfWeek($date){
	$weekday = date("l",strtotime($date));
	while($weekday!="Monday"){
		$date = date("Y-m-d",strtotime($date."-1 day"));
		$weekday = date("l",strtotime($date));
	}
	return $date;
}
function lastDayOfWeek($date){
	$weekday = date("l",strtotime($date));
	while($weekday!="Sunday"){
		$date = date("Y-m-d",strtotime($date."+1 day"));
		$weekday = date("l",strtotime($date));
	}
	return $date;
}
function showWeek($date){
	return "Monday(".firstDayOfWeek($date).") - Sunday(".lastDayOfWeek($date).")";
}
function incDay($date,$i=1){
	return date("Y-m-d",strtotime($date."+".$i." day"));
}
function arrTotal($arr){
	$sum = 0;
	foreach ($arr as $key => $val) $sum += $val;
	return $sum;
}

?>