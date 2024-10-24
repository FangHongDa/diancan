package com.ms.diancan.mapper;

import com.ms.diancan.entity.Order;
import com.ms.diancan.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {

    /**
     * 根据用户id查询出来的订单列表
     * @return
     */
    List<Order> findOrderListByUserId(@Param("id")Integer id);

    /**
     *查询order_p表和product_order_p中的全部数据
     * @return
     */
    List<Order> findOrderAll();

    /**
     * 根据订单id和订单时间查询对应的order
     * @return
     * @param orderId 订单id
     */
    Order findListByOrderId(String orderId);

    //保存到中间表Product_order_p
    void saveToProductOrder(@Param("orderId") String orderId, @Param("productId") Integer productId, @Param("buyNum") Integer buyNum);


    //保存订单到订单表
    void saveOrder(Order order);
    //修改订单状态
    void updateOrderStatus(@Param("status") Integer status, @Param("orderId") String orderId);

    /***
     * 删除订单表
     * @param orderId
     */
    void deleteOrder(String orderId);

    /**
     * 删除商品订单表
     */
    void deleteProductOrder(String orderId);

    /**
     * 支付成功修改库存数量
     * @param pId
     * @param buyCount
     */
    void updateProductNum(@Param("pId") String pId, @Param("buyCount") int buyCount);


    List<Product> findProductByOrderId(String orderId);

    List<Order> findOrderByStatus(Integer status);
    /*
     *Excel导出数据
     */
    public List<Object> find4ExcelDown();
}
