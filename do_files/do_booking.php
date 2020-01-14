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
				$main = $value;
				$list = $_POST['list'.$value.$value1];
				$is_pp = $_POST['is_pp'.$value.$value1];

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

				insert_pkg_item($order_id,$item_id,$category,$package,$main,$persons,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$total_qty,$extra_qty,$extra_price,$pkgprice,$pkgcmt,$pkg_total,$is_pp,$list,$delivery_time);
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
					

					insert_ctm_item($order_id,$item_id,$main,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_ctm,$d_total_price_ctm,$ctm_pp,$ctm_list,$delivery_time);	
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
					$fullctm_pp = 	$_POST['fullctm_pp'.$value.$value1];
					$fullctm_list = $_POST['fullctm_list'.$value.$value1];
					$main = $value;
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
					
					
					insert_fullctm_item($order_id,$fullctm_name,$main,$spice,$tray_lg,$tray_md,$tray_sm,$comment,$qty,$lg_price,$md_price,$sm_price,$ps_price,$total_price_fullctm,$fullctm_pp,$fullctm_list,$delivery_time);
				}
			}
		}
	}





	header("Location: ../receipt.php?oid=".$order_id);

 ?>