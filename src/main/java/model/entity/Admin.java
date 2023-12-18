package model.entity;

public class Admin {
    private Integer userId;
    private String userName;
    private String gender;
    private Integer age;

    public Admin() {}

    public Admin(Integer userId, String userName, String gender, Integer age) {
        this.userId = userId;
        this.userName = userName;
        this.gender = gender;
        this.age = age;
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

    @Override
    public String toString() {
        return "userId=" + userId + ",userName=" + userName + ",gender=" + gender + ",age=" + age;
    }


}
