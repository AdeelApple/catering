
	var rng = {}; var ranges = {};	var tray = {};	var salad_tray = {};
	function ready(){
		$('#booking-form').trigger("reset");
	}

	

	function getdate(d){
	var today = new Date();
	var day = today.getDay();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var weekdays = new Array(7);
	weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	if(dd<10) { dd = '0'+dd;	}
	if(mm<10) {    mm = '0'+mm		}
	if(d=='/')
		return dd + '/' + mm +  '/' + yyyy;
	if(d=='-')
		return yyyy+"-"+ mm + '-' + dd;
	if(d=='day')
		return weekdays[day] +" "+ dd + '/' + mm + '/' + yyyy;
	}
	function today_date(){	$(".date").html(getdate('/')); }
	function today_form_date(){	$("#date").val(getdate('-'));	}

			

	function sum(a,b){	return Number(Number(a) + Number(b)).toFixed(2);	}
	function sub(a,b){	return Number(Number(a) - Number(b)).toFixed(2);	}
	function mul(a,b){	return Number(Number(a) * Number(b)).toFixed(2);	}
	function div(a,b){	return Number(Number(a) / Number(b)).toFixed(2);	}


	function checkDigitOnly(obj){

		if (/^[0-9]+$/.test(obj.innerHTML)) obj.innerHTML = obj.innerHTML.replace(/\D/g,'');
	}

	// function sub(a,b){	

	// 	var a1 = Number(a);
	// 	var b1 = Number(b);
	// 	var dd = a1 - b1;

	// 	var rs = Number(dd).toFixed(2);
	// 	return rs;

	// }



	function amount_cal(){

		var totalprice = 0;
		var per = $('#persons').val();
		$('.pkg').each(function(index, el) {
			pkgprice_id  = $(el).attr('data-pkgprice_id');
			pkgprice = $(pkgprice_id).val();
			if (el.disabled) { pkgprice = 0.00; }
			totalprice = sum(totalprice,mul(pkgprice,per));
		});
		$('.extra_price').each(function(index, el) {
			var ex_price = $(el).val();
			if (el.disabled) { ex_price = 0.00; }
			totalprice = sum(totalprice,ex_price);
		});
		var adv = $('#advance').val();
		$('.cstm[data-show="1"] .d_ctm_total_price[data-active="1"]').each(function(index, el) {
			totalprice = sum(totalprice,$(el).val());
		});

		$('.fullctm_total_price[data-active="1"]').each(function(index, el) {
			totalprice = sum(totalprice,$(el).val());
		});
		totalprice = sum(totalprice,$('#extra').val());
		$('#total').val(totalprice);
		$('#balance').val(sub(totalprice,adv));

	}


	// CUSTOM TOTAL

	function ctm_total(obj){
		var ttl_price = 0.00;
		var ttl_per = 0;
		var qty = $(obj).val();
		var tr = $(obj).closest('tr');
		var tds = $(tr).children('.ctm_tray_price');
		var ttl = $(tr).find('.ctm_total_and_persons>.ctm_total_price');
		var dttl = $(tr).find('td>.d_ctm_total_price');
		tds.each( function(i, el) {
			var tray_price = $(el).children('.price').val();
			var qty = $(el).children('.item-qty').val();
			var all_tray_price = mul(tray_price,qty);
			ttl_price = sum(ttl_price,all_tray_price);
		});
		
		$(ttl).val(ttl_price);
		$(dttl).val(ttl_price);

		amount_cal();
	}


	// CUSTOME TOTAL

	function ctm_pp_total(obj){
		var ttl_price = 0.00;
		var qty = $(obj).val();
		var tr = $(obj).closest('tr');
		var tds = $(tr).children('.ctm_tray_price');
		var ttl = $(tr).find('.ctm_total_and_persons>.ctm_total_price');
		var per = $(tr).find('.ctm_total_and_persons>.ctm_persons');
		var dttl = $(tr).find('td>.d_ctm_total_price');
		tds.each( function(i, el) {
			var tray_price = $(el).children('.price').val();
			var qty = $(el).children('.item').val();
			var all_tray_price = mul(tray_price,qty);
			ttl_price = sum(ttl_price,all_tray_price);
		});
		
		$(ttl).val(ttl_price);
		$(dttl).val(ttl_price);

		amount_cal();
	}
	function select_pkg(obj){

		var pkg = $(obj).attr('data-pkg');
		var trgt = $(obj).attr('data-target');
		var tpkg = $(trgt).css('display');
		var count = 0;
		var submit = true;
		if(tpkg=="none"){
			$(pkg).val(1); count++;
			$(trgt).attr('data-show','1');
			$(trgt+' select').removeAttr('disabled');
			$(trgt+' input').removeAttr('disabled');

		}else{
			
			$(pkg).val(0); count--;
			$(trgt).attr('data-show','0');
			$(trgt+' select').attr('disabled', 'true');
			$(trgt+' input').attr('disabled', 'true');
			$(trgt+' input[type="checkbox"]').removeAttr('checked');
		}
		var plen = $('.pkgs[data-show="1"]').length;
		var clen = $('.cstm[data-show="1"]').length;
		var fclen= $('.fullctm[data-show="1"]').length;
		if(plen>0) submit = false;
		$('#submitbtn').attr('disabled', submit);
		if(clen>0&&plen<1) mark_check();
		if(fclen>0) fullctm_submit_btn();

		amount_cal();
	}
	function mark(obj) {
		var ttl_price = 0.00;
		var qty = $(obj).val();
		var tr = $(obj).closest('tr');
		var tds = $(tr).children('.ctm_tray_price');
		var ttl = $(tr).find('.ctm_total_and_persons>.ctm_total_price');
		var per = $(tr).find('.ctm_total_and_persons>.ctm_persons');
		var dttl = $(tr).find('td>.d_ctm_total_price');
		var inp = $(tr).find('.d_ctm_total_price');

		if(obj.checked)
		{
			$(inp).attr('data-active', '1');
			$(tr).find('.item-qty').removeAttr('readonly');
		}
		else{
			$(inp).attr('data-active', '0');
			$(tr).find('.item-qty').attr('readonly', 'readonly');
		}

		amount_cal();
		mark_check();
	}

	function mark_check() {
		if($('.mark:checked').length>0){
			$('#submitbtn').attr('disabled', false);
		}
		else{
			$('#submitbtn').attr('disabled', true);
		}
	}	

	function adv(obj){
		var total = new Number($('#total').val()).toFixed(2);
		var val = new Number($(obj).val()).toFixed(2);
		$(obj).val(total);
		amount_cal();
	}

	function check_limit(obj,val){
		var value = $(obj).val()
		if(value<val){
			$(obj).val(val);
		}
	}

	function count_tray(){
		$('.pkgs table tbody').each(function(ind, tb) {
			if($(tb).children().length > 0 )
			{
				var per = $('#persons').val();
				var tr = $(tb).children();
				tr.each(function(index, tr) {
					var cat_nm = $(tr).find('.cat_name').html().toLowerCase();
					var sel_item = $(tr).find('.cat_select').children('option:selected').html().toLowerCase();
					var pp_cat = ["naan","raita","bbq"];
					var pp_item = ["gulab jamun","samosa","fried fish"];
					if(pp_cat.includes(cat_nm)||pp_item.includes(sel_item))
					{
						if(cat_nm=="naan")	 cal_naan(tr);
						if(cat_nm=="raita")  cal_raita(tr);
						if(cat_nm=="bbq")	 cal_bbq(tr);
						if(sel_item=="gulab jamun")	 cal_gulab_jamun(tr);
						if(sel_item=="samosa")	 cal_samosa(tr);
						if(sel_item=="fried fish")	 cal_fried_fish(tr);

					}else
					{
						rng = ranges[cat_nm];
						if(cat_nm=='salad'){
							saladf(per);
						}else{
							get_trays(per);
						}

						$(tr).find('.lg_tray').val(tray['lg']);
						$(tr).find('.md_tray').val(tray['md']);
						$(tr).find('.sm_tray').val(tray['sm']);
					}
				});
			}
		});
	}
	function cal_extra_qty(tr){

		var sel = $(tr).find('.cat_select');
		var extra_qty = $(tr).find('.extra_qty').val();
		var extra_price = $(tr).find('.extra_price');
		var ex_price = $(sel).children('option:selected').attr('data-extra-price');

		$(extra_price).val(mul(ex_price,extra_qty));
		amount_cal();

	}

	function cal_naan(tr) {
		var sel = $(tr).find('.cat_select');
		var name = $(tr).find('.cat_select').children('option:selected').html().toLowerCase();
		var total_qty = $(tr).find('.total_qty');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;	}
		if(name=="peta naan"){
			var total_naan = peta_naan(per);
		}else{
			var total_naan = tandori_naan(per);
		}

		$(total_qty).val(total_naan);
		amount_cal();
	}
	function cal_raita(tr) {
		
		var total_qty = $(tr).find('.total_qty');
		var sel = $(tr).find('.cat_select');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;		}
		$(total_qty).val(get_raita(per));
	}

	function cal_bbq(tr) {
		
		var name = $(tr).find('.cat_select').children('option:selected').html().toLowerCase();
		var sel = $(tr).find('.cat_select');
		var total_qty = $(tr).find('.total_qty');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;		}
		$(total_qty).val(get_bbq(name,per));
	}

	function cal_gulab_jamun(tr) {

		var sel = $(tr).find('.cat_select');
		var total_qty = $(tr).find('.total_qty');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;		}

		$(total_qty).val(parseInt(mul(2,per)));
	}

	function cal_samosa(tr) {
		var sel = $(tr).find('.cat_select');
		var total_qty = $(tr).find('.total_qty');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;		}

		$(total_qty).val(parseInt(mul(1,per)));
	}

	function cal_fried_fish(tr) {

		var sel = $(tr).find('.cat_select');
		var total_qty = $(tr).find('.total_qty');
		var per = $('#persons').val();

		if($(sel).val()=="0"||$(sel).val()==""){	$(total_qty).val(0);	return;		}

		$(total_qty).val(parseInt(mul(per,2)));
	}

	function trayf(){
		var val = parseInt($('#num').val());
	}

	function get_trays(val) {
		tray = {'sm':0,'md':0,'lg':0};
		if(val>=rng['lg']['min']){	largf(val);
		}else if(val>=rng['md']['min']){ medf(val);
		}else if(val>=rng['sm']['min']&&val<=rng['sm']['max']){ smallf(val);
		}else{	/*wrong val*/	}
		return tray;			
	}
	function largf (val) {
		
		larg = parseInt(val/rng['lg']['max']);
		rem = val - larg*rng['lg']['max'];
		tray['lg'] = larg;

		if(rem >= rng['lg']['min']){
			tray['lg'] += 1;		
		}else{
			if(rem >= rng['md']['min'])
				medf(rem);
			else 
				if(rem>rng['sm']['min']&&rem<=rng['sm']['max'])
				smallf(rem);
		}
	}
	function medf (val) {			
		medium = parseInt(val/rng['md']['max']);
		rem = val - medium * rng['md']['max'];
		tray['md'] = medium;
		if(rem>=rng['md']['min']){
			tray['md'] += 1;
		}else{
			if(rem>rng['sm']['min']&&rem<=rng['sm']['max'])
				smallf(rem);
		}
	}

	function smallf (val) {		tray['sm'] = 1;	}


	function get_raita(val) {
		
		var r = parseInt(val/25);
		rem = val - r * 25;
		if(rem>0) r +=1;

		return r*2;
	}

	function saladf(val){
		tray = {'md':0,'sm':0,'lg':0};
		var num = parseInt(val/rng['md']['max']);
		var rem = val - num * rng['md']['max'];
		
		tray['md'] = num;

		if(rem>=rng['md']['min']){
			tray['md'] += 1;
		}else{
			if(rem<=rng['sm']['max']&&rem>=rng['sm']['min']){
				tray['sm'] = 1;
			}
		}
		return tray;
	}
	function get_bbq(nm,per){
		var nm = nm.toLowerCase();
		if(nm=="reshmi kabab"||nm=="beef kabab")
			return per;
		if(nm=="tandoori chicken tikka"||nm=="chicken kabab")
			return per*2;

	}

	function tandori_naan(val){	return Math.ceil(parseInt(val)*0.7);	}
	function peta_naan(val){	return parseInt(val);	}



	function custom_tray_cal(obj){
		var tray_lg = $(obj).closest('tr').children('ctm_lg_tray').children('input');
		var tray_sm = $(obj).closest('tr').children('ctm_sm_tray').children('input');
		

	}




