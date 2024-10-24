package com.ms.diancan.entity;

import com.ms.diancan.entity.dto.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;         //用户id
    private String userName;    //用户名
    private String password;    //用户密码
    private Integer roleId;     //用户角色 1表示管理员 2表示普通用户
    private Integer status;     //用户状态 0表示禁用 1表示正常

    private UserInfo userInfo;  //用户详细信息

    public User(UserDTO userDTO) {
        this.userName = userDTO.getUserName();
        this.password = userDTO.getPassword();
        this.roleId = 2;
        this.status = 1;
    }
}
