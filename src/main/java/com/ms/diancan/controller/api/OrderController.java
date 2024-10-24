package com.ms.diancan.controller.api;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.User;
import com.ms.diancan.entity.UserInfo;
import com.ms.diancan.service.OrderService;
import com.ms.diancan.service.ProductService;
import com.ms.diancan.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author ms_miao
 * @createTime 2020-03-18 17:03
 */

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    /**
     * 去购物车页面
     */
    @PostMapping("/toCart")
    public String toDetail(HttpSession session, @RequestParam("id") Integer[] id, String buyNum, Model model) {
        System.out.println("111111111111111:" + id[0]);
        Integer buyCount = Integer.parseInt(buyNum);
        List<Product> productList = productService.findProductsById(id);
        Map<Product, Integer> cartMap = (Map<Product, Integer>) session.getAttribute("cart");
        for (Product product : productList) {
            cartMap.put(product, buyCount);
        }
        session.setAttribute("cart", cartMap);
        session.setAttribute("buyCount", 0);
        return "/pages/order/cart";
    }

    /**
     * 去我的购物车
     */
    @GetMapping("/toMyCart")
    public String tocart() {
        return "/pages/order/cart";
    }

    /**
     * 从购物车删除
     */
    @PostMapping("/toDelete")
    public String toDelete(Integer productId, HttpSession session, Model model) {
        Product product = productService.findProductById(productId);
        System.out.println(product);
        ((Map<Product, Integer>) session.getAttribute("cart")).remove(product);
        System.out.println("size:" + ((Map<Product, Integer>) session.getAttribute("cart")).size());
        return "/pages/order/cart";
    }

    /**
     * 去支付订单页面
     */
    @PostMapping("/toOrder")
    public String toOrder(HttpSession session, String[] buyNum, Model model,@RequestParam("id") Integer[] id,
                          @RequestParam("checkId") Integer[] checkId) {
        //1-获取session中用户基本信息 和详细信息
        User user = (User) session.getAttribute("user");
        UserInfo dbUserInfo = userService.findAdressByUserId(user.getId().toString());
        //2-将购物车内的*全部*商品id和对应购买数量放入map中   key：商品id  value：购买数量
        Map<Integer,Integer> map = new HashMap<>();
        for (int i = 0; i < id.length; i++){
            map.put(id[i],Integer.parseInt(buyNum[i]));
        }
        //3-创建我的订单map集合  key：product产品信息 value：购买数量
        Subject subject = SecurityUtils.getSubject();
        Map<Product, Integer> myCartMap = new HashMap<>();
        subject.getSession().setAttribute("myCartMap", myCartMap);
        Map<Product, Integer> myOrder = (HashMap<Product, Integer>) session.getAttribute("myCartMap");
        //4-从存储有全部商品和购买数量的map中 取出 被选中的信息（checkbox）放到我的订单map中
        for (Integer cId :checkId){
            Product dbProduct = productService.findProductById(cId);
            myOrder.put(dbProduct,map.get(cId));
        }
        model.addAttribute("myOrder", myOrder);
        model.addAttribute("userInfo", dbUserInfo);
        return "pages/order/pay_order";
    }

    /**
     * 支付订单
     */
    @PostMapping("/order")
    public String order(HttpServletRequest request, HttpServletResponse response,
                        String addressInfo, @RequestParam("id") Integer[] ids, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        //1-生成订单编号
        String orderId = UUID.randomUUID().toString();
        User user = (User) session.getAttribute("user");
        Map<Product, Integer> myCartMap = (Map<Product, Integer>) session.getAttribute("myCartMap");
        //1-保存订单信息
        orderService.saveOrder(user,ids, myCartMap, orderId);
        //--------------------------------------支付操作未实现--------------------------
        //2-支付成功后修改订单状态
        orderService.updateOrderStatus(0, orderId);
        //3-清空购物车
        List<Product> list = productService.findProductsById(ids);
        for (Product product:list) {
            myCartMap.remove(product);
        }
        System.out.println("size:"+myCartMap.size());

        return "pages/order/confirm";
    }
}
