package model.entity;

public class Log {
    private String logId;
    private String userId;
    private String logTime;
    private String state;

    public Log() {}

    public Log(String logId, String userId, String logTime, String state) {
        this.logId = logId;
        this.userId = userId;
        this.logTime = logTime;
        this.state = state;
    }

    public Log(String userId, String logTime, String state) {
        this.userId = userId;
        this.logTime = logTime;
        this.state = state;
    }

    @Override
    public String toString() {
        return "Log [logId=" + logId + ", userId=" + userId + ", logTime=" + logTime + ", state=" + state + "]";
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

    
}
