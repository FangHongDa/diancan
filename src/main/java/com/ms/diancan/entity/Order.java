package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
    private Integer id;
    private String orderId;     //订单id
    private String orderDate;   //订单日期
    private String orderStatus; //订单状态
    private String addressInfo;  //收货地址
    private Integer userId;      //用户id
    private Double money;       //总价


    private User user;
    private UserInfo userInfo;
    private List<ProductOrder> productOrders;
}
