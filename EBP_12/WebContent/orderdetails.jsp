<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="<c:url value='/css/revise.css'/>" />
<link rel="stylesheet" href="<c:url value='/css/orderdetails.css'/>" />

<body>

		<div class="main">
			<div class="sidenav">
				<div id="mydamai" style="">
					<h3>
						<a href="<c:url value='/index.jsp'/>">回到首页</a>
					</h3>
					<dl>
						<dt style="margin-top: 12px;">交易中心</dt>
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
					用户名:${userInfo.username}&gt; <a
						href="<c:url value='/pageselect.action'/>" target="_self">订单管理</a>&gt;
					<span>个人信息</span>
				</div>
				<div class="msg-safety">
					<div class="fl ts">
						<span class="mr20"> 订单号： <span>${orderdetails.oid}</span>
						</span> <span> 状态： <span class="gree">已付款</span>
						</span>
					</div>
					<div class="fr intel">服务热线：123456/7890-5365-3465</div>

				</div>
				<div class="pay-step-a" style="" id="progress">
					<ul>
						<li class="m s1 on1">等待付款</li>
						<li class="n on2">完成付款</li>
						<li class="m s2">配货/打包</li>
						<li class="n">发送货品</li>
						<li class="m s3">配送中</li>
						<li class="n">收取货品</li>
						<li class="m s4">订单完成</li>
					</ul>
					<div class="line step-4-0">
						<div></div>
					</div>
					<div class="detail-infos-a">
						<h4>订单详情</h4>
						<div class="cont">
							<div class="p-infos">
								<h5>配送信息</h5>
								<p>
									收 货 人：${orderdetails.user.name}<br> 地
									址：${orderdetails.user.address} <br> 固定电话：无<br>
									手机号码：${orderdetails.user.telno} <br> 电子邮件：无<br>
								</p>
							</div>
							<div class="d-infos">
								<h5>订单信息</h5>
								<p>
									<span>订单编号: ${orderdetails.oid}</span> <span>下单时间：${orderdetails.commitTime}</span>
									<span>商品类型： 纸质票 </span> <span>付款方式： 在线支付 </span>
								</p>
							</div>
							<table class="table03" width="100%" border="0">
								<tbody>
									<tr>
										<th class="w3">商品名称</th>
										<th>商品状态</th>
										<th>票价</th>
										<th>数量</th>
										<th>折扣</th>
										<th>小计</th>
									</tr>
									<tr>
										<td class="w3"><a target="_blank" href="#">
												${ticket.descs}</a><br> <span class="mr10"></span>
										</td>
										<td>销售中</td>

										<td>${ticket.price}</td>

										<td>${orderdetails.orderlist.quantity} 张</td>
										<td>无折扣</td>
										<td><span class="c4"><strong>${orderdetails.amount}</strong></span>元
										</td>
									</tr>
									<tr>
										<td colspan="6" class="tl">
											<div
												style="white-space: normal; width: 700px; word-wrap: break-word;">
												无</div>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="sum-account" id="pay_div">
							<div class="s-top">
								<p>商品总金额：¥${orderdetails.amount}</p>
								<p>+运费：¥00.00</p>
							</div>
							<div class="s-bt">
								<p class="s-price">
									订单支付金额：<span class="m">¥ ${orderdetails.amount} </span>
								</p>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
</body>
</html>