package com.hp.docker_base.service;

import com.hp.docker_base.bean.MedicalRecord;
import com.hp.docker_base.bean.bo.MedicalRecordBo;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/8 21:17
 */

public interface IMedicalRecordService {



    /**
     * 新增就诊记录
     */
    MedicalRecord addMedicalRecordInfo(MedicalRecord disease,
                             String userName);


    int findDefaultSort();

    List<MedicalRecord> queryAllMedicalRecordList();

    MedicalRecord queryMedicalRecordByUUID(String medicalRecordId);

    int editMedicalRecordInfo(String medicalRecordId, MedicalRecord medicalRecord, String userName);

    int deleteMedicalRecordInfo(String medicalRecordId, String userName);

    /**
     * 分页查询数据
     */
    List<MedicalRecordBo> queryMedicalRecordPageList(String postId, String keywords);

    /**
     * 查看医生看了多少病人
     */
    List<MedicalRecordBo> queryDoctorMedicalRecordPageList(String uuid, String keywords, Integer type, String startDate, String endDate);
}
