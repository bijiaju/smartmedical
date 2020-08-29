package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.bo.ExtendAttributeBo;
import com.hp.docker_base.bean.bo.ExtendAttributeValueBo;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeValueDto;
import com.hp.docker_base.bean.em.EnumExtendAttributeCategory;
import com.hp.docker_base.service.IDepartmentService;
import com.hp.docker_base.service.IDiagnosticFeatureExtService;
import com.hp.docker_base.service.IDiagnosticFeatureService;
import com.hp.docker_base.util.convert.AccountObjectTypeConvertUtils;
import com.hp.docker_base.util.convert.ExtendAttributeObjectTypeConvertUtils;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/6 17:30
 */
@Service
public class DiagnosticFeatureServiceImpl implements IDiagnosticFeatureService {

    @Autowired
    private IDiagnosticFeatureExtService featureExtService;

    @Autowired
    private AccountExtendServiceImpl accountExtendService;

    @Autowired
    private IDepartmentService departmentService;



    @Override
    public List<ExtendAttributeDto> queryAccountExtendAttributeInfo(String departmentId,
                                                                    String userId) {
        List<Department> departmentList = departmentService.queryAllDepartmentList(null);

        List<ExtendAttributeBo> extendAttributeBoList = featureExtService.findAccountExtendAttributeInfoById(departmentId, userId);

        List<ExtendAttributeDto> extendAttributeDtoList = ExtendAttributeObjectTypeConvertUtils.convertExtendAttributeBoToDtoList(extendAttributeBoList,departmentList);

        return extendAttributeDtoList;
    }

    @Override
    public int addAccountExtendAttribute(String medicalRecordId,
                                         String category,
                                         List<ExtendAttributeValueDto> extendAttributeInfoList,
                                         String userName) {

        // 1、添加扩展属性
        List<ExtendAttributeValueBo> extendAttributeValueList = AccountObjectTypeConvertUtils.convertAccountExtendValueDtoToBo(
                medicalRecordId,
                category,
                extendAttributeInfoList);

        EnumExtendAttributeCategory extendAttributeCategory = EnumExtendAttributeCategory.getExtendAttributeCategory(Integer.valueOf(category));

        int totalCount = 0;
        if (CollectionUtils.isNotEmpty(extendAttributeInfoList)) {
             accountExtendService.saveExtendAttributeValueInfo(
                     category,
                     medicalRecordId,
                    extendAttributeCategory,
                    extendAttributeValueList,
                    userName
            );
        }

        return totalCount;
    }

    @Override
    public List<ExtendAttributeDto> editAccountExtendAttributeInfo(String medicalRecordID,
                                                                   String category,
                                                                   List<ExtendAttributeValueDto> extendAttributeInfoList,
                                                                   String userName) {

        // 2、类型转换
        List<ExtendAttributeValueBo> extendAttributeValueList = AccountObjectTypeConvertUtils.
                convertAccountExtendValueDtoToBo( medicalRecordID, category,extendAttributeInfoList);

        EnumExtendAttributeCategory extendAttributeCategory = EnumExtendAttributeCategory.getExtendAttributeCategory(Integer.valueOf(category));

        if (CollectionUtils.isNotEmpty(extendAttributeInfoList)) {
            accountExtendService.saveExtendAttributeValueInfo(
                    category,
                    medicalRecordID,
                    extendAttributeCategory,
                    extendAttributeValueList,
                    userName
            );
        }

        return null;
    }

    @Override
    public int deleteAccountByAccountId(String medicalRecordId,
                                        List<String> memberList,
                                        String userName) {
        // 2、联动删除账户的扩展属性信息
        accountExtendService.removeExtendAttributeValueInfo(
                medicalRecordId,
                memberList,
                userName);
        return 0;
    }
}
