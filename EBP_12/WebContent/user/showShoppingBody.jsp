<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<title>购物车</title>
	<link href="<:url value='/css/base2.css'/>" rel="stylesheet" >
	<link href="<c:url value='/css/checkout.css'/>" rel="stylesheet" >
	<link href="<c:url value='/css/modal.css'/>" rel="stylesheet" >
	<style>
		.quentity input{
			width: 40px;
			padding: 5px 10px;
			text-align: center;
		}
		.partContent{
			width:100px;
			height: 50px;
		}

		.partContent .left{
			width:50px;
			height:50px;
			display: table-cell;
			vertical-align: middle;
			text-align: center;
			float:left;
		}
		.partContent .right{
			width:50px;
			height: 50px;
			float:left;
			cursor:pointer;
		}
		 *{margin:0;padding:0;list-style-type:none;}
        a{color:#666;text-decoration:none;}
        table{border-collapse:collapse;border-spacing:0;border:0;}
        body{color:#666;font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
        clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
        .clearfix{display:inline-table}
        *html .clearfix{height:1%}
        .clearfix{display:block}
        *+html .clearfix{min-height:1%}
        .fl{float:left;}
        .fr{float:right;}
        .catbox{width:940px;margin:100px auto;}
        .catbox table{text-align:center;width:100%;}
        .catbox table th,.catbox table td{border:1px solid #CADEFF;}
        .catbox table th{background:#e2f2ff;border-top:3px solid #a7cbff;height:30px;}
        .catbox table td{padding:10px;color:#444;}
        .catbox table tbody tr:hover{background:RGB(238,246,255);}
        .checkbox{width:60px;}
        .check-all{ vertical-align:middle;}
        .goods{width:300px;}
        .goods span{width:180px;margin-top:20px;text-align:left;float:left;}
        .goods img{width:100px;height:80px;margin-right:10px;float:left;}
        .price{width:130px;}
        .count{width:90px;}
        .count .add, .count input, .count .reduce{float:left;margin-right:-1px;position:relative;z-index:0;}
        .count .add, .count .reduce{height:23px;width:17px;border:1px solid #e5e5e5;background:#f0f0f0;text-align:center;line-height:23px;color:#444;}
        .count .add:hover, .count .reduce:hover{color:#f50;z-index:3;border-color:#f60;cursor:pointer;}
        .count input{width:50px;height:25px;line-height:15px;border:1px solid #aaa;color:#343434;text-align:center;padding:4px 0;background-color:#fff;z-index:2;}
        .subtotal{width:150px;color:red;font-weight:bold;}
        .operation span:hover,a:hover{cursor:pointer;color:red;text-decoration:underline;}

        .foot{margin-top:0px;color:#666;height:48px;border:1px solid #c8c8c8;border-top:0;background-color:#eaeaea;background-image:linear-gradient(RGB(241,241,241),RGB(226,226,226));position:relative;z-index:8;}
        .foot div, .foot a{line-height:48px;height:48px;}
        .foot .select-all{width:80px;height:48px;line-height:48px;color:#666;text-align:center;}
        .foot .delete{padding-left:10px;}
        .foot .closing{border-left:1px solid #c8c8c8;width:103px;text-align:center;color:#666;font-weight:bold;cursor:pointer;background-image:linear-gradient(RGB(241,241,241),RGB(226,226,226));}
        .foot .closing:hover{background-image:linear-gradient(RGB(226,226,226),RGB(241,241,241));color:#333;}
        .foot .total{margin:0 20px;cursor:pointer;}
        .foot  #priceTotal, .foot #selectedTotal{color:red;font-family:"Microsoft Yahei";font-weight:bold;}
        .foot .selected{cursor:pointer;}
        .foot .selected .arrow{position:relative;top:-3px;margin-left:3px;}
        .foot .selected .down{position:relative;top:3px;display:none;}
        .show .selected .down{display:inline;}
        .show .selected .up{display:none;}
        .foot .selected:hover .arrow{color:red;}
        .foot .selected-view{width:938px;border:1px solid #c8c8c8;position:absolute;height:auto;background:#ffffff;z-index:9;bottom:48px;left:-1px;display:none;}
        .show .selected-view{display:block;}
        .foot .selected-view div{height:auto;}
        .foot .selected-view .arrow{font-size:16px;line-height:100%;color:#c8c8c8;position:absolute;right:330px;bottom:-9px;}
        .foot .selected-view .arrow span{color:#ffffff;position:absolute;left:0px;bottom:1px;}

        #selectedViewList{padding:10px 20px 10px 20px;}
        #selectedViewList div{display:inline-block;position:relative;width:100px;height:80px;border:1px solid #ccc;margin:10px;float:left;}
        #selectedViewList div img{width:100px;height:80px;margin-right:10px;float:left;}
        #selectedViewList div span{display:none;color:#ffffff;font-size:12px;position:absolute;top:0px;right:0px;width:60px;height:18px;line-height:18px;text-align:center;background:#000;cursor:pointer;}
        #selectedViewList div:hover span{display:block;}
    .button {
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}
.orange {
	color: #fef4e9;
	border: solid 1px #D1434A;
	background: #D1434A;
}

	</style>
	<script type="text/javascript">
		
		function rept1(){
			
			return window.confirm("您确定付款吗？");
		}
		function rept(){
			return window.confirm("您确定取消吗？");
		}
	</script>
	</head>
	
	<body>
        	
		<body class="checkout">
			<div id="app">
				<div class="container">
					<div class="cart">
						<div class="checkout-title">
							<span>购物车</span>
						</div>

						<!-- table -->
						
						<div>
						
						<div class="item-list-wrap">
							<div class="cart-item">
								<div class="cart-item-head">
									<ul>
										<li>商品信息</li>
										<li>商品金额</li>
										<li>商品数量</li>
										<li>总金额</li>
										<li>编辑</li>
									</ul>
								</div>
								<c:forEach items="${list}" var="list">
								
								<ul class="cart-item-list">
									<li v-for="(item,index) in list">
										<div class="cart-tab-1">
											<div class="cart-item-check">
										</div>
										<div class="cart-item-pic">
										
										<c:forEach items="${detail}" var="detail2">
										
										
										<c:if test="${list.tid == detail2.ticketid}">
											
											<img src="../${detail2.images}" onClick="show1(${list.tid})">
										</c:if>
										</c:forEach>
										</div>
										<div class="cart-item-title">
											<div class="item-name">${list.descs}</div>
										</div>
										<div class="item-include">
											<dl>
												<dt>赠送:</dt>
												<dd v-for="part in item.parts">	
													<div class="partContent">
														<div class="left">
															<span
															@mouseover="partMouseOver(part)"
															@mouseout="partMouseOut(part)"
															v-text="part.partsName"></span>
														</div>
														<div class="right">
															<img :src="part.img" style="width:50px" v-show="part.showImg"/>
														</div>
													</div>
												</dd>
											</dl>
										</div>
									</div>
									<div class="cart-tab-2">
										<div class="item-price">${list.price}</div>
									</div>
									<div class="cart-tab-3">
										<div class="item-quantity">
											<div class="select-self select-self-open">
												<div class="quentity" style="margin-top:17px;">
													<input type="number" value="${list.quantity}" name="number">
												</div>
											</div>
										</div>
									</div>
									<div class="cart-tab-4">
										<div class="item-price-total">${list.price*list.quantity}</div>
									</div>
									<div class="cart-tab-5">
										<div class="cart-item-opration">
		
		<form action="<c:url value='/user/deleteAction.action'/>" onsubmit="return rept()" method="post">
			<input name="imgbtn" type="image" src="../images/shopping.PNG" width="30" height="25" border="0" >
			<input type="hidden" value="${list.tid}" name="tid">

		</form>
									</div>
								</div>
							</li>
						</ul>
						<div style="float: right; margin-left: 10px;">
				<form action="<c:url value='/user/payforshopping.action'/>" onsubmit="return rept1()" method="post">
			<button type="submit" value="付款" class="button orange" style="width:160px;height: 70px;" >付款</button> 
			<input type="hidden" value="${list.tid}" name="tids"> 
		</form>
			</div>
						</c:forEach>
					
					</div>
					<a style="font-size:26px;color:#D1434A;float:right;margin-right:10px;margin-top:20px;" href="<c:url value='/index.jsp'/>">回到首页</a>
				</div>
			
		
		</div>
		
		
		
		
		
		
		
		
		
	<script type="text/javascript">
	function show(tid){
		window.location="/EBP_11/admin/ShowTicketDetail.action?tid="+tid;
	}
	
	
	
	</script>
	<script type="text/javascript">
	function show1(tid){
		window.location="/EBP_11/ShowTicketDetail.action?tid="+tid;
	}
	
	
	
	</script>
 
</body>
</html>
