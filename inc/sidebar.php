
<div id="sidebar-wrapper" class="d-print-none <?php if(!$sb) echo 'sidebar-toggled'; ?>">
    <aside id="sidebar">
        <ul id="sidemenu" class="sidebar-nav">
            <?php $sbrs = q("select * from sidebar where {$type}=1 and allow=1");
            while($sb = mysqli_fetch_array($sbrs)){ ?>       
            <li>
                <?php if ($sb['submenu']) { ?>
                <a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#<?=$sb['link']?>">
               <?php }else{ ?>
                <a href="<?=$sb['link']?>">
               <?php } ?>
                    <span class="sidebar-icon"><i class="<?=$sb['icon']?>" aria-hidden="true"></i></span>
                    <span class="sidebar-title"><?=$sb['name']?></span>
                    <?php if ($sb['submenu']) { ?>
                        <i class="fa fa-caret-right caret"></i>
                   <?php } ?>
                </a>
                <?php  if ($sb['submenu']) {  ?>
                <ul id="<?=$sb['link']?>" class="panel-collapse collapse panel-switch" role="menu">
                <?php $ssbrs = q("select * from sub_sidebar where main = {$sb['id']} and {$type}=1");
                    while($ssb = mysqli_fetch_array($ssbrs)){ ?>
                    <li><a href="<?=$ssb['link']?>"><i class="<?=$ssb['icon']?>"></i> <?=$ssb['name']?></a></li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>
           <?php } ?>
           
        </ul>
    </aside>     
</div>