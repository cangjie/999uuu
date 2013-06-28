/* Left Nav */

$(document).ready(function () {
	$("div.arealist").hide();
	$("div.area li").hover(function(){
		$(this).children("div.arealist").show();
		$(this).children("div.areatitle").addClass("selected"); 
		$(this).addClass("z999"); 
		},function(){
		$(this).children("div.arealist").hide();
		$(this).children("div.areatitle").removeClass("selected"); 
		$(this).removeClass("z999"); 
	})
})

/* Tabs */

jQuery(function() {

jQuery('div.navbg1>div.hotlinenav>ul>li').mouseover(function() { TabSelect(".navbg1>div.hotlinenav>ul>li", "div.navbg1>div.hotlinelistwrap>div.hotlinelist", "selected", jQuery(this)) });
jQuery('div.navbg1>div.hotlinenav>ul>li').eq(0).trigger("mouseover");

jQuery('div.navbg2>div.hotlinenav>ul>li').mouseover(function() { TabSelect(".navbg2>div.hotlinenav>ul>li", "div.navbg2>div.hotlinelistwrap>div.hotlinelist", "selected", jQuery(this)) });
jQuery('div.navbg2>div.hotlinenav>ul>li').eq(0).trigger("mouseover");

jQuery('div.area1>div.rightlinetop>div.rightlinenav>ul>li').mouseover(function() { TabSelect("div.area1>div.rightlinetop>div.rightlinenav>ul>li", "div.area1>div.rightlinewrap>div.linemiddle>div.linelist", "selected", jQuery(this)) });
jQuery('div.area1>div.rightlinetop>div.rightlinenav>ul>li').eq(0).trigger("mouseover");

jQuery('div.area2>div.rightlinetop>div.rightlinenav>ul>li').mouseover(function() { TabSelect("div.area2>div.rightlinetop>div.rightlinenav>ul>li", "div.area2>div.rightlinewrap>div.linemiddle>div.linelist", "selected", jQuery(this)) });
jQuery('div.area2>div.rightlinetop>div.rightlinenav>ul>li').eq(0).trigger("mouseover");

jQuery('div.area3>div.rightlinetop>div.rightlinenav>ul>li').mouseover(function() { TabSelect("div.area3>div.rightlinetop>div.rightlinenav>ul>li", "div.area3>div.rightlinewrap>div.linemiddle>div.linelist", "selected", jQuery(this)) });
jQuery('div.area3>div.rightlinetop>div.rightlinenav>ul>li').eq(0).trigger("mouseover");

jQuery('div.daycommend1>div.daycommendnav>ul>li').mouseover(function() { TabSelect("div.daycommend1>div.daycommendnav>ul>li", "div.daycommend1>div.daycommendlistall>div.daycommendlist", "selected", jQuery(this)) });
jQuery('div.daycommend1>div.daycommendnav>ul>li').eq(0).trigger("mouseover");

jQuery('div.daycommend2>div.daycommendnav>ul>li').mouseover(function() { TabSelect("div.daycommend2>div.daycommendnav>ul>li", "div.daycommend2>div.daycommendlistall>div.daycommendlist", "selected", jQuery(this)) });
jQuery('div.daycommend2>div.daycommendnav>ul>li').eq(0).trigger("mouseover");

jQuery('div.daycommend3>div.daycommendnav>ul>li').mouseover(function() { TabSelect("div.daycommend3>div.daycommendnav>ul>li", "div.daycommend3>div.daycommendlistall>div.daycommendlist", "selected", jQuery(this)) });
jQuery('div.daycommend3>div.daycommendnav>ul>li').eq(0).trigger("mouseover");

jQuery('div.rightcommend>div.rightcommendnav>ul>li').mouseover(function() { TabSelect("div.rightcommend>div.rightcommendnav>ul>li", "div.rightcommend>div.rightcommendlistall>div.rightcommendlist", "selected", jQuery(this)) });
jQuery('div.rightcommend>div.rightcommendnav>ul>li').eq(0).trigger("mouseover");

});

//tab function
function TabSelect(tab,con,addClass,obj) {
    var jQuery_self = obj;
    var jQuery_nav = jQuery(tab);

    jQuery_nav.removeClass(addClass),
	jQuery_self.addClass(addClass);

    var jQuery_index = jQuery_nav.index(jQuery_self);
    var jQuery_con = jQuery(con);
    jQuery_con.hide(),
	jQuery_con.eq(jQuery_index).show();
}


/* Promotion */

