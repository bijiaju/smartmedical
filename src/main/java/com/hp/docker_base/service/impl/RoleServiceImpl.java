package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.Role;
import com.hp.docker_base.bean.RoleUser;
import com.hp.docker_base.bean.dto.RoleDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumRole;
import com.hp.docker_base.mapper.RoleMapper;
import com.hp.docker_base.mapper.RoleUserMapper;
import com.hp.docker_base.service.IRoleMenuService;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.util.CommonUtil;
import com.hp.docker_base.util.convert.RoleObjectConvert;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

/**
 * @description: 获取角色实现
 * @author: biyangqiang
 * @time: 2020/7/4 22:15
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private IRoleMenuService roleMenuService;

    @Override
    public List<Role> findAllRoles(String keywords) {
        return roleMapper.selectAllRoles(keywords);
    }

    @Override
    public int deleteRoleInfo(String roleId,
                              String userName) {

        Role oldRole = this.findRoleByRoleId(roleId);
        if(oldRole != null){
            if(oldRole.getUuid().equals(EnumRole.DOCTOR.getCode())
                    || oldRole.getUuid().equals(EnumRole.ADMIN.getCode())){
                throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"该角色不可删除！");
            }

            List<String> menuIdList = roleMenuService.findMenuIdListByRoleId(roleId);
            if(!CollectionUtils.isEmpty(menuIdList)){
                throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"角色下还有菜单，暂无法删除");
            }

            oldRole.setIsDelete(EnumDelete.DELETE.getCode());
            return roleMapper.updateRole(oldRole);
        }
        return 0;
    }

    @Override
    public Role findRoleByRoleId(String roleId) {
        if(StringUtils.isEmpty(roleId)){
            return null;
        }
        return roleMapper.findRoleByRoleId(roleId);
    }

    @Override
    public int addRoleInfo(RoleDto roleDto,
                           String userName) {
        Role role =  RoleObjectConvert.convertRoleDtoToDao(roleDto);

        role.setUuid(CommonUtil.generateUUID());
        role.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        role.setCreateTime(new Date());
        role.setUpdateTime(new Date());
        role.setCreateUser(userName);
        role.setUpdateUser(userName);

        checkRoleValidity(role);

        return roleMapper.addRoleInfo(role);
    }


    @Override
    public int modifyRoleInfo(RoleDto roleDto,
                              String userName) {
        Role newRole =  RoleObjectConvert.convertRoleDtoToDao(roleDto);

        checkRoleValidity(newRole);

        // 老角色
        Role oldRole = this.findRoleByRoleId(roleDto.getUuid());
        if(oldRole != null){
            newRole.setCreateTime(oldRole.getCreateTime());
            newRole.setUpdateTime(new Date());
            newRole.setCreateUser(oldRole.getCreateUser());
            newRole.setUpdateUser(userName);
            newRole.setIsDelete(EnumDelete.NOT_DELETE.getCode());

            return roleMapper.updateRole(newRole);
        }

        return 0;
    }

    @Override
    public boolean queryRoleNameIsUnique(String roleId,
                                         String roleName) {
        Role user = roleMapper.selectRoleByName(roleName);
        if(user == null){
            return true;
        }else {
            // 1-2 找到账户，如果是当前编辑账户的话，则认为账户名也是唯一的
            return StringUtils.isNotEmpty(roleId) && user.getUuid().equals(roleId);
        }
    }

    @Override
    public int addRoleMember(String roleId,
                             List<String> memberIds,
                             String userName) {
        int totalCount = 0;
        if(!CollectionUtils.isEmpty(memberIds)){
            for(String memberId: memberIds){
                totalCount += addRoleMemberInfo(memberId,
                        roleId,
                        userName);
            }
        }
        return totalCount;
    }

    @Override
    public int addRoleMemberInfo(String userId,
                                 String roleId,
                                 String userName){
        if(StringUtils.isEmpty(userId)
                || StringUtils.isEmpty(roleId)){
            return 0;
        }

        RoleUser roleUser = new RoleUser();
        roleUser.setUserId(userId);
        roleUser.setRoleId(roleId);
        roleUser.setCreateTime(new Date());
        roleUser.setUpdateTime(new Date());
        roleUser.setCreateUser(userName);
        roleUser.setUpdateUser(userName);
        roleUser.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        return roleUserMapper.insertRoleUser(roleUser);
    }

    private void checkRoleValidity(Role role) {
        boolean isNotExist = this.queryRoleNameIsUnique(role.getUuid(),
                role.getRoleName());
        if(!isNotExist){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"角色已经存在");
        }
    }

}
