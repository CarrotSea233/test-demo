package model.entity;


public class Login {
    private Integer userId;
    private String account;
    private String password;
    private String identity;

    public Login() {}

    public Login(Integer userId, String account, String password, String identity) {
        this.userId = userId;
        this.account = account;
        this.password = password;
        this.identity = identity;
    }

    public Login(String account, String password, String identity) {
        this.account = account;
        this.password = password;
        this.identity = identity;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getAccount() {
        return account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getIdentity() {
        return identity;
    }

    @Override
    public String toString() { 
        return "userId:" + userId + ",account:" + account + ",password:" + password + ",identity:" + identity;
    }

}
