package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.MDC1;
import com.hp.docker_base.bean.MDC1Example;
import com.hp.docker_base.bean.em.EnumMDC1Type;
import com.hp.docker_base.mapper.MDC1Mapper;
import com.hp.docker_base.service.IMDC1Service;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/10/27 14:51
 */
@Service
public class MDC1ServiceImpl implements IMDC1Service {

    @Autowired
    private MDC1Mapper mdc1Mapper;


    @Override
    public List<MDC1> querySickList(String departmentId) {
       /* if(StringUtils.isEmpty(departmentId)){
            return null;
        }*/

        return mdc1Mapper.selectSickList(departmentId);
      /*  MDC1Example example = new MDC1Example();
        MDC1Example.Criteria criteria = example.createCriteria();

        criteria.andDepartmentEqualTo(departmentId);
        criteria.andTypeEqualTo(EnumMDC1Type.OUT.getCode());

        return mdc1Mapper.selectByExample(example);*/
    }
}
