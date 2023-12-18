package controller.student.personal;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.AdminMapper;
import mapper.StudentMapper;
import mapper.TeacherMapper;
import model.entity.Admin;
import model.entity.Login;
import model.entity.Student;
import model.entity.Teacher;
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/student/update-person-servlet")
public class UpdatePerson extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String userId = "" + CookieUtil.getCookie(request).getUserId();
        String userName = request.getParameter("userName");
        String studentId = request.getParameter("studentId");
        String grade = request.getParameter("grade");
        String className = request.getParameter("className");
        String major = request.getParameter("major");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        Student student = new Student(userId, studentId, userName, grade, className, major, gender, age);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        studentMapper.updateStudent(student);

        try {
            response.sendRedirect("/test-demo/jsp/student/personal/person-information.jsp");
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
