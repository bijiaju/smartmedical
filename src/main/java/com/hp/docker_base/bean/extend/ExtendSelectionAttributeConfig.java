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
public class ExtendSelectionAttributeConfig implements Serializable {
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
    private String attrId;

    /**
     * VARCHAR(1000) 必填<br>
     * 
     */
    private String content;

    /**
     * INTEGER(10)<br>
     * 
     */
    private Integer isDefault;

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

    private String selectValue;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", uuid=").append(uuid);
        sb.append(", attrId=").append(attrId);
        sb.append(", content=").append(content);
        sb.append(", isDefault=").append(isDefault);
        sb.append(", sort=").append(sort);
        sb.append(", extend=").append(extend);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", createTime=").append(createTime);
        sb.append(", createNumber=").append(createNumber);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateNumber=").append(updateNumber);
        sb.append(", selectValue=").append(selectValue);
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
        ExtendSelectionAttributeConfig other = (ExtendSelectionAttributeConfig) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUuid() == null ? other.getUuid() == null : this.getUuid().equals(other.getUuid()))
            && (this.getAttrId() == null ? other.getAttrId() == null : this.getAttrId().equals(other.getAttrId()))
            && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
            && (this.getIsDefault() == null ? other.getIsDefault() == null : this.getIsDefault().equals(other.getIsDefault()))
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
        result = prime * result + ((getAttrId() == null) ? 0 : getAttrId().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getIsDefault() == null) ? 0 : getIsDefault().hashCode());
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