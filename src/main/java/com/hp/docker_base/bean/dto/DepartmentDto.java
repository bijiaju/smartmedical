package com.hp.docker_base.bean.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/27 22:32
 */
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data
public class DepartmentDto {

    @ApiModelProperty(value = "科室编号", example = "科室编号")
    private String departmentId;

    @ApiModelProperty(value = "科室名称", example = "科室名称")
    private String departmentName;
}
