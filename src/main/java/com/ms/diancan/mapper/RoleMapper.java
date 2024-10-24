package com.ms.diancan.mapper;

import com.ms.diancan.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {
    List<Role> findRoleList();
}
