<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*, model.entity.*, model.view.*, utils.*, org.apache.ibatis.session.SqlSession, java.util.*" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录日志管理</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>

		<%
			String logId = request.getParameter("logId");
			String userName = request.getParameter("userName");
			String identity = request.getParameter("identity");
			String state = request.getParameter("state");

			if(logId == null) logId = "";
			if(userName == null) userName = "";
			if(identity == null) identity = "";
			if(state == null) state = "";

			LogView logView = new LogView(logId, userName, identity, state);
			
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			LogMapper logMapper = sqlSession.getMapper(LogMapper.class);
			List<LogView> logs = logMapper.findLogs(logView);
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
						<li class="layui-nav-item">
							<a href="javascript:;">学生管理</a>
							<dl class="layui-nav-child">
								<dd><a href="/test-demo/jsp/admin/student-menu/student-view.jsp">学生查看</a></dd>
								<dd><a href="/test-demo/jsp/admin/student-menu/student-add.jsp">学生添加</a></dd>
							</dl>
						</li>
						<li style="background-color: #16baaa;" class="layui-nav-item"><a style="color: white;" href="/test-demo/jsp/admin/log-menu/log-view.jsp">登录日志管理</a></li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/admin/data-menu/data-view.jsp">数据管理</a></li>
						
					</ul>
				</div>
			</div>

			<!-- main -->
			<div class="layui-body">
				<div style="padding: 15px;">
					<div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
						<div style="padding: 15px;">

							<form class="layui-form layui-row layui-col-space16" action="/test-demo/jsp/admin/log-menu/log-view.jsp">
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="logId" class="layui-input" value="<%=logId%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userName" class="layui-input" value="<%=userName%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">身份</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="identity" class="layui-input" value="<%=identity%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">状态</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="state" class="layui-input" value="<%=state%>">
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
									<th style="text-align: center;">姓名</th>
									<th style="text-align: center;">身份</th>
									<th style="text-align: center;">时间</th>
									<th style="text-align: center;">状态</th>
									<th colspan="2" style="text-align: center;">操作</thco>
								  </tr>
								</thead>
								<tbody>
									<% for(int i = 0; i < logs.size(); i++) { %>
											<tr>
											<td><%=logs.get(i).getLogId()%></td>
											<td><%=logs.get(i).getUserName()%></td>
											<td><%=logs.get(i).getIdentity()%></td>
											<td><%=logs.get(i).getLogTime()%></td>
											<td><%=logs.get(i).getState()%></td>
											<td><button type="button" class="layui-btn" onclick="toTheUser('<%=logs.get(i).getUserId()%>','<%=logs.get(i).getIdentity()%>')">查看</button></td>
											<td><button type="button" class="layui-btn layui-btn-danger" onclick="delTheLog('<%=logs.get(i).getLogId()%>')">删除</button></td>
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
	<script src="/test-demo/js/log.js"></script>

	</html>