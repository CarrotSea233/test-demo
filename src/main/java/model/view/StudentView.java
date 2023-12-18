package model.view;

public class StudentView {
    private String userId;
    private String studentId;
    private String userName;
    private String grade;
    private String className;
    private String major;
    private String gender;
    private String age;

    private String account;
    private String password;
    private String identity;

    public StudentView(){}

    public StudentView(String userId, String studentId, String userName, String grade, String className, String major,
            String gender, String age, String account, String password, String identity) {
        this.userId = userId;
        this.studentId = studentId;
        this.userName = userName;
        this.grade = grade;
        this.className = className;
        this.major = major;
        this.gender = gender;
        this.age = age;
        this.account = account;
        this.password = password;
        this.identity = identity;
    }

    

    public StudentView(String userId, String studentId, String userName, String grade, String className, String major,
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

    @Override
    public String toString() {
        return "StudentView [userId=" + userId + ", studentId=" + studentId + ", userName=" + userName + ", grade="
                + grade + ", className=" + className + ", major=" + major + ", gender=" + gender + ", age=" + age
                + ", account=" + account + ", password=" + password + ", identity=" + identity + "]";
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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    
}
