package controller.admin.teacher;

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
import mapper.TeacherMapper;
import model.entity.Admin;
import model.entity.Login;
import model.entity.Teacher;
import utils.CookieUtil;
import utils.MyBatisUtil;

@WebServlet("/admin/add-teacher-servlet")
public class AddTeacher extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String identity = request.getParameter("identity");
        String userName = request.getParameter("userName");
        String gender = request.getParameter("gender");
        Integer age = Integer.parseInt(request.getParameter("age"));
        String entryYear = request.getParameter("entryYear");

        Login newUser = new Login(account, password, identity);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
        loginMapper.insertUser(newUser);

        newUser = loginMapper.getLoginUser(newUser);
        Integer userId = newUser.getUserId();
        Teacher newTeacher = new Teacher(userId, userName, gender, age, entryYear);

        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        teacherMapper.updateTeacher(newTeacher);

        try {
            response.sendRedirect("/test-demo/jsp/admin/teacher-menu/teacher-view.jsp");
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
