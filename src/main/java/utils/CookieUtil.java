package utils;

import java.net.URLDecoder;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import model.entity.Login;

public class CookieUtil {
    private static String loginCookieName = "loginUser";

    public static Login getCookie(HttpServletRequest request) {
        try {
            Cookie[] cookies = request.getCookies();
            if(cookies != null && cookies.length > 0){
                for (Cookie cookie : cookies){
                    if(loginCookieName.equals(cookie.getName())) {
                        String loginCode = URLDecoder.decode(cookie.getValue(), "utf-8");
                        String loginSign[] = loginCode.split(",");
                        Login loginUser = new Login(Integer.parseInt(loginSign[0].split(":")[1]),loginSign[1].split(":")[1],loginSign[2].split(":")[1],loginSign[3].split(":")[1]);
                        return loginUser;
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
