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

@WebServlet("/teacher/add-exam-servlet")
public class AddExam extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        // 新建作业
        String examName = request.getParameter("examName");

        Date date = new Date(); 
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        
        String creationTime = formatter.format(date);
        String modificationTime = formatter.format(date);

        Exam exam = new Exam(examName, creationTime, modificationTime);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.insertExam(exam);

        exam = examMapper.getExam(exam);

        // 建立题目和作业的关系

        String questionIds[] = request.getParameterValues("selectedQuestion");
        for(int i = 0; i < questionIds.length; i++) {
            String questionScore = request.getParameter("score" + questionIds[i]);
            if(questionScore == null || questionScore.equals("")) questionScore = "0";
            ReExamQuestion reExamQuestion = new ReExamQuestion(exam.getExamId(), questionIds[i], questionScore, i + 1 + "");
            examMapper.insertReExamQuestion(reExamQuestion);
        }


        try {
            response.sendRedirect("/test-demo/jsp/teacher/exam/the-exam-view.jsp?examId=" + exam.getExamId());
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
