package com.ms.diancan.mapper;

import com.ms.diancan.entity.ProductOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author ms_miao
 * @createTime 2020-03-23 14:57
 */
@Mapper
public interface ProductOrderMapper {

    List<ProductOrder> listAllByOrderId(String orderId);

}
