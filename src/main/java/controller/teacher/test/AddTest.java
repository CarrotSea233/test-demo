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

@WebServlet("/teacher/add-test-servlet")
public class AddTest extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        // 新建作业
        String testName = request.getParameter("testName");
        String examId = request.getParameter("examId");
        LocalDateTime testStartTime = LocalDateTime.parse(request.getParameter("testStartTime"));
        LocalDateTime testEndTime = LocalDateTime.parse(request.getParameter("testEndTime"));
        String className = request.getParameter("className");

        Test test = new Test(testName, examId, testStartTime, testEndTime, className);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
        testMapper.insertTest(test);

        test = testMapper.getTest(test);

        try {
            response.sendRedirect("/test-demo/jsp/teacher/test/the-test-view.jsp?testId=" + test.getTestId());
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
