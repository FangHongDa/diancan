package com.ms.diancan.controller.web;

import com.ms.diancan.entity.Leave;
import com.ms.diancan.entity.User;
import com.ms.diancan.enums.UserRoleEnum;
import com.ms.diancan.mapper.LeaveMapper;
import com.ms.diancan.mapper.UserMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ms_miao
 * @createTime 2020-03-18 13:45
 */

@Controller
public class Back_HomeController {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LeaveMapper leaveMapper;

    /**
     * 去后台登录系统
     */
    @RequestMapping("/admin/index")
    public String adminLogin() {
       return "/admin/common/login";
    }

    @PostMapping("/admin/backLogin")
    public String backLogin(User user, Model model){
        User dbUser = userMapper.findUserByU_P(user.getUserName(),user.getPassword());
        //1-如果登录账号不存在 直接返回
        if(dbUser == null){
            model.addAttribute("errorInfo","用户名或密码错误~~");
            return "/admin/common/login";
        }
        //2-如果登录账号存在  判断是否为管理员身份
        if(dbUser.getRoleId() == 1){
            Subject subject = SecurityUtils.getSubject();
            //2-1-查询未读的留言
            List<Leave> messageList = leaveMapper.findAllLeaveList()
                    .stream().filter(leave -> leave.getStatus() == 0).collect(Collectors.toList());
            model.addAttribute("messageNum",messageList.size());
            subject.getSession().setAttribute("user",dbUser);
            return "/admin/common/index";
        }
        //3-如果不是管理员  返回登录界面
        model.addAttribute("errorInfo","非管理员不能登录后台管理系统~~");
        return "/admin/common/login";
    }

    @RequestMapping("/admin/home")
    public String home() {
        //跳转回用户列表页面
        return "/admin/common/home";
    }

    @RequestMapping("/brandManage")
    public String brandManage() {
        return "/admin/Brand_Manage";
    }

    @RequestMapping("toProduct_category_add")
    public String toProduct_category_add(){
        return "/admin/product-category-add";
    }

    @RequestMapping("/advertising")
    public String advertising() {
        return "/admin/advertising";
    }

    @RequestMapping("/admin/transaction")
    public String transaction() {
        return "/admin/order/transaction";
    }
    @RequestMapping("/amounts")
    public String amounts() {
        return "/admin/Amounts";
    }
    @RequestMapping("/orderHandling")
    public String orderHandling() {
        return "/admin/Order_handling";
    }
    @RequestMapping("/coverManagement")
    public String coverManagement() {
        return "/admin/Cover_management";
    }
    @RequestMapping("/userList")
    public String userList() {
        return "/admin/user_list";
    }
    @RequestMapping("/memberGrading")
    public String memberGrading() {
        return "/admin/member-Grading";
    }
    @RequestMapping("/integration")
    public String integration() {
        return "/admin/integration";
    }
    @RequestMapping("/feedBack")
    public String feedBack() {
        return "/admin/Feedback";
    }
    @RequestMapping("/systems")
    public String systems() {
        return "/admin/Systems";
    }
    /*  @RequestMapping("/menuManage")
      public String menuManage() {
          return "/admin/test";
      }*/
    @RequestMapping("/userManage")
    public String userManage() {
        return "/admin/test";
    }
    /* */
    @RequestMapping("/systemSet")
    public String systemSet() {
        return "/admin/Systems";
    }

}
