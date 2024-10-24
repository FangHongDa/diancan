package com.ms.diancan.controller.web;

import com.ms.diancan.entity.Role;
import com.ms.diancan.entity.User;
import com.ms.diancan.service.RoleService;
import com.ms.diancan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author ms_miao
 * @createTime 2020-03-17 09:33
 */

@Controller
public class Back_AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @GetMapping("/admin/toMemberList")
    public String toMemberList(Model model){

        List<User> allUser = userService.findAllUser();
        List<Role> roleList  = roleService.findRoleList();
        model.addAttribute("userList",allUser);
        model.addAttribute("roleList", roleList);
        return "/admin/member/member_list";
    }

    /**
     *
     * @param session  前台传过来的管理员的session，里面存有user对象
     */
    @GetMapping("/admin/personalInfo")
    public String findUserByUserId(HttpSession session, Model model){
        Integer userId = ((User) session.getAttribute("user")).getId();
        User user = userService.findUserInfo(userId);
        model.addAttribute("user", user);
        return "/admin/member/personal_info";
    }

    @PostMapping("/admin/updateAdmin")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/personal_info";
    }


    @GetMapping("/admin/updateAdminById")
    public String updateUserById(User user) {
        userService.updateUserById(user);
        return "redirect:/personal_info";
    }
/*
    @RequestMapping("/admin/check")
    @ResponseBody
    public String checkPassowrd(User user, String npassword){

*//*        String password = userService.findUserByUserId(user.getUserId()).getPassword();

        if(user.getPassword().equals(password)){

            user.setPassword(npassword);
            userService.updateUserPassword(user);

            return "true";
        }else{
            return "false";
        }*//*

        return "false";
    }*/

    @RequestMapping("/addAdmin")
    public String addAdmin(User user) {

        userService.addUser(user);

        return "redirect:/admin/toMemberList";
    }

    @RequestMapping("/deleteAdmins")
    public String deleteAdmins(@RequestParam("userId") String[] userIds){
        userService.deleteAdminsById(userIds);
        return "redirect:/admin/toMemberList";
    }

    @RequestMapping("/admin/selectUser")
    public String selectUser(String userName, Model model){
        List<User> dbUserList = userService.findUserByUsername(userName);
        model.addAttribute("userList", dbUserList);
        return "/admin/member/member_list";
    }

    @PostMapping("/admin/stopStatus")
    public void stopState(String userId) {
        int status = 0;
        userService.updateUserStatus(userId, status);
    }

    @PostMapping("/admin/startStatus")
    public void startState(String userId) {
        int status = 1;
        userService.updateUserStatus(userId, status);
    }

    @RequestMapping("/admin/deleteUserById")
    public void deleteUserById(String userId) {
        userService.deleteUserById(userId);
    }

    @RequestMapping("/adminCompetence")
    public String adminCompetence(Model model) {
        List<User> userList = userService.findAdminList();

        String pRoleName = "";
        String sRoleName = "";
        int pCount = 0;
        int sCount = 0;
        for(User user : userList){
        /*    if("超级管理员".equals(user.getRole().getRoleName())){
                sRoleName = sRoleName + " " + user.getUsername();
                sCount = sCount + 1;
            }else{
                pRoleName = pRoleName + "  " + user.getUsername();
                pCount = pCount + 1;
            }*/
        }

        model.addAttribute("pRoleName", pRoleName);
        model.addAttribute("pCount", pCount);
        model.addAttribute("sRoleName" , sRoleName);
        model.addAttribute("sCount", sCount);
        return "/admin/member/admin_competence";
    }

}

