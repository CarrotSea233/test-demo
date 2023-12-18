package mapper;

import java.util.List;

import model.entity.ReTestQuestion;
import model.entity.Test;
import model.view.TestStudentView;

public interface TestMapper {

    void insertTest(Test test);

    Test getTest(Test test);

    Test getTestById(String testId);

    void updateTest(Test test);

    List<Test> findTests(Test test);

    void deleteTest(String testId);

    List<Test> findTestsByClassName(String className);

    void insertReTestQuestion(ReTestQuestion reTestQuestion);

    ReTestQuestion getReTestQuestionByTestAndQuestionAndUserId(ReTestQuestion reTestQuestion);

    List<TestStudentView> findTestStudentViews(TestStudentView testStudentView);

    void updateReTestQuestion(ReTestQuestion reTestQuestion);
    
}
