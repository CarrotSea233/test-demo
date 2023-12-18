package mapper;

import model.entity.Admin;
import model.view.AdminView;

public interface AdminMapper {
    
    Admin getAdminByUserId(Integer userId);

    AdminView getAdminViewByUserId(String userId);

    void updateAdminByUserId(Admin admin);
}
