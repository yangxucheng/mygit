<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>注册</title>
  <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="admin_login_wrap">
  <h1>注册</h1>
  <div class="adming_login_border">
    <div class="admin_input">
      <form action="register.action" method="post" >
		<br/><font color = "red" size="-1">
			<i>${errors['register']}</i>
			</font>
		<label for="username">用户：</label>
		<input type="text" name="username" size="25" id="username" class="admin_input_style"/>
		<font id="usernameF" color="red"></font>
		<br/>
		<font color = "red" size="-1">
			<i>${errors['username']}</i>
			</font>
		
		<label for="password">密码：</label>
		<input type="password" id="password" size="25"class="admin_input_style"/>
		<font color="red"></font>
		<br/><font color = "red" size="-1">
			<i>${errors['password']}</i>
			</font>
		
		<label for="confirmPassword">确认密码：</label>
		<input type="password" name="password" size="25"id="passwordC" class="admin_input_style"/>
		<br/><font id="passwordF" color="red"></font>
		<font color = "red" size="-1">
			<i>${errors['password']}</i>
			</font>
		
		<label for="name">真实姓名：</label>
		<input type="text" name="name" id="name"size="25" class="admin_input_style"/>
		<font id="nameF" color="red"></font>
		
		
		<label for="sex">性别：</label>
		<input type="radio" name="gender" value="1" checked="checked"/><img src="images/nan.gif">
		<input type="radio" name="gender" value="0"/><img src="images/nv.gif">
		<br/><font color = "red" size="-1">
			<i>${errors['gender']}</i>
			</font>
		
		<label for="idCard">身份证号：</label>
		<input type="text" name="idCard" id="idCard" size="25"maxlength="18" class="admin_input_style"/>
		<font id="idCardF" color="red"></font>
		<br/><font color = "red" size="-1">
			<i>${errors['idCard']}</i>
			</font>
		
		<label for="age">年龄：</label>
		<input type="number" name="age" id="age" size="25"class="admin_input_style"/>
		<font id="ageF" color="red"></font>
		<br/><font color = "red" size="-1">
			<i>${errors['age']}</i>
			</font>
		
		<label for="address">地址：</label>
		<input type="text" name="address" id="address"size="25" class="admin_input_style"/>
		<font id="addressF" color="red"></font>
		
		<br/>	<font color = "red" size="-1">
			<i>${errors['address']}</i>
			</font>
		
		
		<label for="phoneNumber">联系电话：</label>
		<input type="text" name="telno" id="telno" size="25"class="admin_input_style"/>
		<font id="telnoF" color="red"></font>
		<br/><font color = "red" size="-1">
			<i>${errors['telno']}</i>
			</font>
		
		<input type="submit" value="注册"size="25" class="btn btn-primary"/>
		<input type="reset" value="重置" size="25"class="btn btn-primary"/>
		<p style="margin-left: 200px"><a href="login.jsp">登录</a></p>
		</form>
       
    </div>
  </div>
    <p class="admin_copyright">&copy; 2017 Powered by 11组</a></p>
</div>
</body>
</html>