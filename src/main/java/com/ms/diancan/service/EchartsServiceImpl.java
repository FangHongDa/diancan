package com.ms.diancan.service;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.vo.OrderAddressCountVO;
import com.ms.diancan.entity.vo.OrderStatusCountVO;
import com.ms.diancan.mapper.EchartsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EchartsServiceImpl implements EchartsService {

    @Autowired
    private EchartsMapper echartsMapper;
    @Override
    public List<Product> findAll() {
        return echartsMapper.findAll();
    }

    @Override
    public List<OrderAddressCountVO> findAllAddr() {
        return echartsMapper.findAllAddr();
    }

    @Override
    public List<OrderStatusCountVO> findAllOrderStatus(){
        return echartsMapper.findAllOrderStatus();
    }
}
