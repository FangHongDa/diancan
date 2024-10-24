package com.ms.diancan.controller.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ms.diancan.entity.*;
import com.ms.diancan.entity.vo.OrderExcelExportVO;
import com.ms.diancan.service.EvaService;
import com.ms.diancan.service.OrderService;
import com.ms.diancan.service.UserService;
import com.ms.diancan.view.ObjectExcelViewOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author ms_miao  后台订单相关controller
 * @createTime 2020-03-05 17:09
 */

@Controller
public class Back_OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private EvaService evaService;

    /**
     * 跳转到订单详情页面--并展示订单详情
     * @return
     */
    @RequestMapping("/admin/toOrderList")
    public String orderForm(@RequestParam(required = true, defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page, 5);
        List<Order> orderAll = orderService.findOrderAll();
        model.addAttribute("order",orderAll);
        PageInfo<Order> pageInfo = new PageInfo<>(orderAll);
        model.addAttribute("page", pageInfo);
        return "/admin/order/order_list";
    }

    @RequestMapping("/admin/deleteOrder")
    public String deleteOrder(String orderId){
        orderService.deleteOrder(orderId);
        return "redirect:/admin/toOrderList";
    }
    /**
     * 修改后台订单状态
     * @param orderId
     * @param orderStatus
     * @return
     */
    @RequestMapping("/admin/updateAdminOrderStatus")
    public String updateAdminOrderStatus(String orderId,Integer orderStatus){
        orderService.updateOrderStatus(orderStatus,orderId);
        return "redirect:/admin/toOrderList";
    }

    /**
     * 跳转到回复评论界面
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping("/admin/toAnsEva")
    public String toAnsEva(String orderId,Model model){
        Evaluate evaluate = evaService.findEvaListByOrderId(orderId);
        model.addAttribute("evaluate",evaluate);
        return "/admin/adminAnsEva";
    }
    @RequestMapping("/admin/ansEva")
    public String ansEva(String orderId,String ansContent,Integer orderStatus){
        evaService.saveAnsEva(orderId,ansContent);
        orderService.updateOrderStatus(orderStatus,orderId);
        return "redirect:/admin/toOrderList";
    }
    //跳转到订单详情页面
    @RequestMapping("/admin/orderDetailed")
    public String orderDetailed(String orderId,Model model){

        Order order =  orderService.findListByOrderId(orderId);
        model.addAttribute("order",order);
        return "/admin/order/order_detailed";
    }


    /**
     * 根据订单状态查询订单
     */
    @RequestMapping("/admin/searchOrderList")
    public String searchOrderList(Integer status,Model model){
        List<Order> orderList = orderService.findOrderByStatus(status);
        model.addAttribute("orderList",orderList);
        return "/admin/toOrderList";
    }


    /*
     * 导出到excel
     * @return
     */
    @RequestMapping("/admin/downloadInfoToExcel")
    public ModelAndView downloadInfoToExcel() {
        System.out.println("导出到excel");
        ModelAndView mv = new ModelAndView();
        try {
            //1-根据id数组获取数据库数据
            List<Object> dataList = getExcelDataList();
            //2-获取列标题和封装数据
            Map<String, Object> dataMap = getTitleArrayAndVarList(dataList);
            //3-获取Excel表格文件名和表格标题
            Map<String, String> excelMap = getExcelTitleAndFileName();
            //4-创建AbstractExcelView
            AbstractExcelView erv = getAbstractExcelView(excelMap);
            //ObjectExcelViewOrderOperation erv = new ObjectExcelViewOrderOperation(excelMap.get("fileName"),excelMap.get("excelTitle"));
            mv = new ModelAndView(erv, dataMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    /**
     *@描述 1-1-从数据库获取数据
     */
    protected  List<Object> getExcelDataList(){
        try {
            List<Object> dataList = orderService.find4ExcelDown();
            return dataList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     *@描述 1-2-导出Excel-自定义列标题和数据
     */
    protected Map<String,Object> getTitleArrayAndVarList(List<Object> dataList) {
        Map<String,Object> dataMap = new HashMap<String,Object>();
        //1-标题
        String[] titleArray = {
                "订单序号",
                "订单编号",
                "订单金额",
                "收货人",
                "收获地址",
                "下单时间",
                "订单状态"
        };
        dataMap.put("titles", Arrays.asList(titleArray));
        //2-数据
        List<OrderExcelExportVO> varList = new ArrayList<OrderExcelExportVO>();
        for(int i=0;i<dataList.size();i++){
            OrderExcelExportVO data = (OrderExcelExportVO)dataList.get(i);
            List<Object> vpd = new ArrayList<>();
            varList.add(data);
        }
        dataMap.put("varList", varList);

        return dataMap;
    }
    /**
     *@描述 1-3-导出excel-自定义Excel标题和文件名
     */
    protected Map<String,String> getExcelTitleAndFileName(){
        Map<String,String> excelMap = new HashMap<String,String>();
        excelMap.put("excelTitle","订单信息表格");//excel标题
        DateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String time = sdf.format(new Timestamp(System.currentTimeMillis()));
        excelMap.put("fileName","订单信息表格" + time);//文件名
        return excelMap;
    }
    /**
     *@描述 1-4-创建AbstractExcelView
     */
    protected AbstractExcelView getAbstractExcelView(Map<String, String> excelMap){
        try {
            ObjectExcelViewOrder erv = new ObjectExcelViewOrder(excelMap.get("fileName"),excelMap.get("excelTitle"));
            return erv;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
