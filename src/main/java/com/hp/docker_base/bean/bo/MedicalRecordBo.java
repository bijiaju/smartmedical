package com.hp.docker_base.bean.bo;

import com.hp.docker_base.bean.MedicalRecord;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/21 21:27
 */

public class MedicalRecordBo extends MedicalRecord {

    // 病人名称
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
