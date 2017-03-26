package service;

import dao.DepartmentDao;
import dao.ProcessDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/2.
 * Description
 */
public class ProcessService {
    //获取流程列表
    public Map<String, Object> getProcessList(int p_dmp/**, String sorting, String filter**/) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.getProcessList(p_dmp);
    }

    //获取流程详情
    public Map<String, Object> getProcessInfo(Integer process_id) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.getProcessInfo(process_id);
    }

    //更新流程
    public boolean updateProcess(Map<String, Object> param) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.editProcess(param);
    }

    public boolean updatePImage(Integer p_id, String p_img) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.updatePImage(p_id, p_img);
    }

    public boolean updatePVideo(Integer p_id, String p_video) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.updatePVideo(p_id, p_video);
    }

    //删除流程
    public boolean deleteProcess(Integer process_id) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.setStatus(process_id,0);
    }

    //增加流程
    public boolean addProcess(Map<String, Object> processMap) {
        // TODO Auto-generated method stub
        ProcessDao ProcessDao = new ProcessDao();
        return ProcessDao.addProcess(processMap);
    }

    public String getDpmNameById(String dpm_id) {
        DepartmentDao dpmDao = new DepartmentDao();
        return dpmDao.getDepartmentInfo(Integer.parseInt(dpm_id)).get("dpm_name").toString();

    }
}
