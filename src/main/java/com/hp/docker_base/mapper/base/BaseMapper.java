package com.hp.docker_base.mapper.base;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/8/19 16:49
 */
import java.io.Serializable;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface BaseMapper<T extends Serializable, PK extends Serializable, Example> {
    long countByExample(Example var1);

    int deleteByExample(Example var1);

    int deleteByPrimaryKey(PK var1);

    int insert(T var1);

    int insertSelective(T var1);

    List<T> selectByExample(Example var1);

    List<T> selectByExample(Example var1, RowBounds var2);

    T selectByPrimaryKey(PK var1);

    int updateByExampleSelective(@Param("record") T var1, @Param("example") Example var2);

    int updateByExample(@Param("record") T var1, @Param("example") Example var2);

    int updateByPrimaryKeySelective(T var1);

    int updateByPrimaryKey(T var1);
}