package com.hp.docker_base.bean;

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
public class AccountExtend implements Serializable {
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
    private String tenantId;

    /**
     * VARCHAR(50) 必填<br>
     * 
     */
    private String accountId;

    /**
     * VARCHAR(50) 必填<br>
     * 
     */
    private String attrId;

    /**
     * VARCHAR(200) 必填<br>
     * 
     */
    private String attrFieldName;

    /**
     * VARCHAR(1000)<br>
     * 文本类：存储具体的文字内容
            数字类：存储数字
            选项类：存储选项编号，多个选项",'隔开
     */
    private String attrFieldValue;

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
        sb.append(", tenantId=").append(tenantId);
        sb.append(", accountId=").append(accountId);
        sb.append(", attrId=").append(attrId);
        sb.append(", attrFieldName=").append(attrFieldName);
        sb.append(", attrFieldValue=").append(attrFieldValue);
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
        AccountExtend other = (AccountExtend) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getTenantId() == null ? other.getTenantId() == null : this.getTenantId().equals(other.getTenantId()))
            && (this.getAccountId() == null ? other.getAccountId() == null : this.getAccountId().equals(other.getAccountId()))
            && (this.getAttrId() == null ? other.getAttrId() == null : this.getAttrId().equals(other.getAttrId()))
            && (this.getAttrFieldName() == null ? other.getAttrFieldName() == null : this.getAttrFieldName().equals(other.getAttrFieldName()))
            && (this.getAttrFieldValue() == null ? other.getAttrFieldValue() == null : this.getAttrFieldValue().equals(other.getAttrFieldValue()))
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
        result = prime * result + ((getTenantId() == null) ? 0 : getTenantId().hashCode());
        result = prime * result + ((getAccountId() == null) ? 0 : getAccountId().hashCode());
        result = prime * result + ((getAttrId() == null) ? 0 : getAttrId().hashCode());
        result = prime * result + ((getAttrFieldName() == null) ? 0 : getAttrFieldName().hashCode());
        result = prime * result + ((getAttrFieldValue() == null) ? 0 : getAttrFieldValue().hashCode());
        result = prime * result + ((getExtend() == null) ? 0 : getExtend().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getCreateNumber() == null) ? 0 : getCreateNumber().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateNumber() == null) ? 0 : getUpdateNumber().hashCode());
        return result;
    }
}