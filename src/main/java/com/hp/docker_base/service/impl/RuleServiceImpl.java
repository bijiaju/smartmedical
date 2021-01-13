package com.hp.docker_base.service.impl;

import cn.hutool.json.JSONObject;
import com.alibaba.fastjson.JSON;
import com.hp.docker_base.bean.Mdc2;
import com.hp.docker_base.bean.Mdc2Example;
import com.hp.docker_base.bean.Reference;
import com.hp.docker_base.bean.dto.BeliefDto;
import com.hp.docker_base.bean.dto.ReferenceDto;
import com.hp.docker_base.bean.dto.RuleDetailDto;
import com.hp.docker_base.mapper.Mdc2Mapper;
import com.hp.docker_base.service.IRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: biyangqiang
 * @Description:
 * @Date: Created in 22:24 2021/1/13
 * @Modify By:
 */
@Service
public class RuleServiceImpl implements IRuleService {

    @Autowired
    private Mdc2Mapper mdc2Mapper;

    @Override
    public List<RuleDetailDto> findAllRules() {
        List<RuleDetailDto> ruleDetailDtoList = new ArrayList<>();

        List<Mdc2> allJsonRules = getAllJsonRules();
        for(Mdc2 mdc2 : allJsonRules){
            RuleDetailDto detailDto = new RuleDetailDto();

            Integer ruleId = mdc2.getRule();// 规则编号
            String ruleJson = mdc2.getReference();//规则
            String sickJson = mdc2.getBelief();// 疾病

            //
            List<ReferenceDto> ruleList = new ArrayList<>();
            List<BeliefDto> sickList = new ArrayList<>();

            // 转换每一个规则
            List<Reference> rules = null;
            List<String> sicks = null;



            detailDto.setRuleId(ruleId);
            detailDto.setRuleList(ruleList);// 规则列表
            detailDto.setSickList(sickList);// 疾病列表
            ruleDetailDtoList.add(detailDto);
        }
        return ruleDetailDtoList;
    }

    /**
     * 获取所有的jsonrule
     */
    private List<Mdc2> getAllJsonRules(){
        Mdc2Example example = new Mdc2Example();
        Mdc2Example.Criteria criteria = example.createCriteria();

        List<Mdc2> mdc2s = mdc2Mapper.selectByExample(example);
        return mdc2s;
    }
}
