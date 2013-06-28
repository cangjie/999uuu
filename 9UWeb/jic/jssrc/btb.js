var X = {}; 
X.hook = function() {
    var pre_init_str = 'x_init_hook_';
    for ( var h in window ) {
        if ( 0 != h.indexOf(pre_init_str) )
            continue;
        var func = window[h];
        if ( typeof func == 'function' ) {
            try { func(); }catch(e){}
        }       
    }
};

X.get = function(u) { return X.ajax(u, 'GET'); };
X.post = function(u) { return X.ajax(u, 'POST'); };
X.ajax = function(u, method) {
    jQuery.ajax({
        url: u,
        dataType: "json",
        success: X.json
    });
    return false;
};

X.json = function(r) {
    var type = r['data']['type'];
    var data = r['data']['data'];
    if ( type == 'alert' ) {
        alert(data);
    } else if ( type == 'eval' ) { 
        eval(data);
	} else if ( type == 'refresh') {
		window.location.reload();
    } else if ( type == 'updater' ) {
        var id = data['id'];
        var inner = data['html'];
        jQuery('#' + id).html(inner);
    } else if ( type == 'dialog' ) {
        X.boxShow(data, true);
    } else if ( type == 'mix' ) {
        for (var x in data) {
            r['data'] = data[x];
            X.json(r);
        }
    }
};

X.getXY = function() {
	var x,y;
	if(document.body.scrollTop){
		x = document.body.scrollLeft;
		y = document.body.scrollTop;		
	}
	else{
		x = document.documentElement.scrollLeft;
		y = document.documentElement.scrollTop;
	}
	return {x:x,y:y};
};

X.boxMask = function(display)
{
    var height = jQuery('body').height() + 'px';
    var width = jQuery(window).width() + 'px';
    jQuery('#pagemasker').css({'position':'absolute', 'z-index':'3000', 'width':width, 'height':height, 'filter':'alpha(opacity=0.5)', 'opacity':0.5, 'top':0, 'left':0, 'background':'#CCC', 'display':display});
	jQuery('#dialog').css('display', display);
};

X.boxShow = function(innerHTML, mask)
{
    var dialog = jQuery('#dialog');
    dialog.html(innerHTML);

    if (mask) { X.boxMask('block'); }	
    var ew = dialog.get(0).scrollWidth;
    var ww = jQuery(window).width();
    var lt = (ww/2 - ew/2) + 'px';
	var wh = jQuery(window).height();
	var xy = X.getXY();

	var tp = (wh*0.15 + xy.y) + 'px';

    dialog.css('background-color', '#FFF');
    dialog.css('left',lt);
    dialog.css('top', tp);
    dialog.css('z-index', 9999);
    dialog.css('display', 'block');	
	var dis_dialog = function () {//检查函数
		var adg = $("#ajax_dialog");		
		if(adg.height()){	
			var dh = adg.height();			
			var sch = X.getXY().y;
			var wh =  jQuery(window).height();
			var tp = (sch+(wh-dh)/4) + 'px';
			var ww = jQuery(window).width();
			var dw = adg.width();
			var lt = ((ww-dw)/2) + 'px';
			var dialog = jQuery('#dialog');
			dialog.css('left',lt);
			dialog.css('top',tp);
			dialog.css('z-index', 9999);
			dialog.css('display', 'block');
//			document.body.style.overflowY = "hidden";
		}
	};
	setTimeout(function(){dis_dialog();},10);

    return false;
};

X.boxClose = function()
{
    jQuery('#dialog').html('').css('z-index', -9999);
//	document.body.style.overflowY = "auto";
    X.boxMask('none');
    return false;
};

X.location = function(url){
    jQuery('#ifra_show').attr({src:url});
};

jQuery(document).ready(X.hook);

