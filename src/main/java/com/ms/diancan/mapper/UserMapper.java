package com.ms.diancan.mapper;

import com.ms.diancan.entity.User;
import com.ms.diancan.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    User findUserInfo(Integer id);

    void updateAddress(UserInfo userInfo);

    void updatePwd(String comfirmPwd);

    void updateTel(@Param("newTel") String newTel, @Param("userId") String userId);

    void deleteTel(String userId);

    void updateEmail(@Param("userId") String userId, @Param("newEmail") String newEmail);

    User findUserByUserId(@Param("user") User user);

    void updateUser(User user);

    List<String> findAdminRole(String userId);

    void addUser(User user);

    void deleteAdminsById(String[] userIds);

    List<User> findUserByUsername(String userName);

    void deleteUserById(String userId);

    /**
     * 查询所有的管理员信息
     * @return  存有管理员对象的列表
     */
    List<User> findAdminList();

    User findUserByU_P(@Param("userName") String userName, @Param("password") String password);

    User finuserByUsername(String username);

    void registerUser(User user);
    void registerUserInfo(UserInfo userInfo);

    /**
     * 注册用户角色
     * @param userId
     */
    void registerRole(String userId);

    List<User> findAllUser();


}

