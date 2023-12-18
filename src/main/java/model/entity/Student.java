package model.entity;

public class Student {
    private String userId;
    private String studentId;
    private String userName;
    private String grade;
    private String className;
    private String major;
    private String gender;
    private String age;

    public Student() {}

    public Student(String userId, String studentId, String userName, String grade, String className, String major,
            String gender, String age) {
        this.userId = userId;
        this.studentId = studentId;
        this.userName = userName;
        this.grade = grade;
        this.className = className;
        this.major = major;
        this.gender = gender;
        this.age = age;
    }

    

    public Student(String userId, String userName, String grade, String className, String major, String gender,
            String age) {
        this.userId = userId;
        this.userName = userName;
        this.grade = grade;
        this.className = className;
        this.major = major;
        this.gender = gender;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Student [userId=" + userId + ", studentId=" + studentId + ", userName=" + userName + ", grade=" + grade
                + ", className=" + className + ", major=" + major + ", gender=" + gender + ", age=" + age + "]";
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    
}
