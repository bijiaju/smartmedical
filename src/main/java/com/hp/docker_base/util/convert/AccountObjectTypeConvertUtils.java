package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.AccountExtend;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeValueDto;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/20 15:40
 */
public class AccountObjectTypeConvertUtils {

    /**
     * Dto->BO 添加属性
     */
    public static List<ExtendAttributeValueBo> convertAccountExtendValueDtoToBo(String accountId,
                                                                                String tenantId,
                                                                                List<ExtendAttributeValueDto> extendAttributeInfoList) {
        List<ExtendAttributeValueBo> extendAttributeValueList = new ArrayList<>();
        if (StringUtils.isEmpty(accountId)
                || CollectionUtils.isEmpty(extendAttributeInfoList)) {
            return extendAttributeValueList;
        }

        for (ExtendAttributeValueDto extendAttributeInfo : extendAttributeInfoList) {
            ExtendAttributeValueBo valueInfo = new ExtendAttributeValueBo();
            valueInfo.setParentId(accountId);
            valueInfo.setTenantId(tenantId);
            valueInfo.setAttributeId(extendAttributeInfo.getAttributeId());
            valueInfo.setAttributeFieldName(extendAttributeInfo.getAttributeFieldName());
            valueInfo.setAttributeFieldValue(extendAttributeInfo.getAttributeFieldValue());

            extendAttributeValueList.add(valueInfo);
        }

        return extendAttributeValueList;
    }

    /**
     * Bo->Dao
     */
    public static AccountExtend convertAccountExtendAttributeBoToDao(ExtendAttributeValueBo bo) {
        if (bo == null) {
            return null;
        }

        AccountExtend dao = new AccountExtend();
        dao.setAccountId(bo.getParentId());
        dao.setTenantId(bo.getTenantId());
        dao.setAttrId(bo.getAttributeId());
        dao.setAttrFieldName(bo.getAttributeFieldName());
        dao.setAttrFieldValue(bo.getAttributeFieldValue());

        return dao;
    }
}
