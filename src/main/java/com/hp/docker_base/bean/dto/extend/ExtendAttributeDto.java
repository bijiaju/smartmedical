package com.hp.docker_base.bean.dto.extend;

import com.hp.docker_base.bean.dto.DepartmentDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.List;

/**
 * @program: idaas
 * @description: 自定义扩展属性信息
 * @author: bee
 * @create: 2020-03-17 10:21
 **/
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
@Data

@ApiModel("组织机构/账户组/账户自定义属性信息")
public class ExtendAttributeDto implements Serializable {
    private static final long serialVersionUID = 8469573140921727259L;

    @ApiModelProperty(value = "自定义属性唯一编号", example = "自定义属性唯一编号")
    private String uuid;

    @ApiModelProperty(value = "自定义属性名称", example = "自定义属性名称")
    private String attributeName;

    @ApiModelProperty(value = "自定义属性所属分类，组织机构、账户组、账户", example = "自定义属性所属分类，0:组织机构 | 1:账户组 | 2:账户")
    private Integer attributeCategory;

    @ApiModelProperty(value = "自定义属性字段名", example = "自定义属性字段名")
    private String attributeFieldName;

    @ApiModelProperty(value = "自定义属性类型，单行文本/多行文本/整数/实数/单选/多选/下拉单选/下拉多选/日期/时间/日期时间",
            example = "自定义属性类型，单行文本：single-line-text | 多行文本：multiple-line-text | 整数：integer-number | 实数：real-number" +
                    "| 单选：single-selection | 多选：multiple-selection | 下拉选择：dropdown-single-selection" +
                    "| 下拉多选：dropdown-multiple-selection | 日期：date | 时间：time | 日期时间：datetime")
    private String attributeFieldType;

    @ApiModelProperty(value = "自定义属性值", example = "自定义属性值")
    private String attributeFieldValue;

    @ApiModelProperty(value = "自定义属性描述", example = "自定义属性描述")
    private String remark;

    @ApiModelProperty(value = "是否必填(0/1)", example = "是否必填， 0:非必填 | 1:必填")
    private Integer needFill;

    @ApiModelProperty(value = "是否允许管理员修改(0/1)", example = "是否允许管理员修改，0:不允许 | 1:允许")
    private Integer canModify;

    @ApiModelProperty(value = "是否唯一(0/1)", example = "是否唯一，0:不唯一 | 1:唯一")
    private Integer unique;

    @ApiModelProperty(value = "是否启用（0/1）", example = "0：禁用 | 1：启用")
    private Integer valid;

    @ApiModelProperty(value = "排序值", example = "排序值")
    private Integer sort;

    @ApiModelProperty(value = "扩展属性配置信息，支持文本类、数字类和选项类扩展属性的配置")
    private AbstractExtendAttributeConfigDto attributeConfigInfo;

    @ApiModelProperty(value = "部门列表")
    private List<DepartmentDto> departmentList;
}
