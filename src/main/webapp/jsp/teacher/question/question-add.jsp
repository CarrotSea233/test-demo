<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession" %>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>题目添加</title>

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
                                <dd><a href="/test-demo/jsp/teacher/question/question-view.jsp">题库查看</a></dd>
                                <dd style="background-color: #16baaa;"><a style="color: white;"
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
                        <div style="padding: 15px; max-width: 500px;">
                            <form class="layui-form layui-form-pane" action="/test-demo/teacher/add-question-servlet">

                                <div class="layui-form-item" pane>
                                    <label class="layui-form-label">题目类型</label>
                                    <div class="layui-input-block">
                                        <select name="questionTypes" lay-verify="required">
                                            <option value=""></option>
                                            <option value="选择题">选择题</option>
                                            <option value="判断题">判断题</option>
                                            <option value="填空题">填空题</option>
                                            <option value="简答题">简答题</option>
                                        </select>
                                    </div>
                                </div>
                                
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">题目名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="questionName" class="layui-input" value="">
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">题目描述</label>
                                    <div class="layui-input-block">
                                        <textarea name="questionDescription" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选项A</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="choiceA" class="layui-input" value="">
                                    </div>
                                </div>
                            
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选项B</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="choiceB" class="layui-input" value="">
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选项C</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="choiceC" class="layui-input" value="">
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选项D</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="choiceD" class="layui-input" value="">
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <label class="layui-form-label">答案</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="solution" class="layui-input" value="">
                                    </div>
                                </div>
                                
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="submitQuestion">提交</button>
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

            form.on('select(questionType)', function (data) {
                if (data.value === '选择题') {
                    $('.choice-option').show();
                } else {
                    $('.choice-option').hide();
                }
            });

            //若页面加载时题目类型已选择，则触发change事件
            var selectedQuestionType = $('select[name="questionTypes"]').val();
            if (selectedQuestionType === '选择题') {
                $('.choice-option').show();
            }
            
            form.render();

            // 日期
            laydate.render({
                elem: '#date'
            });

        });
    </script>
    <script src="/test-demo/js/login-cookie.js"></script>

    </html>