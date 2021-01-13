package com.hp.docker_base.bean.dto;

import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 22:48 2021/1/13
 * @Modify By:
 */

@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("规则信息")
public class ReferenceDto implements Serializable {

    @ApiModelProperty(value = "特征编号",example = "特征编号")
    private String id;

    @ApiModelProperty(value = "特征名称",example = "特征名称")
    private String name;

    @ApiModelProperty(value = "数值",example = "数值")
    private String value;

    @ApiModelProperty(value = "显示数值",example = "显示数值")
    private String showValue;

}
