<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>账号充值</title>
       
         <link type="text/css" rel="stylesheet" href="css/layout1.css"  />
        <link type="text/css" rel="stylesheet" href="css/index1.css">
		<link type="text/css" rel="stylesheet" href="css/common1.css">
		 <link type="text/css" rel="stylesheet" href="css/button.css"  />
      
    </head>
       
    
    
  
        <body>
<div class="main">
		<div class="sidenav">
			<div id="mydamai" style="">
				<h3>
					<a href="<c:url value='/index.jsp'/>">回到首页</a>
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
					<div class="right-main">
				<div class="breadcrumb">

				</div>
				<div class="tab-mydamai">
					<ul class="title">
						<li><a href="ShowAllUser.jsp">用户管理</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">
							<div class="slect-info">

	
	                       <a href="<c:url value='index.jsp'/>">返回主页面</a>
							</div>
							<table class="table03" id="listtitle">
								<thead>
									<tr>
	                         
                                   <td width="100%"><font color="red">充值成功！</font></td>

                                   <td width="100%">
	                               <td width="100%">用户名：${session_user.username}	 &nbsp;&nbsp;&nbsp;&nbsp;</td>
	                               <td width="100%"> 充值方式：${type }	&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                               <td width="100%"> 充值金额：${money}	&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                              
	                               <td width="100%">  账户余额：${session_user.balance }</td>
  
									</tr>
								</thead>
							</table>

							<table border="1" cellspacing="0">

								<c:forEach items="${userList}" var="user" >
									<tr>

									</tr>
								</c:forEach>


							</table></div></div></div></div>

         

</body>
      
</html>