//  FULL CUSTOM FUNCTIONS


function create_fullctm(obj){

	var tbl = $(obj).closest('table');
	var row = $(tbl).find(".fullctm_row:first-child").clone();
	var fullctm_inc = $(obj).attr('data-rows');
	$(obj).attr('data-rows', parseInt(sum(fullctm_inc,1)));
	var iid = "row" + fullctm_inc;

	$(row).find('.fullctmiid').val(iid);
	$(row).addClass('fullctm');
	$(row).find('.delbtn').removeClass('d-none');

	// Add iid in name attribute
	$(row).find('.addiid').each(function(ind, el){
		$(el).attr('name', function(){ return $(this).attr('name').slice(0,-4)+iid });
	});

	// Add iid in ID of Radio attribute
	$(row).find('.spice').each(function(ind, el){
		$(el).attr('id', function(){ return $(this).attr('id').slice(0,-4)+iid });
	});

	// Add iid in FOR of Label
	$(row).find('.spicelabel').each(function(ind, el){
		$(el).attr('for', function(){ return $(this).attr('for').slice(0,-4)+iid });
	});

	// Reset select
	$(row).find('.pp').val(0);
	$(row).find('.list').val(1);
	$(row).find('.mrcal').val('none');

	// Empty Input
	$(row).find('.emp').each(function(index, el) {	$(el).val(''); });
	// Zero Input
	$(row).find('.v0').each(function(index, el) {	$(el).val(0); });
	$(row).find('.vnull').each(function(index, el) {	$(el).val(''); });

	// Reset Display Per Serving
	$(row).find('.fullctm_qty').removeClass("d-none").addClass("d-none");
	$(row).find('.fullctm_tray').removeClass("d-none");
	var nm = $(row).find('.spice:first-child').attr('name');
	$(row).find('input[name="'+nm+'"]').prop('checked', false);




	$(row).find('label').each(function(index, el) {
		var id = $(el).attr('for') + "row" + fullctm_inc;
		$(el).attr('for',id);
	});

	$(row).find('.spice').each(function(index, el) {
		$(el).attr('id', function(){ return $(this).attr('id')+iid });
	});

	var tblbody = $(tbl).find('tbody');
	$(tblbody).append(row);

	fullctm_inc++;
}

