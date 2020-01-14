	function sidebar_tgl_session() {
		var display = $('#sidebar-wrapper').hasClass('sidebar-toggled');
		if(display)	val = 1; else val = 0;
		$.post('ajax.php', {val:val,fun:0}, function(d){
			$('body').append(d);
		});
	}


// FILTER AND PAGINATION
function filter(pg){
	var flt = {};
	$('.filter').each(function(index, el) {
		if($(el).val()!=""){
			var id = $(el).attr('id');
			flt[id] = $(el).val();
		}
	});
	if(typeof pg !== "undefined"){	flt['page'] = pg;	}
	var fun = $('#tbl').attr('data-fun');
	flt['fun'] = fun;

	if($("#scr").length<1)	$('body').append("<div id='scr' class='screen'><i class='fas fa-3x fa-spinner fa-pulse'></i></div>");
	$.post('ajax.php', flt, function(d) {
		$("#tbl").html(d);
		$("#scr").remove();
	});
}




// Weekly Reports
function weekly_report(){
	var flt = {};

	var itstr = $('#tbl').attr('data-items');
	var itarr = itstr.split(",");
	flt['items'] = JSON.stringify(itarr);
	$('.filter').each(function(index, el) {
		if($(el).val()!=""){
			var id = $(el).attr('id');
			flt[id] = $(el).val();
		}
	});
	var fun = $('#tbl').attr('data-fun');
	flt['fun'] = fun;
	$.post('ajax.php', flt, function(d) {
		$("#tbl").html(d);

		flt['fun'] = 5;
		$.post('ajax.php', flt, function(d) {
			$("#report-title").html(d);
		});
		flt['fun'] = 6;
		$.post('ajax.php', flt, function(d) {
			$("#milk").html(d);
		});
		flt['fun'] = 7;
		$.post('ajax.php', flt, function(d) {
			$("#milk2").html(d);
			change_cols($("#cols"));
		});
	});


}


function ingredients(){
	var flt = {};
	$('.filter').each(function(index, el) {
		if($(el).val()!=""){
			var id = $(el).attr('id');
			flt[id] = $(el).val();
		}
	});
	var fun = $('#tbl').attr('data-fun');
	flt['fun'] = fun;
	if($("#scr").length<1)	$('body').append("<div id='scr' class='screen'><i class='fas fa-3x fa-spinner fa-pulse'></i></div>");
	$.post('ajax.php', flt, function(d) {
		$("#tbl").html(d);
		$("#scr").remove();
		cal_sum_ingredients();
	});
}



// Kitchen order lists
function order_list_kitchen(){
	var flt = {};
	var refresh_rate = $('#refresh_rate').val();
	refresh_rate = Number(refresh_rate)*1000;
	font = $('#font').val();
	
	$('.filter').each(function(index, el) {
		if($(el).val()!=""){
			var id = $(el).attr('id');
			flt[id] = $(el).val();
		}
	});
	var fun = $('#list').val();
	flt['fun'] = fun;
	if($("#scr").length<1)	$('body').append("<div id='scr' class='screen'><i class='fas fa-3x fa-spinner fa-pulse'></i></div>");
	$.post('ajax.php', flt, function(d) {
		$("#tbl").html(d);
		$("#scr").remove();
		$('#tbl').css('font-size', font+'pt');
	});

	if (typeof intrval !== 'undefined') clearInterval(intrval);
	intrval = setInterval(function(){

		font = $('#font').val();
		$('.filter').each(function(index, el) {
			if($(el).val()!=""){
				var id = $(el).attr('id');
				flt[id] = $(el).val();
			}
		});
		var fun = $('#list').val();
		flt['fun'] = fun;
		if($("#scr").length<1)	$('body').append("<div id='scr' class='screen'><i class='fas fa-3x fa-spinner fa-pulse'></i></div>");
		$.post('ajax.php', flt, function(d) {
			$("#tbl").html(d);
			$("#scr").remove();
			$('#tbl').css('font-size', font+'pt');
		});

	}, refresh_rate);

}



// SELECTION

// Fetch food_pkg1
function fetch_pkg(obj) {
	var pkg  = $(obj).attr('data-pkg');
	var body = $(obj).attr('data-body');
	var id = $(obj).attr('data-id');
	var pkgprice = $(obj).attr('data-pkgprice_id');
	var pkg = $(obj).val();
	if(pkg==""){
		$(body).empty();
		$(obj).attr("data-pkgprice",0.00);
		$(pkgprice).val(0.00);
		return;
	}
	$.post('ajax.php', {pkg:pkg,id:id,fun:4000}, function(d) {
		$(body).html(d);
		count_tray();

		$.post('ajax.php', {pkg:pkg,fun:100}, function(d) {
			$(pkgprice).val(d);
			setTimeout(function(){
				$(".cat_select").each(function(index, el) {
					$(el).change();
				});
			}, 1000);		
			amount_cal();
		});
	});
}



// INSERTION


	// Create User
	function create_user(btn){
		if(!confirm("Are you sure to create this new user?")) return;

		var fullname = $('#new_fullname').val();
		if(fullname==""){ msg("fullname cannot be empty!",2); return; }
		var username = $('#new_username').val();
		if(username==""){ msg("username cannot be empty!",2); return; }
		var pass = $('#new_pass').val();
		if(pass==""){ msg("pass cannot be empty!",2); return; }
		var type = $('#new_type').val();
		if(type==""){ msg("type cannot be empty!",2); return; }
			
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Creating User...");
		$.post('ajax.php',{fullname:fullname,username:username,pass:pass,type:type,fun:200}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("User Created.");
        	else
            	msg("User Creation failed: "+d,2);
		});
	}



