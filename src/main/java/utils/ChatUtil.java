package utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class ChatUtil {

    public static String sendChatOk(String message) {
        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(10, TimeUnit.SECONDS) // 连接超时时间
                .readTimeout(30, TimeUnit.SECONDS) // 读取超时时间
                .writeTimeout(30, TimeUnit.SECONDS) // 写入超时时间
                .build();

        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType,
                "{\n  \"model\": \"gpt-3.5-turbo\",\n  \"messages\": [{\"role\": \"user\", \"content\": \"" + message
                        + "\"}]\n}");
        Request request = new Request.Builder()
                .url("https://api.chatanywhere.com.cn/v1/chat/completions")
                .method("POST", body)
                .addHeader("Authorization", "Bearer sk-CRKmMoxkBTNpIaXcEkgnKIvKv4atFdHIhMaetzRahHq9oCQ6")
                .addHeader("User-Agent", "Apifox/1.0.0 (https://apifox.com)")
                .addHeader("Content-Type", "application/json")
                .build();

        Boolean reTry = true;
        int state = 0;
        String length = null;

        while (reTry && state < 10) {
            try {
                System.out.println("正在获取gpt回答");
                Response response = client.newCall(request).execute();
                String responseBody = response.body().string();

                JSONObject responseObj = JSONObject.parseObject(responseBody);
                JSONArray choicesArray = responseObj.getJSONArray("choices");
                JSONObject choiceObj = choicesArray.getJSONObject(0);
                JSONObject messageObj = choiceObj.getJSONObject("message");
                String content = messageObj.getString("content");

                System.out.println(content);
                String[] tokens = content.split(":::");
                if (tokens.length >= 1)
                    length = tokens[1];

                reTry = false;

            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                try {
                    
                    Thread.sleep(3000);
                    state++;
                    System.out.println("重新发送请求" + state);
                } catch (InterruptedException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                return "255";
            }
        }

        if (length == null)
            length = "255";
        if (length.equals("null"))
            length = "255";

        return length;
    }
}
