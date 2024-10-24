package com.ms.diancan.service;

import com.ms.diancan.entity.ProductOrder;

import java.util.List;

/**
 * @author ms_miao
 * @createTime 2020-03-23 14:52
 */
public interface ProductOrderService {

    List<ProductOrder> listAllByOrderId(String orderId);
}
