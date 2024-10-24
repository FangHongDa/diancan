package com.ms.diancan.entity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ms_miao
 * @createTime 2020-03-22 13:22
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private String userName;
    private String realName;
    private String email;
    private String password;
    private String telephone;
}
