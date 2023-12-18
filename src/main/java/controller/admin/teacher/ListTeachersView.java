package controller.admin.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mapper.TeacherMapper;
import model.view.TeacherView;
import utils.MyBatisUtil;

@WebServlet("/admin/teachers-view-servlet")
public class ListTeachersView extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        TeacherMapper teacherMapper = sqlSession.getMapper(TeacherMapper.class);
        List<TeacherView> teachers = teacherMapper.listTeachers();

        try {
            for(int i = 0; i < teachers.size(); i++) {
                writer.println(teachers.get(i) + "<br/>");
            }
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
