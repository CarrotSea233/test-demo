package mapper;

import java.util.List;

import model.entity.Teacher;
import model.view.TeacherView;

public interface TeacherMapper {
    void updateTeacher(Teacher teacher);

    List<TeacherView> listTeachers();

    List<TeacherView> listTeachers(TeacherView teacherView);

    TeacherView getTeacherByUserId(Integer userId);

    void deleteTeacher(Integer userId);
}
