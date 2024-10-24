package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductOrder {

    private Integer id;
    private String orderId;
    private Integer productId;
    private Integer buyNum;

    private Product product;
}
