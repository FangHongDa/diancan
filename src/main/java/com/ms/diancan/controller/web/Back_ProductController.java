package com.ms.diancan.controller.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductBanner;
import com.ms.diancan.entity.ProductKind;
import com.ms.diancan.enums.ResponseMessageEnum;
import com.ms.diancan.mapper.ProductMapper;
import com.ms.diancan.service.ProductKindService;
import com.ms.diancan.service.ProductService;
import com.ms.diancan.utils.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ms_miao         后端product模块相关的controller
 * @createTime 2020-03-10 20:09
 */
@Controller
public class Back_ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductKindService productKindService;

    /**
     * 按条件查找数据--模糊查询
     * @return
     */
    @RequestMapping("/admin/toSelect")
    public String toSelect(@RequestParam("Pname") String Pname, Model model) {
        List<Product> list = productService.findAllProductCondition(Pname);
        model.addAttribute("productList", list);
        return "/admin/product/product_list";
    }

    /**
     *
     * 后台展示商品列表
     */
    @RequestMapping("/admin/toProductList")
    public String toProductList(@RequestParam(required = true, defaultValue = "1") Integer page,
                                Model model,String errorInfo) {
        if(StringUtil.isNotEmpty(errorInfo)){
            model.addAttribute("errorInfo",errorInfo);
        }
        PageHelper.startPage(page, 10);
        //查询所有的商品信息
        List<Product> productList = productService.findAllProductList();
        model.addAttribute("productList", productList);
        PageInfo<Product> pageInfo = new PageInfo(productList);
        model.addAttribute("page", pageInfo);
        return "/admin/product/product_list";
    }

    /**
     * 去添加商品页面
     */
    @RequestMapping("/admin/toAddProductView")
    public String toAddProductView() {
        return "/admin/product/product_edit";
    }
    /**
     * 新增商品
     */
    @RequestMapping("/admin/addNewProduct")
    public String addNewProduct(MultipartFile imageUrl, HttpServletRequest request,Product product, BindingResult bindingResult){
        //1-依次 得到图片的后缀名、得到菜品的种类、生成新的图片名
        String suffix = imageUrl.getOriginalFilename().substring(imageUrl.getOriginalFilename().lastIndexOf("."));
       // int kindId = product.getProductKindId();
        String newPicName = UUIDUtils.getUUID15()+suffix;
        //2-获取项目路径  指定图片按照商品的分类存放 id为1的图片 放置/static/pro/upload/下的1文件夹里
        ServletContext sc = request.getSession().getServletContext();
        String localPath = "/static/pro/upload/";
        //String localPath = "/static/pro/upload/"+kindId+"/";
        String path = sc.getRealPath(localPath);
        //2-2-如果图片不为空 以流的形式存放到指定的文件夹中
        FileOutputStream fos = null;
        InputStream in = null;
        if (!imageUrl.isEmpty()){
            try{
                fos = new FileOutputStream(path + newPicName);
                in = imageUrl.getInputStream();
                int b = 0;
                while((b = in.read()) != -1){
                    fos.write(b);
                }
                //2-3关闭流
                fos.close();
                in.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        //3-保存商品的信息到数据库中
        product.setImageUrl(localPath+newPicName);
        productService.addOne(product);
        return "redirect:/admin/toProductList";
    }

    /**
     * 修改商品的信息  数据回显
     * @return
     */
    @RequestMapping("/admin/updateProductView")
    public String updateProductView(Integer id, Model model) {
        Product dbproduct = productService.findProductById(id);
        model.addAttribute("flag","update");
        model.addAttribute("product", dbproduct);
        return "/admin/product/product_edit";
    }

    /**
     * 更新商品信息
     */
    @RequestMapping("/admin/updateProduct")
    public String updateProduct(Product product, BindingResult bindingResult) {
        System.out.println(product.toString());
        productService.updateOne(product);
        return "redirect:/admin/toProductList";
    }

    /**
     * 删除商品
     */
    @GetMapping("/admin/deleteProductById")
    public String deleteProductById(Integer id, RedirectAttributes  redirectAttributes) {
        if(productService.findProductBannerByProductId(id) != null) {
            redirectAttributes.addAttribute("errorInfo","请取消热门关联再进行操作");
            return "redirect:/admin/toProductList";
        }
        productService.deleteById(id);
        return "redirect:/admin/toProductList";
    }

    /**
     * 批量删除商品
     */
    @RequestMapping("/admin/deleteAllProduct")
    public String deleteAll(@RequestParam("id") Integer[] id) {
        productService.deleteAllProduct(id);
        return "redirect:/admin/toProductList";
    }

    /**
     * * 更改商品状态
     */
    @GetMapping("/admin/updateProductStatus")
    public String updateProductStatus(Product product, RedirectAttributes  redirectAttributes){
        if(product.getStatus()==0){
            if(productService.findProductBannerByProductId(product.getId()) != null) {
                redirectAttributes.addAttribute("errorInfo","请取消热门关联再进行操作");
                return "redirect:/admin/toProductList";
            }
        }

        productService.updateProductStatusById(product);
        return "redirect:/admin/toProductList";
    }

    /**
     * 后台展示商品分类
     * @return
     */
    @RequestMapping("/admin/toProductClassifyList")
    public String categoryManage(@RequestParam(required = true, defaultValue = "1") Integer page,Model model) {
        PageHelper.startPage(page, 10);
        //1-查询全部商品类别
        List productKindList = productService.findAllProductKindNameList();
        model.addAttribute("productKindList",productKindList);
        PageInfo<ProductKind> pageInfo = new PageInfo<ProductKind>(productKindList);
        model.addAttribute("page", pageInfo);
        return "/admin/product/productclassify_list";
    }

    /**
     * 添加商品类别
     */
    @RequestMapping("/admin/addClassify")
    public String toAddClassify(ProductKind productKind){
        productKindService.addProductKind(productKind);
        return "redirect:/admin/toProductClassifyList";
    }

    /**
     * 修改商品类别
     */
    @RequestMapping("/admin/updateClassify")
    public String toUpdateClassify(Integer id,String updateKindName){
        ProductKind productKindUpdate = new ProductKind(id,updateKindName);
        productKindService.updateProductKind(productKindUpdate);
        return "redirect:/admin/toProductClassifyList";
    }

    /**
     * 删除商品类别
     */
    @RequestMapping("/admin/deleteKindById")
    public String deleteClassify(Integer kindId){
        ProductKind productKindDel = new ProductKind(kindId);
        productKindService.deleteProductKind(productKindDel);
        return "redirect:/admin/toProductClassifyList";
    }

    /**
     * 批量删除 商品类别
     */
    @RequestMapping("/admin/batchtDeleteProduct")
    public String batchDeleteClassify(@RequestParam("id") Integer[] kindIds){
        productKindService.batchDeletekind(kindIds);
        return "redirect:/admin/toProductClassifyList";
    }

    /**
     * 查询全部分类
     */
    @RequestMapping(value="/admin/productKind/list",produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object productKind(){
        List productKindList= productService.findAllProductKindNameList();
        return ResponseMessageEnum.SUCCESS.appendObjectToString(productKindList);
    }

//---------------------------------------------------------------------------------------------------------------

    @RequestMapping("/admin/toProductBanner")
    public String toProductBanner(Model model,@RequestParam(required = true, defaultValue = "1") Integer page){
        PageHelper.startPage(page,5);
        List<ProductBanner> productBannerList = productService.findAllProductBanner();
        PageInfo<ProductBanner> pageInfo = new PageInfo<>(productBannerList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("productBannerList",productBannerList);
        return "/admin/product/product_banner_list";
    }

    @RequestMapping("/admin/toAddProductBanner")
    public String toAddProductBanner(){
        return "/admin/product/product_banner_edit";
    }

    /**
     *选择上架状态 并且未关联热门的商品
     */
    @GetMapping(value = "/admin/validProduct/list" ,produces = "application/json;charset=utf-8")
    @ResponseBody
    public Object getValidProduct(){
        List<Product> validProductList = new ArrayList<>();
        productService.findAllProductList().
                stream().filter(product -> product.getStatus() == 1).       //过滤上架的商品
                collect(Collectors.toList()).forEach(product ->{
                    if (productService.findProductBannerById(product.getId()) == null){ //过滤未关联的商品
                        validProductList.add(product);
                    }
        });
        return ResponseMessageEnum.SUCCESS.appendObjectToString(validProductList);
    }


    @RequestMapping("/admin/addNewProductBanner")
    public String addNewProductBanner(ProductBanner productBanner){
        productService.addNewProductBanner(productBanner);
        return "redirect:/admin/toProductBanner";
    }
    /**
     * 删除商品类别
     */
    @RequestMapping("/admin/deleteProductBanner")
    public String deleteProductBanner(Integer id){
        productService.deleteProductBanner(id);
        return "redirect:/admin/toProductBanner";
    }

    @RequestMapping("/admin/updateProductBannerStatus")
    public String updateProductBannerStatus(Integer id){
        ProductBanner dbProductBanner = productService.findProductBannerById(id);
        ProductBanner productBanner = new ProductBanner(id);
        if(dbProductBanner.getStatus() == 1){
            productBanner.setStatus(0);
            productService.updateProductBanner(productBanner);
        }else{
            productBanner.setStatus(1);
            productService.updateProductBanner(productBanner);
        }
        return "redirect:/admin/toProductBanner";
    }

    @PostMapping("/admin/checkStatus")
    @ResponseBody
    public Integer checkStatus(Integer productId){
        //针对下架操作 校验是否关联热门
            System.out.println("2");
            ProductBanner dbProductBanner = productService.findProductBannerByProductId(productId);
            if(dbProductBanner == null){
                return ResponseMessageEnum.SUCCESS.getCode();
            }
            return  ResponseMessageEnum.FAIL.getCode();
    }

    public static void main(String[] args) {
      /*  File picture = new File("logo.jpg");
        String suffix = picture.getName().substring(picture.getName().lastIndexOf("."));
        System.out.println(suffix);


        File dir = new File("src/main/webapp/static/pro/upload/8");
        System.out.println(dir.getAbsolutePath());
        if(!dir.exists()){
            dir.mkdir();
        }

        System.out.println(dir.getAbsolutePath()+"创建成功");
*/
    }


}
