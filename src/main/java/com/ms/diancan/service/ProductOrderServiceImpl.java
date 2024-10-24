package com.ms.diancan.service;

import com.ms.diancan.entity.ProductOrder;
import com.ms.diancan.mapper.ProductOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ms_miao
 * @createTime 2020-03-23 14:52
 */
@Service
public class ProductOrderServiceImpl implements ProductOrderService {

    @Autowired
    private ProductOrderMapper productOrderMaper;

    @Override
    public List<ProductOrder> listAllByOrderId(String orderId) {
        return productOrderMaper.listAllByOrderId(orderId);
    }
}
