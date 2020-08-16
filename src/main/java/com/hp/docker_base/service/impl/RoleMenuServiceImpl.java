package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.RoleMenu;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.mapper.RoleMenuMapper;
import com.hp.docker_base.service.IRoleMenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/8/16 10:39
 */
@Service
public class RoleMenuServiceImpl implements IRoleMenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    public List<String> findMenuIdListByRoleId(String roleId) {
        if(!StringUtils.isEmpty(roleId)){
            return roleMenuMapper.findMenuIdListByRoleId(roleId);
        }
        return null;
    }

    @Override
    public int saveRoleMenu(String roleId,
                            List<String> addResourceIds,
                            List<String> dataBaseResourceIds,
                            String userName) {
        if(StringUtils.isEmpty(roleId)
                || CollectionUtils.isEmpty(addResourceIds)){
            return 0;
        }

        int total = 0;
        for(String menuId:addResourceIds){
            RoleMenu record = new RoleMenu();
            record.setRoleId(roleId);
            record.setMenuId(menuId);

            record.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            record.setCreateUser(userName);
            record.setCreateTime(new Date());
            record.setUpdateUser(userName);
            record.setUpdateTime(new Date());
            total += roleMenuMapper.insert(record);
        }
        return total;
    }

    @Override
    public int removeRoleMenu(String roleId,
                              List<String> deleteResourceIds) {
        if(StringUtils.isEmpty(roleId)
                || CollectionUtils.isEmpty(deleteResourceIds)){
            return 0;
        }

        //roleMenuMapper.findRoleMenu(roleId,)
        int total = 0;
        for(String menuId:deleteResourceIds){
            total += roleMenuMapper.deleteRoleMenu(roleId,menuId);
        }
        return total;
    }
}
