	<div class="col border p-0 k-items">
				<h6 class="text-center bg-success text-light pblack mb-0 p-2 border"><?=$val['name'];?></h6>
				<?php 
				?>
	 			<div class="row m-0 border">
	 				<div class="col-2 p-0"><?=customer_name($r['order_id']);?></div>
	 				<div class="col p-0"><?=date('h:iA',strtotime($r['delivery_time']));?></div>
	 				<div class="col p-0"><?=spice($r['spice'])?></div>
	 				<div class="col p-0"><?php if($r['type']==1) echo intval($r['persons']).'person'; ?></div>
	 				<?php if($val['pp']){ ?>
	 				<div class="col p-0">qty<?=$r['qty']?></div>
			 		<?php }else{ ?>
	 				<?php if($r['tray_lg']>0) $trays.= "<span class='tr-b px-2'>".round($r['tray_lg'],1).'L</span>'; ?>
	 				<?php if($r['tray_md']>0) $trays.= "<span class='tr-b px-2'>".round($r['tray_md'],1).'M</span>'; ?>
	 				<?php if($r['tray_sm']>0) $trays.= "<span class='tr-b px-2'>".round($r['tray_sm'],1).'S</span>'; ?>
	 				<div class='col-2 p-0'><?=$trays?></div>
			 		<?php } ?>
	 				<div class="col-3 p-0"><?php if($r['type']==2) echo "(ctm)"; echo $r['description']; ?></div>
	 			</div>
	 			<div class="row m-0 fc p-fc">
	 				<div class="col p-0 text-center"><?php  ?></div>
	 				<div class="col p-0 text-center">Meat: <?=round($pot['meat'],2)?> kg</div>
	 			</div>
			</div>