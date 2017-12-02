<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value='/admin/insertTicketDetail.action' />"
		method="post">
		tld：<input type='text' name='tId' value='${param.tId}' /><br /> <font
			color='red' size="-1"> <i>${errors['tid']}</i>
		</font><br /> descs：<input type='text' name='descs' value='${param.descs}' /><br />
		<font color='red' size="-1"> <i>${errors['descs']}</i>
		</font><br /> images：<input type='text' name='images'
			value='${param.images}' /><br /> <font color='red' size="-1">
			<i>${errors['images']}</i>
		</font><br /> sequence：<input type='text' name='sequence'
			value='${param.sequence}' /><br /> <font color='red' size="-1">
			<i>${errors['sequence']}</i>
		</font><br /> <input type="submit" value="提交">
	</form>


	<br/><br/><br/>
	<a href="ticketdetail.jsp">信息查询及修改</a>
</body>
</html>