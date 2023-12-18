package controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ExamMapper;
import mapper.LogMapper;
import utils.MyBatisUtil;

@WebServlet("/login/del-log-servlet")
public class DelLog extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();


        String logId = request.getParameter("logId");


        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        LogMapper logMapper = sqlSession.getMapper(LogMapper.class);
        logMapper.deleteLog(logId);


        try {
            response.sendRedirect("/test-demo/jsp/admin/log-menu/log-view.jsp");
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
