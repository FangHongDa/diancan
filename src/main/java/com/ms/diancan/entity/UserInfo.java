package com.ms.diancan.entity;

import com.ms.diancan.entity.dto.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo {
    private Integer id;         //id
    private Integer userId;     //用户id
    private String realName;    //真实名字
    private String telephone;   //手机号
    private String email;       //邮箱地址
    private String addressInfo; //收货地址
    private Integer zipCode;    //邮政编码

    public UserInfo(UserDTO userDTO) {
        this.realName = userDTO.getRealName();
        this.telephone = userDTO.getTelephone();
        this.email = userDTO.getEmail();
    }
}
