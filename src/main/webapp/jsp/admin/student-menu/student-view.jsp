<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*, model.entity.*, model.view.*, utils.*, org.apache.ibatis.session.SqlSession, java.util.*" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学生管理</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>

		<%
            String userId = request.getParameter("userId");
            String studentId = request.getParameter("studentId");
            String userName = request.getParameter("userName");
            String grade = request.getParameter("grade");
            String className = request.getParameter("className");
            String major = request.getParameter("major");
            String gender = request.getParameter("gender");
            String age = request.getParameter("age");

			if(userId == null) userId = "";
			if(studentId == null) studentId = "";
			if(userName == null) userName = "";
			if(grade == null) grade = "";
			if(className == null) className = "";
			if(major == null) major = "";
			if(gender == null) gender = "";
			if(age == null) age = "";

			StudentView studentView = new StudentView(userId, studentId, userName, grade, className, major, gender, age);
			
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
			List<StudentView> students = studentMapper.findStudents(studentView);
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
						<li class="layui-nav-item">
							<a href="javascript:;">教师管理</a>
							<dl class="layui-nav-child">
								<dd><a href="/test-demo/jsp/admin/teacher-menu/teacher-view.jsp">教师查看</a></dd>
								<dd><a href="/test-demo/jsp/admin/teacher-menu/teacher-add.jsp">教师添加</a></dd>
							</dl>
						</li>
						<li class="layui-nav-item layui-nav-itemed">
							<a href="javascript:;">学生管理</a>
							<dl class="layui-nav-child">
								<dd style="background-color: #16baaa;"><a style="color: white;" href="/test-demo/jsp/admin/student-menu/student-view.jsp">学生查看</a></dd>
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

							<form class="layui-form layui-row layui-col-space16" action="/test-demo/jsp/admin/student-menu/student-view.jsp">
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userId" class="layui-input" value="<%=userId%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">学号</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="studentId" class="layui-input" value="<%=studentId%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userName" class="layui-input" value="<%=userName%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">年级</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="grade" class="layui-input" value="<%=grade%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">班级</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="className" class="layui-input" value="<%=className%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">专业</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="major" class="layui-input" value="<%=major%>">
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
                                        <input type="text" name="age" class="layui-input" value="<%=age%>">
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
                                        <th style="text-align: center;">学号</th>
                                        <th style="text-align: center;">姓名</th>
                                        <th style="text-align: center;">年级</th>
                                        <th style="text-align: center;">班级</th>
                                        <th style="text-align: center;">专业</th>
                                        <th style="text-align: center;">性别</th>
                                        <th style="text-align: center;">年龄</th>
                                        <th colspan="2" style="text-align: center;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(int i = 0; i < students.size(); i++) { %>
                                    <tr>
                                        <td><%= students.get(i).getUserId() %></td>
                                        <td><%= students.get(i).getStudentId() %></td>
                                        <td><%= students.get(i).getUserName() %></td>
                                        <td><%= students.get(i).getGrade() %></td>
                                        <td><%= students.get(i).getClassName() %></td>
                                        <td><%= students.get(i).getMajor() %></td>
                                        <td><%= students.get(i).getGender() %></td>
                                        <td><%= students.get(i).getAge() %></td>
                                        <td><button type="button" class="layui-btn" onclick="toTheStudent('<%= students.get(i).getUserId() %>')">查看</button></td>
                                        <td><button type="button" class="layui-btn layui-btn-danger" onclick="delTheStudent('<%= students.get(i).getUserId() %>')">删除</button></td>
                                    </tr>
                                    <% } %>
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
	<script src="/test-demo/js/admin/student.js"></script>

	</html>