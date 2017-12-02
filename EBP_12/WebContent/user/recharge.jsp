<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>账号充值</title>
       
         <link type="text/css" rel="stylesheet" href="../css/layout1.css"  />
        <link type="text/css" rel="stylesheet" href="../css/index1.css">
		<link type="text/css" rel="stylesheet" href="../css/common1.css">
		 <link type="text/css" rel="stylesheet" href="../css/button.css"  />
		
      
    </head>




 <body>

<c:url var="url" value="/user/recharge.action" scope="request" />
<form:form modelAttribute="rechargeBean" action="${url}" method="post">
<jsp:useBean id="rechargeBean" scope="request"
	class="com.oracle.ebp.domain.RechargeBean" />
	
	


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
	  
	<p>
		<font  color='red' size="-1"><i><form:errors /></i></font>
	</p>
	<div class="right">
	<table>
	</br></br></br>
	<div class="warn">月末、月初充值高峰时段，用户较多，到账时间会有一定的延迟；如果长时间未到账，请提供手机服务密码与客服联系查询!</div>
	用户名：${userInfo.username}	</br></br></br>
	充值方式：
	<select name="type" class='button blue'>
		<option value="空中充值">空中充值</option>
		<option value="支付宝">支付宝</option>
		<option value="微信">微信</option>
		<option value="储蓄卡">储蓄卡</option>
	</select>
	<br/><br/><br/>
	
	<div class="recharge_pay">

					</div>
	
		<tr>
			<td>充值金额:<form:input path="ammount" /><br />
			<br /></td>
			<td><font color='red' size="-1"> <i>
			
			
			<form:errors path="ammount" /></i>
			</font><br />
			<br /></td>
		</tr>
		
		
	</table>
	<input class='button blue' type='submit' value='立即充值' />
	</div>
</form:form>
</body>
</html>
