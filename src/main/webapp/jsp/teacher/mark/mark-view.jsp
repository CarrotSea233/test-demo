<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession,java.util.*" %>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>评卷管理</title>

        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
        <link rel="icon" href="/test-demo/favicon.ico" />

    </head>

    <body>

        <%
            String testId = request.getParameter("testId");
            String testName = request.getParameter("testName");
            String className = request.getParameter("className");
            String userName = request.getParameter("userName");
            String theMarkUserName = request.getParameter("theMarkUserName");

            if(testId == null) testId = "";
            if(testName == null) testName = "";
            if(className == null) className = "";
            if(userName == null) userName = "";
            if(theMarkUserName == null) theMarkUserName = "";

            TestStudentView test = new TestStudentView(testId, testName, className, userName, theMarkUserName);
            
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
			List<TestStudentView> tests = testMapper.findTestStudentViews(test);
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
                        <li class="layui-nav-item ">
                            <a href="javascript:;">题库管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/question/question-view.jsp">题库查看</a></dd>
                                <dd><a href="/test-demo/jsp/teacher/question/question-add.jsp">题目添加</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">试卷管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-view.jsp">试卷查看</a></dd>
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-add.jsp">试卷添加</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item  layui-nav-itemed">
                            <a href="javascript:;">考试管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/test/test-view.jsp">考试查看</a></dd>
                                <dd ><a 
                                        href="/test-demo/jsp/teacher/test/test-add.jsp">考试添加</a></dd>
                            </dl>
                        </li>
                        <li style="background-color: #16baaa;" class="layui-nav-item"><a style="color: white;" href="/test-demo/jsp/teacher/mark/mark-view.jsp">评卷管理</a></li>
                            <li class="layui-nav-item"><a href="/test-demo/jsp/teacher/score/score-view.jsp">成绩管理</a></li>

                    </ul>
                </div>
            </div>

            <!-- main -->
            <div class="layui-body">
                <div style="padding: 15px;">
                    <div class="layui-panel" style="min-height: calc(100vh - 60px - 32px);">
                        <div style="padding: 15px;">
                            <form class="layui-form layui-row layui-col-space16" action="/test-demo/jsp/teacher/mark/mark-view.jsp">
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">考试ID</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="testId" class="layui-input" value="<%=testId%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">考试名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="testName" class="layui-input" value="<%=testName%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">班级名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="className" class="layui-input" value="<%=className%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">学生姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userName" class="layui-input" value="<%=userName%>">
                                    </div>
                                </div>
                                <div class="layui-col-sm3 layui-inline">
                                    <label class="layui-form-label">评卷人</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="theMarkUserName" class="layui-input" value="<%=theMarkUserName%>">
                                    </div>
                                </div>
                            
                                <div class="layui-form-item" style="text-align: center;">
                                    <button class="layui-btn" lay-submit>查询</button>
                                </div>
                            </form>
                            
                            <table class="layui-table" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">考试ID</th>
                                        <th style="text-align: center;">考试名称</th>
                                        <th style="text-align: center;">班级名称</th>
                                        <th style="text-align: center;">学生姓名</th>
                                        <th style="text-align: center;">成绩</th>
                                        <th style="text-align: center;">评卷人</th>
                                        <th style="text-align: center;">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        for(int i=0; i<tests.size(); i++) {
                                            out.print("<tr>"+
                                                "<td>"+tests.get(i).getTestId()+"</td>"+
                                                "<td>"+tests.get(i).getTestName()+"</td>"+
                                                "<td>"+tests.get(i).getClassName()+"</td>"+
                                                "<td>"+tests.get(i).getUserName()+"</td>"+
                                                "<td>"+tests.get(i).getTotalScore()+"</td>"+
                                                "<td>"+tests.get(i).getTheMarkUserName()+"</td>"+
                                                "<td><button type='button' class='layui-btn' onclick='toTheStudentTest("+ tests.get(i).getTestId()+","+ tests.get(i).getUserId() +")'>评卷</button></td>"+
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
    <script src="/test-demo/js/teacher/test.js"></script>

    </html>