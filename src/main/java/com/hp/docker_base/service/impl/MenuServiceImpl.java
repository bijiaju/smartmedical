package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Menu;
import com.hp.docker_base.bean.dto.MenuDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.mapper.MenuMapper;
import com.hp.docker_base.mapper.RoleMenuMapper;
import com.hp.docker_base.service.IMenuService;
import com.hp.docker_base.service.IRoleMenuService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.CommonObjectTypeConvertUtils;
import com.hp.docker_base.util.convert.MenuObjectConvert;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: biyangqiang
 * @time: 2020/7/4 23:11
 */
@Service
public class MenuServiceImpl implements IMenuService{
    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private IRoleMenuService roleMenuService;



    @Override
    public List<Menu> queryAllMenuList() {
        return menuMapper.selectAllMenuList();
    }

    @Override
    public List<Menu> queryMenuListByUserId(String userId) {
        if(StringUtils.isEmpty(userId)){
            return null;
        }
        return menuMapper.findMenuListByUserId(userId);
    }

    @Override
    public MenuDto addMenuInfo(MenuDto menuDto,
                               String userName) {
        Menu menu = MenuObjectConvert.convertMenuDto2Dao(menuDto);

        if(menu != null){
            menu.setUuid(CommonUtil.generateUUID());

            menu.setFullParh(getFullPath(menu.getParentId(),menu.getUuid()));
            menu.setLevel(CommonUtil.getLevel(menu.getFullParh()));
            menu.setSort(findDefaultMenuSort(menu.getParentId()));

            menu.setCreateTime(new Date());
            menu.setUpdateTime(new Date());
            menu.setCreateUser(userName);
            menu.setUpdateUser(userName);
            menu.setIsDelete(EnumDelete.NOT_DELETE.getCode());
            menuMapper.insertMenuInfo(menu);

            return MenuObjectConvert.convertMenu2Dto(this.findMenuByUUID(menu.getUuid()));
        }
        return null;
    }

    @Override
    public int findDefaultMenuSort(String parentId) {
        List<Menu> applicationResources = findMenuListByParentId(parentId);

        if (!CollectionUtils.isEmpty(applicationResources)) {
            return applicationResources.get(applicationResources.size() - 1).getSort() + 1;//获取最后一个sort值
        }
        return 1;
    }

    @Override
    public int deleteMenuInfo(String menuId,
                              String userName) {
        List<Menu> menuList = this.findMenuListByParentId(menuId);
        if(!CollectionUtils.isEmpty(menuList)){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),
                    "当前菜单下还有子菜单");
        }else{
            Menu menu = this.findMenuByUUID(menuId);
            menu.setIsDelete(EnumDelete.DELETE.getCode());

            return menuMapper.updateMenuInfo(menu);
        }
    }

    @Override
    public MenuDto modifyMenuInfo(MenuDto menuDto,
                              String userName) {
        Menu newMenu = MenuObjectConvert.convertMenuDto2Dao(menuDto);

        Menu oldMenu = this.findMenuByUUID(menuDto.getUuid());
        if(oldMenu != null){
            oldMenu.setName(newMenu.getName());
            oldMenu.setParentId(newMenu.getParentId());
            oldMenu.setFullParh(getFullPath(oldMenu.getParentId(),oldMenu.getUuid()));
            oldMenu.setLevel(CommonUtil.getLevel(oldMenu.getFullParh()));

            oldMenu.setSort(newMenu.getSort());

            oldMenu.setUpdateUser(userName);
            oldMenu.setUpdateTime(new Date());

            menuMapper.updateMenuInfo(oldMenu);
            return MenuObjectConvert.convertMenu2Dto(this.findMenuByUUID(oldMenu.getUuid()));
        }

        return null;
    }

    @Override
    public int addRoleMenuInfo(String roleId,
                               List<String> resourceIds,
                               String userName) {
        // 1、 获取角色数据库应用资源
        List<String> dataBaseResourceIds = roleMenuService.findMenuIdListByRoleId(roleId);

        List<String> addResourceIds = CommonObjectTypeConvertUtils.getAddId(resourceIds, dataBaseResourceIds);
        List<String> deleteResourceIds = CommonObjectTypeConvertUtils.getDeleteId(resourceIds, dataBaseResourceIds);

        // 2、 添加人和应用资源的关系
        int total = 0;
        if (!CollectionUtils.isEmpty(addResourceIds)) {
            int addCount = roleMenuService.saveRoleMenu(roleId,
                    addResourceIds, dataBaseResourceIds, userName);
            total += addCount;
        }
        // 3、 删除角色和应用资源的关系
        if (!CollectionUtils.isEmpty(deleteResourceIds)) {
            int delCount = roleMenuService.removeRoleMenu(roleId,
                    deleteResourceIds);
            total += delCount;
        }
        return total;
    }

    @Override
    public List<Menu> queryMenuListByRoleId(String roleId) {
        if(StringUtils.isNotEmpty(roleId)){
            List<String> menuIdList = roleMenuService.findMenuIdListByRoleId(roleId);
            if(!CollectionUtils.isEmpty(menuIdList)){
                return menuMapper.selectMenuByIdList(menuIdList);
            }
        }
        return null;
    }

    private List<Menu> findMenuListByParentId(String parentId) {
        if(StringUtils.isNotEmpty(parentId)){
            return menuMapper.selectMenuListByParentId(parentId);
        }
        return null;
    }

    @Override
    public Menu findMenuByUUID(String uuid) {
        if(StringUtils.isNotEmpty(uuid)){
            return menuMapper.selectMenuByUUID(uuid);
        }
        return null;
    }

    /**
     * 根据父亲编号和 当前编号 返回fullpath
     *
     * @param parentId 父亲编号
     * @param Id       当前编号
     */
    private String getFullPath(String parentId,
                               String Id) {
        if (StringUtils.isEmpty(parentId)) {//"" 表示是父亲节点
            return "-1";
        } else {
            Menu applicationResource = this.findMenuByUUID(parentId);
            if(applicationResource == null){
                return "-1";
            }
            return applicationResource.getFullParh() + "/" + Id;
        }
    }
}
