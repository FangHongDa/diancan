package com.ms.diancan.service;

import com.ms.diancan.entity.Role;
import com.ms.diancan.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findRoleList() {
        return roleMapper.findRoleList();
    }
}
