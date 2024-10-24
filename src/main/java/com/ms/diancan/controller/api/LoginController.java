package com.ms.diancan.controller.api;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.User;
import com.ms.diancan.entity.dto.UserDTO;
import com.ms.diancan.enums.ResponseMessageEnum;
import com.ms.diancan.service.UserService;
import com.ms.diancan.utils.VerifyCode;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ms_miao      登录相关的controller
 * @createTime 2020-03-13 16:40
 */

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 通过shiro认证登录
     */
    @PostMapping("/loginLogin")
    public String loginLogin(Model model, String username, String password) {

        //1-如果用户账号被禁用
        User dbUser = userService.findUserByU_P(username, password);
        if(dbUser != null && dbUser.getStatus() == 0){
            model.addAttribute("errorInfo","该账号已禁用，请联系管理员...");
            return "/login";
        }
        //2-通过subject进行登录操作
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try {
            //2-1-使用subject执行登录  并把user放到session中
            subject.login(token);
            User user = (User) subject.getPrincipal();
            subject.getSession().setAttribute("user", user);
            //2-2-初始化购物车
            Map<Product, Integer> cartMap = new HashMap<>();
            subject.getSession().setAttribute("cart", cartMap);
            return "redirect:/index";
        } catch (AuthenticationException e) {
        //3-登录认证失败
            model.addAttribute("errorInfo","用户名或密码错误~~~");
            return "/login";
        }
    }
    /**
     *  用于ajax数据校验  校验username是否存在
     */
    @PostMapping("registerQuery")
    @ResponseBody
    public Integer registerQuery(HttpServletRequest request){
        try {
            //1-获取username 根据username查找是否存在user
            String userName = request.getParameter("userName");
            User user = userService.finuserByUsername(userName);
            //2-如果不存在
            if(user == null){
                return ResponseMessageEnum.SUCCESS.getCode();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ResponseMessageEnum.FAIL.getCode();
    }

    /**
     *  注册用户
     * @return
     */
    @PostMapping("/registerUser")
    public String registerUser(UserDTO userDTO, Model model) {
       //1-如果username已经存在
        if (userService.finuserByUsername(userDTO.getUserName()) != null) {
            model.addAttribute("errorInfo","该用户名已经被注册");
            return "/register";
        }
        //2-如果username不存在 保存user信息
        userService.registerUser(userDTO);
        return "/login";
    }

    /**
     * 退出登录
     */
    @GetMapping("/loginOut")
    public String loginOut() {
        //1-通过subject进行登出操作
        Subject subject = SecurityUtils.getSubject();
        subject.getSession().removeAttribute("user");
        subject.getSession().removeAttribute("roleId");
        return "redirect:/index";
    }


    /**
     * 获取验证码
     * @param response
     * @param request
     */
    @GetMapping(value = "getCode")
    public void getCode(HttpServletResponse response, HttpServletRequest request) {
        VerifyCode vc = new VerifyCode();
        try {
            vc.drawImage(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        String code = vc.getCode();
        request.getSession().setAttribute("code", code);
    }

    /**
     * 校验验证码是否正确
     */
    @PostMapping("inputCode")
    @ResponseBody
    public Integer inputCode(HttpServletRequest request) {
        String code = (String) request.getSession().getAttribute("code");
        String inputCode = request.getParameter("inputCode");
        System.out.println("> > >" + code);
        System.out.println("input> > >" + inputCode);
        if (!code.toLowerCase().equals(inputCode.toLowerCase())) {
            return ResponseMessageEnum.FAIL.getCode();
        }
        return ResponseMessageEnum.SUCCESS.getCode();
    }

}