function fullctm_named(obj){

	var tr = $(obj).closest('tr');
	var tbody = $(obj).closest('tbody');
	
	if($(obj).val()=="")
		$(tr).find(".fullctm_total_price").attr('data-active',0);
	else
		$(tr).find(".fullctm_total_price").attr('data-active',1);

	amount_cal();
}

function fullctm_submit_btn(){
	if($('.fullctm').length>0)	$('#submitbtn').attr('disabled', false); else $('#submitbtn').attr('disabled', true);
	
}

function fullctm_changed(obj){

	var tr = $(obj).closest('tr');
	if($(obj).val()=="0")
	{

		$(tr).find('.fullctm_tray').removeClass("d-none");
		$(tr).find('.fullctm_qty').addClass("d-none");

	}else{

		$(tr).find('.fullctm_tray').addClass("d-none");
		$(tr).find('.fullctm_qty').removeClass("d-none");

	}

	fullctm_total(obj);

}
function fullctm_total(obj){

	var ttl_tray = 0.00;
	var tr = $(obj).closest('tr');
	var pp = $(tr).find('.pp').val();
	var ttl = $(tr).find('.fullctm_total_price');

	if(pp=="0"){

		var lg = $(tr).find('.lg_qty').val();
		var md = $(tr).find('.md_qty').val();
		var sm = $(tr).find('.sm_qty').val();

		var lg_price = $(tr).find('.lg_price').val();
		var md_price = $(tr).find('.md_price').val();
		var sm_price = $(tr).find('.sm_price').val();

		ttl_tray = sum(ttl_tray,mul(lg,lg_price));
		ttl_tray = sum(ttl_tray,mul(md,md_price));
		ttl_tray = sum(ttl_tray,mul(sm,sm_price));

		$(ttl).val(ttl_tray);

	}else{

		var ps_qty = $(tr).find('.ps_qty').val();
		var ps_price = $(tr).find('.ps_price').val();
		$(ttl).val(mul(ps_qty,ps_price));

	}

	amount_cal();

}






