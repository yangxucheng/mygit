<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<style>
 
.sdddq {
	font-family: "宋体";
	font-size: 20px;
	height: 30px;
	width: 150px;
	
	 
}
.lhj {
	font-family: "宋体";
	font-size: 60px;
	height: 100px;
	width: 300px;
	line-height: 100px;
	text-align: center;
	float:left;
}

.sssd {
	border-left-width: 1px;
	border-left-style: solid;
	border-left-color: #999;
	text-align: center;
}
.bgColor{
 	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr='#22000000', EndColorStr='#33FFFFFF'); 
	background-image: linear-gradient(to top, rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.2) 80%, rgba(0, 0, 0, 0.4) 100%, #FFFFFF 100%); 
}
.bgColor1{
 	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr='#22FFFFFF', EndColorStr='#33000000'); 
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.2) 80%, rgba(0, 0, 0, 0.4) 100%, #FFFFFF 100%); 
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4,img, ol, ul,p{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	background: transparent;
	}
ul {list-style: none;}
a {text-decoration: none;}
.clear{clear: both;}
:focus{outline:0}
body {
	
	font: 13px 'Microsoft YaHei', 寰蒋闆呴粦, Arial, Lucida Grande, Tahoma, sans-serif;
	color: #000;
	}
#wrapper {
	width: 980px;
	margin: 18px auto;
	line-height: 22px;
	}
a {
	color: #000;
	text-decoration: none;
	}
a:hover {
	color: #0196e3;
	text-decoration: none;
	}
a:active {
	}
ul.scroll {
	width: 15px;
	float: right;
	display:block;
	position:fixed;
	top:40%;
	right:0;
	_position:absolute;
	_margin-top:300px;
	_top:expression(eval(document.documentElement.scrollTop));
	z-index: 6;
	}
.sct {background: url(images/scroll.png);}
.scb {background: url(images/scroll.png) 0 40px;}
.scc {background: url(images/scroll.png) 0 80px;}
.scroll_t,.scroll_c,.scroll_b{
	width: 80px;
	height:40px;
	line-height:40px;
	text-align:center;
	cursor: pointer;
	border-radius: 20px 0 0 20px;
	}
.scroll_t{
	background: #d03f42;
	}
.scroll_b{
	background: #383838;
	}
.scroll_c{
	background: #467ebd;
	}
ul.scroll li {
	position: relative; 
	height:40px;
	float: right;
	}
ul.scroll li a{
	display: block;
	color:#fff;
	}
ul.scroll li div {
	display: none;
	position: absolute;
	top: 0;
	right: 0;
	}
