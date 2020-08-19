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
public class ExtendNumberAttributeConfig implements Serializable {
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
    private String attrId;

    /**
     * VARCHAR(100)<br>
     * 
     */
    private String unit;

    /**
     * VARCHAR(100)<br>
     * 
     */
    private String minValue;

    /**
     * VARCHAR(100)<br>
     * 
     */
    private String maxValue;

    /**
     * VARCHAR(1000)<br>
     * 
     */
    private String defaultValue;

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
        sb.append(", attrId=").append(attrId);
        sb.append(", unit=").append(unit);
        sb.append(", minValue=").append(minValue);
        sb.append(", maxValue=").append(maxValue);
        sb.append(", defaultValue=").append(defaultValue);
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
        ExtendNumberAttributeConfig other = (ExtendNumberAttributeConfig) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAttrId() == null ? other.getAttrId() == null : this.getAttrId().equals(other.getAttrId()))
            && (this.getUnit() == null ? other.getUnit() == null : this.getUnit().equals(other.getUnit()))
            && (this.getMinValue() == null ? other.getMinValue() == null : this.getMinValue().equals(other.getMinValue()))
            && (this.getMaxValue() == null ? other.getMaxValue() == null : this.getMaxValue().equals(other.getMaxValue()))
            && (this.getDefaultValue() == null ? other.getDefaultValue() == null : this.getDefaultValue().equals(other.getDefaultValue()))
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
        result = prime * result + ((getAttrId() == null) ? 0 : getAttrId().hashCode());
        result = prime * result + ((getUnit() == null) ? 0 : getUnit().hashCode());
        result = prime * result + ((getMinValue() == null) ? 0 : getMinValue().hashCode());
        result = prime * result + ((getMaxValue() == null) ? 0 : getMaxValue().hashCode());
        result = prime * result + ((getDefaultValue() == null) ? 0 : getDefaultValue().hashCode());
        result = prime * result + ((getExtend() == null) ? 0 : getExtend().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getCreateNumber() == null) ? 0 : getCreateNumber().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateNumber() == null) ? 0 : getUpdateNumber().hashCode());
        return result;
    }
}