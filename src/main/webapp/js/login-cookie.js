

// 获取指定名称的cookie的value
function getCookie(name){
    var strcookie = document.cookie;//获取cookie字符串
    var arrcookie = strcookie.split("; ");//分割
    //遍历匹配
    for ( var i = 0; i < arrcookie.length; i++) {
        var arr = arrcookie[i].split("=");
        if (arr[0] == name){
            return arr[1];
        }
    }
    return "";
}

// 退出登录
function logout() {
    window.location.href = '/test-demo/logout-controller';
}

// 绑定logout点击事件
document.getElementById("logoutButton").onclick=function() {
    logout()
}

// 获取cookie里存的当前用户的数据
function getLoginUser() {
    var loginUser = new Array();
    var loginCookie = getCookie("loginUser");
    loginCookie = decodeURIComponent(loginCookie); // 解码
    var arr = loginCookie.split(",");
    for(var i = 0; i < arr.length; i++) {
        var arr2 = arr[i].split(":");
        loginUser[arr2[0]] = arr2[1];
    }
    return loginUser;
    
}

// 把用户名显示在页面上
window.onload = function() {
    var loginUser = getLoginUser();
    document.getElementById("adminAccount").innerHTML = loginUser["account"];
}