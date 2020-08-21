package com.hp.docker_base.service;

import com.hp.docker_base.bean.dto.extend.ExtendAttributeDto;
import com.hp.docker_base.bean.dto.extend.ExtendAttributeValueDto;

import java.util.List;

/**
 * @Desc 诊断特征api
 * @Author 24763
 * @Date 2020/7/6 17:29
 */
public interface IDiagnosticFeatureService {

    /**
     * 查询账户拓展属性的值
     */
    List<ExtendAttributeDto> queryAccountExtendAttributeInfo(String departmentId,
                                                             String userId);

    /**
     * 添加特征
     */
    int addAccountExtendAttribute(String departmentId,
                                  String category,
                                  List<ExtendAttributeValueDto> extendAttributeInfoList,
                                  String userName);

    /**
     * 编辑拓展属性
     */
    List<ExtendAttributeDto> editAccountExtendAttributeInfo(String departmentId,
                                                            String category,
                                                            List<ExtendAttributeValueDto> extendAttributeInfoList,
                                                            String userName);

    /**
     * 删除拓展属性
     */
    int deleteAccountByAccountId(String category,
                                 List<String> memberList,
                                 String userName);
}
