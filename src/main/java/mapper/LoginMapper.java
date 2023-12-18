package mapper;


import model.entity.Login;

public interface LoginMapper {
    
    Login getLoginUser(Login loginUser);

    void insertUser(Login newUser);

    void updateUser(Login user);

    void deleteUser(Integer userId);

    Login getUserById(String userId);
}
