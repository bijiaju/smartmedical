package com.hp.docker_base.bean.dto;

import com.hp.docker_base.bean.algorithm.ActivedRulesDto;
import com.hp.docker_base.bean.algorithm.DataOutDto;
import com.hp.docker_base.bean.algorithm.FidOutDto;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/10/29 10:24
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class MedicalRecordDto {

    @ApiModelProperty(value = "诊断疾病", example = "诊断疾病")
    private String disease;

    @ApiModelProperty(value = "治疗方案", example = "治疗方案")
    private String treatmentResultPlan;

    private List<DataOutDto> Result;

    private List<ActivedRulesDto> ActivedRules;



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


}
