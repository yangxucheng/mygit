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

	function buying(tid) {
		
				$.ajax({  
					  url: "<c:url value='/admin/UpdateStatus'/>",  
					  type:'post',
					  dataType:'text',  
					  data:{  
					  	tid:tid
						},  
					success:function(data){  
						
						if(data=="售票中"){
							$("#buyend"+tid).html(data);
							$("#buying"+tid).val("停售");
							$("#buyend1"+tid).val("停售");
						}else if(data=="已停售"){
							$("#buyend"+tid).html("<font color='red'>"+data+"</font>");
							$("#buying"+tid).val("出售");
							$("#buyend1"+tid).val("出售");
						}
					}
				}); 
	}
	function GetTicketBySday_Eday() {
	window.location="GetTicketBySday_Eday?stardate="+$("#stardate").val()+"&enddate="+$("#enddate").val();
	}
</script>
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
					用户名:${userInfo.username}&gt; <span>票项管理</span> <a
						class="right-help" href="#">查看帮助>></a>
				</div>
				<div class="tab-mydamai">
					<ul class="title">
						<li><a href="UpdateTickets.jsp">票项修改</a></li>
						<li><a href="ticketdetail.jsp">详情修改</a></li>
						<li><a href="NewFile.jsp">票项增加</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">
							<div class="slect-info">
								<form action="<c:url value='/admin/SelectTicketShow.action' />"
									method="post">
									tid:&nbsp;<input type="number" name="tid" size="10"
										value='${param.tid}' />&nbsp;&nbsp; descs:&nbsp;<input
										type="text" name="descs" size="10" value='${param.descs}' />&nbsp;&nbsp;
									startTime:&nbsp;<input type="date" name="startTime"
										value='${param.startTime}' />&nbsp;&nbsp;&nbsp; endTime:&nbsp;<input
										type="date" name="endTime" value='${param.endTime}' />&nbsp;&nbsp;
									<input type="hidden" name="amount" value="100"> <input
										type="hidden" name="balance" value="100"> <input
										type="hidden" name="price" value="100"> <input
										type="hidden" name="status" value="0"> <input
										type="submit" value="查询" /><br /> <br /> <br />
								</form>
							</div>
							<table class="table03" id="listtitle">
								<thead>
									<tr>
										<td width="7.5%">票ID</td>
										<td width="16.5%">票名</td>
										<td width="12%">开始时间</td>
										<td width="10%">总票数</td>
										<td width="12%">剩余票数</td>
										<td width="8%">单价</td>
										<td width="11%">小图标路径</td>
										<td width="5%">交易状态</td>
										<td width="5%">操作</td>
									</tr>
								</thead>
							</table>

							<table border="1" cellspacing="0">

								<c:forEach items="${pageBean.recordList}" var="list1">
									<tr>
										<td width="8%">${list1.tid }<input type="hidden"
											name="tid" value="${list1.tid}">
										</td>

										<td width="16.5%">${list1.descs }</td>
										<td width="12%">${list1.startTime }</td>
										<td width="10%">${list1.amount }</td>
										<td width="12%">${list1.balance }</td>
										<td width="8%">${list1.price }</td>
										<td width="10%">${list1.images }</td>
										<c:if test="${list1.status==0 }">
											<td width="5%" id="buyend${list1.tid }"><font
												color="red">已停售</font></td>

											<td width="5%"><input type="button" value="售票"
												id="buying${list1.tid }" onclick="buying(${list1.tid })" />
												<input type="button" value="修改"
												onclick="updatebuy(${list1.tid })" /></td>
										</c:if>
										<c:if test="${list1.status==1 }">
											<td width="5%" id="buyend${list1.tid }">售票中</td>
											<td width="5%"><input type="button" value="停售"
												id="buyend1${list1.tid }" onclick="buying(${list1.tid })" />
												<input type="button" value="修改"
												onclick="updatebuy(${list1.tid })" /></td></c:if>

										
									</tr>
								</c:forEach>


							</table>
							<font size="4"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.currentPage-1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">上一页</a></font>&nbsp;
							<font size="4"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=1&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">首
									页</a></font>&nbsp; <font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+1}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+2}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+2}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+3}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+3}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+4}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+4}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+5}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+5}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+6}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+6}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+7}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+7}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+8}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+8}</a></font>&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+9}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+9}</a></font>&nbsp;&nbsp;&nbsp;
							<font size="3"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">总计：
									${pageBean.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp; <font size="4"><a
								href="SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.currentPage+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">下一页</a></font>

							<script type="text/javascript">
	function updatebuy(tid){
		window.location="AdminGetTicketById?tid="+tid;
	}
	function AddTicket(){
		window.location="AddTicket.jsp";
	}
</script>
</body>
</html>