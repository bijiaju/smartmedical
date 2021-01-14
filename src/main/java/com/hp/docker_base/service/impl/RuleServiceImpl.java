package com.hp.docker_base.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.hp.docker_base.bean.*;
import com.hp.docker_base.bean.dto.ReferenceDto;
import com.hp.docker_base.bean.dto.RuleDetailDto;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfig;
import com.hp.docker_base.mapper.ExtendAttributeExtMapper;
import com.hp.docker_base.mapper.Mdc2Mapper;
import com.hp.docker_base.service.IExtendAttributeService;
import com.hp.docker_base.service.IMDC1Service;
import com.hp.docker_base.service.IRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

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

    @Autowired
    private IMDC1Service imdc1Service;

    @Autowired
    private IExtendAttributeService extendAttributeService;

    @Autowired
    private ExtendAttributeExtMapper extendAttributeExtMapper;

    @Override
    public List<RuleDetailDto> findAllRules() {

        Map<String, Object> beliefAndReferenceMap = getBeliefAndReferenceMap();
        List<MDC1> mdc1List = imdc1Service.queryFeatureList(null);
        /// 获取外键和uuid的map
        Map<String, String> uuidforMap = extendAttributeService.queryAttrSelectForeignIdMap();
        // 选项值map
        List<ExtendSelectionAttributeConfig> extendSelectionAttributes = extendAttributeExtMapper.selectSelectionListByAttrId(null);

        List<RuleDetailDto> ruleDetailDtoList = new ArrayList<>();

        ArrayList<ArrayList<ReferenceDto>> beliefValueList = getBeliefValueList(beliefAndReferenceMap,
                getFeatureMap("output",mdc1List));
        ArrayList<ArrayList<ReferenceDto>> referenceValueList = getReferenceValueList(beliefAndReferenceMap,
                getFeatureMap("input",mdc1List),
                uuidforMap,
                extendSelectionAttributes);

        List<Mdc2> allJsonRules = getAllJsonRules();
        for(int i =0 ;i<allJsonRules.size();i++){
            RuleDetailDto detailDto = new RuleDetailDto();

            Integer ruleId = allJsonRules.get(i).getRule();// 规则编号

            ArrayList<ReferenceDto> sickList = beliefValueList.get(i);
            ArrayList<ReferenceDto> ruleList = referenceValueList.get(i);
            ruleList.addAll(sickList);

            detailDto.setRuleId(ruleId);
            detailDto.setRuleList(ruleList);// 规则列表

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

    public ArrayList<ArrayList<ReferenceDto>> getReferenceValueList(Map<String, Object> beliefAndReferenceMap,
                                                                    Map<String, String> sickMap,
                                                                    Map<String, String> uuidforMap,
                                                                    List<ExtendSelectionAttributeConfig> selectListValueMap) {
        ArrayList<ArrayList<ReferenceDto>> retList = new ArrayList<ArrayList<ReferenceDto>>();

        // 1、获取所有Reference
        List<Reference> referenceList = (List<Reference>) beliefAndReferenceMap.get("reference");

        // 2、解析处理数据
        for(int i=0; i<referenceList.size();i++){

            ArrayList<ReferenceDto> referenceValues1 = new  ArrayList<ReferenceDto>();

            Reference reference = referenceList.get(i);

            double d1 = Double.parseDouble(reference.getId001());
            double d2 = Double.parseDouble(reference.getId002());
            double d3 = Double.parseDouble(reference.getId003());
            double d4 = Double.parseDouble(reference.getId004());
            double d5 = Double.parseDouble(reference.getId005());
            double d6 = Double.parseDouble(reference.getId006());
            double d7 = Double.parseDouble(reference.getId007());
            double d8 = Double.parseDouble(reference.getId008());
            double d9 = Double.parseDouble(reference.getId009());
            double d10 = Double.parseDouble(reference.getId010());
            double d11 = Double.parseDouble(reference.getId011());
            double d12 = Double.parseDouble(reference.getId012());
            double d13 = Double.parseDouble(reference.getId013());
            double d14 = Double.parseDouble(reference.getId014());
            double d15 = Double.parseDouble(reference.getId015());
            double d16 = Double.parseDouble(reference.getId016());

            // 获取id对应的uuid，获取uuid对应的类型值

            referenceValues1.add(new ReferenceDto("id001",sickMap.get("id001"),d1+"",d1));
            referenceValues1.add(new ReferenceDto("id002",sickMap.get("id002"),getSelectListValue("id002",new Double(d2).intValue()+"",uuidforMap,selectListValueMap),d2));
            referenceValues1.add(new ReferenceDto("id003",sickMap.get("id003"),getSelectListValue("id003",new Double(d3).intValue()+"", uuidforMap, selectListValueMap),d3));
            referenceValues1.add(new ReferenceDto("id004",sickMap.get("id004"),getSelectListValue("id004",new Double(d4).intValue()+"", uuidforMap, selectListValueMap),d4));
            referenceValues1.add(new ReferenceDto("id005",sickMap.get("id005"),getSelectListValue("id005",new Double(d5).intValue()+"", uuidforMap, selectListValueMap),d5));
            referenceValues1.add(new ReferenceDto("id006",sickMap.get("id006"),getSelectListValue("id006",new Double(d6).intValue()+"", uuidforMap, selectListValueMap),d6));
            referenceValues1.add(new ReferenceDto("id007",sickMap.get("id007"),getSelectListValue("id007",new Double(d7).intValue()+"", uuidforMap, selectListValueMap),d7));
            referenceValues1.add(new ReferenceDto("id008",sickMap.get("id008"),getSelectListValue("id008",new Double(d8).intValue()+"", uuidforMap, selectListValueMap),d8));
            referenceValues1.add(new ReferenceDto("id009",sickMap.get("id009"),getSelectListValue("id009",new Double(d9).intValue()+"", uuidforMap, selectListValueMap),d9));
            referenceValues1.add(new ReferenceDto("id010",sickMap.get("id010"),getSelectListValue("id010",new Double(d10).intValue()+"", uuidforMap, selectListValueMap),d10));
            referenceValues1.add(new ReferenceDto("id011",sickMap.get("id011"),getSelectListValue("id011",new Double(d11).intValue()+"", uuidforMap, selectListValueMap),d11));
            referenceValues1.add(new ReferenceDto("id012",sickMap.get("id012"),getSelectListValue("id012",new Double(d12).intValue()+"", uuidforMap, selectListValueMap),d12));
            referenceValues1.add(new ReferenceDto("id013",sickMap.get("id013"),getSelectListValue("id013",new Double(d13).intValue()+"", uuidforMap, selectListValueMap),d13));
            referenceValues1.add(new ReferenceDto("id014",sickMap.get("id014"),getSelectListValue("id014",new Double(d14).intValue()+"", uuidforMap, selectListValueMap),d14));
            referenceValues1.add(new ReferenceDto("id015",sickMap.get("id015"),getSelectListValue("id015",new Double(d15).intValue()+"", uuidforMap, selectListValueMap),d15));
            referenceValues1.add(new ReferenceDto("id016",sickMap.get("id016"),getSelectListValue("id016",new Double(d16).intValue()+"", uuidforMap, selectListValueMap),d16));

            retList.add(referenceValues1);
        }

        return retList;
    }

    public ArrayList<ArrayList<ReferenceDto>> getBeliefValueList(Map<String, Object> beliefAndReferenceMap,
                                                                 Map<String, String> sickMap) {
        ArrayList<ArrayList<ReferenceDto>> retList = new ArrayList<ArrayList<ReferenceDto>>();

        // 1、获取所有Reference
        List<Belief> referenceList = (List<Belief>) beliefAndReferenceMap.get("belief");

        // 2、解析处理数据
        for(int i=0; i<referenceList.size();i++){

            ArrayList<ReferenceDto> referenceValues1 = new  ArrayList<ReferenceDto>();

            Belief belief = referenceList.get(i);

            double d1 = Double.parseDouble(belief.getSk001());
            double d2 = Double.parseDouble(belief.getSk002());
            double d3 = Double.parseDouble(belief.getSk003());

            referenceValues1.add(new ReferenceDto("sk001",sickMap.get("sk001"),d1+"",d1));
            referenceValues1.add(new ReferenceDto("sk002",sickMap.get("sk002"),d2+"",d2));
            referenceValues1.add(new ReferenceDto("sk003",sickMap.get("sk003"),d3+"",d3));

            retList.add(referenceValues1);
        }

        return retList;
    }


    // 获取两者数据集合
    public Map<String,Object> getBeliefAndReferenceMap() {

        Map<String,Object> retMap = new HashMap<>();

        List<Mdc2> mdc2List = this.getAllJsonRules();

        List<Belief> retList = new ArrayList<>();
        List<Reference> referenceList = new ArrayList<>();
        if(mdc2List.isEmpty()){
            return null;
        }


        for(Mdc2 mdc2 :mdc2List){
            // 解析Belief
            String beliefJsonStr = mdc2.getBelief();
            Belief belief = JSONObject.parseObject(beliefJsonStr, Belief.class);

            String referenceJsonStr = mdc2.getReference();
            Reference reference = JSONObject.parseObject(referenceJsonStr, Reference.class);

            retList.add(belief);
            referenceList.add(reference);
        }
        retMap.put("belief",retList);
        retMap.put("reference",referenceList);

        return retMap;
    }



    // type :: output /input
    public Map<String, String> getFeatureMap(String type,List<MDC1> sickList){

        Map<String, String> sickMap = null;
        if(sickList != null && sickList.size() > 0){
            // 取不同类型数据
            sickList = sickList.parallelStream().filter(r->r.getType().equals(type)).collect(Collectors.toList());
            sickMap = sickList.stream().collect(Collectors.toMap(MDC1::getId, MDC1::getFeature));
        }

        return  sickMap;
    }



    private String getSelectListValue(String foreignId,
                                      String value,
                                      Map<String, String> uuidforMap,
                                      List<ExtendSelectionAttributeConfig> extendSelectionAttributes){
        // 获取uuid
        String attrID = uuidforMap.get(foreignId);
        if(!attrID.isEmpty()){

            if(!extendSelectionAttributes.isEmpty()){
                extendSelectionAttributes = extendSelectionAttributes.parallelStream().filter(r-> r.getAttrId().equals(attrID) && r.getSelectValue().equals(value)).collect(Collectors.toList());
                if(!extendSelectionAttributes.isEmpty()){
                    return extendSelectionAttributes.get(0).getContent();
                }
            }
        }

        return "";
    }
}
