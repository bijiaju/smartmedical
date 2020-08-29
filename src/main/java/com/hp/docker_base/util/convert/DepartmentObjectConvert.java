package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.Department;
import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.dto.DepartmentDto;
import com.hp.docker_base.bean.dto.RoleDto;
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
public class DepartmentObjectConvert {

    

    public static List<DepartmentDto> convertDepartmentList2Dto(List<Department> menuList) {
        // 判空
        if (CollectionUtils.isEmpty(menuList)) {
            return new ArrayList<>();
        }

        // 数据流转换
        return menuList.stream().map(DepartmentObjectConvert::convertDepartmentList2Dto).collect(Collectors.toList());
    }


    public static DepartmentDto convertDepartmentList2Dto(Department menu) {
        DepartmentDto dto = new DepartmentDto();

        BeanUtils.copyProperties(menu,dto);

        dto.setDepartmentId(menu.getUuid());
        dto.setDepartmentName(menu.getName());

        return dto;
    }


}
