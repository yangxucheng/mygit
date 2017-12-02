<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

        
       
    <title>电子商务平台</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/myJs.js" ></script>
    </head>
    <script type="text/javascript">
        $(function(){ 
        $("li").has("ul").mouseover(function(){ 
        $(this).children("ul").show(); 
        $(this).css("backgroundColor","#cea"); 
        
        }).mouseout(function () { $(this).children("ul").hide();
        $(this).css("backgroundColor","#1C1D1F"); 
        }) 
        }); 
        </script>
    <body>
        <div id="main_page">
            <div id="header">
            <div id="background2">
            <div>
                <img style="height:60px;margin-top:1px;margin-bottom:5px" src="images/2.jpg"/>
               </div>
        <div id="menu4"> 		
		<ul>
		<li><a  href="shopping.html">在线订票 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丨</a></li>
        </ul>
		<ul>
                <li class="navmenu"><a href="">修改个人信息</a>
          <ul>
               <li><a href="#">基本信息修改</a>           
               </li> 
               <li>
               <a href="#">个人密码修改</a>
               </li>      
         </ul>
         </li>
         </ul>
         
         <ul>
         <li><a href="#" >订单&购物车</a>
         <ul>
         <li><a href="#" >购物车&结账</a>           
               </li> 
               <li>
               <a href="#" >去我的订单</a>
               </li>
         
         </ul>
         </li>
         </ul>
         
         <ul>
         <li><a href="#" >&nbsp;&nbsp;账户&nbsp;&nbsp;充值</a>
         </li>
         </ul>
         
         <ul>
         <li><a href="#" >&nbsp;&nbsp;退出账号</a>
         </li>
         </ul>
         </div>
         </div>   
		</div>
	   </div>
            <div id="body">
                <div id="navigation">
                    <div id="inner">
                        <p>当前用户： ${session_user.name }</p>
                        <ul>
                            <li><a href="user/index.jsp" class="index">首&nbsp;&nbsp;&nbsp;页</a><li>
                            <li><a href="user/ShowTickets.jsp" class="personal">在线订票</a><li>
                            <li><a href="orderdetails.jsp" class="exam">我的订单</a><li>
                            <li><a href="user/updateUser.jsp" class="examlog">个人信息</a><li>
                            <li><a href="user/TopUpAccount.jsp" class="examlog">账户冲值</a><li>
                            <li><a href="user/logout" class="logout">注&nbsp;&nbsp;&nbsp;销</a><li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <div class="title">
                        <p><img src="images/icon-title.jpg" /> ${param.title}</p>
                    </div>
                    <div class="main">
							<jsp:include page="${param.mainbody}"/>                        
                    </div>
                </div>  <!--content-->
            </div>  <!--body-->
        </div>
    </body>
</html>