function del_fullctm(obj){

	if(confirm("Are you sure to remove this custom order?")){

		$(obj).closest('tr').remove();
	}

}






// package category changed
var pplist = {};
function pack_cat_change(obj){
	var tr = $(obj).closest('tr');
	var key = $(obj).attr('id');
	var cls_num = $(obj).attr('data-cls');
	var pkgid = $(obj).attr('data-pkgid');
	var pkgprice_id = '#pkgprice'+pkgid;
	var nm = $(obj).children('option:selected').html().toLowerCase();
	var sel = $(obj).children('option:selected');
	var list = $(obj).children('option:selected').attr('data-list');
	var pp = $(sel).attr('data-pp');
	if(pp==1){
		$('.pp-cell'+cls_num).removeClass('d-none');
		$('.non-pp'+cls_num).addClass('d-none');
		$('#is_pp'+cls_num).val(1);

		// Functions
	 	if(nm=="gulab jamun") cal_gulab_jamun(tr);
	 	if(nm=="samosa") cal_samosa(tr);
	 	if(nm=="fried fish") cal_fried_fish(tr);

	}else{

		$('.pp-cell'+cls_num).addClass('d-none');
		$('.non-pp'+cls_num).removeClass('d-none');
		$('#is_pp'+cls_num).val(0);
	}

	// Assign list_num

	$(tr).find('.list').val(list);

	// Reduce / Increase Package Price

	var preid = $(obj).attr('data-previous');
	var newid = $(obj).val();
	$(obj).attr('data-previous',newid);
	var pkgprice = $(pkgprice_id).val();

	if(preid != ""){

		var prev_el = $(obj).children("option[value='"+preid+"']");
		var v1 = prev_el.attr('data-increase');
		var v2 = prev_el.attr('data-reduce');
		var amt = [v1,v2]; 
		var pkgprice = $(pkgprice_id).val();
		$(pkgprice_id).val(sum(pkgprice,amt[1]));
		var pkgprice = $(pkgprice_id).val();
		$(pkgprice_id).val(sub(pkgprice,amt[0]));
		
	}
	if(newid != ""){

		var inc = $(sel).attr('data-increase');
		var pkgprice = $(pkgprice_id).val();
		$(pkgprice_id).val(sum(pkgprice,inc));
		
		var red = $(sel).attr('data-reduce');
		var pkgprice = $(pkgprice_id).val();
		$(pkgprice_id).val(sub(pkgprice,red));

	}

	amount_cal();

}

