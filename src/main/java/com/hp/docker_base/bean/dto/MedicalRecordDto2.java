package com.hp.docker_base.bean.dto;

import com.hp.docker_base.bean.em.EnumTreatState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.Date;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/21 21:27
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class MedicalRecordDto2 {



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


}
