package service;

import dao.VideoDao;
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

    public void addLogo(Map<String,Object> map){
        String input_path  = map.get("input_path").toString();
        String video_name = VideoUtils.getVideoName(input_path);
        String video_type = VideoUtils.getVideoType(input_path);
        //System.out.println(video_name);
        //System.out.println(video_type);
        String output_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path.replace(video_name,video_name+"_logo");
        input_path = PropertyUtils.getProperty("uploadPathPrefix") + input_path;
        map.put("input_path",input_path);
        map.put("output_path",output_path);
        map.put("logo_path",PropertyUtils.getProperty("logoPath"));

        videoDao.addLogo(map);
    }
}
