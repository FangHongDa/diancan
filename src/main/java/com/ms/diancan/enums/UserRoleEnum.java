package com.ms.diancan.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author ms_miao
 * @createTime 2020-03-19 13:13
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum UserRoleEnum {

    ADMIN("1","超级管理员"),
    NORMALUSER("2","普通用户")

    ;

    private String code;
    private String name;


}
