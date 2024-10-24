package com.ms.diancan.service;


import com.ms.diancan.entity.Order;
import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderService {
    /**
     * 根据用户id查询订单列表
     * @return
     */
    List<Order> findOrderListByUserId(Integer id);

    /**
     *查询order_p表和product_order_p中的全部数据
     * @return
     */
    List<Order> findOrderAll();

    /**
     * 根据订单id和订单时间查询对应的orderList
     * @return
     * @param orderId 订单id
     */
    Order findListByOrderId(String orderId);



    //保存订单
    void saveOrder(User user, Integer[] productIds, Map<Product, Integer> cartMap, String orderId);


    void updateOrderStatus(Integer status, String orderId);

    /***
     * 删除订单
     * @param orderId
     */
    void deleteOrder(String orderId);

    void updateProductNum(String pId, int buyCount);

    List<Product> findProductByOrderId(String orderId);

    List<Order> findOrderByStatus(Integer status);

    /*
     *Excel导出数据
     */
    public List<Object> find4ExcelDown();


}