// Kitchen
	function change_font_size(obj){
		var size = $(obj).val();
		$('#tbl').css('font-size', size+'pt');
	}

// Weekly reports

	function change_cols(obj){
		var col = $(obj).val();
		var cols = $(".rcol");

		$(".ecol").remove();
		var ecol = "<div class='col ecol'></div>";
		for (var i = 0; i <= 60; i++) {
			cols.push($(ecol).clone());
		}

		$('#r-1').append(cols.splice(0,col));
		$('#r-2').append(cols.splice(0,col));
		$('#r-3').append(cols.splice(0,col));
		$('#r-4').append(cols.splice(0,col));
		$('#r-5').append(cols.splice(0,col));
		$('#r-6').append(cols.splice(0,col));
		$('#r-7').append(cols.splice(0,col));
		$('#r-8').append(cols.splice(0,col));

	}

	function bold_font(obj){
		var val = $(obj).val();
		if(val=="1")
			$('#tbl').css('font-weight', 'normal');
		else
			$('#tbl').css('font-weight', 'bold');
	}


function msg(msg,ind,link,linkmsg){
	var i = ind || 0;	var duration = 1500;	var addlink = "";
	var at = ["alert-success","alert-primary","alert-danger","alert-info","alert-warning"];
	if(linkmsg!==undefined){
		addlink = "<a href='"+link+"' class='alert-link ml-2'><u>"+linkmsg+"</u></a>";
		 duration=3000; }
	var disbtn = "<button type='button' class='close' data-dismiss='alert'>&times;</button>";
	var msgtext = "<div class='alert "+at[i]+" alert-dismissible' role='alert' id='alert'>"+disbtn+msg+addlink+"</div>";

	$('#msgdiv').html(msgtext);
	$('#msgdiv').slideDown(500, function() {
		setTimeout(function(){$('#msgdiv').slideUp(500,function(){$(this).hide();$('#alert').remove();})},duration);
	});
}