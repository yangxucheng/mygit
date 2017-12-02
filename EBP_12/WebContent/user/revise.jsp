<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page import="com.oracle.ebp.domain.User" %>
<%@page import="com.oracle.ebp.service.UserService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<c:url value='/css/revise.css'/>"/>
<body>
<% 	
request.setAttribute("userInfo", session.getAttribute("userInfo"));
%>
<jsp:useBean id="ReviseBean" scope="request" class="com.oracle.ebp.domain.ReviseBean" />
<c:url var="url" value="/revise" scope="request" />
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
				用户名:${userInfo.username}&gt; <span>个人信息</span>
			</div>
			<div class="tab-mydamai">
				<ul class="title">
					<li><a class="on" href="#">基本资料</a></li>
					<li><a href="#">头像设置</a></li>
					<li><a href="#">兴趣爱好</a></li>
					<li class="right">资料完整度： <span>100%</span>
					</li>
				</ul>
				<div class="c-n box01">
					<div class="per-edit-list">
						<form:form modelAttribute="ReviseBean" action="${url}">
							<div class="per-edit-msg">完善更多个人信息，有助于我们为您提供更加个性化的服务，本网站将尊重并保护您的隐私。</div>

							<dl>
								<dt>真实姓名：</dt>
								<dd>
									<form:input path="name" id="realinp" type="text"
										class="input-text-2" name="RealName" value="${userInfo.name}"
										required="true" />
									<span id="realinpTip" class="tip"></span>
								</dd>
							</dl>
							<dl>
								<dt>性别:</dt>
								<dd>
									<c:if test="${userInfo.gender ==1}">
										<label class="radio"> <form:radiobutton id="sexRadio"
												path="gender" value="男" check="true" /><span class="m">男</span>
										</label>
										<label class="radio"> <form:radiobutton id="sexRadio1"
												path="gender" value="女" /><span class="f">女</span>
										</label>
									</c:if>
									<c:if test="${userInfo.gender ==0}">
										<label class="radio"> <form:radiobutton id="sexRadio"
												path="gender" value="男" /><span class="m">男</span>
										</label>
										<label class="radio"> <form:radiobutton id="sexRadio1"
												path="gender" value="女" check="true" /><span class="f">女</span>
										</label>
									</c:if>
									<span id="sexRadioTip" class="tip"></span>
								</dd>
							</dl>
							<dl>
								<dt>
									<span class="c4"></span>年龄：
								</dt>
								<dd>
									<form:input id="ageinp" path="age" type="text"
										class="input-text-2" name="Age" value="${userInfo.age}"
										required="true" />
									<span id="ageinpTip" class="tip"></span>
								</dd>
							</dl>
							<dl>
								<dt>身份证号：</dt>
								<dd>
									<form:input path="idCard" id="cardinp" type="text"
										class="input-text-1" name="IdentityCard"
										value="${userInfo.idCard }" required="true" />
									<span id="cardinpTip" class="tip"></span>
								</dd>
							</dl>
							<dl>
								<dt>地址:</dt>
								<dd>
									<form:input path="address" required="true"
										value="${userInfo.address}" id="addressinp" type="text"
										class="input-text-2" name="address" />
									<span id="addressinpTip" class="tip"></span>
								</dd>
							</dl>
							<dl>
								<dt>电话号码:</dt>
								<dd>
									<form:input class="input-text-2" name="telno" id="telno"
										path="telno" value="${userInfo.telno}" required="true"
										pattern="^((13[0-9])|(15[0-9])|(18[0, 5-9]))\d{8}$"
										maxlength="11" />
								</dd>
							</dl>
							<input id="posttoken" type="hidden" name="posttoken" value="" />
							<button id="sumBgn" class="btn05" type="submit" onclick="save()">保存</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</script>
</html>