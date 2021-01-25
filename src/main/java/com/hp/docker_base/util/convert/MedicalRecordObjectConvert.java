package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.bo.MedicalRecordBo;
import com.hp.docker_base.bean.dto.MedicalRecordDto2;
import com.hp.docker_base.bean.dto.UserDto;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/4 16:20
 */
public class MedicalRecordObjectConvert {

    public static MedicalRecordDto2 convertMedicalRecord2Dto(MedicalRecordBo user){
        MedicalRecordDto2 dto = new MedicalRecordDto2();
        BeanUtils.copyProperties(user,dto);
        return dto;
    }


    public static User convertUserDto2User(UserDto dto){
        User user = new User();
        BeanUtils.copyProperties(dto,user);
        return user;
    }

    /**
     * List : Bo->Dto MedicalRecord
     */
    public static List<MedicalRecordDto2> convertMedicalRecordList2Dto(List<MedicalRecordBo> medicalRecordBos) {
        // 判空
        if (CollectionUtils.isEmpty(medicalRecordBos)) {
            return new ArrayList<>();
        }

        // 数据流转换
        return medicalRecordBos.stream().map(MedicalRecordObjectConvert::convertMedicalRecord2Dto).collect(Collectors.toList());
    }

}
