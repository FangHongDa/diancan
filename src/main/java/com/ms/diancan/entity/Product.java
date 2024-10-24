package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 商品类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    private Integer id;                 //id
    private String productName;         //名字
    private Double price;               //价格
    private Double vprice;              //vip价格
    private String imageUrl;            //图片
    private String description;         //描述
    private Integer productKindId;      //商品种类
    private Integer buyCount;           //商品销售量
    private Integer status;             //状态 上下架 1:上架 0:下架

    private ProductKind productKind;    //产品种类


    public Product(Integer id,Integer buyCount){
        this.id = id;
        this.buyCount = buyCount;
    }
}



