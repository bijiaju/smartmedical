package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("诊断结果")
public class TreatmentResultDto implements Serializable {
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


}