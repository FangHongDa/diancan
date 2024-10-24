package com.ms.diancan.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ms_miao
 * @createTime 2020-03-12 09:25
 */

@Controller
public class HeadController {

    /**
     * 跳转到residter.jsp页面
     */
    @GetMapping("/toRegister")
    public String toRegister(){
        return "/register";
    }

    /**
     * 跳转到login.jsp页面
     */
    @GetMapping("/toLogin")
    public String toLogin(){
        return "/login";
    }


    /**
     * 跳转到residter.jsp页面
     */
    @GetMapping("/loginToRegister")
    public String loginToRegister(){
        return "/register";
    }

    /**
     * 从注册页面跳转到登陆页面
     */
    @GetMapping("/registerToLogin")
    public  String registerToLogin(){
        return  "/login";
    }
/*
    *//**
     * 跳转到user_center.jsp页面
     *//*
    @RequestMapping("/toUser_center")
    public String toUser_center(){
        return "/pages/user/user_center";
    }*/
/*
    *//**
     * 跳转到user_orderlist.jsp页面
     *//*
    @RequestMapping("/toUser_orderlist")
    public String toUser_orderlist(){
        return "/pages/user/user_orderlist";
    }*/
}







