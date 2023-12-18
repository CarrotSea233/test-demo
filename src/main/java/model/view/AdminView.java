package model.view;

public class AdminView {
    private String userId;
    private String userName;
    private String gender;
    private String age;

    private String account;
    private String password;
    private String identity;

    public AdminView() {}

    public AdminView(String userId, String userName, String gender, String age, String account, String password,
            String identity) {
        this.userId = userId;
        this.userName = userName;
        this.gender = gender;
        this.age = age;
        this.account = account;
        this.password = password;
        this.identity = identity;
    }

    @Override
    public String toString() {
        return "AdminView [userId=" + userId + ", userName=" + userName + ", gender=" + gender + ", age=" + age
                + ", account=" + account + ", password=" + password + ", identity=" + identity + "]";
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
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
