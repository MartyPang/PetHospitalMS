package util;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public class JsonUtils {
    @SuppressWarnings("unused")
    //private static final Logger logger = Logger.getLogger(JsonUtils.class);

    public static String replace(String json, String field, String content,
                                 String str, String str2) throws Exception {
        JSONObject jsonObject = new JSONObject(json);
        JSONArray array = (JSONArray) jsonObject.get("rows");
        JSONArray newArray = new JSONArray();
        for (int i = 0; i < array.length(); i++) {
            JSONObject o = (JSONObject) array.get(i);
            o.put(field, content.replace(str, o.getString(str2)));
            newArray.put(o);
        }
        jsonObject.put("rows", newArray);
        return jsonObject.toString();
    }

    public static String list2Json(List<Map<String, String>> list) {
        JSONArray array = new JSONArray(list);
        return array.toString();

    }

    public static String listO2Json(List<Map<String, Object>> list) {
        JSONArray array = new JSONArray(list);
        return array.toString();

    }

    public static String map2Json(Map<String, Object> map) {
        JSONObject jsonObj = new JSONObject(map);
        return jsonObj.toString();
    }

    public static String map2json(Map<String, String> map) {
        JSONObject jsonObj = new JSONObject(map);
        return jsonObj.toString();
    }
}
