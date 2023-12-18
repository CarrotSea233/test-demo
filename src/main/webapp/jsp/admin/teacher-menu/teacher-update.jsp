<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="mapper.*, model.entity.*, model.view.*, utils.*, org.apache.ibatis.session.SqlSession, java.util.*"%>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>教师信息修改</title>

        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/test-demo/utils/layui/css/layui.css" rel="stylesheet">
        <link rel="icon" href="/test-demo/favicon.ico" />

    </head>

    <body>

        <%
            String id = request.getParameter("userId");
            if(id == null) id = "10";
            Integer userId = Integer.parseInt(id);
            SqlSession sqlSession = MyBatisUtil.getSqlSession();
            TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
            TeacherView teacher = teacherMapper.getTeacherByUserId(userId);
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
                            <li class="layui-nav-item"><a href="/test-demo/jsp/admin/personal/person-information.jsp">个人信息</a></li>
                            <li class="layui-nav-item layui-nav-itemed">
                                <a href="javascript:;">教师管理</a>
                                <dl class="layui-nav-child">
                                    <dd style="background-color: #16baaa;"><a href="/test-demo/jsp/admin/teacher-menu/teacher-view.jsp" style="color: white;">教师查看</a></dd>
                                    <dd ><a href="/test-demo/jsp/admin/teacher-menu/teacher-add.jsp">教师添加</a></dd>
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
                            <div style="padding: 15px; max-width: 500px;">
                                <form class="layui-form layui-form-pane" action="/test-demo/admin/update-teacher-servlet">
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">ID</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="userId" class="layui-input" value="<%=teacher.getUserId()%>" readonly>
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">工号</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="jobId" class="layui-input" value="<%=teacher.getJobId()%>" readonly>
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">职位</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="identity" class="layui-input" value="<%=teacher.getIdentity()%>" readonly>
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">账号</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="account" class="layui-input" value="<%=teacher.getAccount()%>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">密码</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="password" class="layui-input" value="<%=teacher.getPassword()%>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">姓名</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="userName" class="layui-input" value="<%=teacher.getUserName()%>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">性别</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="gender" class="layui-input" value="<%=teacher.getGender()%>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">年龄</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="age" class="layui-input" value="<%=teacher.getAge()%>">
                                        </div>
                                    </div>
                                    <div class="layui-form-item" pane>
                                        <label class="layui-form-label">入职年份</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="entryYear" id="date" lay-verify="date"
                                                placeholder="yyyy-MM-dd" class="layui-input" value="<%=teacher.getEntryYear()%>">
                                        </div>
                                    </div>
                                    

                                    <div class="layui-form-item">
                                        <button class="layui-btn" lay-submit>确认</button>
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
        layui.use(['laydate'], function(){
          var laydate = layui.laydate;
          
          // 日期
          laydate.render({
            elem: '#date'
          });
          
        });
        </script>
    <script src="/test-demo/js/login-cookie.js"></script>

    </html>