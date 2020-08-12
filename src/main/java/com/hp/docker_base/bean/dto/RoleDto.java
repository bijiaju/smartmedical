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
 * @program: idaas
 * @description: 应用角色信息
 * @author: 姬同凯
 * @create: 2020-03-20 16:53
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("应用角色信息")
public class RoleDto implements Serializable {
    private static final long serialVersionUID = 909751103637574490L;

    @ApiModelProperty(value = "应用角色编号",example = "应用角色编号")
    private String uuid;

    @ApiModelProperty(value = "应用角色名称",example = "应用角色名称")
    @NotEmpty(message = "角色不能为空", groups = MiniValidation.class)
    private String roleName;

    @ApiModelProperty(value = "应用角色编码",example = "应用角色编码")
    private String roleCode;

    @ApiModelProperty(value = "应用角色描述",example = "应用角色描述")
    private String remark;


}
