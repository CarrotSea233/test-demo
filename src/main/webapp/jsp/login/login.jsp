<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
	<link rel="stylesheet" type="text/css" href="/test-demo/css/login-css.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
    <link rel="icon" href="/test-demo/favicon.ico" />

</head>
<body>
	<div id="bigBox">
			<h1>LOGIN</h1>
			<div class="inputBox">
				<form action="/test-demo/login-controller" method="post" class="layui-form">
					<div class="inputText">
						<i class="fa fa-user-circle" style="color: whitesmoke;"></i>
						<input type="text" placeholder="账号" name="account"/>
					</div>
					<div class="inputText">
						<i class="fa fa-key" style="color: whitesmoke;"></i>
						<input type="password" placeholder="密码" name="password"/>
					</div>
					<div class="" style="padding-top: 15px; padding-left: 20px; color: white;">
						<input type="radio" name="identity" value="student" id="student" checked title="学生">
						<input type="radio" name="identity" value="teacher" id="teacher" title="教师">
						<input type="radio" name="identity" value="admin" id="admin" title="管理员">
					</div>
					<input type="submit" class="inputButton" value="LOGIN" />
				</form>
			</div>
		</div>
</body>

<script src="/test-demo/utils/layui/layui.js"></script>


</html>