var WEB_ROOT = WEB_ROOT || '';
var LOGINUID = LOGINUID || 0;
window.x_init_hook_validator = function() {
	jQuery('form.validator').each(function(){jQuery.fn.checkForm(this);});
	jQuery('a.needlogin').click(X.misc.needlogin);
};
window.x_init_hook_dealimage = function() {
	jQuery('#deal-stuff img').each(function(){X.misc.scaleimage(this,640);});
	jQuery('div.sbox-content img, .side #side-business img').each(function(){X.misc.scaleimage(this,195);});
};
window.x_init_hook_click = function() {

	jQuery('#sysmsg-guide-close').click(function(){
		jQuery('#sysmsg-guide').remove();
		return !X.get( WEB_ROOT + '/ajax/newbie.php');
	});
	jQuery('#sysmsg-error span.close').click(function(){
		return !jQuery('#sysmsg-error').remove();
	});
	jQuery('#sysmsg-success span.close').click(function(){
		return !jQuery('#sysmsg-success').remove();
	});
	jQuery('#deal-share-im').click(function(){
		return !jQuery('#deal-share-im-c').toggle();
	});
	jQuery('a.ajaxlink').click(function() {
		if (jQuery(this).attr('no') == 'yes')
			return false;
		var link = jQuery(this).attr('href');
		var ask = jQuery(this).attr('ask');
		if (link.indexOf('/delete')>0 &&!confirm('确定删除本条记录吗？')) { 
			return false;
		} else if (ask && !confirm(ask)) {
			return false;
		}
		X.get(jQuery(this).attr('href'));
		return false;
    });
	jQuery('a.remove').click(function(){
		var u = jQuery(this).attr('href');
		if (confirm('确定删除该条记录吗？')){X.get(u);}
		return false;
	});
	jQuery('.remove-record').click(function(){
		return confirm('确定删除该条记录吗？');
	});

//	jQuery('#consult-add-more').click(X.team.consultation_again);
	jQuery('#mail-zone-div input').click(function(){
		var v = jQuery(this).attr('value');
		if ( v == 'smtp' ) {
			jQuery('#mail-zone-smtp').css('display', 'block');
		} else {
			jQuery('#mail-zone-smtp').css('display', 'none');
		}
	});
	jQuery('#share-copy-text').click(function(){jQuery(this).select();});
	jQuery('#share-copy-button').click(function(){
			X.misc.copyToCB('share-copy-text');
	});
	jQuery('#verify-coupon-id').click(function(){
		X.get( WEB_ROOT + '/ajax/coupon.php?action=dialog');
	});
	jQuery('#deal-subscribe-form').submit(function(){
		var v =jQuery('#deal-subscribe-form-email').attr('value');
		return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(v);
	});
	jQuery('#header-subscribe-form').submit(function(){
		var v =jQuery('#header-subscribe-email').attr('value');
		return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(v);
	});
	jQuery('input[xtip$="."]').each(X.misc.inputblur);
	jQuery('input[xtip$="."]').focus(X.misc.inputclick);
	jQuery('input[xtip$="."]').blur(X.misc.inputblur);
};

window.x_init_hook_imagerotate = function() {
	var imgListCurr = 0;
	var imgListCount = jQuery('#img_list a').size();
	if(imgListCount < 2) return;
	var imagesRun = function() { var imgListNext = imgListCurr + 1; if (imgListCurr == imgListCount - 1) imgListNext = 0; imagesPlay(imgListNext); imgListCurr++; if (imgListCurr > imgListCount - 1) { imgListCurr = 0; imgListNext = imgListCurr + 1; } };
	jQuery('#team_images').everyTime(3000, 'imagerotate', imagesRun);
	jQuery('#team_images li,#img_list a').hover(function(){ jQuery('#team_images').stopTime('imagerotate'); },function(){ jQuery('#team_images').everyTime(3000, 'imagerotate', imagesRun); }); 
	jQuery('#img_list a').click(function(){ var index = jQuery('#img_list a').index(this); if (imgListCurr != index){ imagesPlay(index); imgListCurr = index; }; return false; });
	var imagesPlay = function(next) { jQuery('#team_images li').eq(imgListCurr).css({'opacity':'0.5'}).animate({'left':'-440px','opacity':'1'},'slow',function(){ jQuery(this).css({'left':'440px' }); }).end().eq(next).animate({'left':'0px','opacity':'1'},'slow',function(){ jQuery('#img_list a').siblings('a').removeClass('active').end().eq(next).addClass('active'); }); };
};


