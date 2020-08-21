package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.AccountExtend;
import com.hp.docker_base.bean.AccountExtendExample;
import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.AccountExtendMapper;
import com.hp.docker_base.service.AbstractExtendAttributeValueService;
import com.hp.docker_base.util.ObjectConvertUtils;
import com.hp.docker_base.util.convert.AccountObjectTypeConvertUtils;
import org.apache.commons.collections4.CollectionUtils;
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


    @Autowired
    private AccountExtendMapper accountExtendMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    protected void addExtendAttributeValueInfo(String accountId,
                                               ExtendAttributeValueBo extendAttributeInfo,
                                               String createUserId) {
        if (StringUtils.isEmpty(accountId)
                || extendAttributeInfo == null
                || StringUtils.isEmpty(createUserId)) {
            return;
        }

        // 添加账户扩展属性的值记录
        AccountExtend record = AccountObjectTypeConvertUtils.convertAccountExtendAttributeBoToDao(extendAttributeInfo);

        record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        record.setCreateTime(new Date());
        record.setCreateNumber(createUserId);
        record.setUpdateTime(new Date());
        record.setUpdateNumber(createUserId);

        accountExtendMapper.insert(record);

    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    protected int modifyExtendAttributeValueInfo(String accountId,
                                                 ExtendAttributeValueBo extendAttributeInfo,
                                                 String updateUserId) {
        if (StringUtils.isEmpty(accountId)
                || extendAttributeInfo == null
                || StringUtils.isEmpty(updateUserId)) {
            return 0;
        }

        // 更新账户扩展属性的值记录
        AccountExtend record = AccountObjectTypeConvertUtils.convertAccountExtendAttributeBoToDao(extendAttributeInfo);

        record.setUpdateTime(new Date());
        record.setUpdateNumber(updateUserId);

        AccountExtendExample example = new AccountExtendExample();
        AccountExtendExample.Criteria criteria = example.createCriteria();
        criteria.andAccountIdEqualTo(accountId);
        criteria.andAttrIdEqualTo(extendAttributeInfo.getAttributeId());
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return accountExtendMapper.updateByExampleSelective(record, example);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeExtendAttributeValueInfo(String accountId,
                                               List<String> attributeIdList,
                                               String deleteUserId) {

        if (StringUtils.isEmpty(accountId)
                || StringUtils.isEmpty(deleteUserId)) {
            return;
        }

        // 删除账户扩展属性的值记录
        AccountExtend record = new AccountExtend();
        record.setIsDelete(EnumDelete.DELETE.getCode());
        record.setUpdateTime(new Date());
        record.setUpdateNumber(deleteUserId);

        AccountExtendExample example = new AccountExtendExample();
        AccountExtendExample.Criteria criteria = example.createCriteria();
        criteria.andAccountIdEqualTo(accountId);
        if (CollectionUtils.isNotEmpty(attributeIdList)) {
            criteria.andAttrIdIn(attributeIdList);
        }
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        accountExtendMapper.updateByExampleSelective(record, example);
    }

    @Override
    public List<ExtendAttributeBo> findExtendAttributeValueInfoById(String tenantId,
                                                                    String accountId) {
        List<ExtendAttributeBo> accountExtendAttributeList = new ArrayList<>();
        if (StringUtils.isEmpty(accountId)) {
            return accountExtendAttributeList;
        }

        // 1、获取账户分类下的扩展属性列表
        accountExtendAttributeList = extendAttributeService.findExtendAttributeListByCategory(
                tenantId,
                Integer.valueOf(accountId)
        );
        if (CollectionUtils.isEmpty(accountExtendAttributeList)) {
            return accountExtendAttributeList;
        }

        // 2、获取该账户下的扩展属性值列表
        List<AccountExtend> accountExtendList = queryAccountExtendInfo(Collections.singletonList(accountId));
        if (CollectionUtils.isEmpty(accountExtendList)) {
            return accountExtendAttributeList;
        }

        // 3、拼接最终的结果，以账户分类下的扩展属性列表为主体（因为获取的扩展属性值列表可能会多无效的扩展属性）
        Map<String, List<AccountExtend>> accountExtendMap = accountExtendList
                .stream()
                .collect(Collectors.groupingBy(AccountExtend::getAttrId));

        for (ExtendAttributeBo extendAttributeInfo : accountExtendAttributeList) {
            if (accountExtendMap.containsKey(extendAttributeInfo.getUuid())) {
                AccountExtend accountExtendInfo = ObjectConvertUtils.getFirstElementOfList(accountExtendMap.get(extendAttributeInfo.getUuid()));
                if (accountExtendInfo != null) {
                    extendAttributeInfo.setAttributeFieldValue(accountExtendInfo.getAttrFieldValue());
                }
            }
        }

        return accountExtendAttributeList;
    }

   /* @Override
    public List<String> findParentIdByAttributeNameAndValue(String tenantId,
                                                            String attributeFieldName,
                                                            String attributeFieldValue) {
        if (StringUtils.isEmpty(tenantId) || StringUtils.isEmpty(attributeFieldName) || StringUtils.isEmpty(attributeFieldValue)) {
            return new ArrayList<>();
        }

        // 1、获取扩展属性信息
        ExtendAttribute extendAttributeInfo = extendAttributeService.findExtendAttributeConfigInfoByFiledName(
                tenantId,
                EnumExtendAttributeCategory.ORGANIZATION.getCode(),
                attributeFieldName
        );
        if (extendAttributeInfo == null) {
            return new ArrayList<>();
        }

        // 2、查询扩展属性值对应的账户编号列表
        AccountExtendExample example = new AccountExtendExample();
        AccountExtendExample.Criteria criteria = example.createCriteria();

        criteria.andAttrFieldNameEqualTo(extendAttributeInfo.getFieldName());
        EnumExtendAttributeType attributeType = EnumExtendAttributeType.getExtendAttributeType(extendAttributeInfo.getFieldType());
        if (EnumExtendAttributeType.isMultipleSelectionAttributeType(attributeType)) {
            criteria.andAttrFieldNameLike("%" + attributeFieldValue + "%");
        } else {
            criteria.andAttrFieldValueEqualTo(attributeFieldValue);
        }

        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return Optional.ofNullable(accountExtendMapper.selectByExample(example))
                .map(list -> list.stream().map(AccountExtend::getAccountId).collect(Collectors.toList()))
                .orElse(new ArrayList<>());
    }*/

    /*@Override
    public Map<String, List<ExtendAttributeBo>> findExtendAttributeValueMapByIdList(String tenantId,
                                                                                    List<String> accountIdList) {
        Map<String, List<ExtendAttributeBo>> extendAttributeMap = new HashMap<>();
        if (StringUtils.isEmpty(tenantId) || CollectionUtils.isEmpty(accountIdList)) {
            return extendAttributeMap;
        }

        // 1、获取账户分类下的扩展属性列表
        List<ExtendAttributeBo> accountExtendAttributeList = extendAttributeService.findExtendAttributeListByCategory(
                tenantId,
                EnumExtendAttributeCategory.ACCOUNT.getCode()
        );
        if (CollectionUtils.isEmpty(accountExtendAttributeList)) {
            return extendAttributeMap;
        }

        // 2、获取扩展属性值列表
        List<AccountExtend> accountExtendList = queryAccountExtendInfo(accountIdList);

        // 3、拼接最终的结果，以账户分类下的扩展属性列表为主体（因为获取的扩展属性值列表可能会多无效的扩展属性）
        Map<String, AccountExtend> accountExtendMap = accountExtendList
                .stream()
                .collect(Collectors.toMap(
                        accountExtend -> accountExtend.getAccountId() + "_" + accountExtend.getAttrId(),
                        accountExtend -> accountExtend)
                );

        accountIdList.forEach(accountId -> {
            List<ExtendAttributeBo> list =
                    accountExtendAttributeList.stream().map(extendAttribute -> {
                        ExtendAttributeBo copy = CloneUtils.clone(extendAttribute);
                        copy.setParentId(accountId);
                        AccountExtend extendInfo = accountExtendMap.get(accountId + "_" + extendAttribute.getUuid());
                        if (extendInfo != null) {
                            copy.setAttributeFieldValue(extendInfo.getAttrFieldValue());
                        } else {
                            copy.setAttributeFieldValue("");
                        }

                        return copy;
                    }).collect(Collectors.toList());

            extendAttributeMap.put(accountId, list);
        });

        return extendAttributeMap;
    }*/

    /**
     * 查询账户机构扩展属性值信息
     *
     * @param accountIdList 账户编号
     */
    private List<AccountExtend> queryAccountExtendInfo(List<String> accountIdList) {
        List<AccountExtend> accountExtendList = new ArrayList<>();
        if (CollectionUtils.isEmpty(accountIdList)) {
            return accountExtendList;
        }

        AccountExtendExample example = new AccountExtendExample();
        AccountExtendExample.Criteria criteria = example.createCriteria();
        criteria.andAccountIdIn(accountIdList);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());

        return accountExtendMapper.selectByExample(example);
    }

    @Override
    public boolean isExtendAttributeValueUnique(String tenantId,
                                                String accountId,
                                                String attributeId,
                                                String attributeFieldValue) {
        if (StringUtils.isEmpty(tenantId)
                || StringUtils.isEmpty(attributeId)
                || StringUtils.isEmpty(attributeFieldValue)) {
            return true;
        }

        AccountExtendExample example = new AccountExtendExample();
        AccountExtendExample.Criteria criteria = example.createCriteria();
        criteria.andAttrIdEqualTo(attributeId);
        criteria.andIsDeleteEqualTo(EnumDelete.NOT_DELETE.getCode());
        criteria.andTenantIdEqualTo(tenantId);
        criteria.andAttrFieldValueEqualTo(attributeFieldValue);

        List<AccountExtend> list = accountExtendMapper.selectByExample(example);

        return list.size() == 0 || (list.size() == 1 && list.get(0).getAccountId().equals(accountId));
    }
}
