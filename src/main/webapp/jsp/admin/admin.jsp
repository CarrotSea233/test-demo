<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理员页面</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>
		<div class="layui-layout layui-layout-admin">
			<!-- header -->
			<div class="layui-header">
				<!-- logo -->
				<div class="layui-logo layui-bg-black"><a href="/test-demo/jsp/admin/admin.jsp" style="color: white;">管理员</a></div>

				<!-- header_right -->
				<ul class="layui-nav layui-layout-right">
					<!-- 显示管理员名称及登出处理 -->
					<li class="layui-nav-item layui-show-sm-inline-block">
					  <a href="javascript:;">
						<img src="https://unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
						<span id="adminAccount"></span>
					  </a>
					  <dl class="layui-nav-child">
						<dd><a href="javascript:;" id="logoutButton">logout</a></dd>
					  </dl>
					</li>
				  </ul>
			</div>

			<!-- side -->
			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<ul class="layui-nav layui-nav-tree">
						<li class="layui-nav-item"><a href="/test-demo/jsp/admin/personal/person-information.jsp">个人信息</a></li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">教师管理</a>
							<dl class="layui-nav-child">
								<dd><a href="/test-demo/jsp/admin/teacher-menu/teacher-view.jsp">教师查看</a></dd>
								<dd><a href="/test-demo/jsp/admin/teacher-menu/teacher-add.jsp">教师添加</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">学生管理</a>
							<dl class="layui-nav-child">
								<dd><a href="/test-demo/jsp/admin/student-menu/student-view.jsp">学生查看</a></dd>
								<dd><a href="/test-demo/jsp/admin/student-menu/student-add.jsp">学生添加</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/admin/log-menu/log-view.jsp">登录日志管理</a></li>
						
					</ul>
				</div>
			</div>

			<!-- main -->
			<div class="layui-body">
				<div style="padding: 15px;">
					<div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
						<div style="padding: 15px;">
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	</body>

	<script src="/test-demo/utils/layui/layui.js"></script>
	<script>
		layui.use(function () {
			var element = layui.element;
			element.render('nav');
		});
		window.location.href = '/test-demo/jsp/admin/teacher-menu/teacher-view.jsp';
	</script>
	<script src="/test-demo/js/login-cookie.js"></script>

	</html>