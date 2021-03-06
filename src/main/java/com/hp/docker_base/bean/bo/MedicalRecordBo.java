package com.hp.docker_base.bean.bo;

import com.alibaba.fastjson.annotation.JSONField;
import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.em.EnumTreatState;

import java.util.Date;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/21 21:27
 */

public class MedicalRecordBo{



    private Integer id;

    private String uuid;

    private String patientId;

    private String doctorId;

    private String record;

    private String treatmentPlan;

    private Integer sort;

    private Integer isDelete;

    private String createUser;

    private String updateUser;

    private Date createTime;

    private Date updateTime;

    // 病人名称
    private String name;

    //诊断类型
    private Integer type;

    private String typeDesc;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getTypeDesc(){
        Integer type = this.getType();
        EnumTreatState[] values = EnumTreatState.values();
        for(EnumTreatState state:values ){
            if(type.intValue() == state.getValue()){
                return state.getDescription();
            }
        }
        return null;
    }

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

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId == null ? null : patientId.trim();
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId == null ? null : doctorId.trim();
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public String getTreatmentPlan() {
        return treatmentPlan;
    }

    public void setTreatmentPlan(String treatmentPlan) {
        this.treatmentPlan = treatmentPlan == null ? null : treatmentPlan.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
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


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
