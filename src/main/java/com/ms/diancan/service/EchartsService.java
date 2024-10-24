package com.ms.diancan.service;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.vo.OrderAddressCountVO;
import com.ms.diancan.entity.vo.OrderStatusCountVO;

import java.util.List;

public interface EchartsService {
    List<Product> findAll();
    List<OrderAddressCountVO> findAllAddr();
    List<OrderStatusCountVO> findAllOrderStatus();
}