$(document).ready(function(){

	$("#promotionlist ul li").eq(0).css({"background":"url(images/focus_on.gif)","cursor":"pointer"});//页面载入后默认第一幅图的样式
	/*
	*鼠标交互相关
	*/	
	$("#promotionlist ul li").each(function(i){
		$(this).hover(
			function(){
				c = i;    //将定时器指向当前鼠标移动到的元素上
				$(this).css({"background":"url(images/focus_on.gif)","cursor":"pointer"});
				$("#promotionlist ul li").each(function(k){
					if(k!=i){
						$(this).css({"background":"url(images/focus_off.gif)"});
					}
				});
				$(".promotiondetail").each(
					function(j){
						if(j!=i){
							$(this).hide();
						}else{
							$(this).show();
						}
					}
				);
			},function(){
			}
		);
	});
});


$(document).ready(function () {

	$("div.destinationnavlist").hide();
	$("div.destinationnavlist:first").show();
	
	$('div.destinationnavlistall li').hover(function () {
		$('div.destinationnavlist').hide();
		$(this).children("div.destinationnavlist").show();
	});

});   

/* home dadugundong */
 function runImg(){}
 runImg.prototype={
  bigbox:null,//最外层容器
  boxul:null,//子容器ul
  imglist:null,//子容器img
  numlist:null,//子容器countNum
  prov:0,//上次显示项
  index:0,//当前显示项
  timer:null,//控制图片转变效果
  play:null,//控制自动播放
  imgurl:[],//存放图片
  count:0,//存放的个数
  $:function(obj)
  {
   if(typeof(obj)=="string")
   {
    if(obj.indexOf("#")>=0)
    {
     obj=obj.replace("#","");
     if(document.getElementById(obj))
     {
      return document.getElementById(obj);
     }
     else
     {
      //alert("没有容器"+obj);
      return null;
     } 
    }
    else
    {
     return document.createElement(obj);
    }
   }
   else
   {
    return obj;
   }
  },
  //初始化
  info:function(id)
  {
   this.count=this.count<=5?this.count:5;
   this.bigbox=this.$(id);
   for(var i=0;i<2;i++)
   {
    var ul=this.$("ul");
    for(var j=1;j<=this.count;j++)
    {
     var li=this.$("li");
     li.innerHTML=i==0?this.imgurl[j-1]:j;
     ul.appendChild(li);
    }
    this.bigbox.appendChild(ul);
   }
   this.boxul=this.bigbox.getElementsByTagName("ul");
   this.boxul[0].className="imgList";
   this.boxul[1].className="countNum";
   this.imglist=this.boxul[0].getElementsByTagName("li");
   this.numlist=this.boxul[1].getElementsByTagName("li");
   for(var j=0;j<this.imglist.length;j++)
   {
    this.alpha(j,0);
   }
   this.alpha(0,100);
   this.numlist[0].className="current";
  },
  //封装程序入口
  action:function(id)
  {
   this.autoplay();
   this.mouseoverout(this.bigbox,this.numlist);
  },
  //图片切换效果
  imgshow:function(num,numlist,imglist)
  {
   this.index=num;
   var pralpha=100;
   var inalpha=0;
   for(var i=0;i<numlist.length;i++)
   {
    numlist[i].className="";
   }
   numlist[this.index].className="current";
   clearInterval(this.timer);
                        for(var j=0;j<this.imglist.length;j++)
          {
           this.alpha(j,0);
          }
   this.alpha(this.prov,100);
   this.alpha(this.index,0);
   var $this=this;
   //利用透明度来实现切换图片
   this.timer=setInterval(function(){
    inalpha+=2;
    pralpha-=2;
    if(inalpha>100){inalpha=100};//不能大于100
    if(pralpha<0){pralpha=100};
    //为兼容性赋样式
    $this.alpha($this.prov,pralpha);
    $this.alpha($this.index,inalpha);
    if(inalpha==100&&pralpha==0){clearInterval($this.timer)};//当等于100的时候就切换完成了
   },20)//经测试20是我认为最合适的值
  },
  //设置透明度
  alpha:function(i,opacity){
   this.imglist[i].style.opacity=opacity/100;
   this.imglist[i].style.filter="alpha(opacity="+opacity+")";
  },
  //自动播放
  autoplay:function(){
   var $this=this;
   this.play=setInterval(function(){
    $this.prov=$this.index;
    $this.index++;
    if($this.index>$this.imglist.length-1){$this.index=0};
    $this.imgshow($this.index,$this.numlist,$this.imglist);
    },2000)
  },
  //处理鼠标事件
  mouseoverout:function(box,numlist)
  {
   var $this=this;
   box.onmouseover=function()
   {
    clearInterval($this.play);
   }
   box.onmouseout=function()
   {
    $this.autoplay($this.index);
   }
   for(var i=0;i<numlist.length;i++)
   {
    numlist[i].index=i;
    numlist[i].onmouseover=function(){
     $this.prov=$this.index;
     $this.imgshow(this.index,$this.numlist,$this.imglist);
    }
   }
  }
 }
