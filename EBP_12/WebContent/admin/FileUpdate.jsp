<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ page import="com.oracle.ebp.filter.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<title>文件上传</title>
<meta HTTP-EQUIV=Content-Type content="text/html; charset=utf-8">
</head>

<body bgcolor='white'>

	<form action="<c:url value='/admin/update.action' />" method="post" enctype="multipart/form-data">  
    选择文件:<input type="file" name="file">  
    <input type="submit" value="提交"> 
    <br/>  <br/>  
    <a href="ticketdetail.jsp">返回</a>
</form> 
</body>
</html>



