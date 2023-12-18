package controller.teacher.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AdminMapper;
import mapper.LoginMapper;
import mapper.QuestionMapper;
import mapper.TeacherMapper;
import model.entity.Admin;
import model.entity.Login;
import model.entity.Question;
import model.entity.Teacher;
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/teacher/del-question-servlet")
public class DelQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();


        String questionId = request.getParameter("questionId");


        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        questionMapper.deleteQuestion(questionId);


        try {
            response.sendRedirect("/test-demo/jsp/teacher/question/question-view.jsp");
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
