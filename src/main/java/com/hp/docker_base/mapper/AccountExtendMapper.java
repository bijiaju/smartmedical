package com.hp.docker_base.mapper;

import com.hp.docker_base.bean.AccountExtend;
import com.hp.docker_base.bean.AccountExtendExample;
import com.hp.docker_base.mapper.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface AccountExtendMapper extends BaseMapper<AccountExtend, Integer, AccountExtendExample> {
    long countByExample(AccountExtendExample example);

    int deleteByExample(AccountExtendExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AccountExtend record);

    int insertSelective(AccountExtend record);

    List<AccountExtend> selectByExample(AccountExtendExample example);

    AccountExtend selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AccountExtend record, @Param("example") AccountExtendExample example);

    int updateByExample(@Param("record") AccountExtend record, @Param("example") AccountExtendExample example);

    int updateByPrimaryKeySelective(AccountExtend record);

    int updateByPrimaryKey(AccountExtend record);
}