<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>您已购买成功！</p>

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
<form action="<c:url value='/user/backshoppingcart.action'/>" method="post">
   <input type="submit" style="width: 80px;" value="返回购物车" " />
   </p></br></br>
   </form>
   
 <form action="<c:url value='/user/backshopping.action'/>" method="post">
   <input type="submit" style="width: 80px;" value="继续购买" " />
   </p></br></br>
   </form>
<br/>
</body>
</html>