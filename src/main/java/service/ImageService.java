package service;

import dao.ImageDao;

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
}
