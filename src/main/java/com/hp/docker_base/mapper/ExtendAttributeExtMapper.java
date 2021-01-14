package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.TranAttr;
import com.hp.docker_base.bean.extend.ExtendSelectionAttributeConfig;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: idaas
 * @description: 扩展属性增强SQL方法
 * @author: bee
 * @create: 2020-03-31 15:52
 **/
@Mapper
public interface ExtendAttributeExtMapper {
    /**
     * 获取最大排序值
     */
    Integer maxSort(@Param("tenantId") String tenantId);


    /**
     * 获取转换数据
     */
    List<TranAttr> selectTransFeignMap();

    List<TranAttr> selectAttrNumMap();


    // 根据属性编号 获取select列表
    List<ExtendSelectionAttributeConfig> selectSelectionListByAttrId(@Param("attrId") String attrId);
}