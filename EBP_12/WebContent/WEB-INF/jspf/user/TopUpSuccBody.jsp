<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>账号充值</title>
       
         <link type="text/css" rel="stylesheet" href="/css/layout1.css"  />
        <link type="text/css" rel="stylesheet" href="/css/index1.css">
		<link type="text/css" rel="stylesheet" href="/css/common1.css">
		 <link type="text/css" rel="stylesheet" href="/css/button.css"  />
      
    </head>
       
    
    
  
        <body>
<div class="main">
		<div class="sidenav">
			<div id="mydamai" style="">
				<h3>
					<a href="#">个人相关业务</a>
			     	</h3>
				<dl>
					<dt>交易中心</dt>
					<dd>
						<a href="<c:url value='/pageselect.action'/>" id="nav_Order"
							class="" title="订单管理" domain=""> <span>订单管理</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_myEwallet" class="" title="电子钱包 /超级票"
							domain=""> <span>电子钱包 /超级票</span>
						</a>
					</dd>

					<dd>
						<a href="#" id="nav_myCoupon" class="" title="我的优惠券" domain="">
							<span>我的优惠券</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyIntegral" class="" title="我的积分" domain="">
							<span>我的积分</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_OutStockReco" class="" title="缺货登记" domain="">
							<span>缺货登记</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_Orderbook" class="" title="预定登记" domain="">
							<span>预定登记</span>
						</a>
					</dd>
				</dl>
				<dl>
					<dt>互动中心</dt>
					<dd>
						<a href="#" id="nav_MessCenter" class="" title="站内消息" domain="">
							<span>站内消息</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyComment" class="" title="我的评论" domain="">
							<span>我的评论</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyQuestion" class="" title="我的提问" domain="">
							<span>我的提问</span>
						</a>
					</dd>
				</dl>
				<dl>
					<dt>账户中心</dt>
					<dd>
						<a href="#" id="nav_MyAddress" class="" title="收货地址" domain="">
							<span>收货地址</span>
						</a>
					</dd>

					<dd>
						<a href="#" id="nav_AccountSafty" class="" title="账号设置" domain="">
							<span>账号设置</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_SecurityCenter" class="" title="安全中心"
							domain=""> <span>安全中心</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyInfo" class="" title="个人信息" domain=""> <span>个人信息</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MySubscribe" class="" title="我的订阅" domain="">
							<span>我的订阅</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MySubscribe" class="" title="常用观演人" domain="">
							<span>常用观演人</span>
						</a>
					</dd>
				</dl>
			</div>
		</div>
	
	 <div id="login">
		<div>
			<div class="login_r">
			Hi,欢迎来到永乐票务 ！	
			<a href="login.html">登录</a>丨<a href="zhuce.html">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="#">热线电话：123-456-789</a>
			</div>
		</div>
	</div>
	<div id="navgin">
		<div class="navgin_left">
			<div>
				<img src="img/1.jpg" alt="">
			</div>
			<div>
				<a href="#">商品分类</a>
			</div>
		</div>
		<div class="navgin_right">
			<div class="search">
			
				<input type="text" value="变形金刚5"
					onblur="if(this.value == '')this.value='变形金刚5';"
					onclick="if(this.value == '变形金刚5')this.value='';">
					<input type="button" value="搜 索">
				<p>
					热门：<a href="#">摔跤吧！爸爸&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						  <a href="#">异形：契约&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						  <a href="#">大话西游&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						  <a href="#">海洋奇缘&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						  <a href="#">逆时营救&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						  <a href="#">仙球大战&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						   更多
				</p>
				
				
			</div>
			
			<div class="nav">
				<a href="#">首页</a> <a href="#">电影</a> <a href="#">戏剧</a> <a
					href="#">舞蹈古典</a> <a href="#">戏曲综艺</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="#">演唱会</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">国家大剧院</a>
			</div>
			
		</div>
		
	</div>
	





<div class="myDiv">
<h1><font color="red">充值成功！</font></h1>
<br/><br/><br/>

<b>本次充值信息如下：</b><br/><br/>
	用户名：${session_user.username}	 &nbsp;&nbsp;&nbsp;&nbsp;
	充值方式：${type }	&nbsp;&nbsp;&nbsp;&nbsp;
	充值金额：${money}	&nbsp;&nbsp;&nbsp;&nbsp;
	<br/><br/><br/>
	账户余额：${session_user.balance }
	
	<a href="<c:url value='index.jsp'/>">返回主页面</a>
	

</div>           

</body>
      
</html>