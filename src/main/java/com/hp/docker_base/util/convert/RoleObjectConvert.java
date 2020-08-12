package com.hp.docker_base.util.convert;

import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.dto.MenuDto;
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
public class RoleObjectConvert {

    /**
     * 构建树模型
     */
    public static List<MenuDto> buildMenuTreeList(List<MenuDto> resourceTreeDtoList) {

        MenuDto lastOran = resourceTreeDtoList.get(0);
        List<MenuDto> list = new ArrayList<>();
        for (int i = 0; i < resourceTreeDtoList.size(); i++) {
            MenuDto organization = resourceTreeDtoList.get(i);
            if(lastOran.getParentId().equals(organization.getParentId())){
                list.add(organization);
            }
        }
        for(MenuDto organization:list){
            organization.setChildren(getMenuChildNodes(organization.getUuid(),resourceTreeDtoList));
        }
        return list;
    }

    /**
     *  递归获取子节点数据
     * @param code 企业编号
     * @param rootList 待递归数据
     * @return
     */
    private static List<MenuDto> getMenuChildNodes(String code, List<MenuDto> rootList) {
        List<MenuDto> childList = new ArrayList<>();
        for (MenuDto organization : rootList) {
            if (org.apache.commons.lang3.StringUtils.isNotBlank(organization.getParentId())) {
                if (code.equals(organization.getParentId())) {
                    childList.add(organization);
                }
            }
        }
        if (childList.size() == 0) {
            return null;
        }
        for (MenuDto entity : childList) {
            entity.setChildren(getMenuChildNodes(entity.getUuid(), rootList));
        }
        return childList;
    }


    public static List<MenuDto> convertMenuList2Dto(List<Menu> menuList) {
        // 判空
        if (CollectionUtils.isEmpty(menuList)) {
            return new ArrayList<>();
        }

        // 数据流转换
        return menuList.stream().map(RoleObjectConvert::convertMenuList2Dto).collect(Collectors.toList());
    }


    public static MenuDto convertMenuList2Dto(Menu menu) {
        MenuDto dto = new MenuDto();
        BeanUtils.copyProperties(menu,dto);
        return dto;
    }

    public static Role convertRoleDtoToDao(RoleDto roleDto) {
        Role role = new Role();
        BeanUtils.copyProperties(roleDto,role);
        return role;
    }
}
