package controller.teacher.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.ExamMapper;
import model.entity.Exam;
import model.entity.ReExamQuestion;
import utils.MyBatisUtil;

@WebServlet("/teacher/update-exam-servlet")
public class UpdateExam extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        // 更新作业名
        String examId = request.getParameter("examId");
        String examName = request.getParameter("examName");

        Exam exam = new Exam(examId, examName);
        
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        examMapper.updateExam(exam);

        // 更新题目分数
        List<ReExamQuestion> questions = examMapper.listReExamQuestionByExamId(examId);

        for(int i = 0; i < questions.size(); i++) {
            String score = request.getParameter("score" + questions.get(i).getQuestionId());
            if(score == null || score.equals("")) continue;
            ReExamQuestion question = new ReExamQuestion(questions.get(i).getExamId(), questions.get(i).getQuestionId(), score);
            examMapper.updateTheQuestionScore(question);
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
