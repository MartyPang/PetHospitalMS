package action;

import org.apache.log4j.Logger;
import service.CaseService;
import util.JsonUtils;
import util.Struts2Utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/2/28.
 * Description 病例管理action
 */
public class CaseAction extends BaseAction{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(CaseAction.class);
    private CaseService caseService = new CaseService();

    private Integer case_id = 0;
    private Integer casetype_id;
    private Integer casetype_name;
    private String case_name;
    private String reception_des;
    private String reception_pic;
    private String reception_video;
    private String examination_des;
    private String examination_pic;
    private String examination_video;
    private String diagnosis_des;
    private String diagnosis_pic;
    private String diagnosis_video;
    private String treatment_des;
    private String treatment_pic;
    private String treatment_video;

    private Integer p_type;
    private String p_list;
    private Integer v_type;
    private String v_list;

    public String preCaseManage(){
        return SUCCESS;
    }

    /**
     * 获取病例列表的一页
     */
    public void getCaseList(){
        logger.info("getCaseList");

        int beginIndex = getBeginIndex();
        int pageSize = getPageSize();

        Map<String, Object> dataMap = caseService.getCaseList();
        String resultJsonString = changeListToJsonStringWithJtable(dataMap);
        Struts2Utils.renderJson(resultJsonString);
    }

    /**
     * 增加病例
     * @return
     */
    public void addCase(){
        Map<String, Object> caseMap = new HashMap<String, Object>();
        //获取病例信息
        caseMap.put("casetype_id",casetype_id);
        caseMap.put("casetype_name",casetype_name);
        caseMap.put("case_name",case_name);
        caseMap.put("reception_des",reception_des);
        caseMap.put("examination_des",examination_des);
        caseMap.put("diagnosis_des",diagnosis_des);
        caseMap.put("treatment_des",treatment_des);

        boolean result = caseService.addCase(caseMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 删除病例
     */
    public void deleteCase() {
        boolean result = caseService.deleteCase(case_id);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 更新科室信息
     */
    public void updateCase(){
        Map<String, Object> caseMap = new HashMap<String, Object>();
        //获取病例信息
        caseMap.put("case_id",case_id);
        caseMap.put("casetype_id",casetype_id);
        caseMap.put("casetype_name",casetype_name);
        caseMap.put("case_name",case_name);
        caseMap.put("reception_des",reception_des);
        caseMap.put("examination_des",examination_des);
        caseMap.put("diagnosis_des",diagnosis_des);
        caseMap.put("treatment_des",treatment_des);


        boolean result = caseService.updateCase(caseMap);
        Struts2Utils.renderText(String.valueOf(result));
    }

    /**
     * 获取病例信息
     */
    public void getCaseInfo() {
        Map<String, Object> caseMap = new HashMap<String, Object>();
        caseMap = caseService.getCaseInfo(case_id);
        Struts2Utils.renderJson(JsonUtils.map2Json(caseMap));
    }

    public void updateCImage(){
        Map<String, Object> caseMap = new HashMap<String, Object>();
        caseMap.put("case_id",case_id);
        caseMap.put("p_type",p_type);
        caseMap.put("p_list",p_list);
        caseService.updateCImage(caseMap);
    }

    public void updateCVideo(){
        Map<String, Object> caseMap = new HashMap<String, Object>();
        caseMap.put("case_id",case_id);
        caseMap.put("v_type",v_type);
        caseMap.put("v_list",v_list);
        caseService.updateCVideo(caseMap);
    }

    //getters and setters
    public Integer getCase_id() {
        return case_id;
    }

    public void setCase_id(Integer case_id) {
        this.case_id = case_id;
    }

    public Integer getCasetype_id() {
        return casetype_id;
    }

    public void setCasetype_id(Integer casetype_id) {
        this.casetype_id = casetype_id;
    }

    public String getCase_name() {
        return case_name;
    }

    public void setCase_name(String case_name) {
        this.case_name = case_name;
    }

    public String getReception_des() {
        return reception_des;
    }

    public void setReception_des(String reception_des) {
        this.reception_des = reception_des;
    }

    public String getReception_pic() {
        return reception_pic;
    }

    public void setReception_pic(String reception_pic) {
        this.reception_pic = reception_pic;
    }

    public String getReception_video() {
        return reception_video;
    }

    public void setReception_video(String reception_video) {
        this.reception_video = reception_video;
    }

    public String getExamination_des() {
        return examination_des;
    }

    public void setExamination_des(String examination_des) {
        this.examination_des = examination_des;
    }

    public String getExamination_pic() {
        return examination_pic;
    }

    public void setExamination_pic(String examination_pic) {
        this.examination_pic = examination_pic;
    }

    public String getExamination_video() {
        return examination_video;
    }

    public void setExamination_video(String examination_video) {
        this.examination_video = examination_video;
    }

    public String getDiagnosis_des() {
        return diagnosis_des;
    }

    public void setDiagnosis_des(String diagnosis_des) {
        this.diagnosis_des = diagnosis_des;
    }

    public String getDiagnosis_pic() {
        return diagnosis_pic;
    }

    public void setDiagnosis_pic(String diagnosis_pic) {
        this.diagnosis_pic = diagnosis_pic;
    }

    public String getDiagnosis_video() {
        return diagnosis_video;
    }

    public void setDiagnosis_video(String diagnosis_video) {
        this.diagnosis_video = diagnosis_video;
    }

    public String getTreatment_des() {
        return treatment_des;
    }

    public void setTreatment_des(String treatment_des) {
        this.treatment_des = treatment_des;
    }

    public String getTreatment_pic() {
        return treatment_pic;
    }

    public void setTreatment_pic(String treatment_pic) {
        this.treatment_pic = treatment_pic;
    }

    public String getTreatment_video() {
        return treatment_video;
    }

    public void setTreatment_video(String treatment_video) {
        this.treatment_video = treatment_video;
    }

    public Integer getP_type() {
        return p_type;
    }

    public void setP_type(Integer p_type) {
        this.p_type = p_type;
    }

    public String getP_list() {
        return p_list;
    }

    public void setP_list(String p_list) {
        this.p_list = p_list;
    }

    public Integer getV_type() {
        return v_type;
    }

    public void setV_type(Integer v_type) {
        this.v_type = v_type;
    }

    public String getV_list() {
        return v_list;
    }

    public void setV_list(String v_list) {
        this.v_list = v_list;
    }

    public Integer getCasetype_name() {
        return casetype_name;
    }

    public void setCasetype_name(Integer casetype_name) {
        this.casetype_name = casetype_name;
    }
}
