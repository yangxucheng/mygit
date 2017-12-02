<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/ticket.css" rel="stylesheet" type="text/css"></link>
</head>
<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
	function statechange(data) {
		$("#ajaxselectOrder").html(data);

	}
</script>
<link rel="stylesheet" href="<c:url value='/css/order.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/revise.css'/>" />
<body>
	<div id="ajaxselectOrder">
		<div class="main">
			<div class="sidenav">
				<div id="mydamai" style="">
					<h3>
						<a href="<c:url value='/admin/adminfunction.jsp'/>">回到首页</a>
					</h3>
					<dl>
						<dt>交易中心</dt>
						<dd>
							<a href="<c:url value='/admin/UpdateTickets.jsp'/>"
								id="nav_Order" class="" title="订单管理" domain=""> <span>票项管理</span>
							</a>
						</dd>
						<dd>
							<a href="#" id="nav_myEwallet" class="" title="电子钱包 /超级票"
								domain=""> <span>用户管理</span>
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
							<a href="#" id="nav_MyInfo" class="" title="个人信息" domain="">
								<span>个人信息</span>
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
					<span>票项管理</span> <a class="right-help" href="#">查看帮助>></a>
				</div>
				<div class="tab-mydamai">
					<ul class="title">
						<li><a href="UpdateTickets.jsp">票项修改</a></li>
						<li><a href="ticketdetail.jsp">详情修改</a></li>
						<li><a href="NewFile.jsp">票项增加</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">

						<p>
								<font color='red'>${errors['GLOBAL']}</font>
							

							<br />

							<form action="UpdateTicketTicketDetailId" method="post"
								id="form1">
								<input type="hidden" name="tId" value="${ticketdetail.tId }" /><br />
								<br /> 描述：<input type="text" name="descs"
									value="${ticketdetail.descs }" /><br /> <br /> 图片路径：<input
									type="text" name="images" value="${ticketdetail.images }" /><br />
								<br /> 信息顺序：<input type="text" name="sequence"
									value="${ticketdetail.sequence }" /><br /> <br /> <input
									type="button" value="修改" onclick="register()" /> <input
									type="reset" />
							</form>
</body>
<script type="text/javascript">
	function register() {
		var form1 = document.getElementById("form1");
		form1.submit();
	}
</script>
</html>