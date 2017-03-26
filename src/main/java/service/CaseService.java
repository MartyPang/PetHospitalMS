package service;

import dao.CaseDao;

import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/6.
 * Description
 */
public class CaseService {
    private CaseDao caseDao = new CaseDao();

    public Map<String,Object> getCaseList(int beginIndex,int pageSize) {
        return caseDao.getCaseList(beginIndex,pageSize);
    }

    public boolean addCase(Map<String, Object> caseMap) {
        return caseDao.addCase(caseMap);
    }

    public boolean deleteCase(Integer case_id) {
        return caseDao.setStatus(case_id,0);
    }

    public boolean updateCase(Map<String, Object> caseMap) {
        return caseDao.editCase(caseMap);
    }

    public Map<String,Object> getCaseInfo(Integer case_id) {
        return caseDao.getCaseInfo(case_id);
    }

    public void updateCImage(Map<String, Object> caseMap) {
        Integer type = Integer.parseInt(caseMap.get("p_type").toString());
        String field_name = "";
        switch (type){
            case 1:field_name="reception_pic";break;
            case 2:field_name="examination_pic";break;
            case 3:field_name="diagnosis_pic";break;
            case 4:field_name="treatment_pic";break;
        }
        caseMap.put("field_name",field_name);
        caseDao.updateCImage(caseMap);
    }

    public void updateCVideo(Map<String, Object> caseMap) {
        Integer type = Integer.parseInt(caseMap.get("v_type").toString());
        String field_name = "";
        switch (type){
            case 1:field_name="reception_video";break;
            case 2:field_name="examination_video";break;
            case 3:field_name="diagnosis_video";break;
            case 4:field_name="treatment_video";break;
        }
        caseMap.put("field_name",field_name);
        caseDao.updateCVideo(caseMap);
    }
}
