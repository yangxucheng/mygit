<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
		(function() {
			setTimeout(function() {
				window.top.location.href="<c:url value='/user/pageselect.action'/>";
				
			},5000);
		var tempTime = 5;
		function time() {
			var i = setInterval(function() {
				document.getElementById("mytime").innerHTML=tempTime;
				if(tempTime!=0){
					tempTime--;
				
					}
				},1000);
			}
			time();
		})();
	</script>
	<body>
	<center>
	<div style="font-size: 30px; margin-top: 200px;">
			付款成功，本页面将于
		<span id="mytime" value="5" style="color: #D1434A;font-size: 40px;font-weight: bold;font-family:'宋体'" ></span>
		s后进入订单查询。
	</div>
	<div>
	<p>以下是该定单详细信息：</p>
<table border="1" cellspacing="0" style="margin-left: 5%;width: 90%;">
	<tr>
		
		<td>描述</td>
		<td>单价(元)</td>
		<td>购票数(张)</td>
		<td>总金额(元)</td>
	</tr>
	<c:forEach items="${list}" var="list1" >
	<tr>
		<td width="40%;">${list1.descs }</td>
		<td width="10%;">${list1.price }</td>
		<td width="10%;" >${list1.quantity }</td>
		<td width="10%;" >${list1.amount }</td>
	</tr>
	</c:forEach>
	<tr>

	</tr>
</table>
	</div>
	</center>
	</body>