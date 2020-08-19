package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.service.AbstractExtendAttributeValueService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Desc 账户基础病史
 * @Author 24763
 * @Date 2020/8/19 19:19
 */
@Service
public class AccountExtendServiceImpl extends AbstractExtendAttributeValueService {


    @Override
    protected void addExtendAttributeValueInfo(String parentId, ExtendAttributeValueBo extendAttributeInfo, String createUserId) {

    }

    @Override
    protected int modifyExtendAttributeValueInfo(String parentId, ExtendAttributeValueBo extendAttributeInfo, String updateUserId) {
        return 0;
    }

    @Override
    public void removeExtendAttributeValueInfo(String parentId, List<String> attributeIdList, String deleteUserId) {

    }

    @Override
    public List<ExtendAttributeBo> findExtendAttributeValueInfoById(String tenantId, String parentId) {
        return null;
    }

    @Override
    public Map<String, List<ExtendAttributeBo>> findExtendAttributeValueMapByIdList(String tenantId, List<String> parentIdList) {
        return null;
    }

    @Override
    public List<String> findParentIdByAttributeNameAndValue(String tenantId, String attributeFieldName, String attributeFieldValue) {
        return null;
    }

    @Override
    public boolean isExtendAttributeValueUnique(String tenantId, String parentId, String attributeId, String attributeFieldValue) {
        return false;
    }
}
