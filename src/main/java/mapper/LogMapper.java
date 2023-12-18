package mapper;

import java.util.List;

import model.entity.Log;
import model.view.LogView;

public interface LogMapper {

    void insertLog(Log log);

    List<LogView> findLogs(LogView logView);

    void deleteLog(String logId);
    
}
