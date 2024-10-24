package com.ms.diancan.controller.api;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductKind;
import com.ms.diancan.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author ms_miao  前端product模块相关的controller
 * @createTime 2020-03-14 10:45
 */
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/toList")
    public String toList(@RequestParam(required = true, defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page, 6);
        List<Product> productList = productService.findAllProductListByStatus(1);
        List<Product> hotProductList = productService.findHotProductList();
        model.addAttribute("productList", productList);
        model.addAttribute("hotProductList", hotProductList);
        PageInfo<Product> p = new PageInfo<>(productList);
        model.addAttribute("page", p);
        return "/pages/list/list1";
    }

    /**
     * 查询商品种类名信息;查询热门商品信息;
     * 获取数据，然后跳转到list.jsp页面并回显数据
     * 根据输入的查询条件查询商品，然后跳转到list.jsp页面并回显数据
     * 获取查询条件(商品的名称(product_name), 商品的种类(name))
     * 商品的最低价格(minprice)及最高价格(maxprice)
     */
    @PostMapping("/findProductByCondition")
    public String findProductByCondition(@RequestParam(required = true, defaultValue = "1") Integer page, String product_name, String name, Double minprice, Double maxprice, Model model) {
        PageHelper.startPage(page, 4);
        List<Product> productConditionList = productService.findProductByCondition(product_name,name,minprice,maxprice);
        List<Product> HotProductList = productService.findHotProductList();
        PageInfo<Product> p = new PageInfo<Product>(productConditionList);
        model.addAttribute("productList", productConditionList);
        model.addAttribute("HotProductList", HotProductList);
        model.addAttribute("pages", p);
        return "/pages/list/list";
    }
    @GetMapping("/searchByConditition")
    public String searchByConditition(@RequestParam(required = true, defaultValue = "1") Integer page,String keyword, Model model){
        PageHelper.startPage(page, 4);
        List<Product> productConditionList = productService.searchByConditition(keyword);
        List<Product> HotProductList = productService.findHotProductList();
        PageInfo<Product> p = new PageInfo<Product>(productConditionList);
        model.addAttribute("productList", productConditionList);
        model.addAttribute("HotProductList", HotProductList);
        model.addAttribute("keyword",keyword);
        model.addAttribute("pages", p);
        return "/pages/list/list3";
    }
    /**
     * 查询商品种类名信息;查询热门商品信息;
     * 获取数据，然后跳转到list.jsp页面并回显数据
     * 根据输入的查询条件查询商品，然后跳转到list.jsp页面并回显数据
     * 获取查询条件(商品的名称(product_name), 商品的种类(name))
     * 商品的最低价格(minprice)及最高价格(maxprice)
     */
    @PostMapping("/findProductByCondition2")
    public String findProductByCondition2(@RequestParam(required = true, defaultValue = "1") Integer page, String kindId, String product_name, String name, Double minprice, Double maxprice, Model model) {
        PageHelper.startPage(page, 4);
        List<Product> productConditionList = productService.findProductByCondition(product_name, name, minprice, maxprice);
        List<Product> HotProductList = productService.findHotProductList();
        PageInfo<Product> p = new PageInfo<Product>(productConditionList);
        model.addAttribute("productList", productConditionList);
        model.addAttribute("kindId", kindId);
        model.addAttribute("HotProductList", HotProductList);
        model.addAttribute("pages", p);
        return "/pages/list/list2";
    }
    @GetMapping("/findProductByCategory")
    public String findProductByCategory(@RequestParam(required = true, defaultValue = "1") Integer page,Integer kindId,Model model){
        PageHelper.startPage(page, 4);
        List<Product> productList = productService.findProductByCategory(kindId);
        List<Product> HotProductList = productService.findHotProductList();
        PageInfo<Product> p = new PageInfo<Product>(productList);
        model.addAttribute("productList", productList);
        model.addAttribute("kindId", kindId);
        model.addAttribute("HotProductList", HotProductList);
        model.addAttribute("pages", p);
        return "/pages/list/list2";
    }

    /**
     * 跳转到商品详情页面
     * @return
     */
    @GetMapping("/toDetail")
    public String toDetail(Integer id, Model model){
        //1-根据商品id查询商品信息
        Product product = productService.findProductById(id);
        //2-查询热门商品信息列表
        List<Product> hotProductList = new ArrayList<>();
            //2-1-从热门商品表中取出两个
        productService.findProductBannerByCount(2).forEach(productBanner -> {
            Product dbProduct = productService.findProductById(productBanner.getProductId());
            if(dbProduct != null){
                hotProductList.add(dbProduct);
            }
        });
        model.addAttribute("product",product);
        model.addAttribute("HotProductList",hotProductList);
        //3-跳转到商品详情页面
        return "/pages/list/detail";
    }
}
