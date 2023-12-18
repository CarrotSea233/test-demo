package controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.format.DateTimeFormatter;

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
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/logout-controller")
public class LogOutController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        // 写入登录日志
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        Login user = CookieUtil.getCookie(request);
        LogMapper logMapper = sqlSession.getMapper(LogMapper.class);
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String logTime = formatter.format(date);
        Log log = new Log("" + user.getUserId(), logTime, "logout");
        logMapper.insertLog(log);

        // 删除Cookie
        String retValue = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("loginUser")) {
                retValue = cookies[i].getValue();
                break;
            }
        }
        Cookie cookie = new Cookie("loginUser", retValue);
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        try {
            response.sendRedirect("/test-demo/jsp/login/login.jsp");
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
