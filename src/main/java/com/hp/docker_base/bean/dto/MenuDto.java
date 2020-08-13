package com.hp.docker_base.bean.dto;

import com.hp.docker_base.util.validate.group.MiniValidation;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MenuDto {

    @ApiModelProperty(value = "菜单编号",example = "菜单编号")
    private String uuid;

    @NotEmpty(message = "菜单不能为空", groups = MiniValidation.class)
    private String name;

    private String parentId;

    private String fullParh;

    private Integer level;

    private Integer sort;

    private List<MenuDto> children;

}