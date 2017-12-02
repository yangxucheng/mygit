<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>注册</title>
  <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function chkuserinput(form){
if(form.username.value==""){
 alert("请输入用户名!");
 form.username.select();
 return(false);
}
if(form.passwd.value==""){
 alert("请输入用户密码!");
 form.pwd.select();
 return(false);
}
if(form.passwd.value!=form.confirmPassword.value){
 alert("密码不一致!");
 form.yz.select();
 return(false);
}
return(true); 
}
</script>
<body>
<div class="admin_login_wrap">
  <h1>注册</h1>
  <div class="adming_login_border">
    <div class="admin_input">
      <form action="user/register.action" method="post" onSubmit="return chkuserinput(this)">
        <ul class="admin_items">
          <li>
            <label for="username">用户：</label>
            <input type="text" name="username" value="" id="username" size="25" class="admin_input_style" placeholder="请输入用户名"/>
          </li>
          <li>
            <label for="password">密码：</label>
            <input type="password" name="password" value="" id="password" size="25" class="admin_input_style" placeholder="请输入密码"/>
          </li>
	  <li>
            <label for="confirmPassword">确认密码：</label>
            <input type="password" name="confirmPassword" value="" id="confirmPassword" size="25" class="admin_input_style" placeholder="请输入确认密码"/>
          </li>
 	 <li>
            <label for="name">真实姓名：</label>
            <input type="text" name="name" value="" id="name" size="25" class="admin_input_style" placeholder="请输入真实姓名"/>
          </li>
           <li>
            <label for="sex">性别：</label>
            <input type="radio" name="genders" value="0" id="sex" size="40" class="admin_input_style" />男
	    <input type="radio" name="genders" value="1" id="sex" size="40" class="admin_input_style" />女
          </li>
          <li>
            <label for="name">年龄：</label>
            <input type="text" name="ages" value="" id="username" size="25" class="admin_input_style" placeholder="请输入年龄"/>
          </li>
           <li>
            <label for="idCard">身份证号：</label>
            <input type="text" name="idCard" value="" id="idCard" size="25" class="admin_input_style" placeholder="请输入身份证号" />
          </li>
	   <li>
            <label for="address">地址：</label>
            <input type="text" name="address" value="" id="address" size="25" class="admin_input_style" placeholder="请输入地址"/>
          </li>
	 <li>
            <label for="phoneNumber">联系电话：</label>
            <input type="text" name="phoneNumber" value="" id="phoneNumber" size="25" class="admin_input_style" placeholder="请输入联系电话"/>
          </li>
          <li>
              <input type="submit" name="submit" value="注册" class="btn btn-primary" />
          </li>
	<p style="margin-left: 200px"><a href="/user/login.jsp">登录</a></p>
        </ul>
      </form>
    </div>
  </div>
    <p class="admin_copyright">&copy; 2017 Powered by 11组</a></p>
</div>
</body>
</html>