package com.hp.docker_base.service.impl;

import com.hp.docker_base.bean.RoleUser;
import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.condition.UserCondition;
import com.hp.docker_base.bean.dto.UserDto;
import com.hp.docker_base.em.EnumDelete;
import com.hp.docker_base.em.EnumOKOrNG;
import com.hp.docker_base.em.EnumRole;
import com.hp.docker_base.mapper.RoleUserMapper;
import com.hp.docker_base.mapper.UserMapper;
import com.hp.docker_base.service.IRoleService;
import com.hp.docker_base.service.IUserService;
import com.hp.docker_base.util.MD5Utils;
import com.hp.docker_base.util.convert.UserObjectConvert;
import com.hp.docker_base.util.validate.ErrorParamException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Desc TODO
 * @Author 24763
 * @Date 2020/7/4 15:14
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private IRoleService roleService;

    @Override
    public List<User> findAllUsers(String departmentId, String keywords) {
        UserCondition condition = new UserCondition();
        condition.setDepartmentId(departmentId);
        condition.setKeywords(keywords);
        return userMapper.selectAllUsers(condition);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addUserInfo(UserDto userInfo) {

        // 新增账户
        User user = UserObjectConvert.convertUserDto2User(userInfo);

        String uuid = UUID.randomUUID().toString();
        user.setUuid(uuid);

        // 查看帐户名是否已经存在
        checkUserValidity(user);

        user.setPassword(MD5Utils.string2MD5(userInfo.getPassword()));
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setCreateUser(userInfo.getUserName());
        user.setUpdateUser(userInfo.getUserName());
        user.setIsDelete(EnumDelete.NOT_DELETE.getCode());
        user.setSort(queryUserSort());

        // 新增账户角色
        if(StringUtils.isEmpty(userInfo.getRoleId())){
            roleService.addRoleMemberInfo(uuid,
                    EnumRole.DOCTOR.getCode(),
                    userInfo.getUserName());
        }else if(userInfo.getRoleId().equals(EnumRole.DOCTOR.getCode())){
            roleService.addRoleMemberInfo(uuid,
                    EnumRole.DOCTOR.getCode(),
                    userInfo.getUserName());
        }else if(userInfo.getRoleId().equals(EnumRole.ADMIN.getCode())){
            roleService.addRoleMemberInfo(uuid,
                    EnumRole.ADMIN.getCode(),
                    userInfo.getUserName());
        }


        return userMapper.insertUserInfo(user);
    }

    /**
     *  校验账户有消息
     */
    private void checkUserValidity(User userInfo) {
        boolean isNotExist = queryRoleNameIsUnique(userInfo.getUuid(),
                userInfo.getUserName());
        if(!isNotExist){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"账户名已经存在");
        }

        boolean isNotExist1 = queryPhoneIsUnique(userInfo.getUuid(),
                userInfo.getPhone());
        if(!isNotExist1){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"手机号已经存在");
        }

        boolean isNotExist2 = queryEmailIsUnique(userInfo.getUuid(),
                userInfo.getEmail());
        if(!isNotExist2){
            throw new ErrorParamException(EnumOKOrNG.NG.getCode(),"邮箱已经存在");
        }
    }

    @Override
    public User queryUserByNameAndPassword(String userName,
                                           String password) {
        User user = userMapper.findUserByNameAndPassword(userName,password);
        return user;
    }

    @Override
    public boolean queryRoleNameIsUnique(String userId,
                                         String userName) {
        User user = userMapper.selectUserByUserName(userName);
        if(user == null){
            return true;
        }else {
            // 1-2 找到账户，如果是当前编辑账户的话，则认为账户名也是唯一的
            return StringUtils.isNotEmpty(userId) && user.getUuid().equals(userId);
        }
    }

    @Override
    public boolean queryPhoneIsUnique(String userId,
                                      String phone) {
        User user = userMapper.selectUserByPhone(phone);
        if(user == null){
            return true;
        }else {
            // 1-2 找到账户，如果是当前编辑账户的话，则认为账户名也是唯一的
            return StringUtils.isNotEmpty(userId) && user.getUuid().equals(userId);
        }
    }

    @Override
    public boolean queryEmailIsUnique(String userId,
                                      String email) {
        User user = userMapper.selectUserByEmail(email);
        if(user == null){
            return true;
        }else {
            // 1-2 找到账户，如果是当前编辑账户的话，则认为账户名也是唯一的
            return StringUtils.isNotEmpty(userId) && user.getUuid().equals(userId);
        }
    }

    @Override
    public int deleteAccountByAccountId(String accountId,
                                        String userName) {
        if(StringUtils.isEmpty(accountId)){
            return 0;
        }

        User oldUser = userMapper.selectUserByUUID(accountId);
        if(oldUser != null){
            oldUser.setIsDelete(EnumDelete.DELETE.getCode());
        }

        return userMapper.updateUser(oldUser);
    }

    @Override
    public UserDto editAccountInfo(String accountId,
                                   UserDto userInfo,
                                   String userName) {

        User oldUser = userMapper.selectUserByUUID(accountId);
        if(oldUser != null){
             //User newUser = UserObjectConvert.convertUserDto2User(userInfo);
            oldUser.setUserName(userInfo.getUserName());
            oldUser.setDepartmentId(userInfo.getDepartmentId());
            oldUser.setEmail(userInfo.getEmail());
            oldUser.setPhone(userInfo.getPhone());

            oldUser.setUpdateUser(userName);
            oldUser.setUpdateTime(new Date());

            userMapper.updateUser(oldUser);

            // 修改账户的角色
            RoleUser roleUser = new RoleUser();
            roleUser.setRoleId(userInfo.getRoleId());
            roleUser.setUserId(accountId);
            roleUser.setUpdateTime(new Date());

            roleUserMapper.updateRoleUserByUserId(roleUser);

            return UserObjectConvert.convertUser2Dto(userMapper.selectUserByUUID(accountId));
        }
        return null;
    }

    @Override
    public User findUserByUUID(String accountId) {
        if(StringUtils.isEmpty(accountId)){
            return null;
        }
        return userMapper.selectUserByUUID(accountId);
    }

    @Override
    public void editAccountPassword(String accountId, String userName) {
        User oldUser = userMapper.selectUserByUUID(accountId);
        if(oldUser != null){

            oldUser.setPassword(MD5Utils.string2MD5("123465"));
            oldUser.setUpdateUser(userName);
            oldUser.setUpdateTime(new Date());

            userMapper.updateUser(oldUser);
            return ;
        }
        return ;
    }

    @Override
    public int queryUserSort() {
        List<User> allUsers = findAllUsers(null, null);
        if(!CollectionUtils.isEmpty(allUsers)){
            return allUsers.size()+1;
        }
        return 0;
    }


}
