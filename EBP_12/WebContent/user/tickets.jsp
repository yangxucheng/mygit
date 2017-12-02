<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="../css/ticket.css" rel="stylesheet" type="text/css"></link>

</head>

<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>
<style type="text/css">
#left {
	float: left;
	height: 300px;
	width: 25%;
}
#right {
	margin-top:2px;
	height: 20px;
	width: 50%
}
#body {
	
	height: 700px;
	width: 80%;
	border-radius:10px;
}
#all {
	height:85%;
	width: 98%;
}
#top {
	height: 50px;
	width: 80%;
}
p{
	line-height:5px;
}
input,textarea{border-radius:10px;}

</style>

<body >

  
<div id = "all">
	<br><br><br>
	<center>
	<div id = "top">
	<form action="<c:url value='/SelectTicket2.action' />"
		method="post">
		票ID:&nbsp;
		<input type="number" name="tid" value='${param.tid}' onBlur="this.value=parseInt(this.value);if (isNaN(this.value) || this.value<=0){this.focus();};"/>
		
		&nbsp;&nbsp;&nbsp;
		片名:&nbsp;<input type="text" name="descs" value='${param.descs}' />&nbsp;&nbsp;&nbsp;
		开始时间:&nbsp;<input type="date" name="startTime"
			value='${param.startTime}' />&nbsp;&nbsp;&nbsp; 结束时间:&nbsp;<input
			type="date" name="endTime" value='${param.endTime}' />&nbsp;&nbsp;&nbsp;
		<input type="hidden" name="amount" value="100"> <input
			type="hidden" name="balance" value="100"> <input
			type="hidden" name="price" value="100"> <input type="hidden"
			name="status" value="0"> <input type="submit" value="查询" /><br />
		<br /> <br />
	</form>
	</div>
	</center>





	<table border="1" cellspacing="0">
	<center>
	<div id = "body">
		<p>
			<font color='red'>${errors['GLOBAL']}</font>
			<font color='red'>${numerror}</font>
 <font color='red'>${succ}</font>    
		</p>
		<c:forEach items="${pageBean.recordList}" var="list1">
			<div id="left">
				<center>
					<img src="<c:url value='/${list1.images}'/>" title = "${list1.descs}" alt="该图片是duke吉祥物"
						onClick="show(${list1.tid})" width="150" height="200" style="cursor:hand" /> <br />
					<c:if test="${list1.status==0 }">
						<p>${list1.descs }
							&nbsp;&nbsp;&nbsp; <font color="red">已停售</font>
						</p>
					</c:if>
					
					
					<c:if test="${list1.status==1 }">
						<p>${list1.descs }&nbsp;&nbsp;&nbsp; 售票中</p>
											
					</c:if>
					<p><font color="red">${list1.price }</font></p>
					<c:if test="${list1.status==1 }">
					
					</c:if>
				</center>
			</div>

		</c:forEach>
	</div>
	</center>

	<center>
	<div id = "right">
	
	<font size="5"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.currentPage-1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">上一页</a></font>&nbsp;
	<font size="5"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=1&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">首
			页</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+1}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+2}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+2}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+3}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+3}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+4}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+4}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+5}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+5}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+6}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+6}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+7}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+7}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+8}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+8}</a></font>&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.beginPageIndex+9}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+9}</a></font>&nbsp;&nbsp;&nbsp;
	<font size="3"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">总计：
			${pageBean.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp;
	<font size="5"><a
		href="SelectTicket2.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&endTime=${param.endTime}&currentPage=${pageBean.currentPage+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">下一页</a></font>
		</br><font size="3"><a href="<c:url value='/user/gotoshoppingcart.action'/>">我的购物清单/结账</a></font>
	</div>
	</center>
	</table>
	
	
	
	<script type="text/javascript">
	function show(tid){
		window.location="/EBP_11/ShowTicketDetail.action?tid="+tid;
	}
	
	
	
	</script>
 	<script type="text/javascript">
		var img = document.getElementById('img');
		function bigger() {
			img.style.width = '165px';
			img.style.height = '215px';
		}

		function smaller() {
			img.style.width = '150px';
			img.style.height = '200px';
		}
	</script>
	
</div>
<script language="javascript">
var Arraycolor=new Array("#D6F6FF","#B3E7F6","#B9EAF7","#9EDEF1","#99CCFF","#A3E0F2","#B3E7F6","#BFECF9","#CCF1FC","#D6F6FF");
var n=0;
function turncolors(){
	n++;
	if (n==(Arraycolor.length-1)) n=0;
	document.bgColor = Arraycolor[n];
	setTimeout("turncolors()",3000);
}
turncolors();
</script>
</body>
</html>