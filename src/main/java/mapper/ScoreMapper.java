package mapper;

import java.util.List;

import model.entity.Score;

public interface ScoreMapper {

    void insertScore(Score score);

    List<Score> listEndScoreByUserId(String userId);

    void updateScore(Score score);
    
}
