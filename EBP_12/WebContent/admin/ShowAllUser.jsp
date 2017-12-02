<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function buying(uid) {
		var status=1;
		if($("#buying"+uid).val()=="禁用"){
			status=0;
		}
		/* alert($("#buying"+uid).val()+"======"+$("#buyend"+uid).val()); */
		
		$.ajax({  
			  url: "updateUserStatusById.view",  
			  type:'post',
			  dataType:'text',  
			  data:{  
				  uid:uid,
				  status:status
			},  
			success:function(data){  
				$("#statustd"+uid).text(status);
				var d=status
				if(d==1)
				alert("该用户已被启用");
				else
					alert("该用户已被禁用")
				if (d=="1") {
					$("#buyend"+uid).val("禁用");
					$("#buying"+uid).val("禁用");
				}
				
				if (d=="0") {
					$("#buying"+uid).val("启用");
					$("#buyend"+uid).val("启用");
				}
			}
		}); 
	}

		function statechange(data) {
			$("#ajaxselectOrder").html(data);
			
		}
	</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>

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
					用户名:${userInfo.username}&gt; <span>用户管理</span> <a
						class="right-help" href="#">查看帮助>></a>
				</div>
				<div class="tab-mydamai">
					<ul class="title">
						<li><a href="ShowAllUser.jsp">用户管理</a></li>
					</ul>
					<div class="c-n index-table01">
						<div class="table-top">
							<div class="slect-info">
								<form action="<c:url value='/GetUserBynuit.view' />"
									method="post">
									姓名/用户名:&nbsp;<input type="text" id="sname" name="name" size="10"
										value='${param.name}' />&nbsp;&nbsp; 
										身份证号：:&nbsp;<input
										type="text" name="idCard" id="sidCard" size="10" value='${param.idCard}' />&nbsp;&nbsp;
										联系电话:&nbsp;<input
										type="text" name="telno" id="stelno" size="10" value='${param.telno}' />&nbsp;&nbsp;
										<input type="submit" value="查询" /><br /> <br /> <br />
										</form>
										<form action="<c:url value='/GetUserByTime.view' />"
									method="post">
									开始时间:&nbsp;<input type="date" name="begin" id="starttime"
										value='${param.begin}' />&nbsp;&nbsp;&nbsp; 
										结束时间:&nbsp;<input
										type="date" name="end" id="endtime" value='${param.end}' />&nbsp;&nbsp;
	
										<input type="submit" value="查询" /><br /> <br /> <br />
								</form>
							</div>
							<table class="table03" id="listtitle">
								<thead>
									<tr>
										<td width="5%">编号</td>
										<td width="5%">姓名</td>
										<td width="5%">用户名</td>
										<td width="2.5%">性别</td>
										<td width="12%">身份证号</td>
										<td width="2.5%">年龄</td>
										<td width="8%">通讯地址</td>
										<td width="12%">联系电话</td>
										<td width="8%">注册时间</td>
										<td width="2.5%">账户余额</td>
										<td width="2.5%">状态</td>
										<td width="5%">操作</td>
									</tr>
								</thead>
							</table>

							<table border="1" cellspacing="0">

								<c:forEach items="${userList}" var="user" >
									<tr>
										<td width="5%">${user.uid}</td>
										
                                       <td width="5%">${user.name }</td>
										<td width="5%">${user.username}</td>
										<td width="2.5%">${user.gender}</td>
										<td width="12%">${user.idCard }</td>
										<<td width="2.5%">${user.age }</td>
										<td width="8%">${user.address }</td>
										<td width="12%">${user.telno }</td>
                                        <td width="8%">${user.regTime }</td>
                                        <td width="2.5%"><font color="red"> ${user.balance }</font></td>
										<td width="2.5%" id="statustd${user.uid }">${user.status }</td>
			<c:if test="${user.status==1 }">
					<td width="5%"><input type="button" value="禁用" id="buying${user.uid }"
						onclick="buying(${user.uid })"/>
						</td>
						
				</c:if>
				<c:if test="${user.status==0 }">
					<td td="5%"><input type="button" value="启用" id="buyend${user.uid }"
						  onclick="buying(${user.uid })" /> </td>
				 
				</c:if>
									</tr>
								</c:forEach>


							</table></div></div></div></div></div></div>
							

							
</body>
</html>


