package com.ms.diancan.enums;

import com.ms.diancan.utils.JsonUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

/**
 * @author ms_miao
 * @createTime 2020-03-16 21:24
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ResponseMessageEnum {


/*    FAIL("errorInfo","用户名或者密码为空"),
    USEREXIST("123","该用户已经存在"),
    CODERROR("456","验证码填写错误")*/


    SUCCESS(200, "success"),
    FAIL(400, "fail"),

            ;


    private int code;
    private String message;


    public String appendObjectToString(Object obj) {
        if(obj == null){
            obj = new HashMap<String,Object>();
        }
        Map<String,Object> rsMap = new HashMap<String,Object>();
        rsMap.put("data", obj);
        rsMap.put("code", code);
        rsMap.put("msg", this.message);
        return JsonUtil.toJson(rsMap);
    }


}
