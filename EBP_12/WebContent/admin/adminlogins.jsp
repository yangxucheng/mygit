<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>用户登录</title>
  <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function chkuserinput(form){
if(form.username.value==""){
 alert("请输入管理员名!");
 form.username.select();
 return(false);
}
if(form.pwd.value==""){
 alert("请输入用户密码!");
 form.pwd.select();
 return(false);
}

return(true); 
}
</script>
<body>
<div class="admin_login_wrap">
  <h1>管理员登录</h1>
  <div class="adming_login_border">
    <div class="admin_input">
      <form action='<c:url value="/AdminLogin.action"/>' method="post" onSubmit="return chkuserinput(this)">
        <ul class="admin_items">
          <li>
            <label for="user">管理员名：</label>
            <input type="text" name="username" value="" id="username" size="25" class="admin_input_style" />
          </li>
          <li>
            <label for="pwd">密码：</label>
            <input type="password" name="password" value="" id="password" size="25" class="admin_input_style" />
          </li>
          <li>
              <input type="submit" name="submit" value="登录" class="btn btn-primary" />
          </li>
        </ul>
      </form>
    </div>
  </div>
    <p class="admin_copyright">&copy; 2017 Powered by 11组</a></p>
</div>
</body>
</html>