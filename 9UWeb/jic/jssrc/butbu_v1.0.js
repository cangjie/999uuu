(function (e) {	
	if (e.Butbu) return false;
	e.fn.Butbu = function (C) {
		var D = [];
		H = new e.Butbu(this, C);		
		if (H.init()) {
			this.Butbu = H;
			D.push(H)
		}
		if (D.length === 0) D = false;
		if (D.length === 1) D.push(0);
		return D
	};
	e.fn.spin = function(opts, color) {//e("#loading").spin("tiny");e("#loading").spin(false);
			var presets = {
				"tiny": { lines: 8, length: 2, width: 2, radius: 3 },
				"small": { lines: 8, length: 4, width: 3, radius: 5 },
				"large": { lines: 10, length: 8, width: 4, radius: 8 }
			};				
			if (Spinner) {				
				return this.each(function() {
					var $this = e(this),
						data = $this.data();
					if (data.spinner) {
						data.spinner.stop();
						delete data.spinner;
					}					
					if (opts !== false) {
						if (typeof opts === "string") {
							if (opts in presets) {
								opts = presets[opts];
							} else {
								opts = {};
							}
							if (color) {
								opts.color = color;
							}
						}
						data.spinner = new Spinner(e.extend({color: $this.css('color')}, opts)).spin(this);
					}
				});
			} else {
				throw "Spinner class not available.";
			}
	};
	//日历开始
	e.fn.Calendar = function(Cn) {
		var DC = [];
		H = new e.Calendar(this, Cn);		
		if (H.initialize(Cn)) {
			this.Calendar = H;
			DC.push(H)
		}
		
		if (DC.length === 0) DC = false;
		if (DC.length === 1) DC.push(0);
		return DC;
	};
	e.Calendar = function () {
		var d = this,
			cf = {
				aCal: [],
				insertBefore: document.getElementById('calendar'),//插入指定位置			
				id: "calendar_id",//"D_" + (+new Date()),//日历id			
				container: document.createElement("div"),//日历内容容器
				oClose: document.createElement("span"),//关闭按钮
//				oClose.className: "cal-close",			
				oPrev: document.createElement("span"),//左按钮		
				oNext: document.createElement("span"),//右按钮			
				bShowBtn: true,//是否显示功能按钮			
				holiday: true,//是否特殊显示节假日
				autoNext:false,//自动翻阅			
				count:  1,//日历个数			
				Year: new Date().getFullYear(),//指定年份			
				Month: new Date().getMonth() + 1,//指定月份			
				selectDay: 'selectDay',//选择的日期			
				onToday: function() {alert('onToday')},//当天回调函数			
				onComplete: function() {alert('onComplete')},//日历创建完毕回调函数			
//				onSelectDay: function() {},//选择日期回调函数
				dayName: {
							"today":"\u4eca\u5929"
			/*				"yuandan":"\u5143\u65e6",
							"chuxi":"\u9664\u5915",
							"chunjie":"\u6625\u8282",
							"yuanxiao":"\u5143\u5bb5\u8282",
							"qingming":"\u6e05\u660e",
							"wuyi":"\u52b3\u52a8\u8282",
							"duanwu":"\u7aef\u5348\u8282",
							"zhongqiu":"\u4e2d\u79cb\u8282",
							"guoqing":"\u56fd\u5e86\u8282"	*/
						}
						//alert("ok");
//				today: new Date().getFullYear() + "-" + this.format(new Date().getMonth() + 1) + "-" + this.format(new Date().getDate()),//今天
			};
			//alert("ok");
			cf.onSelectDay = function (obj) {				
				X.get(obj['id']);
				return false;
		//		for(;len--;) _.removeClass(aA[len].children[0] ? aA[len].children[0] : aA[len], "selected");
		//		_.addClass(obj.children[0] ? obj.children[0] : obj, "selected");
		//		alert(obj["data-date"] + "\u3010"+ obj["data-week"] +"\u3011\n");
		//		cf.onToday();
			};
			//alert("ok");
		this.initialize = function (cn){
			cf.today = new Date().getFullYear() + "-" + this.format(new Date().getMonth() + 1) + "-" + this.format(new Date().getDate());//今天
			cf.oPrev.className = "cal-prev";
			cf.oNext.className = "cal-next";
			cf.container.id =  cf.id;
			d.setBtn(cf.bShowBtn);//配置功能按钮			
			setTimeout(function(){d.line_price();},100);
			d.addEvent();//添加事件
			d.create();
		};
		
		var _ = {
			$: function(id) {
				return typeof id === "object" ? id : document.getElementById(id)
			},
			$$: function(tagName, oParent) {
				return (oParent || document).getElementsByTagName(tagName)
			},	
			hasClass: function(element, className) {
				return new RegExp("(^|\\s)" + className + "(\\s|$)").test(element.className)
			},
			addClass: function(element, className) {
				var arr = element.className.split(/\s+/);	
				this.hasClass(element, className) || arr.push(className);
				element.className = arr.join(" ").replace(/(^\s*)|(\s*$)/, "")
			},
			removeClass: function(element, className) {
				element.className = element.className.replace(new RegExp("(^|\\s)" + className + "(\\s|$)", "g"), "").split(/\s+/).join(" ")	
			}
		}
		
		this._Draw = function (iYear, iMonth){
			var oContainer = document.createElement("div"),
			oDl = document.createElement("dl"),
			oDd = document.createElement("dd"),
			oFrag = document.createDocumentFragment(),
			//计算当月第一天是星期几
			firstDay = new Date(iYear, iMonth - 1, 1).getDay(),
			//计算当月有多少天
			lastDay = new Date(iYear, iMonth, 0).getDate(),
			//计算上个月有多少天
			PMD = new Date(iYear, iMonth - 1, 0).getDate(),
			gi = 42,			
			//日历头			
			aTmp = [
				"<dt class=\"date\">"+ iYear + "年" + iMonth +"月</dt>",
				"<dt><strong>日</strong></dt>",
				"<dt>一</dt>",
				"<dt>二</dt>",
				"<dt>三</dt>",
				"<dt>四</dt>",
				"<dt>五</dt>",
				"<dt><strong>六</strong></dt>"		
			],
			arr = [],arre = [],
			cur, oA, i, len, sValue, eValue, classIndex;
		//----------------------------------------------------
		for(i = 1; i <= firstDay; i++){
			arre.push(1);
			arr.push(PMD-firstDay+i);
		}
		for(i = 1; i <= lastDay; i++){
			arre.push(0);
			arr.push(i);
		}
		var LMD = gi -  arr.length;
		for(i = 1; i <= LMD; i++){
			arre.push(2);
			arr.push(i);
		}
		//alert(gi);
		while(arr.length) {
			for(i = 1, len = gi; i <= len; i++) {				
				if(arr.length) {
					oA = document.createElement("span");					
					sValue = arr.shift();
					eValue = arre.shift();
					
					if(eValue==1) {						
						oA.className = "trips_cld_disabled";
						oA["data-date"] = iYear + "-" + this.format(iMonth-1) + "-" + this.format(sValue);
						oA["data-week"] = this.getWeek(oA["data-date"]);
						oA.href = "javascript:;";						
						cur = new Date(iYear, iMonth - 2, sValue);
						oA.innerHTML = sValue+"/"+ (cur.getMonth() + 1);
						oA.id = cur.getTime()/1000;
						//屏蔽今天以前的日期选择
						//parseInt(oA["data-date"].replace(/-/g, "")) < parseInt(cf.today.replace(/-/g, "")) && (oA.className = "disabled");
						//团期以及假日处		cur.getTime()/1000				
						//d.line_price();
						if(cf.holiday) for(var className in cf.dayName) d.isHoliday(oA, className)	
					}
					else if(eValue==2) {						
						oA.className = "trips_cld_disabled";
						oA["data-date"] = iYear + "-" + this.format(iMonth+1) + "-" + this.format(sValue);
						oA["data-week"] = this.getWeek(oA["data-date"]);
						oA.href = "javascript:;";					
						cur = new Date(iYear, iMonth, sValue);
						oA.innerHTML = sValue+"/"+ (cur.getMonth() + 1);
						oA.id = cur.getTime()/1000;
						//屏蔽今天以前的日期选择
						//parseInt(oA["data-date"].replace(/-/g, "")) < parseInt(cf.today.replace(/-/g, "")) && (oA.className = "disabled");
						//团期以及假日处		cur.getTime()/1000				
						//d.line_price();
						if(cf.holiday) for(var className in cf.dayName) d.isHoliday(oA, className)	
					}
					else {
						oA.className = "trips_cld_enable";
						oA["data-date"] = iYear + "-" + this.format(iMonth) + "-" + this.format(sValue);
						oA["data-week"] = this.getWeek(oA["data-date"]);
						oA.href = "javascript:;";						
						oA.innerHTML = sValue;
						cur = new Date(iYear, iMonth - 1, sValue);
						oA.id = cur.getTime()/1000;
						//屏蔽今天以前的日期选择
					//	parseInt(oA["data-date"].replace(/-/g, "")) < parseInt(cf.today.replace(/-/g, "")) && (oA.className = "disabled");
						//团期以及假日处		cur.getTime()/1000				
						//d.line_price();
						if(cf.holiday) for(var className in cf.dayName) d.isHoliday(oA, className)						
					}	
				}
				oFrag.appendChild(oA)
			}
		}
		//插入相关元素
		oDd.appendChild(oFrag);			
		oDl.innerHTML = aTmp.join("");
		oDl.appendChild(oDd);
		oContainer.className = "cal-container";
		oContainer.appendChild(oDl);
		//记录日历队列
		cf.aCal.push(oContainer);
		//返回生成好的日历
		return oContainer;
		};
		
		this.line_price = function (){
			var sel_line_price = e("#line_prices_sel").find('option');//,alp = [];
			if(sel_line_price.length == 1) {
				setTimeout(function(){d.line_price();},100);
				return false;
			}
			var timeNow = new Date().getMonth() + 1,
				u_price = e("#ut_price"),
				u_preferential = e("#ut_preferential"),
				min_price = 0;
			
			for(var i=0;i<sel_line_price.length;i++){
				var opid = sel_line_price.get(i).id,					
					stm = e('#'+opid).attr('s_time'),
					cd = e('#'+stm),
					cdhtml = cd.html();
					if( i==0 ){
						var timeM = new Date(stm*1000).getMonth() + 1;						
						if(timeNow != timeM && cf.autoNext == false){
							d.Draw(new Date(stm*1000));
							cf.autoNext = true;
						}						
					}					
				//alp[stm] = new Array();
				if(min_price > parseInt(e('#'+opid).attr('sp_adult'))){
					min_price = parseInt(e('#'+opid).attr('sp_adult'));
				}
				if(e('#'+opid).attr('is_pay') == 'Y'){
					cdhtml += "<br><div class = \"trips_line_site\"><a href=\"javascript:;\" id=\"/ajax/order.php?action=sub_line&lpid="+opid+"\">位置:" + e('#'+opid).attr('plan_number')+"<\/a></div>";
				}else{
					cdhtml += "<br><div class = \"trips_line_site\"><a href=\"javascript:;\" id=\"/ajax/order.php?action=sub_line&lpid="+opid+"\">位置:电询<\/a></div>";
				}
				cdhtml += "<div class = \"trips_line_price\"><a href=\"javascript:;\" id=\"/ajax/order.php?action=sub_line&lpid="+opid+"\">" + parseInt(e('#'+opid).attr('sp_adult'))+"元<\/a></div>";
			//	alert(cdhtml);
				cd.html(cdhtml);
			}
			if(min_price > 0){
				u_price.html(min_price);
				u_preferential.html(min_price-20);
			}
		//	d.addEvent();
		}
		
		this.create = function (){
			var year = cf.Year,
			month = cf.Month,
			i = 0;
			//----------------------------------------------------------------
			cf.container.className = "calendar"; //※指定日历控件className
			//清空日历队列
			while(cf.aCal[0]) cf.container.removeChild(cf.aCal.shift());
			//批量生成日历
			for(i = 0; i < cf.count; i++) {
				year += (month + (i ? 1 : 0)) > 12 ? 1 : 0;
				month = (month + (i ? 1 : 0)) % 12 || 12;
				cf.container.appendChild(d._Draw(year, month))
			};
			//将日历插入页面, 如果未指定插入位置则插入BODY
			(cf.insertBefore ? cf.insertBefore.parentNode : document.body).insertBefore(cf.container, cf.insertBefore);
			//日历生成完毕的回调方法
//			cf.onComplete();
			return this;
		};
		
		this.Draw = function (date){
			cf.Year = date.getFullYear();
			cf.Month = date.getMonth() + 1;
			//重新创建日历
			d.create()
		};
		
		this.NowMonth = function (){
			this.Draw(new Date());
		};
		
		this.NextMonth = function (){
			this.Draw(new Date(cf.Year, cf.Month + (cf.count - 1), 1));
		};
		
		this.PrevMonth = function (){
			this.Draw(new Date(cf.Year, cf.Month - (cf.count + 1), 1));
		};
		
		this.isHoliday = function (obj, className){			
			if(new RegExp(obj["data-date"]).test(d.Holidays()[className].join())) {
				obj.className = 'istrue';//className;
				obj["data-week"] = cf.dayName[className];
			//	alert(obj.innerHTML);
				obj.innerHTML = obj["data-week"];//"<span>"+ obj.innerHTML +"</span>"
			}
		};
		
		this.format = function (str){
			return str.toString().replace(/^(\d)$/, "0$1");
		};
		
		this.show = function (){
			return cf.container.style.display = "block";
		};
		
		this.hide = function (){
			return cf.container.style.display = "none";
		};
		
		this.setBtn = function (boolean){
			var obj = cf.container;
		
			if(!this.mark && boolean) {//如果按钮没有创建过并且设置为显示, 则创建按钮, 并添加已创建标记
	//			obj.insertBefore(this.oClose, obj.firstChild);
				obj.insertBefore(cf.oPrev, obj.firstChild);
				obj.insertBefore(cf.oNext, obj.firstChild);
				//添加已创建标记
				cf.mark = true;
			}
			//如果按钮已经创建过, 则设置其显示/隐藏
			cf.oClose.style.display = cf.oPrev.style.display = cf.oNext.style.display = boolean ? "block" : "none";
		};
		
		this.addEvent = function (){						
			var obj = cf.container,
				handler = null;			
			handler = function(ee) {//CLICK事件代理
				ee = ee || event;								
				var oTarget = ee.target || ee.srcElement;
				
				switch(oTarget.className) {
					case "cal-close":
						d.hide();
						break;
					case "cal-prev":
						d.PrevMonth();
						setTimeout(function(){d.line_price();},100);
						break;
					case "cal-next":
						d.NextMonth();
						setTimeout(function(){d.line_price();},100);
						break;
				}				
				if(oTarget.tagName.toUpperCase() === "A" && oTarget.className != "disabled") {
					cf.onSelectDay(oTarget);					
				}
				if(oTarget.tagName.toUpperCase() === "SPAN" && oTarget.parentNode.tagName.toUpperCase() === "A") {
					cf.onSelectDay(oTarget.parentNode);
				}
				
			}			
			//为日历控件添加CLICK事件监听
			if(obj.addEventListener){
				obj.addEventListener("click", handler, false);				
			}else if(obj.attachEvent){
				obj.attachEvent("onclick", handler);				
			}
		};
		
		this.getWeek = function (date){
			var aWeek = ["\u65e5", "\u4e00", "\u4e8c", "\u4e09", "\u56db", "\u4e94", "\u516d"],
			arr = date.split(/-/g);
			return "\u661f\u671f" + aWeek[new Date(arr[0], arr[1] - 1, arr[2]).getDay()];
		};		
		this.Holidays = function (){
			return {
				today: [cf.today],
				yuandan: ["2012-01-01", "2013-01-01", "2014-01-01", "2015-01-01", "2016-01-01", "2017-01-01", "2018-01-01", "2019-01-01", "2020-01-01"],
				chuxi: ["2012-01-22", "2013-02-09", "2014-01-30", "2015-02-18", "2016-02-07", "2017-01-27", "2018-02-15", "2019-02-04", "2020-01-24"],
				chunjie: ["2012-01-23", "2013-02-10", "2014-01-31", "2015-02-19", "2016-02-08", "2017-01-28", "2018-02-16", "2019-02-05", "2020-01-25"],
				yuanxiao: ["2012-02-06", "2013-02-24", "2014-2-14", "2015-03-05", "2016-02-22", "2017-02-11", "2018-03-02", "2019-02-19", "2020-02-8"],
				qingming: ["2012-04-04", "2013-04-04", "2014-04-05", "2015-04-05", "2016-04-04", "2017-04-04", "2018-04-05", "2019-04-05", "2020-04-04"],
				wuyi: ["2012-05-01", "2013-05-01", "2014-05-01", "2015-05-01", "2016-05-01", "2017-05-01", "2018-05-01", "2019-05-01", "2020-05-01"],
				duanwu: ["2012-06-23", "2013-06-12", "2014-06-02", "2015-06-20", "2016-06-09", "2017-05-30", "2018-06-18", "2019-06-07", "2020-06-25"],
				zhongqiu: ["2012-09-30", "2013-09-19", "2014-09-08", "2015-09-27", "2016-09-15", "2017-10-04", "2018-09-24", "2019-09-13", "2020-10-01"],
				guoqing: ["2012-10-01", "2013-10-01", "2014-10-01", "2015-10-01", "2016-10-01", "2017-10-01", "2018-10-01", "2019-10-01", "2020-10-01"]
			}
		};		

		
	};
	//日历结束
	//alert("ok");
//=========================================================================================
	var ea = 0,
	Ea = e.browser.version,
	B = e.browser.msie,
	va = e.browser.mozilla,
	U = e.browser.safari,
	lb = e.browser.opera,
	V;

	e("script[src*=Butbu]").each(function() {
		var C = this.src;
		if (C.match(/Butbu[^\/]*\.js/i)) {
			V = C.replace(/[\?#].*$/, "").replace(/(^|[\/\\])[^\/]*$/, "$1");
			return false
		}
	});
	
	e.Butbu = function (C, D) {		
		var d = this,
		S = e(C),		
		p = d.settings = e.extend({},//extend函数合并对象  var newSrc=$.extend({},src1,src2,src3...)
		{
			skin: "default"		
		},
		D),
		indexNowplay = null,
		isPlay = true,
		f = e('#focus_spic_list'),
		b = e('#focus_img_list'),
		n = e('#leftnav'),
		dm = e('#mainmenu'),
		di = e('#ImageFocus'),
		Ba = [];

	//--------------------------------------------------------------------------------		
		
		this.init = function () {
		//	d.imageToggleInit();
			if(di.length > 0){
				d.ImageFocus();
			}
			if (e('#leftnav').attr("id") == "leftnav"){
				d.leftnav();
			}
			if(dm.length > 0){
				d.dropmenu();
			}
			if (e('#line_focus_pic').attr("id") == "line_focus_pic"){
				d.lineFocusPic();
			}
			if (e('#line_prices_sel').attr("name") == "line_prices_sel"){
				d.linePrice();
			}			
			if (e('#line_detail_nav').attr("id") == "line_detail_nav"){
//				alert(e('#line_detail_nav').attr("title"));
				d.lineNav();
				d.lineOp();
			}
			return true;
		};
		this.ImageFocus = function (){
			var width = parseInt(di.css("width")),
				height = parseInt(di.css("height")),
				num = di.find("#slideshow_photo a").length,
				mw = parseInt(width/num),
				at = new Array(),
				ah = new Array();
			di.find("#slideshow_photo img").each(function(){
				at.push(e(this).attr("alt"));				
			});
			di.find("#slideshow_photo a").each(function(){
				ah.push(e(this).attr("href"));				
			});
			for(var i = 0; i < num; i++){
				var shtml = "";
				if(i < (num - 1)){
					shtml = e('<div class="slideshow-menu" style="width:'+(mw - 1)+'px; border-right: 1px solid white;" index="'+(num-i)+'"><a href="'+ah[i]+'" target="_blank" style="font-size: 12px;color: white;float: left;display: block;width:'+(mw - 1)+'px;height: 26px;line-height: 26px;padding-top: 2px;text-align: center;">'+at[i]+'</a></div>');
				}else{
					shtml = e('<div class="slideshow-menu" style="width:'+mw+'px;" index="'+(num-i)+'"><a href="'+ah[i]+'" target="_blank" style="font-size: 12px;color: white;float: left;display: block;width:'+mw+'px;height: 26px;line-height: 26px;padding-top: 2px;text-align: center;">'+at[i]+'</a></div>');
				}
				shtml.appendTo('#slideshow_footbar');				
			}
			e('#slideshow_footbar .slideshow-menu:last').addClass('bt-on');

			e('#slideshow_footbar .slideshow-menu').mouseenter(function(e){
				d.slideTo(this);
			});
			e('#slideshow_wrapper').mouseenter(function(){
				isPlay = false;
			}).mouseleave(function(){
				isPlay = true;
			});	
			setInterval(function(){
				if (isPlay) d.slideDown();
			},5000);
			
	 	};
		this.slideDown = function (){
			var currentBt = e('#slideshow_footbar .slideshow-menu.bt-on');
			if (currentBt.length <= 0) return; 
			var nxt = currentBt.get(0).previousSibling;
			d.slideTo(nxt?nxt:e('#slideshow_footbar .slideshow-menu:last').get(0));
		};
		this.slideTo = function (o){
			if (!o) return;
			var currentIndex = e('#slideshow_footbar .slideshow-menu.bt-on').attr('index'),
			current = e('#slideshow_photo a[index='+currentIndex+']');
			var nxt = e('#slideshow_photo a[index='+e(o).attr('index')+']');	
			
			
			e('#slideshow_footbar .slideshow-menu.bt-on').removeClass('bt-on');
			e(o).addClass('bt-on');
			nxt.css('z-index',2);
			current.css('z-index',3).fadeOut(500,function(){
				e(this).css('z-index','1').show();				
			});
		};
		this.linePrice = function (){
			e("#loading").spin("small");
				var act = 'get_line_price',
					id = e("#line_id").val();
				e.post("../../ajax/agi.php.htm"/*tpa=http://www.btgbj.com/ajax/agi.php*/,{id:id,a:act},function(msg){
					var addHtml = "";
					e("#loading").spin(false);	
					var week = new Array ("日", "一", "二", "三", "四", "五", "六");
					if(msg.length > 0){
						 for(var i = 0;i < msg.length;i++){
							 var d = new Date(parseInt(msg[i].s_time)*1000);						 
							addHtml += "<option id=\"" + msg[i].id + "\" value=\"" + msg[i].id + "\" s_time=\"" + msg[i].s_time + "\" is_pay=\"" + msg[i].is_pay + "\" plan_number=\"" + msg[i].plan_number + "\" now_number=\"" + msg[i].now_number + "\" sp_adult=\"" + msg[i].sp_adult + "\">" +(d.getMonth() + 1) + "月" + d.getDate() + "(周" + week[d.getDay()] + ")" + parseFloat(msg[i].sp_adult) + "元/人(单房差"+  parseFloat(msg[i].sp_difference) + "元/人)</option>";//msg[i].s_time.getDay()
						 }
					}else{
						addHtml += "<option id=\"\">暂无团期，敬请电话详询！</option>";
					}
						e("#line_prices_sel option:first").nextAll("option").remove();
						e("#line_prices_sel option:first").after(addHtml);
						e("#line_prices_sel option:first").remove();
					},"json")
		};
		this.lineNav = function (){
			var $obj = e('#line_detail_nav');
			var ln = e("#line_nav").find("li");			
			$obj.css('z-index', 99);
			ln.click(function(){
				e("#line_trip_man").find("[name=line_trip]").css("display","none");
				ln.removeClass("selected");
				this.className = "selected";
				var lt = e("#line"+this.id),
					lm = e("#line_trip_man");
				if(this.id == "_all"){
					lm.find("[name=line_trip]").css("display","inline");
					e("#line_trip_").css("margin-top",$obj.css('height'));
				//	lm.find("[name=title]").css("height","34px");
				}else{
				//	lt.find("[name=title]").css("height","15px");
					lt.css("display","inline");	
					lt.css("margin-top",$obj.css('height'));				
					var ltop = e("#line_trip_man").offset().top;
					e('html,body').animate({
						scrollTop:ltop},500
					);
				}				
				return false;
			});
			
			var on_scroll = function () {
				var offset = e("#line_trip_man").offset();
				if (!offset) {
					return true
				}
				e("#line_trip_").css("margin-top",$obj.css('height'));
				var _default = offset.top;	
				
				if ($(window).scrollTop() > _default) {
					if ($.browser.msie && $.browser.version == '6.0') {
						$obj.css('top', $(window).scrollTop())
					} else {
						$obj.css('position', 'fixed');
						$obj.css('top', 0)
					}
				} else {
					$obj.css('position', 'absolute');
					$obj.css('top', _default)
				}
			};
			$(window).scroll(on_scroll);
	//		on_scroll();
			
		
		};
		this.lineOp = function (){
			var lps = e("#line_prices_sel"),
				an	= e("[name=adult_num]"),
				cn	= e("[name=children_num]"),
				lsb	= e("#line_submit"),
				lsh = e("#line_share");
				
/*			lps.change(function(){
				e("#loading").spin("small");
				alert(lps.val());
			});
			an.change(function(){
				e("#loading").spin("small");
				alert(an.val());
			});
			cn.change(function(){
				e("#loading").spin("small");
				alert(cn.val());
			});*/
			lsb.click(function(){
				e("#loading").spin("small");
				X.get(lsb.attr('href') +'&lpid='+ lps.val() +'&adult_num='+ an.val() +'&children_num='+ cn.val());
				e("#loading").spin(false);
				return false;
			});
			lsh.click(function(){
				e("#loading").spin("small");
				X.get(lsh.attr('href') +'&lpid='+ lps.val() +'&adult_num='+ an.val() +'&children_num='+ cn.val());
				e("#loading").spin(false);
				return false;
			});

		};
		this.lineFocusPic = function (){
			var spic = e("img[name='scenic']"),
				lpic = e("img[name='trips']"),
				lfp	= e("#line_focus_pic"),
				i	= 1,
				sum = spic.length+lpic.length,
				lphtml = "";//lfp.html()
			
			lpic.each(function(){
				if(e(this).attr("src") != ""){
					lphtml += "<li id=\""+i+"\" style=\"list-style\: none;\"><a href=\"/"+e(this).attr("name")+"/"+e(this).attr("id")+"\" target=\"_blank\"><img src=\""+e(this).attr("src")+"\" alt=\""+e(this).attr("alt")+"\" width=\"500\" height=\"280\" /></a><div class=\"opacity_bg\"></div><a title=\""+e(this).attr("title")+"\" target=\"_blank\" class=\"pic_title\" href=\"/"+e(this).attr("name")+"/"+e(this).attr("id")+"\">"+i+"/"+sum+"    "+e(this).attr("title")+"</a></li>";
				i++;
				}				
			});
			spic.each(function(){
				if(e(this).attr("src") != ""){
					lphtml += "<li id=\""+i+"\" style=\"list-style\: none;\"><a href=\"/"+e(this).attr("name")+"/"+e(this).attr("id")+"\" target=\"_blank\"><img src=\""+e(this).attr("src")+"\" alt=\""+e(this).attr("alt")+"\" width=\"500\" height=\"280\" /></a><div class=\"opacity_bg\"></div><a title=\""+e(this).attr("title")+"\" target=\"_blank\" class=\"pic_title\" href=\"/"+e(this).attr("name")+"/"+e(this).attr("id")+"\">"+i+"/"+sum+"    "+e(this).attr("title")+"</a></li>";
				i++;
				}				
			});
			if(sum > 1){
				lfp.html("");
				lfp.html(lphtml);
				
				lfp.find('li').bind('mouseover',function() {
					isPlay = false;
				});	
				lfp.find('li').bind('mouseout',function() {
					isPlay = true;
				});			
				setTimeout(	d.playLinePic,8000);
			}
		};
		this.playLinePic = function (){
			var spic = e("img[name='scenic']"),
				lpic = e("img[name='trips']"),
				sum = spic.length+lpic.length;	
			if(isPlay){
				if(sum == indexNowplay){
				    indexNowplay = 0;
				}else{
					indexNowplay = indexNowplay+1;
				}
				var height = 53+110*(indexNowplay);
				document.getElementById("line_focus_pic").style.left = "-"+500*(indexNowplay)+"px";
//				document.getElementById("focus_pic_small").style.backgroundPosition = "0 "+height+"px";
				f.find('div').addClass("opacity_small");
				f.find('li').eq(indexNowplay).find('div').removeClass("opacity_small");
			}
			if(sum > 1){
				setTimeout( d.playLinePic,2000);
			}
	 	};
		this.imageToggleInit = function (){
			f.find('li').bind('mouseover',function() {
				 var num = e(this).attr("spic-id"),cc = e(this);
				 var left_value = 600*(num),height = 53+110*(num);
				 document.getElementById("focus_img_list").style.left = "-"+left_value+"px";
				 document.getElementById("focus_pic_small").style.backgroundPosition = "0 "+height+"px";
				 f.find('div').addClass("opacity_small");
				 e(this).find('div').removeClass("opacity_small");				 
			});
			f.find('li').eq(0).find('div').removeClass("opacity_small");			
			f.find('li').bind('mouseover',function() {
				isPlay = false;
			});	
			f.find('li').bind('mouseout',function() {
				isPlay = true;
			});	
			b.find('li').bind('mouseover',function() {
				isPlay = false;
			});	
			b.find('li').bind('mouseout',function() {
				isPlay = true;
			});
			setTimeout(	d.autoplay,5000);			
		};
		this.autoplay = function (){
			if(isPlay){
				if(2 == indexNowplay){
				    indexNowplay = 0;
				}else{
					indexNowplay = indexNowplay+1;
				}
				var height = 53+110*(indexNowplay);
				document.getElementById("focus_img_list").style.left = "-"+600*(indexNowplay)+"px";
				document.getElementById("focus_pic_small").style.backgroundPosition = "0 "+height+"px";
				f.find('div').addClass("opacity_small");
				f.find('li').eq(indexNowplay).find('div').removeClass("opacity_small");
			}
			setTimeout(d.autoplay,5000);
	 	};
	 	
		this.leftnav = function (){//selected
			n.find('li').bind('mouseover',function() {
				n.find("[class=arealist]").css("display","none");
				n.find("[class=areatitle selected]").removeClass("selected");
				e(this).find("[class=arealist]").css("display","block");
				e(this).find("[class=areatitle]").addClass("selected");	
			});
			n.bind('mouseout',function() {
				n.find("[class=arealist]").css("display","none");
				n.find("[class=areatitle selected]").removeClass("selected");	
			});
		};
		this.dropmenu = function (){
			dm.find('li[name=dropmenu]').bind('mouseover',function() {
				dm.find('[class=titledaohan]').css("display","none");
				e("#"+e(this).attr("id")+"menu").css("display","block");
				e(this).addClass("selected");
			});
			dm.find('li[name=dropmenu]').bind('mouseout',function() {
				e("#"+e(this).attr("id")+"menu").css("display","none");
				e(this).removeClass("selected");
			});
		};
		
	}
	e(function () {
		e.fn.oldVal = e.fn.val;
		e.fn.val = function (C) {
			var D = this,
			H;
			if (C === undefined) return D[0] && (H = D[0].Butbu) ? H.getSource() : D.oldVal();
			return D.each(function () { (H = this.Butbu) ? H.setSource(C) : D.oldVal(C)
			})
		};		
	})
})(jQuery);