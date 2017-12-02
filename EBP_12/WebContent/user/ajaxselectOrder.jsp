<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<c:url value='/js/jquery-1.6.2.min.js'/>"></script>
<script type="text/javascript">
function listRequest(){
	var oid = $("#oid").val();
	var r = window.confirm("确定删除吗？");
	if(r){
		var param="oid="+oid+"&currentPage="+${pageBean.currentPage}+"&pageSize="+${pageBean.pageSize}+"&recordCount="+${pageBean.recordCount};
	}else{
		var param = "oid=-1";
	}
	
	$.ajax({
		type:"get",
		async:true,
		url:"<c:url value='/deleteOrder.action'/>",
		dataType:"text",
		data:param,
		cache:false,
		success:statechange
	});
}
	function statechange(data) {
		$("#ajaxselectOrder").html(data);
		
	}
</script>
<link rel="stylesheet" href="<c:url value='/css/order.css'/>"/>
<link rel="stylesheet" href="<c:url value='/css/revise.css'/>"/>
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
							<span>我的购物车</span>
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
						<a href="user/revise.jsp" id="nav_MyInfo" class="" title="个人信息" domain=""> <span>个人信息</span>
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
	用户名:${userInfo.username}&gt; <span>我的订单</span>
	<a class="right-help" href="#">查看帮助>></a></div>
<div class="tab-mydamai">
	<ul class="title">
					<li><a class="on" href="#">我的订单</a></li>
					<li><a href="#">积分兑换</a></li>
					<li><a href="#">电影票订单</a></li>
					<li><a href="#" style="width:100px;">合作商户订单</a></li>
				</ul>
	<div class="c-n index-table01">
	<div class="table-top">
		<div class="slect-info">
			<select id="status" class="sel-1" name="status" style="width:95px">
			<option value="0">全部订单</option>
			<option value="1">已受理</option>
			<option value="2">待支付</option>
			<option value="3">完成</option>
			</select>
			<select id="time" class="sel-2" name="time">
				<option value="0">近三个月订单</option>
				<option value="1">近一年订单</option>
				<option value="2">一年前历史订单</option>
			</select>
			<div class="fr">
			<input type="text" id="key" class="t" name="key" value="商品名称、商品编号、订单编号" placeholder="true">
			<button id="keybtn" class="btn07">查询</button>
			</div>
		</div>
		<table  class="table03" id="listtitle" >
 	<thead>
 	<tr>
 		<th class="w6">项目名称</th>
 		<th class="w6">票价</th>
 		<th class="w13">数量</th>
 		<th class="w7">售后</th>
 		<th class="w7">订单金额</th>
 		<th class="w4">交易状态</th>
 		<th class="w6">操作</th>
 	</tr>
 	</thead>
 </table>
	</div>
	
	<c:if test="${not empty pageBean}" var="bool">
	<c:forEach items="${pageBean.recordList}" var="order">
	<form action="<c:url value='/showdetails.action'/>" id="form_combined" method="post" target="_blank">
		
		<div id="list" class="table-list01">
		<div id="list-box">
		<table class="table03" width="100%" border="0">
			<thead>
				<tr>
					<th class="tl" colspan="7">
						<span>订单号:${order.oid}&nbsp;&nbsp;&nbsp;&nbsp;</span> 
						<span class="m130">成交时间:${order.commitTime}</span>
					</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td class="w6">
					<div class="i-name">
						<a href="#">${order.orderlist.descs}</a>
					</div>
				</td>
			<td class="w6 tc" title="票价">
				${order.orderlist.price}
				<span class="c4"></span>
			</td>
			<td class="w13">${order.orderlist.quantity}</td>
			<td class="w7">合肥分部<br>
			<span style="color:#2f97b4;cursor:pointer;">在线客服</span>
			</td>
				<td class="w7">
					${order.amount}
				</td>
				<td class="w4">
				<span class="c4">
				<span class="c4"><a href="#" onclick="listRequest()">交易取消</a></span>
				</span>
				<br>
				<input type="hidden" value="${order.oid}" name="oid" id="oid" class="c4">

				<input type="submit" value="订单详情"/>
				<br>
				</td>
				<td class="w6"></td>
			</tr>
			</tbody>
		</table>
		</div>
		</div>
	</form>
	</c:forEach>
	</c:if>
	</div>
	</div>
	<c:if test="${not empty pageBean.recordList}" var="bool">
 		<div class="page">
<font size="5"><a href="pageselect.action?currentPage=1&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">首 页</a></font>&nbsp;
<font size="4"><a href="pageselect.action?currentPage=${pageBean.currentPage-1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">上一页</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+1}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+2}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+2}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+3}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+3}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+4}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+4}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+5}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+5}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+6}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+6}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+7}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+7}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+8}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+8}</a></font>&nbsp;
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.beginPageIndex+9}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+9}</a></font>&nbsp;&nbsp;&nbsp;
		<font size="4"><a href="pageselect.action?currentPage=${pageBean.currentPage+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">下一页</a></font>
		<font size="3"><a href="pageselect.action?currentPage=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">总计： ${pageBean.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp;
</div>
</c:if>
<c:if test="${!bool}">
<p class="c4">您还没有任何订单，再去商城逛逛吧！</p>
</c:if>
 
</div>

</div>
	
</div>

</body>
</html>