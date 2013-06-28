if (!window.Btb) {
	window.Btb = new Object()
};
Btb.Manage = {
	init: function () {		
		Btb.Manage.enableAmountCalculate();
		Btb.Manage.caculate_amount_func();
		Btb.Manage.redraw_switchsale();
		Btb.Manage.Manage_confirmation();
		Btb.Manage.linePrice();	
		Btb.Manage.lineTrip();
		/*Btb.Manage.redraw_switchsale();
		Btb.Manage.Manage_promo_card();
		Btb.Manage.addSaleGiftToCart();
		Btb.Manage.addSaleToCart();
		Btb.Manage.enable_cod();*/
		if ($("div[id='old_address'] input:checked").length == 1) {
			$("div[id='old_address'] input:checked").click();
		}
	},
	enableAmountCalculate: function () {
		$('.sort-number-input').keyup(function () {
	//		Btb.Manage.cart_item_number_change($(this));
		}).focus(function () {
			$(this).select();			
		//	$(this).siblings('.item-buy-tip').css('display', 'none')
		}).blur(function () {
			var v = parseInt($(this).val());
			if (isNaN(v)) v = 0;
			if (v < 1 || v > 999) {
				if (v < 1) $(this).val('1');
				if (v > 999) $(this).val('999');
			//	$(this).siblings('.deal-buy-tip').css('display', 'none')
			}
		});
		$('.number_input').not('.disable').children('.reduce_num').click(function () {
			var input_number_id = '#' + $(this).attr('alt') + '_number';			
			var number = parseInt($(input_number_id).val());
			if (number > 1) {
				$(input_number_id).val(number - 1);
	//			Btb.Manage.cart_item_number_change($(input_number_id));
			}
		});
		$('.number_input').not('.disable').children('.add_num').click(function () {
			var input_number_id = '#' + $(this).attr('alt') + '_number';
			var number = parseInt($(input_number_id).val());
			if (number < 999) {
				$(input_number_id).val(number + 1);
	//			Btb.Manage.cart_item_number_change($(input_number_id));
			} else {
				alert('显示最高权限为999');
			}
		});
		$('.number_input').not('.disable').children('.number_submit').click(function () {
			var input_number_id = '#' + $(this).attr('alt') + '_number';
			var number = parseInt($(input_number_id).val());
			var id = $(this).attr('alt');
			var target = $(this).attr('target');
			if (number >= 0) {
				return !X.get(WEB_ROOT + '/ajax/manage.php?action=changesort&id='+id+'&sort='+number+'&target='+encodeURIComponent(target));
		//		$(input_number_id).val(number + 1);
		//		Btb.Manage.cart_item_number_change($(input_number_id));
			} else {
				alert('显示排序数字不能是负数！');
			}
		});
		$('.cart-buy-delete').click(function () {
			var is_confirmed = confirm('确定要不购买此商品？');
			if (is_confirmed) {
				$('#' + $(this).attr('alt')).remove();
				Btb.Manage.update_cart($(this).attr('alt'), 0);
				Btb.Manage.caculate_amount_func();
				Btb.Manage.redraw_switchsale();
			//	Btb.Manage.changeSaleGiftBoxItemStatus()
			}
		});
		$('.Manage-table a.clear_cart').click(function(){
				var cart_url = SITE_MAIN_WEBBASEURL+'Manage/cart.php';
				var rf = '?op=clear_cart';	 
				window.location.href = cart_url +rf;
				if(window.event) window.event.returnValue = false;			   
		});
	},
	lineTrip: function (){
		$("#line_trip_submit").click(function(){	//全选
	//		$("html,body").animate({scrollTop: $("#table-line-trip").offset().top}, 1000);
	
			alert('ok');
		});
	},
	linePrice: function () {

		$("#chkAll").click(function(){	//全选
			var act = $(this).attr("checked");	
			$("input[name='chkweek']").attr( "checked", act);	
		});
		
		$("input[name=all_line_price_id]").click(function(){
			var act = $(this).attr("checked");
			$("html,body").animate({scrollTop: $("#list_line_price").offset().top}, 1000);
			$("input[name=chk_line_price_id]").each(function () {
			var i=$(this).attr('id').substring(14,17);
			var v=$(this).val();
				if(act == true){
					var html = '<input name="chk_line_price_id" id="line_price_id_'+i+'" type="checkbox" style="width:20px;" checked="checked" value="'+v+'" /><span style="color:red">'+v.substring(5,8)+'</span>';
					setTimeout(function(){$("#html_"+i).html(html);},i*300);
					$("input[name=line_price_id["+i+"]]").attr("value",v);
				}else{
					var html = '<input name="chk_line_price_id" id="line_price_id_'+i+'" type="checkbox" style="width:20px;" value="'+v+'" /><span style="color:#000">'+v.substring(5,8)+'</span>';
					setTimeout(function(){$("#html_"+i).html(html);},i*300);
					$("input[name=line_price_id["+i+"]]").attr("value","");
					
				};
			});
		//	$("input[name=line_price_id]").attr( "checked", act);	
		});
		
		$("input[name=all_cp]").click(function(){	//全选
			var act = $(this).attr("checked");
			if(act == true){					
				$("#ht_all_cp").html("取消复制");
			}else{					
				$("#ht_all_cp").html("复制首行");
					
			};
			$("input[name=chk_line_price_id]").each(function () {
			var i=$(this).attr('id').substring(14,17);
			var fca = $("input[name=cp_adult[0]]").attr("value");
			var fcc = $("input[name=cp_children[0]]").attr("value");
			var fcd = $("input[name=cp_difference[0]]").attr("value");
			
			var ca = $("input[name=cp_adult["+i+"]]").attr("ca");
			var cc = $("input[name=cp_children["+i+"]]").attr("cc");
			var cd = $("input[name=cp_difference["+i+"]]").attr("cd");

				if(act == true){					
					$("input[name=cp_adult["+i+"]]").attr("value",fca);
					$("input[name=cp_children["+i+"]]").attr("value",fcc);
					$("input[name=cp_difference["+i+"]]").attr("value",fcd);
				}else{					
					$("input[name=cp_adult["+i+"]]").attr("value",ca);
					$("input[name=cp_children["+i+"]]").attr("value",cc);
					$("input[name=cp_difference["+i+"]]").attr("value",cd);
					
				};
			});	
		});
		
		$("input[name=all_sp]").click(function(){	//全选
			var act = $(this).attr("checked");
			if(act == true){					
				$("#ht_all_sp").html("取消复制");
			}else{					
				$("#ht_all_sp").html("复制首行");
					
			};
			$("input[name=chk_line_price_id]").each(function () {
			var i=$(this).attr('id').substring(14,17);
			var fsa = $("input[name=sp_adult[0]]").attr("value");
			var fsc = $("input[name=sp_children[0]]").attr("value");
			var fsd = $("input[name=sp_difference[0]]").attr("value");
			
			var sa = $("input[name=sp_adult["+i+"]]").attr("sa");
			var sc = $("input[name=sp_children["+i+"]]").attr("sc");
			var sd = $("input[name=sp_difference["+i+"]]").attr("sd");

				if(act == true){					
					$("input[name=sp_adult["+i+"]]").attr("value",fsa);
					$("input[name=sp_children["+i+"]]").attr("value",fsc);
					$("input[name=sp_difference["+i+"]]").attr("value",fsd);					
				}else{					
					$("input[name=sp_adult["+i+"]]").attr("value",sa);
					$("input[name=sp_children["+i+"]]").attr("value",sc);
					$("input[name=sp_difference["+i+"]]").attr("value",sd);	
				};
			});	
		});
		
		$("input[name=single_line_price]").click(function(){
			var ind = $(this).attr("id");
			var lp_id = $("#line_price_id_"+ind).attr("value");
			$("input[name=line_price_id["+ind+"]]").attr("value",lp_id);
			$("input[name=single_index]").attr("value",ind);
			$("#line_price_id_"+ind).attr("checked",'checked');
			$("input[name=action]").attr("value",'update_single_line_price');
			if (confirm('确定修改'+lp_id+'吗？')) {
				$('#update_line_price_form').submit();
			}
		});
		
		$("input[name=chk_line_price_id]").live("click",function () {
			var act = $(this).attr("checked");
			var i=$(this).attr('id').substring(14,17);
			var v=$(this).val();
				if(act == true){
					var html = '<input name="chk_line_price_id" id="line_price_id_'+i+'" type="checkbox" style="width:20px;" checked="checked" value="'+v+'" /><span style="color:red">'+v.substring(5,8)+'</span>';
					$("#html_"+i).html(html);
					$("input[name=line_price_id["+i+"]]").attr("value",v);
				}else{
					var html = '<input name="chk_line_price_id" id="line_price_id_'+i+'" type="checkbox" style="width:20px;" value="'+v+'" /><span style="color:#000">'+v.substring(5,8)+'</span>';
					$("#html_"+i).html(html);
					$("input[name=line_price_id["+i+"]]").attr("value","");
					
				};
			});
		
		var check_week = function (start_date) {//检查函数	
			var falg = 0;
			$("input[name='chkweek']:checkbox").each(function () { 
				if(start_date == $(this).val()){				
					if ($(this).attr("checked")) { 						
						falg = 1;
					}
				}; 
			});
			if(falg>0){
				return true;
			}else{
				return false;
			}
		};
		
		var formatdate = function (date){
			var Year = 0;
			var Month = 0;
			var Day = 0;
			var CurrentDate = ""; //初始化时
			Year = date.getFullYear(); //ie火狐下都可以
			Month = date.getMonth() + 1;
			Day = date.getDate(); //Hour = day.getHours();
			// Minute = day.getMinutes();
			// Second = day.getSeconds();
			CurrentDate += Year + "-";
			if (Month >= 10) {
				CurrentDate += Month + "-";
			} else {
				CurrentDate += "0" + Month + "-";
			}
			if (Day >= 10) {
				CurrentDate += Day;
			} else {
				CurrentDate += "0" + Day;
			}
			return CurrentDate;
		};
		
		var getselect = function (name,i){
			var selectval = $('select[name='+name+']').val();
			var strselect = '<select name="'+name+'['+i+']" class="f-input" style="width:80px;height:25px;">';
			for(var i=0;i<$('select[name='+name+'] option').length;i++){
				var optionval = $('select[name='+name+'] option').eq(i).val();
				var optiontext = $('select[name='+name+'] option').eq(i).text();
				if(selectval == optionval){
					strselect += '<option value="'+optionval+'" selected>'+optiontext+'</option>';
				}else{
					strselect += '<option value="'+optionval+'">'+optiontext+'</option>';
				}				
			};
			strselect += '</select>';
			return strselect;
		};
		
		var getcheckbox = function (name,i){
			var checkboxval = $('input[name='+name+']').val();
			var strcheckbox = '<input name="'+name+'['+i+']" type="checkbox" style="width:20px;"';
			
				var checkedval = $('input[name='+name+']').val();				
				if($('input[name='+name+']').attr('checked') == true){
					strcheckbox += 'value="'+checkedval+'" checked="checked">';
				}else{
					strcheckbox += 'value="'+checkedval+'">';
				}
			return strcheckbox;
		};
		
		$("#addlineprice").click(function(){	//生成系列团期
			var start_date,end_date,tmpstart_date,tmpStrend_date;
			var myTable = document.getElementById("add-line-price-plan");
			var days = $('input[name=single_days]').val();
			var cp_adult = $('input[name=single_cp_adult]').val();
			var cp_children = $('input[name=single_cp_children]').val();
			var cp_difference = $('input[name=single_cp_difference]').val();
			var sp_adult = $('input[name=single_sp_adult]').val();
			var sp_children = $('input[name=single_sp_children]').val();
			var sp_difference = $('input[name=single_sp_difference]').val();
			var plan_number = $('input[name=single_plan_number]').val();
			var now_number = $('input[name=single_now_number]').val();

			var start_date= $("#start_date").val(); //周期开始时间
			var strend_date= $("#end_date").val(); //周期结束时间TeamPeopleNum
			var TeamPeopleNum=$("#TeamPeopleNum").val(); //计划人数	

			var reg=new RegExp("-","g"); //创建正则RegExp对象
			if(start_date!=""){
				var tmpstart_date=start_date.replace(reg,"");
					startday=new Date(start_date.replace(reg,"/"));
			} 
			else
			{
				alert("请选择起始日期");return false;
			}
			if(strend_date!="")
			{
					var tmpStrend_date=strend_date.replace(reg,"");
					 end_date=new Date(strend_date.replace(reg,"/")); 
			} 
			else
			{	
				alert("请选择结束日期");return false;
			}
			$("#add-line-price-plan").next("tbody").html("");
			var i=1;
			
			while(parseInt(tmpstart_date,10) <= parseInt(tmpStrend_date,10)){
				if(check_week(startday.getDay()))
				{
					if(i%2 == 1){
						var bgc='bdbc'; 
					}else{
						var bgc='bdb'; 
					}
					var str = '<tr><td class="price '+bgc+'" >'+i+'</td>';
					str += '<td class="price '+bgc+'"><input type="text" size="10" name="s_time['+i+']" id="line-create-begin-time" class="date" value="'+start_date+'" maxLength="10" onfocus="WdatePicker({skin:\'whyGreen\',doubleCalendar:true,minDate:\'%y-%M-%d\',maxDate:\'%y-%M-{%d+60}\'})"/></td>';				
					str += '<td class="price '+bgc+'"><input type="text" size="2" maxLength="2" style="width:16px;" name="days['+i+']" id="line-create-int-number" class="number" value="'+days+'" datatype="double" require="true" />天</td>';
					str += '<td class="price '+bgc+'">'+getselect('single_traffic',i)+'</td>';
					str += '<td class="price '+bgc+'">'+getselect('single_hotel',i)+'</td>';					
					str += '<td class="price '+bgc+'"><li class="lableprice">成人:<input type="text" style="width:50px;" size="6" name="cp_adult['+i+']" id="line-create-market-price" class="number" value="'+cp_adult+'" datatype="double" require="true" /></li><li class="lableprice">儿童:<input type="text" style="width:50px;" size="6" name="cp_children['+i+']" id="line-create-line-price" class="number" value="'+cp_children+'" datatype="double" require="true" /></li><li class="lableprice">房差:<input type="text" style="width:50px;" size="6" name="cp_difference['+i+']" id="line-create-int-number" class="number" value="'+cp_difference+'" datatype="double" require="true" /></li></td>';
					str += '<td class="price '+bgc+'"><li class="lableprice">成人:<input type="text" style="width:50px;" size="10" name="sp_adult['+i+']" id="line-create-market-price" class="number" value="'+sp_adult+'" datatype="double" require="true" /></li><li class="lableprice">儿童:<input type="text" style="width:50px;" size="6" name="sp_children['+i+']" id="line-create-line-price" class="number" value="'+sp_children+'" datatype="double" require="true" /></li><li class="lableprice">房差:<input type="text" style="width:50px;" size="6" name="sp_difference['+i+']" id="line-create-int-number" class="number" value="'+sp_difference+'" datatype="double" require="true" /></li></td>';
					str += '<td class="price '+bgc+'"><input type="text" style="width:30px;" size="4" name="plan_number['+i+']" id="line-create-max-number" class="number" value="'+plan_number+'" maxLength="6" datatype="number" require="true" />人</td>';
					str += '<td class="price '+bgc+'"><input type="text" style="width:30px;" size="4" name="now_number['+i+']" id="line-create-per-number" class="number" value="'+now_number+'" maxLength="6" datatype="number" require="true" />人</td>';
					str += '<td class="price '+bgc+'"><li style="width:60px;">'+getcheckbox('single_is_pay',i)+'直付</li><li style="width:60px;">'+getcheckbox('single_on_sale',i)+'特价</li></td>';
					str += '<td class="price '+bgc+'"></td></tr>';					
					
					$("#add-line-price-plan").next("tbody").append(str);
			//		$("#add-line-price-plan").next("tbody").find("td").addClass("td2");
			//		$("#teamlevel"+i+" option[value="+teamlevel+"]").attr("selected",true);
					i++;
				}
				//重新获得开始日期 每次加一天				
				startday=new Date(startday.getFullYear(),startday.getMonth(),startday.getDate()+1);
				//将开始时间格式化成 yyyy-mm-dd shmily.quan 2011-04-11
				start_date = formatdate(startday);
				if(tmpstart_date!="")
				{
					tmpstart_date=start_date.replace(reg,""); //格式化成 20001122格
				} 
			}
		//	$("#add-line-price").tablegrid();
		str = '<tr><td class="price" colspan="11"><input name="batch_price" style="width:120px;" value="批量插入团期" type="submit" /></t</tr>';
		$("#add-line-price-plan").next("tbody").append(str);
		$("html,body").animate({scrollTop: $("#add_line_price_batch").offset().top}, 1000);
		});
	},
	addSaleToCart: function (){
		var cart_url = SITE_MAIN_WEBBASEURL+'Manage/cart.php?';
		var rf = '&op=add';
	 
		$('ul.product_list a.add_to_cart').click(function(){
			/*if($(this).parent().parent().find('select').length > 0 ) {
					alert('请先选择一个型号吧！');
					return false;
			}*/
			var team_id = $(this).attr('team_id');
			var ptc_no = $(this).attr('ptc_no');        
			   ptc_no = ptc_no.substring(0,ptc_no.length -1);			   
			   ptc_no = ptc_no.split(',');
			   if(ptc_no.length == 1) {
				   window.location.href = cart_url + 'ptc_no=' +ptc_no+'&team_id='+team_id+rf;
				   if(window.event) window.event.returnValue = false;
			   }
			   /*else {
				   var options = '<div style="position: relative;"><select style="position: absolute;left: 15px;height: 18px;"><option value="">请选个您需要的型号</option>';
				   var sku_name = $(this).attr('sku_name');
				   sku_name = sku_name.substring(0,sku_name.length - 1);
				   sku_name = sku_name.split(',');
				   for(var x=0; x<ptc_no.length; x++) {
					   options += '<option value="'+ptc_no[x]+'">'+sku_name[x]+'</option>';
			   }
			   options +='</select></div>';
			   $(this).parent().after(options);
			}
			
			$(this).parent().parent().find('select').bind('change',function(){
				if($(this).val() != '') {
					window.location.href = cart_url +$(this).val()+','+team_id+',1'+rf;
					if(window.event) window.event.returnValue = false;
				}
			});*/
		});
	},
	addSaleGiftToCart: function () {
		var add_free_gift_to_cart = function () {
			var is_add_gift = false;
			if (!$(this).parent().parent().hasClass('enable')) {
				return false;
			}
			if ($(this).hasClass('selected')) {
				return false;
			}
			if ($(this).hasClass('sold_out')) {
				alert('此赠品已抢光，换一个吧');
				return false;
			}
			$('.cart_products .cart_item').each(function () {
				var team_id = $(this).attr('deal_team_id');
				if ($('#gift_' + team_id).length > 0) {
					var alt = $(this).find('.cart-buy-delete').attr('alt');
					Btb.Manage.update_cart(alt, 0);
				}
			});
			var team_id = $(this).attr('team_id');
			var ptc_no = $(this).attr('ptc_no');
			var url = cart_url + ptc_no + ',' + team_id + ',1';
			window.location.href = url;
		};
		Btb.Manage.changeSaleGiftBoxItemStatus();
		$('.sale_gifts_selector li').click(add_free_gift_to_cart);
		var check_gift = function () {
			var sale_box_obj = $('.sale_gifts_selector');
			if (sale_box_obj.length > 0) {
				var check = true;
				$('.cart_products .cart_item').each(function () {
					var team_id = $(this).attr('deal_team_id');
					if ($('#gift_' + team_id).length > 0 && !$('#gift_' + team_id).parent().parent().hasClass('enable')) {
						alert('您选择的赠品不符合规则');
						check = false;
					}
				});
				if (sale_box_obj.find('.enable').length > 0) {
					if (sale_box_obj.find('.enable li.sold_out').length != 3) {
						if (sale_box_obj.find('li.selected').length == 0) {
							if (!confirm('您还没有选择赠品，确定不要赠品去支付么？')) {
								return false;
							}
						}
					}
				}
				if (check) {
					window.location.href = "../../index.php"/*tpa=http://www.btgbj.com/Manage/cart.php*/;
				}
			} else {
				window.location.href = "../../index.php"/*tpa=http://www.btgbj.com/Manage/cart.php*/;
			}
			if (window.event) window.event.returnValue = false;
		};
		$('#go_to_Manage').attr('href', 'javascript:void(0)').click(check_gift);
	},
	changeSaleGiftBoxStatus: function (total_price) {
		var obj = $('.sale_gifts_selector');
		if (obj.length > 0) {
			obj.find('.level').removeClass('enable');
			if (total_price >= 298) {
				$('#level_298').addClass('enable')
			} else if (total_price >= 248) {
				$('#level_248').addClass('enable')
			} else if (total_price >= 198) {
				$('#level_198').addClass('enable')
			}
		}
	},
	changeSaleGiftBoxItemStatus: function () {
		if ($('.sale_gifts_selector').length > 0) {
			$('.sale_gifts_selector li').removeClass('selected');
			$('.cart_products .cart_item').each(function () {
				var team_id = $(this).attr('deal_team_id');
				$('#gift_' + team_id).addClass('selected');
			});
		}
	},
	cart_item_number_change: function (cart_item_input_obj) {		
		var team_buy_limit = parseInt(cart_item_input_obj.attr('team_buy_limit'));
		var team_buy_max = parseInt(cart_item_input_obj.attr('team_buy_max'));
		var v = parseInt(cart_item_input_obj.val());
		if (isNaN(v)) v = 0;
		if (v < 1 || v > 99) {
			if (v < 1) v = 1;
			if (v > 99) v = 99
		}
		if (team_buy_max != 0 && v > team_buy_max) {
			alert("您最多能够购买 " + team_buy_limit + " 件该商品!");
			v = team_buy_limit;
			cart_item_input_obj.val(v);
		}
		if (team_buy_limit != 0 && v < team_buy_limit) {
			alert("本项目一次至少购买 " + team_buy_limit + " 件!");
			v = team_buy_limit;
			cart_item_input_obj.val(v);
		}
		Btb.Manage.caculate_amount_func();
		Btb.Manage.update_cart(cart_item_input_obj.attr('alt'), v)
	},
	caculate_amount_func: function () {
		var number = 0;
		var sub_total = 0;
		var has_free = false;
		var product_count = 0;
		var has_b2c_item = false;		
		$('.sort-number-input').each(function () {
			var v = parseInt($(this).val());
			if (isNaN(v)) v = 0;
			if (v < 1 || v > 99) {
				if (v < 1) v = 1;
				if (v > 99) v = 99;
			//	$(this).siblings('.item-buy-tip').css('display', 'inline')
			}		
			number += v;
			var cart_index = $(this).attr('alt');
			var item_total = v * $('#cart-buy-price-' + cart_index).html();	
			sub_total += parseFloat(item_total);			
			if ($(this).attr('category') == 'free') {
				has_free = true;
			}
			if ($(this).attr('is_b2c_item') == '1') {
				has_b2c_item = true;
			}
			$('#cart-buy-total-' + cart_index).html(item_total.toFixed(2));
		});
		//var cart_amount_after_discount = sub_total - parseFloat($('#promotion_discount_amount').html());
		$('#cart-buy-total-t').html(sub_total.toFixed(2));
		//Btb.Manage.changeSaleGiftBoxStatus(cart_amount_after_discount.toFixed(2))
	},
	update_cart: function (cart_index, number) {
		var raw_cart = $.base64Decode($.cookie('cart'));		
		var cart = $.parseJSON(raw_cart);
		var current_number = eval('cart.team_id_' + cart_index + '.number ');
		var new_cart_total_number = parseInt($.cookie('total_number')) + number - current_number;		
		if (number <= 0) {
			eval('delete cart.team_id_' + cart_index);
		} else {
			eval('cart.team_id_' + cart_index + '.number = ' + number);
		}
		var new_cart_cookie = $.base64Encode(Btb.Manage.jsonToString(cart));
		$.cookie('cart', new_cart_cookie, {
			'path': '/',
			'domain': SITE_MAIN_NAME
		});
		$.cookie('total_number', new_cart_total_number, {
			'path': '/',
			'domain': SITE_MAIN_NAME
		});
	},
	clear_cart: function () {
		$.cookie('cart', '', {
			'path': '/',
			'domain': SITE_MAIN_NAME
		});
		$.cookie('total_number', '0', {
			'path': '/',
			'domain': SITE_MAIN_NAME
		});
	},
	jsonToString: function (obj) {
		var THIS = this;
		switch (typeof(obj)) {
		case 'string':
			return '"' + obj.replace(/(["\\])/g, '\\$1') + '"';
		case 'array':
			return '[' + obj.map(THIS.jsonToString).join(',') + ']';
		case 'object':
			if (obj instanceof Array) {
				var strArr = [];
				var len = obj.length;
				for (var i = 0; i < len; i++) {
					strArr.push(THIS.jsonToString(obj[i]));
				}
				return '[' + strArr.join(',') + ']';
			} else if (obj == null) {
				return 'null';
			} else {
				var string = [];
				for (var property in obj) string.push(THIS.jsonToString(property) + ':' + THIS.jsonToString(obj[property]));
				return String.fromCharCode(123) + string.join(',') + String.fromCharCode(125);
			}
		case 'number':
			return obj;
		case false:
			return obj;
		}
	},
	redraw_switchsale: function () {
		var deal_team_ids = new Array();
		if ($(".cart_item").length > 0) {
			$('.cart_item').each(function () {
				deal_team_ids.push($(this).attr('deal_team_id'));
			});
		}
		$('.switch_product_sale').each(function () {
			var in_array = $.inArray($(this).attr('deal_team_id'), deal_team_ids);
			if (in_array != '-1') {
				$(this).css('display', 'none');
			} else {
				$(this).css('display', 'inline');
			}
		});
	},
	Manage_confirmation: function () {
	/*	$('input[name=logistic_preference]').click(function () {
			$('input[name=delivery_fee]').val($(this).attr('delivery_fee'));
			if (parseInt($('input[name=merge_shipping_delivery_fee_redcuction]').val()) != 0) {
				$('input[name=merge_shipping_delivery_fee_redcuction]').val($(this).attr('delivery_fee'))
			}
			Btb.Manage.load_shipping($('input[name=address_id]:checked').val());
			Btb.Manage.update_checkout_amount()
		});*/
		$('input[name=consignee_address]').click(function () {
			$('#consignee_info').css('display', 'none');
			if ($(this).val() == 'old_address') {
				$('#old_address').addClass('selected');
				$('#new_address').removeClass('selected');				
			} else if ($(this).val() == 'new_address') {
				$('#old_address').removeClass('selected');
				$('#new_address').addClass('selected');
				$('#consignee_info').css('display', 'block');
				$("input[name='Manage_delivery'][value='express']").attr("disabled", "");
				$("input[name='consignee_address'][value='old_address']").attr("checked", false);
				$("input[name='consignee_address'][value='new_address']").attr("checked", true);
			} 
			Btb.Manage.update_checkout_amount();
		});
		$('input[name=Manage_delivery]').click(function () {
			$('#delivery_express_list').css('display', 'none');
			if ($(this).val() == 'express') {
				$('#Manage_delivery_express').addClass('selected');
				$('#Manage_express_ems').removeClass('selected');
				$('#delivery_express_list').css('display', 'block');
				$('#ems_fare').val(0);
			} else if ($(this).val() == 'ems') {
				$('#Manage_delivery_express').removeClass('selected');
				$('#Manage_express_ems').addClass('selected');
				$('#ems_fare').val($('#ems_add_fare').val());
			} 
			Btb.Manage.update_checkout_amount();
		});
		$("input[name='delivery_option']").click(function () {
			$('#merge_delivery_list').css('display', 'none');
			$('#delivery_input_delay').css('display', 'none');
			if ($(this).val() == 'instant') {
		//		$('#merge_shipping_list').css('display', 'block');
				$('#Manage_instant').addClass('selected');
				$('#Manage_delay').removeClass('selected');
				$("input[name='merge_delivery_delivery_fee_redcuction']").val($("input[name='delivery_fee']").val());
			} else if ($(this).val() == 'delay') {
				$("input[name='merge_delivery_delivery_fee_redcuction']").val(0);
				$('#Manage_instant').removeClass('selected');
				$('#Manage_delay').addClass('selected');
				$('#delivery_input_delay').css('display', 'block');
			} else {
				$("input[name='merge_delivery_delivery_fee_redcuction']").val(0);
			}
			Btb.Manage.update_checkout_amount();
		});
		var minPlus = 1;
		var maxPlus = 15;
		var now = new Date();
		var string = now.getFullYear() + "/" + (parseInt(now.getMonth()) + 1) + "/" + now.getDate();
		now = new Date(string);
		var minDate = new Date(now);
		var maxDate = new Date(now);
		minDate.setTime(minDate.getTime() + minPlus * (1000 * 3600 * 24));
		maxDate.setTime(maxDate.getTime() + maxPlus * (1000 * 3600 * 24));		
		$("input[name='target_delivery_date']").mousedown(function () {			
			$(this).datepicker();
			$(this).datepicker('option', {
				dateFormat: "yy-mm-dd",
				showAnim: '',
				minDate: minDate,
				maxDate: maxDate
			});
		});
		$("input[name='target_delivery_date']").change(function () {
			var stringValue = $(this).val();
			var stringValue = stringValue;
			var dateValue = new Date(stringValue.replace(/-/g, "/"));
			if (dateValue == null || dateValue < minDate || dateValue > maxDate) {
				alert("您输入的时间有误！");
				var month = parseInt(maxDate.getMonth()) + 1;
				var day = maxDate.getDate();
				var monthString = month > 9 ? month + "": "0" + month;
				var dayString = day > 9 ? day + "": "0" + day;
				$(this).val(maxDate.getFullYear() + "-" + monthString + "-" + dayString);
			}
		});
	},
	load_delivery: function (address_id) {
		var has_available_delivery = false;
		$(".delivery_no").each(function () {
			var allowed_delivery_set = $("input[name='logistic_preference']:checked").val() + '_' + address_id;
			var is_available_delivery = false;
			if ($(this).attr('alt') != allowed_delivery_set) {
				$(this).css('display', 'none');
			} else {
				is_available_delivery = true;
				$(this).css('display', 'block');
			}
			has_available_delivery = has_available_delivery || is_available_delivery;
			if (!has_available_delivery) {
				$('#merge_delivery_title').css('display', 'none');
				$('#merge_delivery_list').css('display', 'none');
				if ($("input[name='delivery_option']:checked").val() == 'merge') {
					$('#delivery_fee').html($("input[name='delivery_fee']").val());
					var total_amount = parseFloat($('#delivery_fee').html()) + parseFloat($("input[name='cart_total']").val());
					$('#total_amount').text(total_amount.toFixed(2));
					$("input[name='delivery_option'][value='instant']").attr("checked", true);
				}
			} else {
				$('#merge_delivery_title').css('display', 'block');
				if ($("input[name='delivery_option']:checked").val() == 'merge') {
					$('#merge_delivery_list').css('display', 'block');
				}
			}
		});
	},
	cancel: function () {
		$('.Manage-cancel').click(function () {
			var confirmation = confirm('确定要取消这个订单吗？\n取消货到付款的订单会将您此单已经支付的余额退回您的帐户，使用过的现金券恢复正常。');
			var _self = $(this);
			if (confirmation) {
				$.get($(this).attr('href'), '', function () {
					_self.parent().html('已经成功取消');
				});
			} else {}
			return false;
		});
	},
/*	Manage_promo_card: function () {
		$("#promo_card_submit").val('使用');
		$("#promo_card_submit").removeAttr('disabled');
		$("#form_Manage_promo_card").submit(function () {
			$('#Manage_promo_card_processing').css('display', 'block');
			$('#form_Manage_promo_card').css('display', 'none');
			$('#Manage_promo_card_process_result').css('display', 'none');
			$.ajax({
				type: $(this).attr('method'),
				url: $(this).attr('action'),
				dataType: 'json',
				data: $(this).serialize(),
				success: function (data) {
					if (data.status == 0) {
						alert(data.msg);
						$('#Manage_promo_card_processing').css('display', 'none');
						$('#form_Manage_promo_card').css('display', 'block');
						$('input[name=cardno]').val('')
					} else {
						$('#Manage_promo_card_process_result').css('display', 'block');
						$('#Manage_promo_card_processing').css('display', 'none');
						$('#form_Manage_promo_card').css('display', 'none');
						$('input[name=promo_cards]').val($('input[name=cardno]').val());
						if (data.effect_method == 'rmb_off') {
							var amount = data.effect_params;
							$('#Manage_promo_card_process_result').html('使用成功！<br />' + amount + '元金额已经从订单中扣除');
							$('#show_promo_card').hide();
							$("input[name='promo_cards_reduction_amount']").val(amount)
						} else if (data.effect_method == 'no_delivery_fee') {
							var delivery_fee_reduction = parseFloat($("input[name='delivery_fee_reduction']").val());
							var max_discount_amount = parseFloat(data.effect_params);
							var max_reduction = Math.max(max_discount_amount, delivery_fee_reduction);
							$('input[name=delivery_fee_reduction]').val(max_reduction);
							if (isNaN(max_reduction)) {
								max_reduction = 0
							}
							$('#Manage_promo_card_process_result').html('免邮卡使用成功！<br /> 已经免去 ' + discount_delivery_fee + '元邮费。');
							$('#show_promo_card').hide()
						} else if (data.effect_method == 'cashback') {
							var cart_amount = parseFloat($("input[name='cart_total']").val());
							var cashback_value = parseInt(cart_amount * parseFloat(data.effect_params));
							var expire_date = new Date();
							var old_date = expire_date.getDate();
							expire_date.setDate(expire_date.getDate() + 14);
							if (expire_date.getDate() < old_date) {
								expire_date.setMonth(expire_date.getMonth() + 1)
							}
							$('#Manage_promo_card_process_result').html('您本次购买之后可以获得' + cashback_value + '元代金券，请在' + expire_date.getMonth() + '月' + expire_date.getDate() + '日之前使用');
							$('#show_promo_card').hide()
						}
						Btb.Manage.update_checkout_amount()
					}
				}
			});
			return false
		})
	},*/
	update_checkout_amount: function () {
		var Manage_total = parseFloat($("input[name='Manage_total']").val());
	//	var fare = parseFloat($("input[name='fare']").val());
		var ems_fare = parseFloat($("input[name='ems_fare']").val());
		/*
		var delivery_fee = parseFloat($("input[name='delivery_fee']").val());
		var promo_cards_reduction_amount = parseFloat($("input[name='promo_cards_reduction_amount']").val());
		var merge_delivery_delivery_fee_redcuction = parseFloat($("input[name='merge_delivery_delivery_fee_redcuction']").val());
		var delivery_fee_reduction = parseFloat($("input[name='delivery_fee_reduction']").val());
		var final_delivery_fee_reduction = Math.max(delivery_fee_reduction, merge_delivery_delivery_fee_redcuction);
		*/
		if (ems_fare > 0) {
			$('#add_ems_fare').css('display', 'block');
			$('#add_ems_fare_value').html(ems_fare);
		} else {
			$('#add_ems_fare').css('display', 'none');
		}
		/*
		if (promo_cards_reduction_amount > 0) {
			$('#promo_card_reduction_notice').css('display', 'block');
			$('#promo_card_reduction_amount').html(promo_cards_reduction_amount)
		} else {
			$('#promo_card_reduction_notice').css('display', 'none')
		} 本次订单总额为：<strong><span class="money">{$currency}<font id="checkout_total">${moneyit($total_origin)}</font></span></strong>，
		$('#delivery_fee').html(delivery_fee);
		*/
		var checkout_total = Math.max(0, Manage_total + ems_fare).toFixed(2);		
		$('#checkout_total').text(checkout_total);
		var balance = parseFloat($("#account_balance").text());		
		if (balance + 0.000001 < checkout_total) {
			var proceed_notice = '您的帐户余额：<span><font>¥</font><span id="account_balance">' + balance.toFixed(2) + "</span></span>，本次订单总额为：<span><font>¥</font>" + checkout_total + "，</span> 您的余额不够完成本次付款，还需支付 <span><font>¥</font>" + (checkout_total - balance).toFixed(2) + "</span>。请选择支付方式";
			$("#paytype_balance_info").html(proceed_notice);
			$('#Manage_paytype').css('display', 'block');
		} else {
			var proceed_notice = '您的帐户余额：<span><font>¥</font><span id="account_balance">' + balance.toFixed(2) + "，</span></span>  本次订单总额为： <span><font>¥</font>" + checkout_total + "，</span> 您的余额足够完成本次付款，请直接确认订单，完成付款。";
			$("#paytype_balance_info").html(proceed_notice);
			$('#Manage_paytype').css('display', 'none');
		}
	},
	enable_cod: function () {
		$('#province').change(function () {
			var is_in_county = false;
			var city_ids = '650000-540000-150000-630000';
			if ($('#province').val() != '' && city_ids.indexOf($('#province').val()) != -1) {
				is_in_county = true;
			}
			if (is_in_county) {
				Btb.Manage.show_cod();
			} else {
				Btb.Manage.hide_cod();
			}
		});
		$("div[id='new_address'] input").click(function () {
			Btb.Manage.hide_cod();
		});
		$("div[id='old_address'] input").click(function () {
			var address = $(this).next().text();			
			var is_ems = false;
			var city_names = ['新疆维吾尔自治区', '西藏自治区'];
			if ($("div[id='old_address'] input:checked").length == 1) {
				var address = $("div[id='old_address'] input:checked").next().text();
					$.each(city_names, function (i, n) {
						if (address.indexOf(n) != -1) {
							is_ems = true;
						}
					});
			}
			if (is_ems) {
				Btb.Manage.show_cod();
			} else {
				Btb.Manage.hide_cod();
			}
		});
		if ($("div[id='old_address'] input:checked").length == 1) {
			$("div[id='old_address'] input:checked").click();
		}
	},
	show_cod: function () {
		$("input[name='Manage_delivery'][value='ems']").attr("checked", true);
		$("input[name='Manage_delivery'][value='express']").attr("disabled", 'disabled');
		$('#delivery_express_list').css('display', 'none');
		$('#Manage_delivery_express').removeClass('selected');
		$('#Manage_express_ems').addClass('selected');
		$('#ems_fare').val($('#ems_add_fare').val());
		Btb.Manage.update_checkout_amount();
	//	$('#label_express').text('快递（7元，系统自动判断选择快递, 支持货到付款）');
	//	$('#label_delivery_delay').text('推迟发货（让您可以将以后的订单合并成一个包裹发货，节省邮费，不支持货到付款）');
	//	$('#label_delivery_merge').text('和已经存在的包裹一起发货，不支持货到付款');
	//	Btb.Manage.show_cod_option()
	},
	hide_cod: function () {
		$("input[name='Manage_delivery'][value='express']").attr("checked", true);
		$('#Manage_delivery_express').addClass('selected');
		$('#Manage_express_ems').removeClass('selected');
		$('#delivery_express_list').css('display', 'block');
		$('#ems_fare').val(0);
		Btb.Manage.update_checkout_amount();
	//	$('#label_express').text('快递（5元，系统自动判断选择快递）');
	//	$('#label_delivery_delay').text('推迟发货（让您可以将以后的订单合并成一个包裹发货，节省邮费）');
	//	$('#label_delivery_merge').text('和已经存在的包裹一起发货');
	/*	if ($('#gateway_COD').length == 1) {
			$('#gateway_COD').next().remove();
			$('#gateway_COD').remove()
		}*/
	},
	check_cart: function () {		
		var checkNull = function(str){
			if (null == str || str == "" )  {
				return false;
			}else{
				return true;
			}
		};
		var checkObjNull = function (obj,msg){
			if(!checkNull(obj)){
				alert(msg + "不能为空");
				return false;
			}
				return true;
		};
		var checkSelectValue = function(select){
		   for (var i = 0; i < select.options.length; i++){
				if(select.options[i].value !="" && select.options[i].selected){
					  return true;
				}
			}
			return false;
		};
		if($('input[name=delivery_option]:checked').val() == "delay"){
			if(!checkObjNull($('input[name=target_delivery_date]').val(),"推迟发货日期")){
				return false;
			}
		}
		if($('input[name=consignee_address]:checked').val() == "new_address"){
			var province = document.getElementById('province');
			var city = document.getElementById('city');
			var county = document.getElementById('county');
			if(!checkObjNull($('input[name=realname]').val(),"收件人名称")){
				return false;
			}else if(!checkSelectValue(province)){
				alert("请选择省");
				return false;
			}else if(!checkSelectValue(city)){
				alert("请选择市县");
				return false;
			}else if(!checkSelectValue(county)){
				alert("请选择地区");
				return false;
			}else if(!checkObjNull($('input[name=address]').val(),"街道地址")){
				return false;
			}else if(!checkNull($('input[name=mobile]').val())){
				alert("手机号码不能为空。");
				return false;
			}
              document.getElementById('select_province').value = province.options[province.selectedIndex].text;
              document.getElementById('select_city').value = city.options[city.selectedIndex].text;
              document.getElementById('select_county').value = county.options[county.selectedIndex].text;
		}
        $('#check_cart_form').action="/i/cart/pay";
		$('#check_cart_form').submit();
	},
	show_cod_option: function () {
		var is_ems = false;
		var city_names = ['东城区', '西城区', '崇文区', '宣武区', '朝阳区', '丰台区', '石景山区', '海淀区'];
		if ($("div[selector='old_address'] input:checked").length == 1) {
			var address = $("div[selector='old_address'] input:checked").next().text();
			if (address.indexOf('北京市-市辖区') != -1) {
				$.each(city_names, function (i, n) {
					if (address.indexOf('北京市-市辖区-' + n) != -1) {
						is_ems = true;
					}
				});
			}
		}
		var is_in_county = false;
		var city_ids = '110108-110105';
		if ($('#county').val() != '' && city_ids.indexOf($('#county').val()) != -1) {
			is_in_county = true
		}
		var is_cod_enabled = (is_in_county || is_ems);
		if (($('#express:checked, #delivery_instant:checked').length == 2) && is_cod_enabled) {
			if ($('#gateway_COD').length == 0) {
				$('div.gateway_list ul').prepend('<li cname="货到付款" id="gateway_COD"><input type="radio" value="COD" name="gateway" id="check-cod"><label class="COD" for="check-COD"></label></li><li class="desc" style="line-height:20px">货到付款经确认之后方为订购成功，热销商品建议使用在线支付.<br/><a href="../../index.php"/*tpa=http://www.btgbj.com/i/help/cod*/ target="_blank">点击查看详情</a></li>');
				$('#gateway_COD').bind('click', function () {
					$('div.gateway_list li').removeClass('selected');
					$(this).addClass('selected');
					$(this).children('input[type=radio]').attr('checked', 'checked');
				});
			}
		}
	}
};