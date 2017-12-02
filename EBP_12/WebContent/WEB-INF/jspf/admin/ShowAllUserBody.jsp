<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<table border="1" cellspacing="0"
		style=" width: 100%; border-left: 0; border-top: 0; border-right: 0;">
		<tr>
			<td colspan="12"
				style="border:0; padding-bottom: 2%; text-align: left;">
				<form action="admin/GetUserByTime.view" method="post">
				起始日期：<input type="date" id="starttime" name="begin" value="${param.begin }"/> 
				终止日期：<input type="date" id="endtime"  name="end" value="${param.end }"/>
				<input type="submit" value="查询" />
				</form>
				<!--<input type="submit" value="查询" onclick="GetUserBySday_Eday(1)"/>-->
			</td>
		</tr>
		<tr>
			<td colspan="12" style="border-left: 0; border-top: 0; border-right: 0; padding-bottom: 2%;text-align: left;">
			<form id="GetUserBynuit" action="admin/GetUserBynuit.view" method="post">
				姓名/用户名：<input type="text" id="sname"  name="name" value="${param.name }"/>
				身份证号：<input type="text"	id="sidCard"  name="idCard" value="${param.idCard }"/>
				联系电话：<input type="text"	id="stelno"  name="telno" value="${param.telno }"/>
				<input type="submit" value="查询" "/>
			</form>
				
			</td>
		</tr>
		<tr align="center">
			<th>编号</th>
			<th>姓名</th>
			<th>用户名</th>
			<th>性别</th>
			<th>身份证号</th>
			<th>年龄</th>
			<th>通讯地址</th>
			<th>联系电话</th>
			<th>注册时间</th>
			<th>账户余额</th>
			<th>状态</th>
			<th></th>
		</tr>
		<c:forEach items="${userList}" var="user">
		<tr align="center">
		<td>${user.uid }</td>
		<td>${user.name }</td>
		<td>${user.username}</td>
		<td>${user.gender }</td>
		<td>${user.idCard }</td>
		<td>${user.age }</td>
		<td>${user.address }</td>
		<td>${user.telno }</td>
		<td>${user.regTime }</td>
		<td ><font color="red"> ${user.balance }</font></td>
		
		<td id="statustd${user.uid }">${user.status }</td>
			<c:if test="${user.status==1 }">
					<td><input type="button" value="禁用" id="buying${user.uid }"
						onclick="buying(${user.uid })"/></td>
						
				</c:if>
				<c:if test="${user.status==0 }">
					<td><input type="button" value="启用" id="buyend${user.uid }"
						  onclick="buying(${user.uid })" /> </td>
				 
				</c:if>
		</tr>
		</c:forEach>
	</table>
	<table border="0" cellspacing="0"
		style=" width: 100%; border-left: 0; border-top: 0; border-right: 0;">
		<tr align="center">
			<td>	
			<c:if test="${isDate ==1 }">
				<input type="button" value="首页" onclick="GetUserBySday_Eday(1)"/>
				<input type="button" value="上一页" onclick="GetUserBySday_Eday(${currentPage-1})"/>
				${currentPage}/${pageCount}	
				<input type="button" value="下一页" onclick="GetUserBySday_Eday(${currentPage+1})"/>
				<input type="button" value="尾页" onclick="GetUserBySday_Eday(${pageCount})"/>
			
			</c:if>	
			
			
			<c:if test="${isCondition == 1 }">
				<input type="button" value="首页" onclick="GetUserBynuit(1)"/>
				<input type="button" value="上一页" onclick="GetUserBynuit(${currentPage-1})"/>
				${currentPage}/${pageCount}	
				<input type="button" value="下一页" onclick="GetUserBynuit(${currentPage+1})"/>
				<input type="button" value="尾页" onclick="GetUserBynuit(${pageCount})"/>
			</c:if>	
			</td>
		</tr>
	</table>
	
 <script type="text/javascript">

function GetUserBySday_Eday(currentPage){
   
	data="currentPage="+currentPage;
	if($("#starttime").val()!=''){
		data+="&begin="+$("#starttime").val();
	}
	if($("#endtime").val()!=''){
		data+="&end="+$("#endtime").val();
	}
	window.location="admin/queryUsersByDatePage?"+data;
}
function GetUserBynuit(currentPage){
	/*window.location="admin/queryUsersByCondition?currentPage="+currentPage+"&name="+$("#sname").val()+"&idCard="+$("#sidCard").val()+"&telno="+$("#stelno").val();*/
	
}
function buying(uid) {
	var status=1;
	if($("#buying"+uid).val()=="禁用"){
		status=0;
	}
	/* alert($("#buying"+uid).val()+"======"+$("#buyend"+uid).val()); */
	
	$.ajax({  
		  url: "admin/updateUserStatusById.view",  
		  type:'post',
		  dataType:'text',  
		  data:{  
			  uid:uid,
			  status:status
		},  
		success:function(data){  
			$("#statustd"+uid).text(status);
			var d=status
			if(d==1)
			alert("该用户已被启用");
			else
				alert("该用户已被禁用")
			if (d=="1") {
				$("#buyend"+uid).val("禁用");
				$("#buying"+uid).val("禁用");
			}
			
			if (d=="0") {
				$("#buying"+uid).val("启用");
				$("#buyend"+uid).val("启用");
			}
		}
	}); 
}
</script>