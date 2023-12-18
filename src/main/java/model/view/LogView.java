package model.view;

public class LogView {
    private String logId;
    private String userId;
    private String logTime;
    private String state;

    private String userName;
    private String identity;

    public LogView(){}

    public LogView(String logId, String userId, String logTime, String state, String userName, String identity) {
        this.logId = logId;
        this.userId = userId;
        this.logTime = logTime;
        this.state = state;
        this.userName = userName;
        this.identity = identity;
    }

    

    public LogView(String logId, String userName, String identity, String state) {
        this.logId = logId;
        this.state = state;
        this.userName = userName;
        this.identity = identity;
    }

    @Override
    public String toString() {
        return "LogView [logId=" + logId + ", userId=" + userId + ", logTime=" + logTime + ", state=" + state
                + ", userName=" + userName + ", identity=" + identity + "]";
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLogTime() {
        return logTime;
    }

    public void setLogTime(String logTime) {
        this.logTime = logTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    
}