</style>  
<html>
    <head>
        <meta charset="utf-8" />
        <title>adminfunction页面</title>
        <link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>">
        <link type="text/css" rel="stylesheet" href="<c:url value='/css/index.css'/>">
		<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>">
		 <link type="text/css" rel="stylesheet" href="<c:url value='/css/bottom.css'/>"/>
    </head>
    <body>
    
    <div id=background>
		<div>
		
		<IMG NAME="IMG1" src="<c:url value='/images/a4.PNG'/>"  HEIGHT="70">
		</div>
		<div id=menu>
		<ul>
		<li><a style="color:white"; href="<c:url value='/admin/NewFile.jsp'/>">票项管理 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        </ul>
        
		<ul>
		<li><a style="color:white"; href="<c:url value='/admin/ShowAllUser.action'/>">用户管理 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        </ul>
         
         <ul>
         <li><a href="<c:url value='/admin/ShowAllorder.action'/>"; style="color:white";>订单管理</a>

         </li>
         </ul>
         
         <ul>
         <li><a href="<c:url value='/admin/ticketdetail.jsp'/>"; style="color:white";>商品详情</a>
         </li>
         </ul>
         
         <ul>
         <li><a href="<c:url value='/admin/test.action'/>"; style="color:white";>&nbsp;&nbsp;退出账号</a>
         </li>
         </ul>
         
         <ul>
         <p>
         <li><a style="color:white;margin-left:440px;"></a>
         </li>
         </ul>
         
		</div>
	   </div>

	
        <div class="slideShow" style="margin-top:40px;'">
            <!--图片布局开始-->
            <ul>
               <li><a href="#"><img style="width:100%;height:800px"src="<c:url value='/images/111.jpg'/>"></a></li>
                <li><a href="#"><img src="<c:url value='/images/77.jpg'/>"></a></li>
                <li><a href="#"><img src="<c:url value='/images/88.jpg'/>"></a></li>
                <li><a href="#"><img src="<c:url value='/images/99.jpg'/>"></a></li>
               
            </ul>
            <!--图片布局结束-->
            
            <!--按钮布局开始-->
            <div class="showNav">
                <span class="active">1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
               
            </div>
            <!--按钮布局结束-->
        </div>
        
        <div id=menu2>
        <ul>
         <li><p><a href="#" ><img style="margin-top:8px;" alt="" src="<c:url value='/images/b1.PNG'/>"></a>
         </li>
         <li style="margin-top:8px;">打造您的专属影院</li>
         </ul>
         
         <ul>
         <li><a href="#" ><img style="margin-top:8px;" alt="" src="<c:url value='/images/b2.PNG'/>"></a>
         </li>
         <li style="margin-top:8px;">我的电影人生</li>
         </ul>
         
          <ul>
         <li><a href="<c:url value='/user/login.jsp'/>" ><img style="margin-top:8px;" alt="" src="<c:url value='/images/b3.PNG'/>"></a>
         </li>
         <li style="margin-top:8px;">登录&注册</li>
         </ul>
         
         <ul>
         <li><a href="#" ><img style="margin-top:8px;" alt="" src="<c:url value='/images/b4.PNG'/>"></a>
         </li>
         <li style="margin-top:8px;">附近影院</li>
         </ul>
         

         <a><img style="padding-top:20px;" alt="" src="<c:url value='/images/b5.PNG'/>"></a>

        
        </div>

       <div class="wrap">
       <div id="menu6">
    <ul > 
       <div id="menu5">
       <center>
        <li>
        <a href="#" ><img style="padding-top:20px;height:200px;width:180px;" alt="" src="<c:url value='/images/b6.jpg'/>"></a>
          <h1 >霸王别姬</h1>
          <p ><a href ="#">时间</a></p>
          <p >售票中</p>
          <form action="">
          <input type="hidden" name="tid" value="5"></input>
          <p><input type="number" name="number" value="" style="width:120px;"> </input><p>
           <p style="color:red";><input type="submit" value="加入购物清单"/></p>
          </form>
        </li>      
       </div>   
       <div id="menu5">
       <center>
        <li>
        <a href="#" ><img style="padding-top:20px;height:200px;width:180px;" alt="" src="<c:url value='/images/b10.jpg'/>"></a>
          <h1>重庆森林</h1>
          <p><a href ="#">时间</a></p>
          <p >售票中</p>
          <form action="">
          <input type="hidden" name="tid" value="5"></input>
          <p style="color:red;"><input type="submit" value="加入购物车"/></p>
           <p><input type="number" name="number" value="" style="width:120px"> </input><p>
          </p></form>
        </li>
        </div>
        <div id="menu5">
       <center>
        <li>
        <a href="#" ><img style="padding-top:20px;height:200px;width:180px;" alt="" src="<c:url value='/images/b8.jpg'/>"></a>
          <h1>大话西游</h1>
          <p><a href ="#">时间</a></p>
          <p>售票中</p>
          <form action="">
          <input type="hidden" name="tid" value="5"></input>
          <p style="color:red;"><input type="submit" value="加入购物车"/></p>
            <p><input type="number" name="number" value="" style="width:120px"> </input><p>
          </p></form>
        </li>
        </div>
        <div id="menu5">
       <center>
        <li>
        <a href="#" ><img style="padding-top:20px;height:200px;width:180px;" alt="" src="<c:url value='/images/b9.jpg'/>">
          <h1>历史教学</h1>
          <p><a href ="#">时间</a></p>
          <p>停售</p>
          <form action="">
          <input type="hidden" name="tid" value="5"></input>
          <p style="color:red;margin-left:120px;">
         </p></form>
        </li>  
        </div>
        <div id="menu5">
        <center>
        <li >
        <a href="#" ><img style="padding-top:20px;height:200px;width:180px;" alt="" src="<c:url value='/images/b11.jpg'/>">
          <h1>情书</h1>
          <p><a href ="#">时间</a></p>
          <p>售票中</p>
          <form action="">
          <input type="hidden" name="tid" value="5"></input>
          <p style="color:red;"><input type="submit" value="加入购物车"/></p>
           <p><input type="number" name="number" value="" style="width:120px"> </input><p>
          </form>
        </li>
        </div>
      </ul>
      </div>
      
       </div>
 
  <div >
   <a><img style="padding-top:300px;padding-left:200px;" alt="" src="<c:url value='/images/b5.PNG'/>"></a>
  </div>
  
    <body>



