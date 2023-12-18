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

@WebServlet("/teacher/update-question-servlet")
public class QuestionUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        // question_id, question_types, question_name, creation_time, modification_time, 
        // question_description, choice_a, choice_b, choice_c, choice_d, solution

        String questionId = request.getParameter("questionId");
        String questionTypes = request.getParameter("questionTypes");
        String questionName = request.getParameter("questionName");
        String questionDescription = request.getParameter("questionDescription");
        String choiceA = request.getParameter("choiceA");
        String choiceB = request.getParameter("choiceB");
        String choiceC = request.getParameter("choiceC");
        String choiceD = request.getParameter("choiceD");
        String solution = request.getParameter("solution");


        Question question = new Question(questionId, questionTypes, questionName, questionDescription, choiceA, choiceB, choiceC, choiceD, solution);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        QuestionMapper questionMapper = sqlSession.getMapper(QuestionMapper.class);
        questionMapper.updateQuestion(question);


        try {
            response.sendRedirect("/test-demo/jsp/teacher/question/the-question-view.jsp?questionId=" + questionId);
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
