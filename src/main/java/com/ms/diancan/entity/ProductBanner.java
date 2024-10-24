package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ms_miao
 * @createTime 2020-04-03 16:48
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBanner {
    private Integer id;
    private Integer productId;
    private Integer status;     //1表示显示  0不显示

    private Product product;

    public ProductBanner(Integer id) {
        this.id = id;
    }
}
