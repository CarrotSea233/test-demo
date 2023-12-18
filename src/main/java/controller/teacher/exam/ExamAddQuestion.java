package controller.teacher.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ExamMapper;
import mapper.QuestionMapper;
import model.entity.Exam;
import model.entity.Question;
import model.entity.ReExamQuestion;
import utils.MyBatisUtil;

@WebServlet("/teacher/exam-add-question-servlet")
public class ExamAddQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        
        String examId = request.getParameter("examId");

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);

        // 添加试题

        String questionIds[] = request.getParameterValues("selectedQuestion");
        for(int i = 0; i < questionIds.length; i++) {
            String questionScore = request.getParameter("score" + questionIds[i]);
            if(questionScore == null || questionScore.equals("")) questionScore = "0";
            ReExamQuestion reExamQuestion = new ReExamQuestion(examId, questionIds[i], questionScore, i + 1 + "");
            examMapper.insertReExamQuestion(reExamQuestion);
        }


        try {
            response.sendRedirect("/test-demo/jsp/teacher/exam/the-exam-view.jsp?examId=" + examId);
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
