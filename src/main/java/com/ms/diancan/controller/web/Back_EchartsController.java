package com.ms.diancan.controller.web;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.vo.OrderAddressCountVO;
import com.ms.diancan.entity.vo.OrderStatusCountVO;
import com.ms.diancan.service.EchartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLOutput;
import java.util.List;

/**
 * @author ms_miao    hart图表展示相关controller
 * @createTime 2020-02-14 09:39
 */

@RestController
public class Back_EchartsController {

    @Autowired
    private EchartsService echartsService;

    @PostMapping("/admin/buyCount")
    public Object getBuyCount() throws JsonProcessingException {
        List<Product> proList= echartsService.findAll();
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(proList);
        System.out.println(json);
        return json;
    }

   @PostMapping("/admin/buyAddr")
    public Object getBuyAddr() throws JsonProcessingException {
        List<OrderAddressCountVO> ordList=echartsService.findAllAddr();
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(ordList);
        return json;
    }

    @PostMapping("/admin/orderStatus")
    public Object getOrderStatus() throws JsonProcessingException {
        List<OrderStatusCountVO> orderStatusList = echartsService.findAllOrderStatus();

        orderStatusList.forEach((OrderStatusCountVO)->{
            System.out.println(OrderStatusCountVO.getOrderStatus());
            System.out.println(OrderStatusCountVO.getCount());
        });
        ObjectMapper mapper=new ObjectMapper();
        String json=mapper.writeValueAsString(orderStatusList);
        return json;
    }



}
