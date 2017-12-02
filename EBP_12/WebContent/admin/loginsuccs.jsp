<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple YouTube Menu Effect</title>
<meta name="description"
	content="A tutorial on how to recreate the effect of YouTube's little left side menu. The idea is to slide a little menu icon to the right side while revealing some menu item list beneath. " />
<meta name="keywords" content="Add keywords" />
<meta name="author" content="_yourName_ for Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<style>

input,textarea{border-radius:10px;}
</style>
</head>
<body>
	<div class="container">


		<div class="main">
			<p>
				<img style="width: 100%; margin-top: 50px; height: 400px;" alt=""
					src="${images}">
			</p>

			<div class="side">
				<nav class="dr-menu">
				<div class="dr-trigger">
					<span class="dr-icon dr-icon-menu"></span><a class="dr-label">购买</a>
				</div>
				<ul>

					<li><a><img width="140px" height="180px" alt=""
							src="${first}"></a></li>
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-user">电影名称：${Ticket.descs}</a></li>
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-camera">开始时间 ：${Ticket.startTime}</a></li>
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-heart">剩余票数：${Ticket.balance} </a></li>
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-bullhorn">票价：${Ticket.price}</a></li>
							
							
							
					<c:if test="${Ticket.status == 1}">
					<form action="<c:url value='/user/tickets.action' />"method="post">
					<input type="hidden" name="tid" value="${Ticket.tid}">
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-download"><input type="number" name="number" value="购买票数" " required = "true" onBlur="this.value=parseInt(this.value);if (isNaN(this.value) || this.value<=0){this.focus();};"/></a></li>
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-settings"><input type = "submit" value="加入购物清单" style = "font-size:16px;" class="dr-icon dr-icon-settings" /> </a></li>
					</form>
					</c:if>
					<c:if test="${Ticket.status == 0}">
					<li><a style = "font-size:16px;" class="dr-icon dr-icon-settings"><font color = "red">停售中</font></a></li>
					</c:if>
				</ul>
				</nav>
			</div>
			<div>
				<ul>
					<li><a style="font-size: 25px; color: white;"
						class="dr-icon dr-icon-user">剧情简介：
						</a> </li>
						
						<c:forEach
							items="${listall}" var="list1">
							<center>
								<c:if test="${list1.sequence eq '1'}">
									<div id="right">
										<li>${list1.descs}</li>
									</div>
								</c:if>
								<c:if test="${list1.sequence eq '2'}">

									<li><img src="${list1.images}" /></li>

								</c:if>
							</center>
						</c:forEach> </br>
					<br />
				</ul>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="js/ytmenu.js"></script>
</body>
</html>


