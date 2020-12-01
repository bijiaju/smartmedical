package com.hp.docker_base.bean.algorithm;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/12/1 11:06
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class TreatmentProcessDetailDto implements Serializable {

    @ApiModelProperty(value = "输入参数", example = "输入参数")
    private FidInDto fidInDto;

    @ApiModelProperty(value = "自动诊断结果", example = "自动诊断结果")
    private FidOutDto commonResult;

    @ApiModelProperty(value = "修改诊断结果", example = "修改诊断结果")
    private FidOutDto modifyResult;
}
