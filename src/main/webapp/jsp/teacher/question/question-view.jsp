<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*, model.entity.*, model.view.*, utils.*, org.apache.ibatis.session.SqlSession, java.util.*" %>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>题库管理</title>

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
		<link rel="icon" href="/test-demo/favicon.ico" />

	</head>

	<body>

		<%
            String questionId = request.getParameter("questionId");
            String questionTypes = request.getParameter("questionTypes");
            String questionName = request.getParameter("questionName");
            String creationTime = request.getParameter("creationTime");
            String modificationTime = request.getParameter("modificationTime");

            if(questionId == null) questionId = "";
            if(questionTypes == null) questionTypes = "";
            if(questionName == null) questionName = "";
            if(creationTime == null) creationTime = "";
            if(modificationTime == null) modificationTime = "";


			Question question = new Question(questionId, questionTypes, questionName, creationTime, modificationTime);
			
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
			List<Question> questions = questionMapper.findQuestions(question);
			sqlSession.close();

		%>

		<div class="layui-layout layui-layout-admin">
			<!-- header -->
            <div class="layui-header">
                <!-- logo -->
                <div class="layui-logo layui-bg-black"><a href="/test-demo/jsp/teacher/teacher.jsp"
                        style="color: white;">教师</a></div>

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
                        <li class="layui-nav-item"><a
                                href="/test-demo/jsp/teacher/personal/person-information.jsp">个人信息</a></li>
                        <li class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;">题库管理</a>
                            <dl class="layui-nav-child">
                                <dd style="background-color: #16baaa;"><a style="color: white;" href="/test-demo/jsp/teacher/question/question-view.jsp">题库查看</a></dd>
                                <dd><a 
                                        href="/test-demo/jsp/teacher/question/question-add.jsp">题目添加</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">作业管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-view.jsp">作业查看</a></dd>
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-add.jsp">作业添加</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">作业布置管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/test/test-view.jsp">作业布置查看</a></dd>
                                <dd><a href="/test-demo/jsp/teacher/test/test-add.jsp">作业布置添加</a></dd>
                            </dl>
                        </li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/teacher/mark/mark-view.jsp">评卷管理</a></li>
                            <li class="layui-nav-item"><a href="/test-demo/jsp/teacher/score/score-view.jsp">成绩管理</a></li>
                    </ul>
                </div>
            </div>

			<!-- main -->
			<div class="layui-body">
				<div style="padding: 15px;">
					<div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
						<div style="padding: 15px;">

							<form class="layui-form layui-row layui-col-space16" action="/test-demo/jsp/teacher/question/question-view.jsp">
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">题目ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="questionId" class="layui-input" value="<%=questionId%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">题目类型</label>
                                    <div class="layui-input-block">
                                        <!-- <input type="text" name="questionTypes" class="layui-input" value="<%=questionTypes%>"> -->
                                        <select name="questionTypes" value="<%=questionTypes%>">
                                            <option value=""></option>
                                            <option value="选择题">选择题</option>
                                            <option value="判断题">判断题</option>
                                            <option value="填空题">填空题</option>
                                            <option value="简答题">简答题</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">题目名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="questionName" class="layui-input" value="<%=questionName%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">创建时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="creationTime" class="layui-input" value="<%=creationTime%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">修改时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="modificationTime" class="layui-input" value="<%=modificationTime%>">
                                    </div>
                                </div>
                            
                                <div class="layui-form-item" style="text-align: center;">
                                    <button class="layui-btn" lay-submit>查询</button>
                                </div>
                            </form>

                            <table class="layui-table" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">题目ID</th>
                                        <th style="text-align: center;">题目类型</th>
                                        <th style="text-align: center;">题目名称</th>
                                        <th style="text-align: center;">创建时间</th>
                                        <th style="text-align: center;">修改时间</th>
                                        <th colspan="2" style="text-align: center;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        for(int i=0; i<questions.size(); i++) {
                                            out.print("<tr>"+
                                                "<td>"+questions.get(i).getQuestionId()+"</td>"+
                                                "<td>"+questions.get(i).getQuestionTypes()+"</td>"+
                                                "<td>"+questions.get(i).getQuestionName()+"</td>"+
                                                "<td>"+questions.get(i).getCreationTime()+"</td>"+
                                                "<td>"+questions.get(i).getModificationTime()+"</td>"+
                                                "<td><button type='button' class='layui-btn' onclick='toTheQuestion("+ questions.get(i).getQuestionId() +")'>查看</button></td>"+
                                                "<td><button type='button' class='layui-btn layui-btn-danger' onclick='delTheQuestion("+ questions.get(i).getQuestionId() +")'>删除</button></td>"+
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
    <script src="/test-demo/js/teacher/question.js"></script>

	</html>