<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession,java.util.*" %>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>作业布置添加</title>

        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
        <link rel="icon" href="/test-demo/favicon.ico" />

    </head>

    <body>

        <%
			SqlSession sqlSession = MyBatisUtil.getSqlSession();
			ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
			List<Exam> exams = examMapper.listExams();
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
                            <a href="javascript:;">作业管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-view.jsp">作业查看</a></dd>
                                <dd><a href="/test-demo/jsp/teacher/exam/exam-add.jsp">作业添加</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item  layui-nav-itemed">
                            <a href="javascript:;">作业布置管理</a>
                            <dl class="layui-nav-child">
                                <dd><a href="/test-demo/jsp/teacher/test/test-view.jsp">作业布置查看</a></dd>
                                <dd style="background-color: #16baaa;"><a style="color: white;"
                                        href="/test-demo/jsp/teacher/test/test-add.jsp">作业布置添加</a></dd>
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
                            <form class="layui-form" action="/test-demo/teacher/add-test-servlet" method="get">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">作业布置名称</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="testName" lay-verify="required" placeholder="请输入作业布置名称" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">作业</label>
                                        <div class="layui-input-inline">
                                            <select name="examId" lay-verify="required">
                                                <option value="">请选择作业</option>
                                                <% 
                                                    for(int i=0; i<exams.size(); i++) {
                                                        out.print("<option value='" + exams.get(i).getExamId() + "'>" + exams.get(i).getExamName() + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">开始时间</label>
                                        <div class="layui-input-block">
                                            <input type="datetime-local" name="testStartTime" lay-verify="required" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">结束时间</label>
                                        <div class="layui-input-inline">
                                            <input type="datetime-local" name="testEndTime" lay-verify="required" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">作业布置班级</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="className" lay-verify="required" placeholder="请输入班级名称" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <button class="layui-btn" lay-submit lay-filter="add-test">添加作业布置</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
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
    <script src="/test-demo/js/teacher/question.js"></script>

    </html>