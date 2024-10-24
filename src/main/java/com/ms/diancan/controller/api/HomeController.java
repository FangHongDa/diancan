package com.ms.diancan.controller.api;

import com.ms.diancan.entity.*;
import com.ms.diancan.service.EvaService;
import com.ms.diancan.service.LeaveService;
import com.ms.diancan.service.NoticeService;
import com.ms.diancan.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author ms_miao
 * @createTime 2020-03-17 14:03
 */

@Controller
public class HomeController {
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private ProductService productService;

    @Autowired
    private LeaveService leaveService;
    @Autowired
    private EvaService evaService;

    /**
  * 跳转到首页
     * @param model
     * @return
     */
    @GetMapping(value = {"/","/index"})
    public String home(Model model) {
        //1-获取上架商品信息
        List<Product> productList = productService.findAllProductList()
                .stream().filter(product -> product.getStatus() == 1).collect(Collectors.toList());
        //2-获取有效的公告信息
        List<Notice> validNoticeList = noticeService.findAll()
                .stream().filter(notice -> notice.getStatus() == 1).collect(Collectors.toList());
        //3-获取热门商品信息
        List<Product> hotProductList = new ArrayList<>();
        productService.findProductBannerByCount(3).forEach(productBanner ->{
            Product dbProduct = productService.findProductById(productBanner.getProductId());
            if(dbProduct != null) { hotProductList.add(dbProduct);}
        });
        //4-查询两条评论
        List<Evaluate> evaluateList = evaService.find2Eva();
        //5-所有的商品种类名
        List productKindList = productService.findAllProductKindNameList();
        //6-用户留言表
        List<Leave> leaveList = leaveService.findAllLeaveList();


        model.addAttribute("productList",productList);
        model.addAttribute("noticeList",validNoticeList);
        model.addAttribute("hotProductList",hotProductList.stream().limit(3).collect(Collectors.toList()));
        model.addAttribute("evaluateList",evaluateList);
        model.addAttribute("productKindList",productKindList);
        model.addAttribute("leaveList",leaveList);
        return "/pages/index";
    }
}
