package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 商品种类类
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductKind {
    private Integer id;              //商品种类id
    private String kindName;         //商品种类名

    public ProductKind(Integer id) {
        this.id = id;
    }
}
