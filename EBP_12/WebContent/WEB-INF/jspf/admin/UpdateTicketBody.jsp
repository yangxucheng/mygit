<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="AdminUpdateTicketById" method="post"  id="form1">
<input type="hidden" name="tid" value="${getTicketById.tid }"/><br/><br/>
描述：<input type="text" name="descinfor" value="${getTicketById.descinfor }"/><br/><br/>
总票数：<input type="text" name="amount" value="${getTicketById.amount }"/><br/><br/>
剩余票数：<input type="text" name="balance" value="${getTicketById.balance }"/><br/><br/>
单价(元)：<input type="text" name="price" value="${getTicketById.price }"/><br/><br/>
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