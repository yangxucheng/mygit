<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link type="text/css" rel="stylesheet" href="css/button.css"  />
  <link type="text/css" rel="stylesheet" href="css/revise.css"  />
 
 
</head>
<body>


<div class="main">
		<div class="sidenav">
			<div id="mydamai" style="">
				<h3>
					<a href="<c:url value='/index.jsp'/>">回到首页</a>
				</h3>
				<dl>
					<dt>设置</dt>
					<dd>
						<a href="<c:url value='/pageselect.action'/>" id="nav_Order"
							class="" title="个人信息" domain=""> <span>个人信息</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_myEwallet" class="" title="账号绑定"
							domain=""> <span>账号绑定</span>
						</a>
					</dd>

					<dd>
						<a href="#" id="nav_myCoupon" class="" title="我的级别" domain="">
							<span>我的级别</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyIntegral" class="" title="收货地址" domain="">
							<span>收货地址</span>
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
						<a href="#" id="nav_MessCenter" class="" title="分享绑定" domain="">
							<span>分享绑定</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyComment" class="" title="邮件订阅" domain="">
							<span>邮件订阅</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MyQuestion" class="" title="消费记录" domain="">
							<span>消费记录</span>
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
						<a href="#" id="nav_MySubscribe" class="" title="快捷支付" domain="">
							<span>快捷支付</span>
						</a>
					</dd>
					<dd>
						<a href="#" id="nav_MySubscribe" class="" title="采购需求单" domain="">
							<span>采购需求单</span>
						</a>
					</dd>
				</dl>
			</div>
		</div>

  <div id="main1">
                
                    <div>
                        <h3>修改登录密码</h3>
                    </div>
                   
                  <div class="center">
			<div>
				<img src="<c:url value='/images/1216.jpg'/>" alt="">
			</div>
			
		  

<div class="right">
<jsp:useBean id="OldPassword" scope="request" class="com.oracle.ebp.domain.OldPassword" />
<c:url var="url" value="/verifyLogin.action" scope="request" />
<form:form modelAttribute="OldPassword" action="${url}" >
	<p>
		<font color='red' size='-1'><i> 
		<form:errors />
		</i></font>
	</p>
	

	<table>
		<tr>用户名:jack</tr>
		<tr>
		<td>
			<form:input path="opassword" type="password"/><br/><br/>
		</td>
		<td>
			<i style="font-size: 5px;"><form:errors path="opassword"></form:errors></i>
		</td>
		</tr>
	</table>
	<input  class='button blue' type="submit" value="确定"/>
	
</form:form>


			</div>
		</div>
	</div>
</div>


</body>
</html>