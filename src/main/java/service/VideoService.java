package service;

import dao.VideoDao;
import util.VideoUtils;

import java.util.HashMap;
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
}
