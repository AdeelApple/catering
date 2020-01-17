<?php include "inc/top.php"; 

  if(!isset($_GET['oid'])){
    die("Sorry!!! Access Forbidden...");
  }
  $oid = $_GET['oid'];
  $customer = frow("select * from orders where id=".$oid);
  $stamp = strtotime($customer['delivery_time']);
  $items = q("select * from order_items where order_id=".$oid." and type=1 group by package union select * from order_items where type!=1 and order_id = ".$oid);

?>
    <div class="card mx-4 mt-2">
      <div class="card-header bg-light text-center">
        <div class="row">
          <div class="col-4"></div>
          <div class="col-2">
            <img src="pics/logo.png" width="100">
          </div>
          <div class="col-2">
            <h4 class="">AL Mustafa Catering</h4>
          </div>
          <div class="col-4"></div>
        </div>
      </div>
      <div class="card-body p-1">
        <table class="table small receipt-table">
          <tbody>
            <tr>
              <th>Order ID:</th>
              <td><?=$customer['id']?></td>
            </tr>
            <tr>
              <th>Customer</th>
              <td><?=$customer['name']?></td>
            </tr>
            <tr>
              <th>Phone:</th>
              <td><?=$customer['phone1'];?><?php if(!empty($customer['phone2'])) echo " | ".$customer['phone2']; ?></td>
            </tr>
            <tr>
              <th>Order Placed On:</th>
              <td><?=date("d-M-Y", strtotime($customer['date']))?></td>
            </tr>
            <tr>
              <th>Shipping Method:</th>
              <td><?=shipping($customer['shipping']);?></td>
            </tr>
            <tr>
              <th>Address:</th>
              <td><?=$customer['address']?></td>
            </tr>
            <tr>
              <th>Delivery/Extra:</th>
              <td><?php if($customer['extra']>0.0) echo "$".$customer['extra']; ?></td>
            </tr>
            <tr>
              <th>Delivery/Pickup Date&Time:</th>
              <td><?=date('l d-M-Y \A\T h:iA',$stamp)?></td>
            </tr>
          </tbody>
        </table>
        <table class="table small table-sm receipt-table2">
          <thead>
            <tr style="background-color: #f1f1f1;">
              <th width="2%">Sr.</th>
              <th width="15%">Recipe/Package</th>
              <th width="5%">Type</th>
              <th width="5%">Spice</th>
              <th width="40%" align="center">Qty & Price</th>
              <th width="8%">In Warmer</th>
              <th width="8%">In Carier</th>
              <th width="10%">Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $n=1; while($it = mysqli_fetch_array($items)){
              $pkg = $it['package']; $trays =  array(); ?>
            <tr class="bg-light">
              <td class="align-middle"><?=$n++?></td>
              <td class="align-middle"><b><?=pkgitem_nm($it['item'],$it['type'],$it['package'],$it['name'])?></b></td>
              <td class="align-middle"><?=order_type($it['type'])?></td>

              <?php if($it['type']==1){ ?>

              <td colspan="2">No. of Persons: <b>(<?=$it['persons']?>)</b> Package Price/Person: <b>(<?="$".$it['pkgprice']; ?>)</b> <span class="px-4 font-weight-bold">(<?=$it['persons']." x ".$it['pkgprice'];?>)</span></td>
              <td colspan="2"></td>
              <td class="subtotal">$<?=$it['total']?></td>

            <?php }else{ if(!$it['pp']){

              if($it['tray_lg']>0) $trays[] = "<span class='px-1'><b>Larg Tray</b>($".$it['lg_price'].") x ".$it['tray_lg']."</span>";
              if($it['tray_md']>0) $trays[] = "<span class='px-1'><b>Medium Tray</b>($".$it['md_price'].") x ".$it['tray_md']."</span>";
              if($it['tray_sm']>0) $trays[] = "<span class='px-1'><b>Small Tray</b>($".$it['sm_price'].") x ".$it['tray_sm']."</span>";                    
              if(count($trays)>0) $eq = " = <b>$".$it['total']."</b>"; else $eq = "";
             ?>
              <td class="align-middle"><?=spice($it['spice'])?></div></td>
              <td><?=implode(' + ',$trays).$eq;?> <br><?php if($it['description']!="") echo "<hr class='m-1'><b>Description:</b> ".$it['description']; ?></td>
              <td class="align-middle"><div class="tickbox"></div></td>
              <td class="align-middle"><div class="tickbox"></div></td>
              <td class=".subtotal">$<?=$it['d_total']?></td>
            <?php }else{ ?>
              <td class="align-middle"><?=spice($it['spice'])?></div></td>
              <td><?="<b>Quantity:</b> ".$it['qty']." x $".$it['ctmprice'];?> = <b>$<?=$it['total']?></b> <br><?php if($it['description']!="") echo "<hr class='m-1'><b>Description:</b> ".$it['description']; ?></td>
              <td class="align-middle"><div class="tickbox"></div></td>
              <td class="align-middle"><div class="tickbox"></div></td>
              <td class="subtotal">$<?=$it['d_total']?></td>
            <?php }} ?>
            </tr>
            <?php if($it['type']==1){ ?>
            <tr>
              <td class="p-0"></td>
              <td colspan="6" class="p-0">
                <table class="table text-center table-bordered table-sm m-0">
                  <thead>
                    <tr>
                      <th class="text-left">Recipe</th>
                      <th>Spice</th>
                      <th>Tray_lg</th>
                      <th>Tray_md</th>
                      <th>Tray_sm</th>
                      <th>Description</th>
                      <th width="10%">In Warmer</th>
                      <th width="10%">In Carrier</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php 
                      $i=1;
                      $rs1 = q("select * from order_items where order_id=$oid and package=$pkg and item!=0");
                      while($r1 = mysqli_fetch_array($rs1)){
                        $qty = $r1['qty'];
                        if(!is_null($r1['extra_qty']) and $r1['extra_qty']>0)
                          $qty = ($r1['qty']-$r1['extra_qty'])." + ".$r1['extra_qty']."($".$r1['extra_price'].")"; ?>
                    <tr>
                      <td class="text-left"><?=item_nm($r1['item'],$r1['type'],$r1)?></td>
                      <td><?=spice($r1['spice'])?></td>
                      <?php if(!$r1['pp']){ ?>
                      <td><?php if($r1['tray_lg']>0) echo $r1['tray_lg'];?></td>
                      <td><?php if($r1['tray_md']>0) echo $r1['tray_md'];?></td>
                      <td><?php if($r1['tray_sm']>0) echo $r1['tray_sm'];?></td>
                      <?php }else{ ?>
                      <td colspan="3">Quantity: <?=$qty?></td>
                      <?php } ?>
                      <td><?=$r1['description'];?></td>
                      <td class="text-center"><div class="tickbox"></div></td>
                      <td class="text-center"><div class="tickbox"></div></td>
                    </tr>
                  <?php } ?>
                  </tbody>
                </table>
              </td>
              <td></td>
            </tr>
            <?php }} ?>
          </tbody>
          <tfoot>
            <tr>
              <th colspan="6"></th>
              <th>Total</th>
              <th>$<?=$customer['total']?></th>
            </tr>
            <tr>
              <th colspan="6"></th>
              <th>Advance</th>
              <th>$<?=$customer['advance']?></th>
            </tr>
            <tr>
              <th colspan="6"></th>
              <th>Balance</th>
              <th>$<?=$customer['balance']?></th>
            </tr>
          </tfoot>
        </table>
        <div class="row">
          <div class="col-md-12">
            <a href="index.php" class="btn btn-sm btn-danger float-right mx-1 mr-5 d-print-none"><i class="fa fa-times"></i> Close</a>
            <a href="orders.php" class="btn btn-sm btn-info float-right mx-1 d-print-none"><i class="fa fa-file-alt"></i> Order List</a>
            <a href="booking.php" class="btn btn-sm btn-primary float-right mx-1 d-print-none"><i class="fa fa-book"></i> New Booking</a>
            <a href="booking_edit.php?oid=<?=$_GET['oid']?>" class="btn btn-sm btn-success float-right mx-1 d-print-none"><i class="fa fa-pen"></i> Edit</a>
            <button onclick="window.print()" class="float-right d-print-none mx-1 btn btn-sm btn-warning"><i class="fa fa-print"></i> Print</button>
          </div>
        </div>
      </div>
    </div>

<?php include "inc/btm.php"; ?>