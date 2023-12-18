package controller.teacher.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ExamMapper;
import mapper.QuestionMapper;
import mapper.TestMapper;
import model.entity.Exam;
import model.entity.Question;
import model.entity.ReExamQuestion;
import model.entity.Test;
import utils.MyBatisUtil;

@WebServlet("/teacher/del-test-servlet")
public class DelTest extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String testId = request.getParameter("testId");


        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
        testMapper.deleteTest(testId);

        try {
            response.sendRedirect("/test-demo/jsp/teacher/test/test-view.jsp");
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
