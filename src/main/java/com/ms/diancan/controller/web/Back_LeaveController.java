package com.ms.diancan.controller.web;


import com.ms.diancan.entity.Leave;
import com.ms.diancan.entity.User;
import com.ms.diancan.service.LeaveService;
import com.ms.diancan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
/**
 * @author ms_miao
 * @createTime 2020-03-15 17:10
 */

@Controller
public class Back_LeaveController {

    //留言信息处理
    @Autowired
    private LeaveService leaveService;
    @Autowired
    private UserService userService;


    @RequestMapping("/admin/toLeaveList")
    public String guestBook(Model model) {
        List<Leave> list=leaveService.findAllLeaveList();
        model.addAttribute("list",list);
        return "/admin/leave/leave_list";
    }
    @RequestMapping("/admin/delete")
    public String  deleteById(String leaveId){
        leaveService.deleteById(leaveId);
        return "redirect:/admin/toLeaveList";
    }

    @RequestMapping("/admin/deleteAll")
    public String  deleteAll(@RequestParam("id") Integer[] leaveIds){
        System.out.println(Arrays.toString(leaveIds));
        leaveService.deleteAll(leaveIds);
        return "redirect:/admin/toLeaveList";
    }

    @RequestMapping("/admin/openAll")
    public String updateState(@RequestParam("id")Integer[] leaveIds){
        System.out.print(leaveIds);
        int status = 1;
        leaveService.updateAll(leaveIds,status);
        return "redirect:/admin/toLeaveList";
    }
    @RequestMapping("/admin/closeAll")
    public String closeAll(@RequestParam("id")Integer[] leaveIds){
        int status = 0;
        leaveService.updateAll(leaveIds,status);
        return "redirect:/admin/toLeaveList";
    }

    @RequestMapping("/updateStateOnlyOne")
    public String updateStateOnlyOne(Integer leaveId){
        int status = 1;
        leaveService.updateStateOnlyOne(leaveId,status);
        return "redirect:/admin/toLeaveList";
    }

    @RequestMapping("/admin/findConditionLeaveList")
    public String findConditionLeaveList(@RequestParam("userName")String userName,Model model){
        List<Leave> list=leaveService.findConditionLeaveList(userName);
        model.addAttribute("list",list);
        return "/admin/leave/leave_list";
    }

    //用户详情页面
    @RequestMapping("/admin/memberShow")
    public  String memberShow(Integer id,Model model){
        User user = userService.findUserInfo(id);
        model.addAttribute("user",user);
        return "/admin/member-show";
    }




}
