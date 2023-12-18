package controller.admin.student;

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
import mapper.LoginMapper;
import mapper.StudentMapper;
import mapper.TeacherMapper;
import model.entity.Admin;
import model.entity.Login;
import model.entity.Student;
import model.entity.Teacher;
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/admin/add-student-servlet")
public class AddStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String account = request.getParameter("account");
        String userName = request.getParameter("userName");
        String grade = request.getParameter("grade");
        String className = request.getParameter("className");
        String major = request.getParameter("major");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");

        Login newUser = new Login(account, password, identity);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
        loginMapper.insertUser(newUser);

        newUser = loginMapper.getLoginUser(newUser);
        Integer userId = newUser.getUserId();
        Student newStudent = new Student(""+userId, userName, grade, className, major, gender, age);

        StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
        studentMapper.updateStudent(newStudent);

        try {
            response.sendRedirect("/test-demo/jsp/admin/student-menu/student-view.jsp");
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
