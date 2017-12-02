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
					用户名:${userInfo.username}&gt; <span>订单管理</span> <a
						class="right-help" href="#">查看帮助>></a>
				</div>
				<div class="tab-mydamai">
					<ul class="title">
						<li><a href="ShowAllOrder.jsp">订单管理</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">
							<div class="slect-info">
								<form action="<c:url value='/selectByname.action' />"
									method="post">
									订单号:&nbsp;<input type="number" name="number" size="10"
										value='${param.number}' />&nbsp;&nbsp; 
										姓名/用户名:&nbsp;<input
										type="text" name="name" size="10" value='${param.name}' />&nbsp;&nbsp;
										身份证号:&nbsp;<input
										type="text" name="idCard" size="10" value='${param.idCard}' />&nbsp;&nbsp;
										<input type="submit" value="查询" /><br /> <br /> <br />
										</form>
										<form action="<c:url value='/GetUserByTime.view' />"
									method="post">
									开始时间:&nbsp;<input type="date" name="startTime"
										value='${param.startTime}' />&nbsp;&nbsp;&nbsp; 
										结束时间:&nbsp;<input
										type="date" name="endTime" value='${param.endTime}' />&nbsp;&nbsp;
	
										<input type="submit" value="查询" /><br /> <br /> <br />
										
								</form>
								<form action="<c:url value='/admin/ShowAllorder.action'/>" method="post">
                                     <input type="submit" value="查询全部" ></br></br>
                                    </form>
							</div>
							<table class="table03" id="listtitle">
								<thead>
									<tr>
										<td width="7.5%">编号</td>
										<td width="16.5%">订单号</td>
										<td width="12%">订单内容</td>
										<td width="10%">成交时间</td>
										<td width="12%">金额（元）</td>
										<td width="8%">姓名</td>
										<td width="11%">用户名</td>
										<td width="18%">身份证号</td>
										
									</tr>
								</thead>
							</table>

							<table border="1" cellspacing="0">

								<c:forEach items="${list}" var="orders" varStatus="sta">
									<tr>
										<td width="7.5%">${sta.count}</td>
										<td width="16.5">${orders.oid }
										</td>

										<td width="12%">${orders.orderlist.descs}</td>
										<td width="10%">${orders.commitTime }</td>
										<td width="12%">${orders.orderlist.price}</td>
										<td width="8%">${orders.user.name }</td>
										<td width="11%">${orders.user.username }</td>
										<td width="18%">${orders.user.idCard }</td>

									</tr>
								</c:forEach>


							</table>
							

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


