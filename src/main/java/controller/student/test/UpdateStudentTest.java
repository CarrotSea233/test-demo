package controller.student.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AdminMapper;
import mapper.ExamMapper;
import mapper.QuestionMapper;
import mapper.ScoreMapper;
import mapper.StudentMapper;
import mapper.TeacherMapper;
import mapper.TestMapper;
import model.entity.Admin;
import model.entity.Login;
import model.entity.Question;
import model.entity.ReExamQuestion;
import model.entity.ReTestQuestion;
import model.entity.Score;
import model.entity.Student;
import model.entity.Teacher;
import model.entity.Test;
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/student/update-student-test-servlet")
public class UpdateStudentTest extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String testId = request.getParameter("testId");
                
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
        ExamMapper examMapper = sqlSession.getMapper(ExamMapper.class);
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);

        Test test = testMapper.getTestById(testId);

        // 获取作业题目
        String examId = test.getExamId();
        List<ReExamQuestion> reQuestions = examMapper.listReExamQuestionByExamId(examId);
        List<Question> questions = new ArrayList<Question>();
        for(int i = 0; i < reQuestions.size(); i++) {
            Question question = questionMapper.getQuestionById(reQuestions.get(i).getQuestionId());
            questions.add(question);
        }

        String userId = "" + CookieUtil.getCookie(request).getUserId();

        // 自动评卷并记录到数据库里
        Integer totalScore = 0;

        for(int i = 0; i < questions.size(); i++) {
            String answer = request.getParameter("answer" + questions.get(i).getQuestionId());
            String score = "0";
            if(questions.get(i).getSolution().equals(answer)) {
                score = reQuestions.get(i).getQuestionScore();
                totalScore += Integer.parseInt(score);
            }
            ReTestQuestion reTestQuestion = new ReTestQuestion(testId, questions.get(i).getQuestionId(), userId, answer, score);
            testMapper.insertReTestQuestion(reTestQuestion);
        }

        // 记录总分
        Score score = new Score(userId, testId, "" + totalScore, "已结束", "22");

        ScoreMapper socreMapper = sqlSession.getMapper(ScoreMapper.class);
        socreMapper.insertScore(score);
        


        try {
            response.sendRedirect("/test-demo/jsp/student/test/test-view.jsp");
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