<div class="foot-w">
<div class="index-help-links clear tl" name="__indexhelplinkscleartl">
<div class="help-links-logo index-help-links-logo"><a name="__AD_yonglepiaowu" href="http://www.228.com.cn" target="_blank" rel="nofollow" title="永乐票务"></a><span class="f14 bold">"快乐生活 源自多彩永乐"</span></div>
<dl>
<dt> 新手指南 </dt>
<dd> <a href="" name="__AD_gplc.html" title="购票流程" rel="nofollow" target="_blank">购票流程</a> </dd>
<dd> <a href="" name="__AD_fpzd.htmll" title="发票说明" rel="nofollow" target="_blank">发票说明</a> </dd>
<dd> <a href="" name="__AD_ydsm.html" title="预订说明" rel="nofollow" target="_blank">预订说明</a> </dd>
<dd> <a href="" name="__AD_thjqhsm.html" title="退换及缺货说明" rel="nofollow" target="_blank">退换及缺货说明</a> </dd>
<dd> <a href="" name="__AD_idea.html" title="意见与建议" rel="nofollow" target="_blank">意见与建议</a> </dd>
</dl>
<dl>
<dt> 订票方式 </dt>
<dd> <a href="" name="__AD_dhdp.html" title="电话订票" rel="nofollow" target="_blank">电话订票</a> </dd>
<dd> <a href="" name="__AD_zxdp.html" title="在线订票" rel="nofollow" target="_blank">在线订票</a> </dd>
<dd> <a href="" name="__AD_smgp.html" title="上门购票" rel="nofollow" target="_blank">上门购票</a> </dd>
<dd> <a href="" name="__AD_yltg.html" title="大客户团购" rel="nofollow" target="_blank">大客户团购</a> </dd>
</dl>
<dl>
<dt> 配送说明 </dt>
<dd> <a href="" name="__AD_kdps.html" title="送货上门" rel="nofollow" target="_blank">送货上门</a> </dd>
<dd> <a href="" name="__AD_smzq.html" title="上门自取" rel="nofollow" target="_blank">上门自取</a> </dd>
<dd> <a href="" name="__AD_dzp.html" title="电子票" rel="nofollow" target="_blank">电子票</a> </dd>
<dd> <a href="" name="__AD_zzqpj.html" title="自助取票机" rel="nofollow" target="_blank">自助取票机</a> </dd>
</dl>
<dl>
<dt> 支付方式 </dt>
<dd> <a href="" name="__AD_zxzf.html" title="在线支付" rel="nofollow" target="_blank">在线支付</a> </dd>
<dd> <a href="" name="__AD_yhhk.html" title="银行汇款" rel="nofollow" target="_blank">银行汇款</a> </dd>
<dd> <a href="" name="__AD_hdfk2.html" title="货到付款" rel="nofollow" target="_blank">货到付款</a> </dd>
<dd> <a href="" name="__AD_smfk.html" title="上门付款" rel="nofollow" target="_blank">上门付款</a> </dd>
<dd> <a href="" name="__AD_ycpk.html" title="电子钱包" rel="nofollow" target="_blank">电子钱包</a> </dd>
</dl>
<dl>
<dt> 特色服务 </dt>
<dd> <a href="" name="__AD_pswy.html" title="票享无忧" rel="nofollow" target="_blank">票享无忧</a> </dd>
<dd> <a href="" name="__AD_zhyc.html" title="电子钱包" rel="nofollow" target="_blank">电子钱包</a> </dd>
<dd> <a href="" name="__AD_yltg.html" title="大客户团购" rel="nofollow" target="_blank">大客户团购</a> </dd>
<dd> <a href="" name="__AD_yllpk.html" title="永乐乐通卡" rel="nofollow" target="_blank">永乐乐通卡</a> </dd>
<dd> <a href="" name="__AD_jfdh.html" title="会员积分" rel="nofollow" target="_blank">会员积分</a> </dd>
<dd> <a href="" name="__AD_xfxq.html" title="先付先抢" rel="nofollow" target="_blank">先付先抢</a> </dd>
<dd> <a href="" name="__AD_yhq.html" title="现金券" rel="nofollow" target="_blank">现金券</a> </dd>
</dl>
</div>

