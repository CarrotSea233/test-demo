<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession,java.util.*"%>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学生个人信息</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>

        <%  Login loginUser=CookieUtil.getCookie(request);
            SqlSession sqlSession=MyBatisUtil.getSqlSession();
            StudentMapper studentMapper=sqlSession.getMapper(StudentMapper.class);
            Student student = studentMapper.getStudentByUserId(loginUser.getUserId());
            sqlSession.close();
        %>


		<div class="layui-layout layui-layout-admin">
			<!-- header -->
			<div class="layui-header">
				<!-- logo -->
				<div class="layui-logo layui-bg-black"><a href="/test-demo/jsp/student/student.jsp" style="color: white;">学生</a></div>

				<!-- header_right -->
				<ul class="layui-nav layui-layout-right">
					<!-- 显示名称及登出处理 -->
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
						<li style="background-color: #16baaa;" class="layui-nav-item"><a style="color: white;" href="/test-demo/jsp/student/personal/person-information.jsp">个人信息</a></li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/student/test/test-view.jsp">作业布置查看</a></li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/student/score/score-view.jsp">成绩查看</a></li>
						
					</ul>
				</div>
			</div>

			<!-- main -->
			<div class="layui-body">
				<div style="padding: 15px;">
					<div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
						<div style="padding: 15px; max-width: 500px;">
							<form class="layui-form layui-form-pane" action="/test-demo/jsp/student/personal/person-update.jsp">   

                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">学号</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="studentId" class="layui-input" value="<%=student.getStudentId()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userName" class="layui-input" value="<%=student.getUserName()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">年级</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="grade" class="layui-input" value="<%=student.getGrade()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">班级</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="className" class="layui-input" value="<%=student.getClassName()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">专业</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="major" class="layui-input" value="<%=student.getMajor()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="gender" class="layui-input" value="<%=student.getGender()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">年龄</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="age" class="layui-input" value="<%=student.getAge()%>" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn" lay-submit>修改</button>
                                </div>
                            </form>
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

	</html>