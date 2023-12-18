package controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.LogMapper;
import mapper.LoginMapper;
import model.entity.Log;
import model.entity.Login;
import utils.MyBatisUtil;

@WebServlet("/login-controller")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");
        Login loginUser = new Login(account, password, identity);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
        Login user = loginMapper.getLoginUser(loginUser);

        EnvironmentSettings settings = EnvironmentSettings
            .newInstance()
            .inStreamingMode() // 声明为流任务
            //.inBatchMode() // 声明为批任务
            .build();
        

        try {
            if (user == null) {
                writer.print("登录失败");
                // response.sendRedirect("");
            } else {
                writer.print("登录成功");
                writer.print(loginUser);

                String loginCode = URLEncoder.encode(user.toString(), "utf-8");
                Cookie c1 = new Cookie("loginUser", loginCode);
                c1.setMaxAge(3*24*3600);
                response.addCookie(c1);

                writer.print("设置cookie成功");

                // 插入登录日志
                LogMapper logMapper = sqlSession.getMapper(LogMapper.class);
                Date date = new Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                String logTime = formatter.format(date);
                Log log = new Log(""+user.getUserId(), logTime, "login");
                logMapper.insertLog(log);

                // 进入管理员页面
                if (identity.equals("admin")) {
                    response.sendRedirect("jsp/admin/admin.jsp");
                } else if(identity.equals("teacher")) {
                    response.sendRedirect("/test-demo/jsp/teacher/teacher.jsp");
                } else {
                    response.sendRedirect("/test-demo/jsp/student/student.jsp");
                }

                writer.print("没跳");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
            writer.flush();
            writer.close();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
