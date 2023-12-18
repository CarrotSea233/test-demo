package utils;

import java.io.IOException;
import java.util.ArrayList;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.List;

public class textTranslate {



    public static String translateText(String text, String sourceLanguage, String targetLanguage) {
        String appId = "20231102001868033";
        String appKey = "K4aEshGffWQZ4LUVGkT1";

        String apiUrl = "http://api.fanyi.baidu.com/api/trans/vip/translate";

        HttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(apiUrl);

        // 构造请求参数
        String salt = String.valueOf(System.currentTimeMillis());
        String sign = DigestUtils.md5Hex(appId + text + salt + appKey);

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("q", text));
        params.add(new BasicNameValuePair("from", sourceLanguage));
        params.add(new BasicNameValuePair("to", targetLanguage));
        params.add(new BasicNameValuePair("appid", appId));
        params.add(new BasicNameValuePair("salt", salt));
        params.add(new BasicNameValuePair("sign", sign));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));

            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String result = EntityUtils.toString(entity, "UTF-8");

                // 解析翻译结果
                JSONObject jsonObject = JSONObject.parseObject(result);;
                JSONArray translationArray = jsonObject.getJSONArray("trans_result");
                JSONObject translationObject = translationArray.getJSONObject(0);
                String translationText = translationObject.getString("dst");

                return translationText;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
