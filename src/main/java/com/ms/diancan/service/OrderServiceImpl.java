package com.ms.diancan.service;

import com.ms.diancan.entity.Order;
import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.User;
import com.ms.diancan.mapper.OrderMapper;
import com.ms.diancan.mapper.ProductMapper;
import com.ms.diancan.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public List<Order> findOrderListByUserId(Integer id) {
        return orderMapper.findOrderListByUserId(id);
    }

    @Override
    public List<Order> findOrderAll() {
        return orderMapper.findOrderAll();
    }

    @Override
    public Order findListByOrderId(String orderId) {
        return orderMapper.findListByOrderId(orderId);
    }


    @Override
    public void saveOrder(User user, Integer[] productIds, Map<Product, Integer> cartMap, String orderId) {
        //1-设置订单信息
        Order order = new Order();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        order.setOrderDate(sdf.format(new Date()));
        order.setUserId(user.getId());
        //2-遍历map集合  key：product商品信息  value:商品的购买数量
        for (Map.Entry<Product, Integer> entry : cartMap.entrySet()) {
            order.setOrderId(orderId);
            //2-1-保存订单号，商品id，购买数量等信息到商品订单关联表中
            orderMapper.saveToProductOrder(orderId, entry.getKey().getId(), entry.getValue());
            //2-2-更新商品表中商品的销量
            /*productMapper.updateOne(new Product(entry.getKey().getId(),entry.getValue()));*/
            productMapper.updateBuyCount(entry.getKey().getId(),entry.getValue());
            //2-3-设置订单金额
            order.setMoney(entry.getKey().getPrice() * entry.getValue());
        }
        //3-保存订单信息
        orderMapper.saveOrder(order);
    }

    @Override
    public void updateOrderStatus(Integer status, String orderId) {
        orderMapper.updateOrderStatus(status, orderId);
    }

    @Override
    public void deleteOrder(String orderId) {
        orderMapper.deleteOrder(orderId);
        orderMapper.deleteProductOrder(orderId);
    }

    @Override
    public void updateProductNum(String pId, int buyCount) {
        orderMapper.updateProductNum(pId,buyCount);
    }

    @Override
    public List<Product> findProductByOrderId(String orderId){
       return orderMapper.findProductByOrderId(orderId);
    }

    @Override
    public List<Order> findOrderByStatus(Integer status){
        return orderMapper.findOrderByStatus(status);
    }

    /*
     *Excel导出数据
     */
    public List<Object> find4ExcelDown() {
        return orderMapper.find4ExcelDown();
    }

}

