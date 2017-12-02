<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		$("#stardate").datepicker();
	});
</script>
<form action="user/SelectTicket.action" method="post">
	id关键字：<input type="text" name="tid" width="1" size="1" value="${param.tid}"/> 
	descs关键字：<input type="text" name="descs"width="1" size="1"value="${param.descs}"/> 
	请选择起始日期（查询7天以内票项）：<input type="text" name="startTime" id="stardate" size="10" value="${param.startTime}"/>
    <input type="submit" value="查询  ">
</form></br></br>
<p><font color='red' size="-1">${succ}</font></p>
<p><font color='red' size="-1">
            ${numerror}
        </font></p>
<table border="1" cellspacing="0" style="margin-left: 5%;width: 90%;">
	<tr>
		<th>序号</th>
		<th>描述</th>
		<th>时间</th>
		<th>总票数</th>
		<th>剩余票数</th>
		<th>单价(元)</th>
		<th>状态</th>
		<th></th>
	</tr>
	<c:forEach items="${pageBean.recordList}" var="list1">
	<tr align="center">
		<td  width="5%;">${list1.tid }</td>
		<td width="25%;">${list1.descs }</td>
		<td width="12%;">${list1.startTime }</td>
		<td  width="8%;">${list1.amount }</td>
		<td  width="8%;">${list1.balance }</td>
		<td  width="8%;">${list1.price }</td>
		<c:if test="${list1.status==0 }">
		<td  width="10%;" style="color: red;border-color: blue;">已停售</td>
		</c:if>
		<c:if test="${list1.status==1 }">
		<td  width="10%;">售票中</td>
		</c:if>
		<c:if test="${list1.status==0 }">
		<td  ></td>
		</c:if>
		<c:if test="${list1.status==1 }">
		
		<td  > 
   <form action="<c:url value='/user/ShowTickets.action'/>" method="post">
      <input type="hidden" name="tid" value="${list1.tid }">
       票数：<input type="text" name="number" width="10px"></br></br>
       
   <input type="submit" value="加入购物车" name="add"></br></br>
   </form></td>
		</c:if>
	</tr>
	</c:forEach>
	<tr >
		<td colspan="4" style=" text-align: left ;border-right: 0;" id="errotd" ></td>
		<td colspan="5" style="text-align: right;border-left: 0;" ><form action="<c:url value='/user/gotoshoppingcart.action'/>">
   <input type="submit" value="我的购物车/结账" ></br></br>
   </form></td>
	</tr>
</table>
<font size="5"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.currentPage-1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">上一页</a></font>&nbsp;
		<font size="5"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=1&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">首 页</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+1}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+2}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+2}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+3}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+3}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+4}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+4}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+5}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+5}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+6}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+6}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+7}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+7}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+8}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+8}</a></font>&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.beginPageIndex+9}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">${pageBean.beginPageIndex+9}</a></font>&nbsp;&nbsp;&nbsp;
		<font size="3"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">总计： ${pageBean.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp;
		<font size="5"><a href="user/SelectTicket.action?tid=${param.tid}&descs=${param.descs}&startTime=${param.startTime}&currentPage=${pageBean.currentPage+1}&pageSize=${pageBean.pageSize}&recordCount=${pageBean.recordCount}">下一页</a></font>

<script type="text/javascript">
	function buyticket(tid,bal1){
		
		var buynum= document.getElementById("buynum"+tid);
		var errotd= document.getElementById("errotd");
		
		if (buynum.value==null||buynum.value==""||buynum.value=="0") {
			errotd.innerHTML="<font color='red'>请输入正确的票数</font>";
			
		}else{
			if (buynum.value>bal1) {
				errotd.innerHTML="<font color='red'>剩余票数不足，请重新输入</font>";
			}else {
				$.ajax({
					type:"post",
					url:"user/addShoppingCart",
					data:"number="+buynum.value+"&tid="+tid,
					dataType:"text",
					success:function(data){
						if(data=="ok"){
							alert("购物车添加成功！");
						}else{
							alert("购物车添加失败！");
						}
					}
				});
			}
		}
	}
	function location1(){
		window.location="user/showCart";
	}
	function queryday(){
	var stardate=	document.getElementById("stardate");
	
	if(stardate.value==''){
		window.location="user/queryTicketsByDate";
	}else{
		window.location="user/queryTicketsByDate?date="+stardate.value;
	}
	
	}
</script>
