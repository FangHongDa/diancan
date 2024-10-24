package com.ms.diancan.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRoleMapper {
    void addUser(@Param("userId") String userId, @Param("roleId") String roleId);

    void deleteAdminsById(String[] userIds);

    void deleteUserById(String userId);

    void updateUser(@Param("roleId") String roleId, @Param("userId") String userId);

}
