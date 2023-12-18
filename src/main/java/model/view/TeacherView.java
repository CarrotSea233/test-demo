package model.view;

public class TeacherView {
    private Integer userId;
    private Integer jobId;
    private String userName;
    private String account;
    private String password;
    private String identity;
    private String entryYear;
    private String gender;
    private Integer age;

    public TeacherView() {}

    public TeacherView(Integer userId, Integer jobId, String userName, String account, String password, String identity,
            String entryYear, String gender, Integer age) {
        this.userId = userId;
        this.jobId = jobId;
        this.userName = userName;
        this.account = account;
        this.password = password;
        this.identity = identity;
        this.entryYear = entryYear;
        this.gender = gender;
        this.age = age;
    }





    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getEntryYear() {
        return entryYear;
    }

    public void setEntryYear(String entryYear) {
        this.entryYear = entryYear;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "TeacherView [userId=" + userId + ", jobId=" + jobId + ", userName=" + userName + ", account=" + account
                + ", password=" + password + ", identity=" + identity + ", entryYear=" + entryYear + ", gender="
                + gender + ", age=" + age + "]";
    }


    

}
