package com.hp.docker_base.service;

import com.hp.docker_base.bean.MedicalRecord;

import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/8 21:17
 */

public interface IMedicalRecordService {

    /**
     * 根据身份证获取就诊记录
     * @param postId 身份证号
     */
    List<MedicalRecord> queryMedicalRecordByPostId(String postId);
}
