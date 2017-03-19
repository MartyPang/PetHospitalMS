package service;

import dao.ImageDao;
import org.json.JSONArray;
import org.json.JSONObject;
import util.PropertyUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/3.
 * Description
 */
public class ImageService {
    private ImageDao imageDao = new ImageDao();

    public Map<String, Object> getImageList(){
        return imageDao.getImageList();
    }

    public List<Map<String, Object>> getImageListByFilter(String filter){
        return imageDao.getImageListByFilter(filter);
    }

    public boolean deleteImage(String filter){
        filter = filter.substring(1,filter.length());
        filter = "("+filter+")";
        return imageDao.deleteImage(filter);
    }

    //转换图片格式
    public void transferFormat(String p_list, String dest_type){
        JSONArray p_array = new JSONArray(p_list);
        JSONArray image_list = new JSONArray();
        System.out.println(p_array);
        for(Object obj:p_array){
            JSONObject jObj = (JSONObject) obj;
            String input_path  = jObj.get("input_path").toString();
            String image_type = input_path.substring(input_path.lastIndexOf(".")+1);
            //只处理不是转换类型的图片
            if(!image_type.equals(dest_type)){
                input_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path;
                String output_path = input_path.replace(image_type,dest_type);
                jObj.put("input_path",input_path);
                jObj.put("output_path",output_path);
                image_list.put(jObj);
            }
        }
        System.out.println(image_list);
        imageDao.transferFormat(image_list);
    }
}
