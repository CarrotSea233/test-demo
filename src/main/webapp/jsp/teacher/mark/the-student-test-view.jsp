<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="mapper.*,model.entity.*, model.view.*,utils.*,org.apache.ibatis.session.SqlSession,java.util.*" %>
    <html>

    <%
            String testId = request.getParameter("testId");
            String userId = request.getParameter("userId");
                
            SqlSession sqlSession = MyBatisUtil.getSqlSession();
            LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
            Login loginUser = loginMapper.getUserById(userId);
            
            StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
            Student student = studentMapper.getStudentByUserId(Integer.parseInt(userId));

            TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
            ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
            QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);

            Test test = testMapper.getTestById(testId);

            String examId = test.getExamId();
            List<ReExamQuestion> reQuestions = examMapper.listReExamQuestionByExamId(examId);
            List<Question> questions = new ArrayList<Question>();
            for(int i = 0; i < reQuestions.size(); i++) {
                Question question = questionMapper.getQuestionById(reQuestions.get(i).getQuestionId());
                questions.add(question);
            }
            List<Question> selectQuestions = new ArrayList<Question>();
            List<Question> judgeQuestions = new ArrayList<Question>();
            List<Question> fillInQuestions = new ArrayList<Question>();
            List<Question> shortAnswerQuestions = new ArrayList<Question>();
            for(int i = 0; i < questions.size(); i++) {
                if(questions.get(i).getQuestionTypes().equals("选择题")) selectQuestions.add(questions.get(i));
                if(questions.get(i).getQuestionTypes().equals("判断题")) judgeQuestions.add(questions.get(i));
                if(questions.get(i).getQuestionTypes().equals("填空题")) fillInQuestions.add(questions.get(i));
                if(questions.get(i).getQuestionTypes().equals("简答题")) shortAnswerQuestions.add(questions.get(i));
            }


		%>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=test.getTestName()%></title>

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
                            <form class="layui-form" action="/test-demo/teacher/update-student-test-servlet" method="post">

                                <input type="hidden" name="testId" value="<%=testId%>">

                                <input type="hidden" name="userId" value="<%=student.getUserId()%>">

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <table class="layui-table">
                                            <tr>
                                                <td style="border:none; font-weight:bold;">考试：<%=test.getTestName()%></td>
                                                <td style="border:none; font-weight:bold;">学生：<%=student.getUserName()%></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- 选择题 -->
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <table class="layui-table">
                                            <tr><td style="border:none; font-weight:bold;"><h2>一. 选择题</h2></td></tr>
                                            <%
                                                for(int i = 0; i < selectQuestions.size(); i++) {
                                                    out.print("<tr><td style='border:none; font-weight:bold;'>"+(i+1)+". "+selectQuestions.get(i).getQuestionDescription()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"A."+selectQuestions.get(i).getChoiceA()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"B."+selectQuestions.get(i).getChoiceB()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"C."+selectQuestions.get(i).getChoiceC()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"D."+selectQuestions.get(i).getChoiceD()+"</td></tr>");
                                                    ReTestQuestion reTestQuestion = new ReTestQuestion(testId, selectQuestions.get(i).getQuestionId(), "" + loginUser.getUserId());
                                                    reTestQuestion = testMapper.getReTestQuestionByTestAndQuestionAndUserId(reTestQuestion);
                                                    out.print("<tr><td style='border:none'>"+"学生的答案是："+reTestQuestion.getAnswer()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"正确答案是："+selectQuestions.get(i).getSolution()+"</td></tr>");
                                                    ReExamQuestion reExamQuestion = new ReExamQuestion(examId, selectQuestions.get(i).getQuestionId());
                                                    reExamQuestion = examMapper.getReExamQuestionByExamAndQuestionId(reExamQuestion);
                                                    out.print("<tr><td style='border:none'>"+"得分："+"<input type='test' name='score"+selectQuestions.get(i).getQuestionId()+"' style='max-width: 50px;' value='"+reTestQuestion.getTheScore()+"'>"+" / "+reExamQuestion.getQuestionScore()+"</td></tr>");
                                                    
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- 判断题 -->
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <table class="layui-table">
                                            <tr><td style="border:none; font-weight:bold;"><h2>二. 判断题</h2></td></tr>
                                            <%
                                                for(int i = 0; i < judgeQuestions.size(); i++) {
                                                    out.print("<tr><td style='border:none; font-weight:bold;'>"+(i+1)+". "+judgeQuestions.get(i).getQuestionDescription()+"</td></tr>");
                                                    ReTestQuestion reTestQuestion = new ReTestQuestion(testId, judgeQuestions.get(i).getQuestionId(), "" + loginUser.getUserId());
                                                    reTestQuestion = testMapper.getReTestQuestionByTestAndQuestionAndUserId(reTestQuestion);
                                                    out.print("<tr><td style='border:none'>"+"学生的答案是："+reTestQuestion.getAnswer()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"正确答案是："+judgeQuestions.get(i).getSolution()+"</td></tr>");
                                                    ReExamQuestion reExamQuestion = new ReExamQuestion(examId, judgeQuestions.get(i).getQuestionId());
                                                    reExamQuestion = examMapper.getReExamQuestionByExamAndQuestionId(reExamQuestion);
                                                    out.print("<tr><td style='border:none'>"+"得分："+"<input type='test' name='score"+judgeQuestions.get(i).getQuestionId()+"' style='max-width: 50px;' value='"+reTestQuestion.getTheScore()+"'>"+" / "+reExamQuestion.getQuestionScore()+"</td></tr>");
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- 填空题 -->
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <table class="layui-table">
                                            <tr><td style="border:none; font-weight:bold;"><h2>三. 填空题</h2></td></tr>
                                            <tr><td style="border:none;">说明：多个填空用中文的逗号”；“隔开</td></tr>
                                            <%
                                                for(int i = 0; i < fillInQuestions.size(); i++) {
                                                    out.print("<tr><td style='border:none; font-weight:bold;'>"+(i+1)+". "+fillInQuestions.get(i).getQuestionDescription()+"</td></tr>");
                                                    ReTestQuestion reTestQuestion = new ReTestQuestion(testId, fillInQuestions.get(i).getQuestionId(), "" + loginUser.getUserId());
                                                    reTestQuestion = testMapper.getReTestQuestionByTestAndQuestionAndUserId(reTestQuestion);
                                                    out.print("<tr><td style='border:none'>"+"学生的答案是："+reTestQuestion.getAnswer()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"正确答案是："+fillInQuestions.get(i).getSolution()+"</td></tr>");
                                                    ReExamQuestion reExamQuestion = new ReExamQuestion(examId, fillInQuestions.get(i).getQuestionId());
                                                    reExamQuestion = examMapper.getReExamQuestionByExamAndQuestionId(reExamQuestion);
                                                    out.print("<tr><td style='border:none'>"+"得分："+"<input type='test' name='score"+fillInQuestions.get(i).getQuestionId()+"' style='max-width: 50px;' value='"+reTestQuestion.getTheScore()+"'>"+" / "+reExamQuestion.getQuestionScore()+"</td></tr>");
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- 简答题 -->
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <table class="layui-table">
                                            <tr><td style="border:none; font-weight:bold;"><h2>四. 简答题</h2></td></tr>
                                            <%
                                                for(int i = 0; i < shortAnswerQuestions.size(); i++) {
                                                    out.print("<tr><td style='border:none; font-weight:bold;'>"+(i+1)+". "+shortAnswerQuestions.get(i).getQuestionDescription()+"</td></tr>");
                                                    ReTestQuestion reTestQuestion = new ReTestQuestion(testId, shortAnswerQuestions.get(i).getQuestionId(), "" + loginUser.getUserId());
                                                    reTestQuestion = testMapper.getReTestQuestionByTestAndQuestionAndUserId(reTestQuestion);
                                                    out.print("<tr><td style='border:none'>"+"学生的答案是："+reTestQuestion.getAnswer()+"</td></tr>");
                                                    out.print("<tr><td style='border:none'>"+"参考答案是："+shortAnswerQuestions.get(i).getSolution()+"</td></tr>");
                                                    ReExamQuestion reExamQuestion = new ReExamQuestion(examId, shortAnswerQuestions.get(i).getQuestionId());
                                                    reExamQuestion = examMapper.getReExamQuestionByExamAndQuestionId(reExamQuestion);
                                                    out.print("<tr><td style='border:none'>"+"得分："+"<input type='test' name='score"+shortAnswerQuestions.get(i).getQuestionId()+"' style='max-width: 50px;' value='"+reTestQuestion.getTheScore()+"'>"+" / "+reExamQuestion.getQuestionScore()+"</td></tr>");
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit>确认评卷</button>
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
    <script src="/test-demo/js/teacher/test.js"></script>

    </html>