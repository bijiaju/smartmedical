package com.hp.docker_base.service;

import com.hp.docker_base.bean.User;
import com.hp.docker_base.bean.dto.UserDto;

import java.util.List;

/**
 * @Desc 用户服务
 * @Author 24763
 * @Date 2020/7/4 15:13
 */
public interface IUserService {

    /**
     * 获取所有的账户
     * @param departmentId
     * @param keywords
     */
    List<User> findAllUsers(String departmentId,
                            String keywords);

    /**
     *  添加账户信息
     * @param userInfo 账户信息
     * @return 账户信息
     */
    int addUserInfo(UserDto userInfo);

    /**
     *  根据帐户名和密码获取登录
     * @param userName 帐户名
     * @param password 密码
     */
    User queryUserByNameAndPassword(String userName,
                                    String password);

    /**
     * 查询帐户名是否存在
     * @param userName 帐户名
     */
    boolean queryRoleNameIsUnique(String userId,
                                  String userName);

    /**
     * 查询手机号是否唯一
     */
    boolean queryPhoneIsUnique(String userId,
                               String phone);

    /**
     * 获取账户排序
     */
    int queryUserSort();


    /**
     *  查询邮箱是否存在
     */
    boolean queryEmailIsUnique(String userId, String email);

    /**
     * 删除账户
     */
    int deleteAccountByAccountId(String accountId,
                                 String userName);

    /**
     * 编辑账户信息
     */
    UserDto editAccountInfo(String accountId,
                            UserDto userInfo,
                            String userName);

    /**
     * 查询用户信息
     */
    User findUserByUUID(String accountId);

    /**
     * 重置密码
     * @param accountId
     * @param userName
     */
    void editAccountPassword(String accountId,
                             String userName);
}
