package com.ms.diancan.mapper;

import com.ms.diancan.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserInfoMapper {
    /**
     * 更新用户表中的数据
     * @param userInfo 用户详情对象
     */
    public void updateUser(UserInfo userInfo);

    void addUser(UserInfo userInfo);

    void deleteAdminsById(String[] userIds);

    void updateUserState(@Param("userId") String userId, @Param("status") int status);

    void deleteUserById(String userId);

    UserInfo findAdressByUserId(@Param("userId") String userId);
}
