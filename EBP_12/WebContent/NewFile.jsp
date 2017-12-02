<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<base href="<%=basePath%>">

<title>登录示例页面</title>
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
						<a href="<c:url value='/index.jsp'/>">回到首页</a>
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
						<li><a href="admin/UpdateTickets.jsp">票项修改</a></li>
						<li><a href="admin/ticketdetail.jsp">详情修改</a></li>
						<li><a href="admin/NewFile.jsp">票项增加</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">



							<p>
								<font color='red'>${errors['GLOBAL']}</font>
							</p>

							<br />
							<form action="<c:url value='/admin/AddTicket.action' />"
								method="post">
								电影名称：<input type='text' name='descs' required="true"
									value='${param.descs}' /><br /> <br /> 总票数：<input
									type="number" name='amount' required="true"
									value='${param.amount}' /><br /> <br /> 剩余票数：<input
									type="number" name='balance' required="true"
									value='${param.balance}' /><br /> <br /> 单价（元）：<input
									type="number" name='price' required="true" value='${param.price}' /><br />
								<br /> 开始时间：<input type='date' name='startTime' required="true"
									value='${param.startTime}' /><br /> <br /> 状态：<input
									type=radio name=status value="0">禁售 <input type=radio
									name=status value="1">销售<br /> <br /> 小图标路径：<input
									type='text' name='Images' required="true"
									value='${param.Images}' /><br /> <br /> 相关描述：<input
									type='text' name='Descs2' required="true"
									value='${param.Descs2}' /><br /> <br /> 图片描述路径：<input
									type='text' name='images2' required="true"
									value='${param.images2}' /><br /> <br /> 描述的顺序：<input
									type='text' name='sequence' required="true"
									value='${param.sequence}' /><br /> <br /> <input
									type="submit" value="提交"> <br /> <br />
							</form>




							<form action="<c:url value='/admin/update.action' />"
								method="post" enctype="multipart/form-data">
								选择文件:<input type="file" name="file"> <input
									type="submit" value="提交">
							</form>
</body>
</html>
