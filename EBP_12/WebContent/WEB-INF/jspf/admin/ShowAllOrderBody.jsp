<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>  
</head>
<script type="text/javascript" src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>
 
<script type="text/javascript">
 $(function(){
	$("#starttime").datepicker();
	$("#endtime").datepicker();
});

function GetUserByAdmin_Sday_Eday(){
	window.location="admin/queryOrderByDate?begin="+$("#starttime").val()+"&end="+$("#endtime").val();
}
function GetUserByAdmin_oni(){
	alert($("#soid").val())
	window.location="GetUserByAdmin_oni?sname="+$("#sname").val()+"&sidCard="+$("#sidCard").val()+"&soid="+$("#soid").val();
}
</script>
<body>
	<table border="1" cellspacing="0"
		style="width: 100%; border-left: 0; border-top: 0; border-right: 0;">
		<tr>
			<td colspan="8"
				style="border: 0; padding-bottom: 2%; text-align: left;">
				<form action="<c:url value='/admin/selectByTime.action'/>" method="post">
				起始日期：<input
				type="text" id="starttime" name="begin" value="${param.begin }"/> 终止日期：<input
				type="text" id="endtime" name="end" value="${param.end }"/><input type="submit"
				value="查询" />
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="8"
				style="border-left: 0; border-top: 0; border-right: 0; padding-bottom: 2%; text-align: left;">
				<form action="<c:url value='/admin/selectByname.action'/>" method="post">
				订单号：<input type="text"  name="number" /> 姓名/用户名：<input
				type="text"  name="name" value=""/>
				 身份证号：<input type="text"
				 name="idCard" /> <input type="submit" value="查询" />
				</form>
			</td>
			
		</tr>
		<form action="<c:url value='/admin/ShowAllorder.action'/>" method="post">
            <input type="submit" value="查询全部" ></br></br>
   </form>
		<tr align="center">
			<th>编号</th>
			<th>订单号</th>
			<th>订单内容</th>
			<th>成交时间</th>
			<th>金额(元)</th>
			<th>姓名</th>
			<th>用户名</th>
			<th>身份证号</th>
		</tr>
		<c:forEach items="${list}" var="orders" varStatus="sta">
			<tr align="center">
				<td>${sta.count }</td>
				<td>${orders.oid }</td>
				<td>${orders.orderlist.descs }</td>
				<td>${orders.commitTime }</td>
				<td>${orders.orderlist.price}</td>
				<td>${orders.user.name }</td>
				<td>${orders.user.username }</td>
				<td>${orders.user.idCard }</td>
			</tr>
		</c:forEach>
	</table>
	<table border="0" cellspacing="0"
		style="width: 100%; border-left: 0; border-top: 0; border-right: 0;">	
		<tr align="center">
			<td colspan="8"><a href="admin/queryOrderByDate?currentPage=1">首页</a>
				<a href="admin/queryOrderByDate?currentPage=${currentPage-1 }">上一页</a>
				${currentPage }/${pageCount } <a
				href="admin/queryOrderByDate?currentPage=${currentPage+1 }">下一页</a> <a
				href="admin/queryOrderByDate?currentPage=${pageCount}">尾页</a></td>
		</tr>
	</table>
	
</body>
</html>