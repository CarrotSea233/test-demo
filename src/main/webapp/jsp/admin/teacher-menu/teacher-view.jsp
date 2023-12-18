<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*, model.entity.*, model.view.*, utils.*, org.apache.ibatis.session.SqlSession, java.util.*" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>教师管理</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>

		<%
			String id = request.getParameter("userId");
			Integer userId = null;
			if(id != null && !"".equals(id)) userId = Integer.parseInt(id);

			String job = request.getParameter("jobId");
			Integer jobId = null;
			if(job != null && !"".equals(job)) jobId = Integer.parseInt(job);

			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String identity = request.getParameter("identity");
			String userName = request.getParameter("userName");
			String gender = request.getParameter("gender");

			String a = request.getParameter("age");
			Integer age = null;
			if(a != null && !"".equals(a)) age = Integer.parseInt(a);

			String entryYear = request.getParameter("entryYear");

			if(id == null) id = "";
			if(job == null) job = "";
			if(account == null) account = "";
			if(password == null) password = "";
			if(identity == null) identity = "";
			if(userName == null) userName = "";
			if(gender == null) gender = "";
			if(a == null) a = "";
			if(entryYear == null) entryYear = "";

			TeacherView teacherView = new TeacherView(userId, jobId, userName, account, password, identity, entryYear, gender, age);
			
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
			List<TeacherView> teachers = teacherMapper.listTeachers(teacherView);
			sqlSession.close();

		%>

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
						<li class="layui-nav-item"><a href="/test-demo/jsp/admin/personal/person-information.jsp" >个人信息</a></li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">教师管理</a>
							<dl class="layui-nav-child">
								<dd style="background-color: #16baaa;"><a href="/test-demo/jsp/admin/teacher-menu/teacher-view.jsp" style="color: white;">教师查看</a></dd>
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
						<li class="layui-nav-item"><a href="/test-demo/jsp/admin/data-menu/data-view.jsp">数据管理</a></li>
						
					</ul>
				</div>
			</div>

			<!-- main -->
			<div class="layui-body">
				<div style="padding: 15px;">
					<div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
						<div style="padding: 15px;">

							<form class="layui-form layui-row layui-col-space16" action="/test-demo/jsp/admin/teacher-menu/teacher-view.jsp">
								<div class="layui-col-sm3 layui-inline" >
									<label class="layui-form-label">ID</label>
									<div class="layui-input-block">
										<input type="text" name="userId" class="layui-input" value="<%=id%>">
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">工号</label>
									<div class="layui-input-block">
										<input type="text" name="jobId" class="layui-input" value="<%=job%>">
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">职位</label>
									<div class="layui-input-block">
										<input type="text" name="identity" class="layui-input" value="<%=identity%>">
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">账号</label>
									<div class="layui-input-block">
										<input type="text" name="account" class="layui-input" value="<%=account%>" >
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">姓名</label>
									<div class="layui-input-block">
										<input type="text" name="userName" class="layui-input" value="<%=userName%>">
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">性别</label>
									<div class="layui-input-block">
										<input type="text" name="gender" class="layui-input" value="<%=gender%>">
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">年龄</label>
									<div class="layui-input-block">
										<input type="text" name="age" class="layui-input" value="<%=a%>" >
									</div>
								</div>
								<div class="layui-col-sm3 layui-inline">
									<label class="layui-form-label">入职年份</label>
									<div class="layui-input-block">
										<input type="text" name="entryYear" id="date" lay-verify="date"
											placeholder="yyyy-MM-dd" class="layui-input" value="<%=entryYear%>" >
									</div>
								</div>
								

								<div class="layui-form-item" style="text-align: center;">
									<button class="layui-btn" lay-submit>查询</button>
								</div>
							</form>

							<table class="layui-table" style="text-align: center;">
								<thead>
								  <tr>
									<th style="text-align: center;">ID</th>
									<th style="text-align: center;">工号</th>
									<th style="text-align: center;">姓名</th>
									<th style="text-align: center;">账号</th>
									<th style="text-align: center;">身份</th>
									<th style="text-align: center;">性别</th>
									<th style="text-align: center;">年龄</th>
									<th style="text-align: center;">入职年份</th>
									<th colspan="2" style="text-align: center;">操作</thco>
								  </tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < teachers.size(); i++) {
											out.print("<tr>"+
												"<td>"+teachers.get(i).getUserId()+"</td>"+
												"<td>"+teachers.get(i).getJobId()+"</td>"+
												"<td>"+teachers.get(i).getUserName()+"</td>"+
												"<td>"+teachers.get(i).getAccount()+"</td>"+
												"<td>"+teachers.get(i).getIdentity()+"</td>"+
												"<td>"+teachers.get(i).getGender()+"</td>"+
												"<td>"+teachers.get(i).getAge()+"</td>"+
												"<td>"+teachers.get(i).getEntryYear()+"</td>"+
												"<td>"+"<button type='button' class='layui-btn' onclick='toTheTeacher("+ teachers.get(i).getUserId() +")'>查看</button>"+"</td>"+
												"<td>"+"<button type='button' class='layui-btn layui-btn-danger' onclick='delTheTeacher("+ teachers.get(i).getUserId() +")'>删除</button>"+"</td>"+
												"</tr>");
										}
									
									%>
								</tbody>
							</table>
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
		</script>
	<script src="/test-demo/js/login-cookie.js"></script>
	<script src="/test-demo/js/admin/teacher.js"></script>

	</html>