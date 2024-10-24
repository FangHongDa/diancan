package com.ms.diancan.mapper;


import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.vo.OrderAddressCountVO;
import com.ms.diancan.entity.vo.OrderStatusCountVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EchartsMapper {
    List<Product> findAll();
    List<OrderAddressCountVO> findAllAddr();
    List<OrderStatusCountVO> findAllOrderStatus();
}
