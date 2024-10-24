package com.ms.diancan.service;


import com.ms.diancan.entity.User;
import com.ms.diancan.entity.UserInfo;
import com.ms.diancan.entity.dto.UserDTO;

import java.util.List;

public interface UserService {

    User findUserInfo(Integer id);

    /**
     * 修改地址
     * @param user
     */
    void updateAddress(User user);

    /**
     * 修改密码
     * @param comfirmPwd
     */
    void updatePwd(String comfirmPwd);

    void updateTel(String newTel, String userId);

    void deleteTel(String userId);

    void updateEmail(String userId, String newEmail);

    /**
     * 查询所有的管理员信息
     * @return  存有管理员对象的列表
     */
    List<User> findAdminList();

    /**
     * 根据管理员Id查询管理员
     */
    User findUserByUserId(User user);

    /**
     * 更新管理数据
     * @param user 管理员对象
     */
    void updateUser(User user);

    /**
     * 更改管理员的密码
     * @param user   更新信息
     */
    void updateUserPassword(User user);

    List<String> findAdminRole(String userId);

    void addUser(User user);

    void deleteAdminsById(String[] userIds);

    List<User> findUserByUsername(String userName);

    void updateUserStatus(String userId, int status);

    void deleteUserById(String userId);

    User findUserByU_P(String username, String password);

    User finuserByUsername(String username);

    void registerUser(UserDTO userDTO);

    void updateUserById(User user);

    /**
     * 注册角色
     * @param userId
     */
    void registerRole(String userId);

    List<User> findAllUser();

    UserInfo findAdressByUserId(String userId);

}
