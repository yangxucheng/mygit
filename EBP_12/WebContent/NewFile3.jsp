<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>jquery实现返回顶部和转到底部特效</title>
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4,img, ol, ul,p{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	background: transparent;
	}
ul {list-style: none;}
a {text-decoration: none;}
.clear{clear: both;}
:focus{outline:0}
body {
	
	font: 13px 'Microsoft YaHei', 寰蒋闆呴粦, Arial, Lucida Grande, Tahoma, sans-serif;
	color: #000;
	}
#wrapper {
	width: 980px;
	margin: 18px auto;
	line-height: 22px;
	}
a {
	color: #000;
	text-decoration: none;
	}
a:hover {
	color: #0196e3;
	text-decoration: none;
	}
a:active {
	}
ul.scroll {
	width: 15px;
	float: right;
	display:block;
	position:fixed;
	top:40%;
	right:0;
	_position:absolute;
	_margin-top:300px;
	_top:expression(eval(document.documentElement.scrollTop));
	z-index: 6;
	}
.sct {background: url(images/scroll.png);}
.scb {background: url(images/scroll.png) 0 40px;}
.scc {background: url(images/scroll.png) 0 80px;}
.scroll_t,.scroll_c,.scroll_b{
	width: 80px;
	height:40px;
	line-height:40px;
	text-align:center;
	cursor: pointer;
	border-radius: 20px 0 0 20px;
	}
.scroll_t{
	background: #d03f42;
	}
.scroll_b{
	background: #383838;
	}
.scroll_c{
	background: #467ebd;
	}
ul.scroll li {
	position: relative; 
	height:40px;
	float: right;
	}
ul.scroll li a{
	display: block;
	color:#fff;
	}
ul.scroll li div {
	display: none;
	position: absolute;
	top: 0;
	right: 0;
	}
</style>
</head>

<body >
  ///////
<ul class="scroll">
  <li class="sct"> <a href="#">&nbsp;&nbsp;&nbsp;</a>
    <div><a class="scroll_t">返回顶部</a></div>
  </li>
  <li class="scb"> <a href="#">&nbsp;&nbsp;&nbsp;</a>
    <div><a class="scroll_b">转到底部</a></div>
  </li>
</ul>
<script type="text/javascript" src="js/jquery.min.js" ></script>

<script type="text/javascript">
jQuery(document).ready(function($){
$('.scroll_t').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);}); 
$('.scroll_b').click(function(){$('html,body').animate({scrollTop: document.body.clientHeight+'px'}, 800);});
});

$(document).ready(function(){ 
    $("ul.scroll li").hover(function() {
        $(this).find("div").stop()
        .animate({right: "0", opacity:1}, "fast")
        .css("display","block")
    }, function() {
        $(this).find("div").stop()
        .animate({right: "0", opacity: 0}, "fast")
    });  
});
</script>
</body>
</html>