window.x_init_hook_order = function() {
	jQuery('form[id="order-pay-form"]').bind('submit', function() {
		X.get( WEB_ROOT + '/ajax/order.php?action=dialog&id=' + jQuery(this).attr('sid'));
	});
};

/* X.misc Zone */
X.misc = {};
X.misc.copyToCB = function(tid) {
	var o = jQuery('#'+tid); o.select(); var maintext = o.val();
	if (window.clipboardData) {
		if ((window.clipboardData.setData("Text", maintext))) {
			var tip = o.attr('tip'); if ( tip ) alert(tip);
			return true;
		}
	}
	else if (window.netscape) {
		netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
		var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
		if (!clip) return;
		var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
		if (!trans) return;
		trans.addDataFlavor('text/unicode');
		var str = new Object();
		var len = new Object();
		var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
		var copytext=maintext;
		str.data=copytext;
		trans.setTransferData("text/unicode",str,copytext.length*2);
		var clipid=Components.interfaces.nsIClipboard;
		if (!clip) return false;
		clip.setData(trans,null,clipid.kGlobalClipboard);
		var tip = o.attr('tip'); if ( tip ) alert(tip);
		return true;
	}
	return false;
};
/* X.coupon */
X.coupon = {};
X.coupon.dialogquery = function() {
	var id = jQuery('#coupon-dialog-input-id').attr('value');
	if (id) return !X.get(WEB_ROOT + '/ajax/coupon.php?action=query&id='+encodeURIComponent(id));
};
X.coupon.dialogconsume = function() {
	var id = jQuery('#coupon-dialog-input-id').attr('value');
	var secret = jQuery('#coupon-dialog-input-secret').attr('value');
	if (id && secret) { 
		var ask = jQuery('#coupon-dialog-consume').attr('ask');
		return confirm(ask) && !X.get(WEB_ROOT + '/ajax/coupon.php?action=consume&id='+encodeURIComponent(id)+'&secret='+encodeURIComponent(secret)); 
	}
};
X.coupon.dialoginputkeyup = function(o) {jQuery(o).attr('value', jQuery(o).attr('value').toUpperCase())};

/* X.manage */
X.manage = {};
X.manage.loadtemplate = function(id) {
	window.location.href = WEB_ROOT + '/manage/system/template.php?id='+id;
};
X.manage.loadpage = function(id) {
	window.location.href = WEB_ROOT + '/manage/system/page.php?id='+id;
};
X.manage.usermoney = function() {
	var money = parseInt(jQuery('#user-dialog-input-id').attr('value'));
	var uid = jQuery('#user-dialog-input-id').attr('uid');
	var ask = jQuery('#user-dialog-input-id').attr('ask');
	if (uid&&money&&(!ask||confirm(ask))) return !X.get(WEB_ROOT + '/ajax/manage.php?action=usermoney&id='+uid+'&money='+encodeURIComponent(money));
};
X.manage.orderexpress = function() {
	var eid = parseInt(jQuery('#order-dialog-select-id').val());
	var nid = jQuery('#order-dialog-input-id').attr('value');
	var oid = jQuery('#dialog-order-id').attr('oid');
	if(oid) return !X.get(WEB_ROOT + '/ajax/manage.php?action=orderexpress&id='+oid+'&eid='+eid+'&nid='+encodeURIComponent(nid));
};
X.manage.orderrefund = function() {
	var rid = jQuery('#order-dialog-refund-id').val();
	var oid = jQuery('#dialog-order-id').attr('oid');
	if(oid&&rid) return !X.get(WEB_ROOT + '/ajax/manage.php?action=orderrefund&id='+oid+'&rid='+rid);
};
X.manage.teamcoupon = function(tid) {
	return !X.get(WEB_ROOT + '/ajax/manage.php?action=teamcoupon&id='+tid);
};
/* X.miscajax */
X.miscajax = function(script, action) {
	return !X.get(WEB_ROOT + '/ajax/'+script+'.php?action='+action);
};
