package com.hp.docker_base.bean.algorithm;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/12/1 15:40
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class RuleDto {

    @ApiModelProperty(value = "该条规则的参考值", example = "该条规则的参考值")
    private List<String> reference;

    @ApiModelProperty(value = "该条规则的置信度", example = "该条规则的置信度")
    private List<String> belief;
}