// UPDATATION

	// Update Admin Settings
	function save_settings(){
		if(!confirm("Are you sure to save these settings?")) return;
		var sett = {}
		sett['fn'] = $("#fullname").val();
		sett['un'] = $("#user").val();
		sett['pass'] = $("#pass").val();
		sett['em'] = $("#email").val();
		

		sett['fun'] = 300;

		$.post('ajax.php', sett, function(d) {
			if(d=="success")
				msg("All Changes Saved.");
			else
				msg("Failed to Save changes."+d);

		});

	}

	// Update Users
	function update_users(btn){
		if(!confirm("Are you sure to Update you changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {}; var update = 1;
		$(".price[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();
			var clm = $(el).attr('data-clm');
			if(val==""){
				msg("User field("+clm+") can't be empty!",4);
				update = 0;
			}
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		if(update){
			$.post('ajax.php',{arr:json,fun:301}, function(d) {
				$(btn).html(oldtxt);
				if(d=="success")
	            	msg("Changes saved.");
	        	else
	            	msg("Changes failed: "+d,2);
			});
		}else{
			$(btn).html(oldtxt);
		}
	}



	// update customer name
	function atblur(obj) {
		var ncont = $(obj).html().trim();
		if(ncont!=$(obj).attr('data-oldcont'))
        {
            var tid = $(obj).attr("data-id");
            var tclm = $(obj).attr("data-clm");
            var ttbl = $(obj).attr("data-tbl");
            var tfun = $(obj).attr("data-fun");

            $.post('ajax.php',{id:tid,nm:ncont,clm:tclm,tbl:ttbl,fun:tfun},function(d){
            	if(d=="success")
	            	msg("Changes saved.");
            	else
	            	msg("Changes failed: "+d,2);
            });
        }

		$(obj).removeAttr('data-oldcont');
	}

	// Update Package item prices
	function update_package_prices(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".price[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val(); 	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:310}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update Extra Prices
	function update_extra_prices(btn){
		if(!confirm("Are you sure to update extra prices?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".extra_price[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val(); 	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:311}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}


	// Update Package Deductions
	function update_package_deductions(btn){
		if(!confirm("Are you sure to update deduction changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".none[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val(); 	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:312}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}


	// Update Tray Ranges
	function update_tray_ranges(btn){
		if(!confirm("Are you sure to update these tray ranges?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating Ranges...");
		var obj = {};
		$(".tray_range[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val(); 	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:313}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}


	// Update Custom item prices
	function update_custom_prices(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".price[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:315}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}


	// Update Package item Tray Meat and Rice
	function update_package_mr(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".mr[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:320}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update Package item Meat and Rice Limits
	function update_package_mr_limit(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".mr_limit[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:321}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update Custom item Tray Meat and Rice
	function update_custom_mr(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		var allit = $(".mr[data-changed='1']");
		$(".mr[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:322}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update Custom item Meat and Rice Limits
	function update_custom_mr_limit(btn){
		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".mr_limit[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:323}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update Privileges
	function update_privileges(obj){

		var val;
		if(obj.checked) val = 1; else val = 0;
		var id = $(obj).attr("data-id");
		var clm = $(obj).attr("data-clm");
		var tbl = $(obj).attr("data-tbl");

		$.post('ajax.php',{id:id,clm:clm,val:val,tbl:tbl,fun:345}, function(d) {
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}

	// Update General Settings
	function update_general_settings(btn){

		if(!confirm("Are you sure to update your changes?")) return;
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i> Updating...");
		var obj = {};
		$(".value[data-changed='1']").each(function(index, el) {
			var id = $(el).attr('data-id');
			var val = $(el).val();	if(val=="") val = 0.00;
			var clm = $(el).attr('data-clm');
			oldval = $(el).attr('data-old');
			newval = $(el).val();
			if(oldval!=newval){
				obj[index] = [clm,val,id];
			}
			$(el).css('backgroundColor' , '#FFF');
			$(el).removeAttr('data-changed');
		});

		var json = JSON.stringify(obj);
		$.post('ajax.php',{arr:json,fun:350}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success")
            	msg("Changes saved.");
        	else
            	msg("Changes failed: "+d,2);
		});
	}


// DELETION


	// Delete User
	function del_user(btn){
		if(!confirm("Are you sure to delete this user permanently?")) return;

		var id = $(btn).attr('data-id');
		var oldtxt = $(btn).html();
		$(btn).html("<i class='fas fa-spinner fa-pulse'></i>");
		$.post('ajax.php',{uid:id,fun:400}, function(d) {
			$(btn).html(oldtxt);
			if(d=="success"){
            	msg("User deleted.");
				$(btn).closest('.row').remove();
			}
        	else
            	msg("User deletion failed: "+d,2);
		});
	}
	// Delete Order
	function del_order(obj,id){
		if(!confirm("Are sure to delete this order from list?")) return;
		$.post('ajax.php', {id:id,tbl:1,fun:410}, function(d) {
			$(obj).closest('tr').next('tr').remove();
			$(obj).closest('tr').hide('fast',function(){$(this).remove(); });
			msg("Order deleted"+d);
		});
	}








