package model.entity;

public class Teacher {
    private Integer jobId;
    private Integer userId;
    private String userName;
    private String gender;
    private Integer age;
    private String entryYear;

    public Teacher(Integer jobId, Integer userId, String userName, String gender, Integer age, String entryYear) {
        this.jobId = jobId;
        this.userId = userId;
        this.userName = userName;
        this.gender = gender;
        this.age = age;
        this.entryYear = entryYear;
    }

    public Teacher(){}

    

    public Teacher(Integer userId, String userName, String gender, Integer age, String entryYear) {
        this.userId = userId;
        this.userName = userName;
        this.gender = gender;
        this.age = age;
        this.entryYear = entryYear;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getEntryYear() {
        return entryYear;
    }

    public void setEntryYear(String entryYear) {
        this.entryYear = entryYear;
    }

    @Override
    public String toString() {
        return "jobId=" + jobId + ",userId=" + userId + ",userName=" + userName + ",gender=" + gender
                + ",age=" + age + ",entryYear=" + entryYear;
    }

    

    
}
