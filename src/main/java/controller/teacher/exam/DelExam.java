package controller.teacher.exam;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ExamMapper;
import utils.MyBatisUtil;

@WebServlet("/teacher/del-exam-servlet")
public class DelExam extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();


        String examId = request.getParameter("examId");


        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.deleteExamQuestions(examId);
        examMapper.deleteExam(examId);


        try {
            response.sendRedirect("/test-demo/jsp/teacher/exam/exam-view.jsp");
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
