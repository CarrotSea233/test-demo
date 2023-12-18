<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession,java.util.List, java.util.ArrayList" %>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>成绩查看</title>

        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
        <link rel="icon" href="/test-demo/favicon.ico" />

    </head>

    <body>

        <%
            Login loginUser = CookieUtil.getCookie(request);
            
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            Student student = studentMapper.getStudentByUserId(loginUser.getUserId());
            
            ScoreMapper scoreMapper = sqlSession.getMapper(ScoreMapper.class);
            List<Score> scores = scoreMapper.listEndScoreByUserId(""+loginUser.getUserId());

			TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
            List<Test> tests = new ArrayList<Test>();

            for(int i = 0; i < scores.size(); i++) {
                Test test = testMapper.getTestById(scores.get(i).getTestId());
                tests.add(test);
            }
            

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
						<li class="layui-nav-item"><a href="/test-demo/jsp/student/personal/person-information.jsp">个人信息</a></li>
						<li class="layui-nav-item"><a href="/test-demo/jsp/student/test/test-view.jsp">作业布置查看</a></li>
						<li style="background-color: #16baaa;" class="layui-nav-item"><a style="color: white;" href="/test-demo/jsp/student/score/score-view.jsp">成绩查看</a></li>
						
					</ul>
				</div>
			</div>

            <!-- main -->
            <div class="layui-body">
                <div style="padding: 15px;">
                    <div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
                        <div style="padding: 15px;">
                            <table class="layui-table" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">作业布置名称</th>
                                        <th style="text-align: center;">作业布置开始时间</th>
                                        <th style="text-align: center;">作业布置结束时间</th>
                                        <th style="text-align: center;">作业布置班级</th>
                                        <th style="text-align: center;">成绩</th>
                                        <th style="text-align: center;">状态</th>
                                        <th style="text-align: center;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        for(int i=0; i<tests.size(); i++) {
                                            
                                            out.print("<tr>"+
                                                "<td>"+tests.get(i).getTestName()+"</td>"+
                                                "<td>"+"<input type='datetime-local' name='testStartTime' class='layui-input' value='"+tests.get(i).getTestStartTime()+"' disabled style='border-style:none;'>"+"</td>"+
                                                "<td>"+"<input type='datetime-local' name='testEndTime' class='layui-input' value='"+tests.get(i).getTestEndTime()+"' disabled style='border-style:none'>"+"</td>"+
                                                "<td>"+tests.get(i).getClassName()+"</td>"+
                                                "<td>"+scores.get(i).getTotalScore()+"</td>"+
                                                "<td>"+"<div id='theTestState'>已结束</div>"+"</td>"+
                                                "<td><button type='button' class='layui-btn' onclick='toTheStudentEndTest("+ tests.get(i).getTestId() +")'>查看作业</button></td>"+
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
        layui.use(['laydate', 'form'], function () {
            var laydate = layui.laydate;
            var form = layui.form;


            // 日期
            laydate.render({
                elem: '#date'
            });

        });
    </script>
    <script src="/test-demo/js/login-cookie.js"></script>
    <script src="/test-demo/js/student/test.js"></script>

    </html>