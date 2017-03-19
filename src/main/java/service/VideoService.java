package service;

import dao.VideoDao;
import org.json.JSONArray;
import org.json.JSONObject;
import util.PropertyUtils;
import util.VideoUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/11.
 * Description
 */
public class VideoService {
    private VideoDao videoDao = new VideoDao();

    public boolean addVideo(String rootPath, String filename){
        String video_path = rootPath + "/upload/video/" + filename;
        String cover_img = video_path.substring(0,video_path.lastIndexOf('.')) + "_c.jpg";
        //截图
        VideoUtils.capturePic(3,470,350,video_path,cover_img);

        Map<String, Object> param  = new HashMap<String,Object>();
        param.put("video_path","/upload/video/"+filename);
        param.put("cover_img","/upload/video/"+filename.substring(0,filename.lastIndexOf('.'))+"_c.jpg");

        return videoDao.addVideo(param);
    }

    public Map<String,Object> getVideoList() {
        return videoDao.getVideoList();
    }

    public boolean deleteVideo(String filter) {
        filter = filter.substring(1,filter.length());
        filter = "("+filter+")";
        return videoDao.deleteVideo(filter);
    }

    public List<Map<String,Object>> getVideoListByFilter(String filter) {
        return videoDao.getVideoListByFilter(filter);
    }

    public void addLogo(String v_list){
        JSONArray v_array = new JSONArray(v_list);
        JSONArray video_list = new JSONArray();
        System.out.println(v_array);
        for(int i=0;i<v_array.length();++i){
            JSONObject jObj = v_array.getJSONObject(i);
            String input_path  = jObj.get("input_path").toString();
            String video_name = VideoUtils.getVideoName(input_path);
            //System.out.println(video_name);
            //System.out.println(video_type);
            String output_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path.replace(video_name,video_name+"_logo");
            input_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path;
            jObj.put("input_path",input_path);
            jObj.put("output_path",output_path);
            jObj.put("logo_path",PropertyUtils.getProperty("logoPath"));

            video_list.put(jObj);
        }
        videoDao.addLogo(video_list);
    }

    public void processMP4(String v_list){
        JSONArray v_array = new JSONArray(v_list);
        JSONArray video_list = new JSONArray();
        //System.out.println(v_list);
        for(Object obj:v_array){
            JSONObject jObj = (JSONObject) obj;
            String input_path  = jObj.get("input_path").toString();
            String video_type = VideoUtils.getVideoType(input_path);
            //System.out.println(video_type);
            //只处理不是MP4类型的视频
            if(!video_type.equals("mp4")){
                String output_path = input_path.replace(video_type,"mp4");
                input_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path;
                jObj.put("input_path",input_path);
                jObj.put("output_path",output_path);
                video_list.put(jObj);
            }
        }
        videoDao.processMP4(video_list);
    }
}
