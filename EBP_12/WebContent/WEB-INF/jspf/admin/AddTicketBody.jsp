<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$("#date").datepicker();
	});
</script>
<body>
<form action="AddTicket" method="post"  id="form1">
描述：<input type="text" name="descinfor"/><br/><br/>
开始时间：<input type="text" name="startime" id="date"/><br/><br/>
总票数：<input type="text" name="amount" /><br/><br/>
剩余票数：<input type="text" name="balance" /><br/><br/>
单价(元)：<input type="text" name="price"/><br/><br/>
状态：<input type="radio" name="status" value="0" checked="checked"/>售票中
<input type="radio" name="status"  value="1"/>已停售<br/><br/>
<input type="button" value="修改" onclick="register()"/>
<input type="reset" />
</form>
</body>
<script type="text/javascript">
	function register(){
		var form1=	document.getElementById("form1");
		form1.submit();
	}
</script>
</html>