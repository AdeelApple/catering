<?php 

session_start();
include '../inc/build.php';


	$order_id = order_no();

	$date = $_POST['date'];
	$customer = pr($_POST['customer']);
	$phone1 = pr($_POST['phone1']);
	$phone2 = pr($_POST['phone2']);
	$persons = zifnull($_POST['persons']);
	$total = zifnull($_POST['total']);
	$advance = zifnull($_POST['advance']);
	$balance = $total - $advance;
	$shipping = $_POST['shipping'];
	$address = pr($_POST['address']);
	$remark = pr($_POST['remark']);
	$extra = zifnull($_POST['extra']);
	$delivery_time = $_POST['delivery_time'];




	q("insert into orders(name,persons,extra,total,advance,balance,phone1,phone2,shipping,delivery_time,address,remark,date) values('$customer',$persons,$extra,$total,$advance,$balance,'$phone1','$phone2',$shipping,'$delivery_time','$address','$remark','$date')");



	// Packages
	$ids = $_POST['pkgid'];
	foreach ($ids as $key => $value) 
	{
		if($_POST['pkg'][$key])
		{

			$cts = $_POST['pkgiid'.$value];
			$pkgprice = zifnull($_POST['pkgprice'.$value]);
			$pkg_total = $pkgprice * $persons;
			$pkgcmt = pr($_POST['pkgcmt'.$value]);
			
			foreach ($cts as $key1 => $value1)
			{

				$item_id = $_POST['item'.$value.$value1];
				$comment = pr($_POST['comment'.$value.$value1]);

				$category = $_POST['category'.$value.$value1];
				$package = $_POST['pkg_selected'.$value];
				$pkg_name = food_pkg_name($package);
				$spice = nullifunset('spice'.$value.$value1);
				$list = $_POST['list'.$value.$value1];
				$is_pp = $_POST['is_pp'.$value.$value1];
				$main = $value;


				$it = frow('select * from food_package_items where id = '.$item_id);
				$item_name = $it['name']??'NULL';
				$mr_limits = $it['mr_limit_id']??'NULL';
				$ingredient_id = $it['ingredient_id']??'NULL';
				$mr_cal = $it['mr_cal']??'NULL';
				$rice_type = $it['rice_type']??'NULL';
				$is_meat_cal = $it['is_meat_cal']??'NULL';
				$is_rice_cal = $it['is_rice_cal']??'NULL';
				$tspan = $it['tspan']?? 4;
				$rank = $it['rank']?? 10000;

				if($is_pp){
					
					$tray_lg = "NULL";
					$tray_md = "NULL";
					$tray_sm = "NULL";
					$extra_price = zifnull($_POST['extra_price'.$value.$value1]);
					$total_qty = zifnull($_POST['total_qty'.$value.$value1]);
					$extra_qty = zifnull($_POST['extra_qty'.$value.$value1]);
					$total_qty = $total_qty + $extra_qty;
					
				}else{
					
					$tray_lg = $_POST['tray_lg'.$value.$value1];
					$tray_md = $_POST['tray_md'.$value.$value1];
					$tray_sm = $_POST['tray_sm'.$value.$value1];
					$total_qty = "NULL";
					$extra_qty = "NULL";
					$extra_price = "NULL";
				}

				insert_pkg_item($order_id,$item_id,$item_name,$category,$package,$main,$persons,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$total_qty,$extra_qty,$extra_price,$pkgprice,$pkgcmt,$pkg_total,$is_pp,$list,$delivery_time,$mr_cal,$mr_limits,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank);
			}
		}
	}



	

	// Custom Order
	$ctm = $_POST['ctmid'];
	foreach ($ctm as $key => $value) {

		if($_POST['ctm'][$key])
		{			

			$ctmiid = $_POST['ctmiid'.$value];

			foreach ($ctmiid as $key1 => $value1)
			{

				if (isset($_POST['mark'.$value][$key1]))
				{
					$item_id = $_POST['ctm_item'.$value.$value1];
					$ctm_pp = 	$_POST['ctm_pp'.$value.$value1];
					$ctm_list = 	$_POST['ctm_list'.$value.$value1];
					$main = $value;



					$it = frow('select * from food_custom_items where id = '.$item_id);
					$item_name = $it['name']??'NULL';
					$mr_limits = $it['mr_limit_id']??'NULL';
					$ingredient_id = $it['ingredient_id']??'NULL';
					$mr_cal = $it['mr_cal']??'NULL';
					$rice_type = $it['rice_type']??'NULL';
					$is_meat_cal = $it['is_meat_cal']??'NULL';
					$is_rice_cal = $it['is_rice_cal']??'NULL';
					$tspan = $it['tspan']?? 4;
					$rank = $it['rank']?? 10000;

					if($ctm_pp){

						$tray_lg  = "NULL";
						$tray_md  = "NULL";
						$tray_sm  = "NULL";
						$lg_price =	"NULL";
						$md_price =	"NULL";
						$sm_price =	"NULL";
						$qty = zifnull($_POST['ctm_qty'.$value.$value1]);
						$ps_price = zifnull($_POST['ps_price'.$value.$value1]);

					}else{

						$tray_lg  = $_POST['tray_lg_ctm'.$value.$value1];
						$tray_md  = nullifunset('tray_md_ctm'.$value.$value1);
						$tray_sm  = $_POST['tray_sm_ctm'.$value.$value1];
						$lg_price =	$_POST['lg_price'.$value.$value1];
						$md_price =	nullifunset('md_price'.$value.$value1);
						$sm_price =	$_POST['sm_price'.$value.$value1];
						$qty = "NULL";
						$ps_price = "NULL";

						
					}
					$total_price_ctm = $_POST['total_price_ctm'.$value.$value1];
					$d_total_price_ctm = zifnull($_POST['d_total_price_ctm'.$value.$value1]);
					$spice = 	nullifunset('spice_ctm'.$value.$value1);
					$comment = 	pr($_POST['comment_ctm'.$value.$value1]);
					

					insert_ctm_item($order_id,$item_id,$item_name,$main,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_ctm,$d_total_price_ctm,$ctm_pp,$ctm_list,$delivery_time,$mr_cal,$mr_limits,$ingredient_id,$rice_type,$is_meat_cal,$is_rice_cal,$tspan,$rank);	
					// echo $items2_qry."<br>";
				}
			}

		}
	}







	

	// FullCustom Orders
	$fullctm = $_POST['fullctmid'];
	foreach ($fullctm as $key => $value) {


		if($_POST['fullctm'][$key])
		{			

			$ctmiid = $_POST['fullctmiid'.$value];

			foreach ($ctmiid as $key1 => $value1)
			{
				
				$fullctm_name = pr($_POST['fullctm_name'.$value.$value1]);
				if($fullctm_name!="")
				{						
					$fullctm_pp   = $_POST['fullctm_pp'.$value.$value1];
					$fullctm_list = $_POST['fullctm_list'.$value.$value1];
					$main = $value;

					list($fullctm_mr_cal, $ingredient_id) = explode('|', $_POST['fullctm_mr_cal'.$value.$value1]);

					if($fullctm_mr_cal!="none"){

						$it = frow("select * from food_package_items where mr_cal = {$fullctm_mr_cal} and ingredient_id = {$ingredient_id} limit 1"); 
						$mr_limits = $it['mr_limit_id']??'NULL';
						$ingredient_id = $it['ingredient_id']??'NULL';
						$rice_type = $it['rice_type']??'NULL';
						$is_meat_cal = $it['is_meat_cal']??'NULL';
						$is_rice_cal = $it['is_rice_cal']??'NULL';
						$meat_type = nullIfNone($_POST['fullctm_meat_type'.$value.$value1]);
						$persons = nullIfZ($_POST['persons_fullctm'.$value.$value1]);


					}else{

						$fullctm_mr_cal = "NULL";
						$rice_type = "NULL";
						$is_meat_cal = "NULL";
						$is_rice_cal = "NULL";
						$meat_type = "NULL";
						$ingredient_id = "NULL";
						$mr_limits = "NULL";

					}

					if($fullctm_pp){

						$tray_lg  = "NULL";
						$tray_md  = "NULL";
						$tray_sm  = "NULL";
						$lg_price =	"NULL";
						$md_price =	"NULL";
						$sm_price =	"NULL";
						$qty = $_POST['fullctm_qty'.$value.$value1];
						$ps_price = zifnull($_POST['ps_price_fullctm'.$value.$value1]);

					}else{

						$tray_lg  = zifnull($_POST['tray_lg_fullctm'.$value.$value1]);
						$tray_md  = zifnull($_POST['tray_md_fullctm'.$value.$value1]);
						$tray_sm  = zifnull($_POST['tray_sm_fullctm'.$value.$value1]);
						$lg_price =	zifnull($_POST['lg_price_fullctm'.$value.$value1]);
						$md_price =	zifnull($_POST['md_price_fullctm'.$value.$value1]);
						$sm_price =	zifnull($_POST['sm_price_fullctm'.$value.$value1]);
						$qty = "NULL";
						$ps_price = "NULL";
						
					}

					$total_price_fullctm =  zifnull($_POST['total_price_fullctm'.$value.$value1]);
					$spice = 	nullifunset('spice_fullctm'.$value.$value1);
					$comment = 	pr($_POST['comment_fullctm'.$value.$value1]);
					
					
					insert_fullctm_item($order_id,$fullctm_name,$main,$persons,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_fullctm,$fullctm_pp,$fullctm_list,$delivery_time,$fullctm_mr_cal,$mr_limits,$ingredient_id,$rice_type,$meat_type,$is_meat_cal,$is_rice_cal,4,10000);
				}
			}
		}
	}





	header("Location: ../receipt.php?oid=".$order_id);

 ?>