<div class="company-info" name="__companyinfo">
<p class="mb15"> <a title="关于永乐" target="_blank" rel="nofollow" name="__AD_aboutgyyl.html" href="http://www.228.com.cn/about-gyyl.html">关于永乐</a><span>丨</span><a title="永乐大事记" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-yldsj.html">永乐大事记</a><span>丨</span><a title="品牌识别" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-ppsb.html">品牌识别</a><span>丨</span><a title="合作招商" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-hzzs.html">合作招商</a><span>丨</span><a title="服务协议" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-fwtk.html">服务协议</a><span>丨</span><a title="隐私声明" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-yssm.html">隐私声明</a><span>丨</span><a title="诚聘英才" target="_blank" rel="nofollow" href="http://www.228.com.cn/about-zpxx.html">招聘信息</a><span>丨</span><a title="联系我们" target="_blank" href="http://www.228.com.cn/about-lxwm.html" rel="nofollow">联系我们</a><span>丨</span><a title="友情链接" target="_blank" href="http://www.228.com.cn/about-yqlj.html" rel="nofollow">友情链接</a><span>丨</span><a title="网站地图" target="_blank" href="http://www.228.com.cn/about-wzdt.html">网站地图</a><span>丨</span><a title="官方微博" target="_blank" href="http://www.228.com.cn/weibo.html" rel="nofollow">官方微博</a><span>丨</span><a title="永乐文化集团" target="_blank" href="http://www.yles.cn/" rel="nofollow">永乐文化集团</a> </p>
</div>
<div class="copyright pb30" name="__copyrightpb30">
<p class="garya mb5">版权所有 <a title="永乐票务" class="c3" name="__AD_ylpw" href="http://www.228.com.cn/">永乐票务</a> Copyright©2003-2017 All Rights Reserved 北京春秋永乐文化传播股份有限公司</p>
<p class="garya">中国领先的演出门票预订综合性票务网站,为您提供各类演出门票网上订票服务。</p>
<p class="copyright-mintb mt10">
<a rel="nofollow" title="中国互联网诚信联盟" name="__AD_wangzhanxinyong" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1747516259" target="_blank" class="credit">中国互联网诚信联盟</a>
<a rel="nofollow" title="360绿色网站" name="__AD_lvsewangzhan" style="cursor: pointer;" class="green_web ml10">360绿色网站</a>
<a rel="nofollow" href="http://www.bjwhzf.gov.cn/accuse.do" title="北京12318文化市场举报热线" target="_blank"><img class="mr5 ml20 vm" src="http://static.228.com.cn/resources/images/report.png">北京12318文化市场举报热线</a>
<a rel="nofollow" href="http://static.228.com.cn/resources/images/footer/icp.jpg" title="京icp" target="_blank" style="cursor: pointer;" class="icp">京ICP证030942号</a>
<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010102000758" style="background:url(http://static.228.com.cn/resources/images/footer/record-icon.png) 0 5px no-repeat;  display: inline-block; padding-left: 25px; line-height:30px">京公网安备 11010102000758号</a>
</p>
<div class="copyright-mintb mt10">
<span id="kx_verify" title="ICP可信网站身份验证"></span><script type="text/javascript">(function (){var _kxs =document.createElement('script');_kxs.id ='kx_script';_kxs.async =true;_kxs.setAttribute('cid','kx_verify');_kxs.src =('https:' ==document.location.protocol ?'https://ss.knet.cn' :'http://rr.knet.cn')+'/static/js/icon3.js?sn=e130726110100417830nnm000000&tp=icon3';_kxs.setAttribute('size',2);var _kx =document.getElementById('kx_verify');_kx.parentNode.insertBefore(_kxs,_kx);})();</script>
<a rel="nofollow" id='___szfw_logo___' href='https://search.szfw.org/cert/l/CX20130327002366002888' title="诚信示范网站" target="_blank" style="margin-left:20px;margin-right:20px;"><img src="http://static.228.com.cn/resources/images/sincerity.png"></a>
<a rel="nofollow" key="5201f52024306332d3c50a76" title="安全联盟行业验证" logo_size="83x30" logo_type="business" href="http://www.anquan.org"><script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script></a>
<a class="ml20 mr20" title="不良信息举报中心" href="http://www.12377.cn/?spm=a21bo.7724922.1997523009.43.C0XyXH" target="_blank"><img src="http://static.228.com.cn/resources/images/bad-info.png"></a>
<a class="mr20" title="12321垃圾信息举报中心" href="http://www.12321.cn/" target="_blank"><img src="http://static.228.com.cn/resources/images/rub-info.png"></a>
<a target="_blank" title="IECMC电子信用验证" href="http://ec.eqixin.com/?sn=QX4000521029411441179664"><img width="79px" height="28px" src="http://ec.eqixin.com/images/blue4.png"></a>
<script type='text/javascript'>(function(){document.getElementById('___szfw_logo___').oncontextmenu =function(){return false;}})();</script>
</div>
</div>
</div>

<ul class="scroll">
  <li class="sct"> <a href="#">&nbsp;&nbsp;&nbsp;</a>
    <div><a class="scroll_t">返回顶部</a></div>
  </li>
  <li class="scb"> <a href="#">&nbsp;&nbsp;&nbsp;</a>
    <div><a class="scroll_b">转到底部</a></div>
  </li>
</ul>
</body>


    
	<script src='<c:url value="/js/jquery.min.js"/>'></script>
        <script src='<c:url value="/js/jquery-2.1.1.min.js"/>'></script>
        
        <script src='<c:url value="/js/jquery.layout-latest.js"/>'></script>
        <script src='<c:url value="/js/jquery.min.js"/>'></script>
        <script src='<c:url value="/js/indexjs.js"/>'></script>
        
        <script type="text/javascript">

        

        
        $(document).ready(function(){
        	 var slideShow=$(".slideShow"), //获取最外层框架的名称
        	 ul=slideShow.find("ul"), 
        	 showNumber=slideShow.find(".showNav span"),//获取按钮
        	 oneWidth=slideShow.find("ul li").eq(0).width(); //获取每个图片的宽度
        	 var timer=null; //定时器返回值，主要用于关闭定时器
        	 var iNow=0; //iNow为正在展示的图片索引值，当用户打开网页时首先显示第一张图，即索引值为0
        	 
        	 showNumber.on("click",function(){  //为每个按钮绑定一个点击事件 
        	  $(this).addClass("active").siblings().removeClass("active"); //按钮点击时为这个按钮添加高亮状态，并且将其他按钮高亮状态去掉
        	  var index=$(this).index(); //获取哪个按钮被点击，也就是找到被点击按钮的索引值
        	  iNow=index;
        	  ul.animate({
        	  "left":-oneWidth*iNow, //注意此处用到left属性，所以ul的样式里面需要设置position: relative; 让ul左移N个图片大小的宽度，N根据被点击的按钮索引值iNOWx确定
        	  })
        	 });
        	 
        	 timer=setInterval(function(){ //打开定时器
        	  iNow++;    //让图片的索引值次序加1，这样就可以实现顺序轮播图片
        	  if(iNow>showNumber.length-1){ //当到达最后一张图的时候，让iNow赋值为第一张图的索引值，轮播效果跳转到第一张图重新开始
        	  iNow=0;
        	  }
        	  showNumber.eq(iNow).trigger("click"); //模拟触发数字按钮的click
        	 },2500); //2500为轮播的时间
        	})

        
       
jQuery(document).ready(function($){
$('.scroll_t').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);}); 
$('.scroll_b').click(function(){$('html,body').animate({scrollTop: document.body.clientHeight+'px'}, 800);});
});

$(document).ready(function(){ 
    $("ul.scroll li").hover(function() {
        $(this).find("div").stop()
        .animate({right: "0", opacity:1}, "fast")
        .css("display","block")
    }, function() {
        $(this).find("div").stop()
        .animate({right: "0", opacity: 0}, "fast")
    });  
});
        
        </script>
        
        
    </body>
</html>

   




<!--  
 <form action="<c:url value='/admin/ShowAllorder.action'/>" method="post">
   <input type="submit" value="订单管理" style="background:url(images/button_t.png);width:124px;height:35px;"></br></br>
   </form>
   <form action="<c:url value='/admin/ShowAllUser.action'/>" method="post">
    <input type="submit" value="用户管理" style="background:url(images/button_t.png);width:124px;height:35px;"></br></br>
   </form>
   
    <a href="<c:url value='/admin/NewFile.jsp'/>">票项管理</a>&nbsp;&nbsp;&nbsp;
 
   <a href="<c:url value='/admin/ticketdetail.jsp'/>">商品详情</a>&nbsp;&nbsp;&nbsp;
   
    <a href="<c:url value='/admin/test.action'/>">登出</a>
    -->
   
