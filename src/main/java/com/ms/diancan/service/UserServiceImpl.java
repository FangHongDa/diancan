package com.ms.diancan.service;

import com.ms.diancan.entity.User;
import com.ms.diancan.entity.UserInfo;
import com.ms.diancan.entity.dto.UserDTO;
import com.ms.diancan.mapper.UserInfoMapper;
import com.ms.diancan.mapper.UserMapper;
import com.ms.diancan.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUserInfo(Integer id) {
        return userMapper.findUserInfo(id);
    }

    @Override
    public void updateAddress(User user) {
        UserInfo userInfo = user.getUserInfo();
        userInfo.setUserId(user.getId());
        userMapper.updateAddress(userInfo);
    }

    @Override
    public void updatePwd(String comfirmPwd) {
        userMapper.updatePwd(comfirmPwd);
    }

    @Override
    public void updateTel(String newTel, String userId) {
        userMapper.updateTel(newTel, userId);
    }

    @Override
    public void deleteTel(String userId) {
        userMapper.deleteTel(userId);
    }

    @Override
    public void updateEmail(String userId, String newEmail) {
        userMapper.updateEmail(userId, newEmail);
    }


    @Override
    public List<User> findAdminList() {
        return userMapper.findAdminList();
    }

    @Override
    public User findUserByUserId(User user) {
        return userMapper.findUserByUserId(user);
    }

    @Override
    public void updateUser(User user) {

     /*   userMapper.updateUser(user);//跟新用户表

        UserInfo userInfo = user.getUserInfo();
        userInfo.setUserInfoId(user.getUserId());
        userInfoMapper.updateUser(userInfo);//跟新用户详情表
        userRoleMapper.updateUser(user.getRole().getRoleId(), user.getUserId());*/


    }

    @Override
    public void updateUserById(User user) {

//        userMapper.updateUser(user);//跟新用户表
//
//        UserInfo userInfo = user.getUserInfo();
//        userInfo.setUserInfoId(user.getUserId());
//        userInfoMapper.updateUser(userInfo);//跟新用户详情表


    }

    @Override
    public void registerRole(String userId) {
        userMapper.registerRole(userId);
    }


    public void updateUserPassword(User user) {

        userMapper.updateUser(user);//跟新用户表

    }

    @Override
    public List<String> findAdminRole(String userId) {
        return userMapper.findAdminRole(userId);
    }

    @Override
    public void addUser(User user) {

 /*       user.setUserId(UUID.randomUUID().toString());
        userMapper.addUser(user);

        UserInfo userInfo = user.getUserInfo();
        userInfo.setUserInfoId(user.getUserId());
        userInfoMapper.addUser(userInfo);

        String roleId = user.getRole().getRoleId();
        userRoleMapper.addUser(user.getUserId(), roleId);
*/
    }

    @Override
    public void deleteAdminsById(String[] userIds) {

        userRoleMapper.deleteAdminsById(userIds);
        userInfoMapper.deleteAdminsById(userIds);
        userMapper.deleteAdminsById(userIds);

    }

    @Override
    public List<User> findUserByUsername(String userName) {
        return userMapper.findUserByUsername(userName);
    }

    @Override
    public void updateUserStatus(String userId, int status) {
        userInfoMapper.updateUserState(userId, status);
    }

    @Override
    public void deleteUserById(String userId) {
        userInfoMapper.deleteUserById(userId);
        userMapper.deleteUserById(userId);
    }

    @Override
    public User findUserByU_P(String username, String password) {

        return userMapper.findUserByU_P(username, password);
    }

    @Override
    public User finuserByUsername(String username) {
        return userMapper.finuserByUsername(username);
    }

    @Override
    public void registerUser(UserDTO userDTO) {
        User user = new User(userDTO);
        userMapper.registerUser(user);
        UserInfo userInfo = new UserInfo(userDTO);
        userInfo.setUserId(user.getId());
        userMapper.registerUserInfo(userInfo);
    }

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }
    @Override
    public UserInfo findAdressByUserId(String userId){
        return userInfoMapper.findAdressByUserId(userId);
    }


}

