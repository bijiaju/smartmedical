package com.hp.docker_base.bean;

import java.util.Date;

public class TreatmentResult {
    private Integer id;

    private String uuid;

    private String diagnosisResult;

    private String treatmentId;

    private String outFeatureJson;

    private String activeRuleJson;

    private Integer type;

    private Integer isDelete;

    private String createUser;

    private String updateUser;

    private Date createTime;

    private Date updateTime;

    private String treatmentPlan;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public String getDiagnosisResult() {
        return diagnosisResult;
    }

    public void setDiagnosisResult(String diagnosisResult) {
        this.diagnosisResult = diagnosisResult == null ? null : diagnosisResult.trim();
    }

    public String getTreatmentId() {
        return treatmentId;
    }

    public void setTreatmentId(String treatmentId) {
        this.treatmentId = treatmentId == null ? null : treatmentId.trim();
    }

    public String getOutFeatureJson() {
        return outFeatureJson;
    }

    public void setOutFeatureJson(String outFeatureJson) {
        this.outFeatureJson = outFeatureJson == null ? null : outFeatureJson.trim();
    }

    public String getActiveRuleJson() {
        return activeRuleJson;
    }

    public void setActiveRuleJson(String activeRuleJson) {
        this.activeRuleJson = activeRuleJson == null ? null : activeRuleJson.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTreatmentPlan() {
        return treatmentPlan;
    }

    public void setTreatmentPlan(String treatmentPlan) {
        this.treatmentPlan = treatmentPlan == null ? null : treatmentPlan.trim();
    }
}