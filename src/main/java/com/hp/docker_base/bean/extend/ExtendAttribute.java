package com.hp.docker_base.bean.extend;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExtendAttribute implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * INTEGER(10) 必填<br>
     * 
     */
    private Integer id;

    /**
     * VARCHAR(50) 必填<br>
     * 
     */
    private String uuid;

    /**
     * VARCHAR(50) 必填<br>
     * 
     */
    private String tenantId;

    /**
     * INTEGER(10) 必填<br>
     * 0：组织机构
            1：组
            2：账户
     */
    private Integer category;

    /**
     * VARCHAR(100) 必填<br>
     * 
     */
    private String attrName;

    /**
     * VARCHAR(200) 必填<br>
     * 
     */
    private String fieldName;

    /**
     * VARCHAR(50) 必填<br>
     * single-line-text：文本
            multiple-line-text：多行文本
            integer-number：整数
            real-number：实数
            single-selection：单选
            mutiple-selection：多选
            dropdown-single-selection：下拉单选
            dropdown-multiple-selection：下拉多选
            date：日期
            time：时间
            datetime：日期时间
     */
    private String fieldType;

    /**
     * INTEGER(10)<br>
     * 
     */
    private Integer isFill;

    /**
     * INTEGER(10)<br>
     * 
     */
    private Integer isModify;

    /**
     * INTEGER(10)<br>
     * 
     */
    private Integer isUnique;

    /**
     * INTEGER(10)<br>
     * 
     */
    private Integer isValid;

    /**
     * VARCHAR(500)<br>
     * 
     */
    private String remark;

    /**
     * INTEGER(10) 必填<br>
     * 
     */
    private Integer sort;

    /**
     * VARCHAR(200)<br>
     * 
     */
    private String extend;

    /**
     * INTEGER(10) 默认值[0] 必填<br>
     * 
     */
    private Integer isDelete;

    /**
     * TIMESTAMP(19) 必填<br>
     * 
     */
    private Date createTime;

    /**
     * VARCHAR(50)<br>
     * 
     */
    private String createNumber;

    /**
     * TIMESTAMP(19) 必填<br>
     * 
     */
    private Date updateTime;

    /**
     * VARCHAR(50)<br>
     * 
     */
    private String updateNumber;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", uuid=").append(uuid);
        sb.append(", tenantId=").append(tenantId);
        sb.append(", category=").append(category);
        sb.append(", attrName=").append(attrName);
        sb.append(", fieldName=").append(fieldName);
        sb.append(", fieldType=").append(fieldType);
        sb.append(", isFill=").append(isFill);
        sb.append(", isModify=").append(isModify);
        sb.append(", isUnique=").append(isUnique);
        sb.append(", isValid=").append(isValid);
        sb.append(", remark=").append(remark);
        sb.append(", sort=").append(sort);
        sb.append(", extend=").append(extend);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", createTime=").append(createTime);
        sb.append(", createNumber=").append(createNumber);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateNumber=").append(updateNumber);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        ExtendAttribute other = (ExtendAttribute) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUuid() == null ? other.getUuid() == null : this.getUuid().equals(other.getUuid()))
            && (this.getTenantId() == null ? other.getTenantId() == null : this.getTenantId().equals(other.getTenantId()))
            && (this.getCategory() == null ? other.getCategory() == null : this.getCategory().equals(other.getCategory()))
            && (this.getAttrName() == null ? other.getAttrName() == null : this.getAttrName().equals(other.getAttrName()))
            && (this.getFieldName() == null ? other.getFieldName() == null : this.getFieldName().equals(other.getFieldName()))
            && (this.getFieldType() == null ? other.getFieldType() == null : this.getFieldType().equals(other.getFieldType()))
            && (this.getIsFill() == null ? other.getIsFill() == null : this.getIsFill().equals(other.getIsFill()))
            && (this.getIsModify() == null ? other.getIsModify() == null : this.getIsModify().equals(other.getIsModify()))
            && (this.getIsUnique() == null ? other.getIsUnique() == null : this.getIsUnique().equals(other.getIsUnique()))
            && (this.getIsValid() == null ? other.getIsValid() == null : this.getIsValid().equals(other.getIsValid()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getSort() == null ? other.getSort() == null : this.getSort().equals(other.getSort()))
            && (this.getExtend() == null ? other.getExtend() == null : this.getExtend().equals(other.getExtend()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getCreateNumber() == null ? other.getCreateNumber() == null : this.getCreateNumber().equals(other.getCreateNumber()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getUpdateNumber() == null ? other.getUpdateNumber() == null : this.getUpdateNumber().equals(other.getUpdateNumber()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUuid() == null) ? 0 : getUuid().hashCode());
        result = prime * result + ((getTenantId() == null) ? 0 : getTenantId().hashCode());
        result = prime * result + ((getCategory() == null) ? 0 : getCategory().hashCode());
        result = prime * result + ((getAttrName() == null) ? 0 : getAttrName().hashCode());
        result = prime * result + ((getFieldName() == null) ? 0 : getFieldName().hashCode());
        result = prime * result + ((getFieldType() == null) ? 0 : getFieldType().hashCode());
        result = prime * result + ((getIsFill() == null) ? 0 : getIsFill().hashCode());
        result = prime * result + ((getIsModify() == null) ? 0 : getIsModify().hashCode());
        result = prime * result + ((getIsUnique() == null) ? 0 : getIsUnique().hashCode());
        result = prime * result + ((getIsValid() == null) ? 0 : getIsValid().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getSort() == null) ? 0 : getSort().hashCode());
        result = prime * result + ((getExtend() == null) ? 0 : getExtend().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getCreateNumber() == null) ? 0 : getCreateNumber().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateNumber() == null) ? 0 : getUpdateNumber().hashCode());
        return result;
    }
}