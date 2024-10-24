package com.ms.diancan.service;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductKind;

/**
 * @author ms_miao
 * @createTime 2020-03-17 21:13
 */
public interface ProductKindService {

    /**
     * 添加商品的种类
     * @param productKind
     */
    void addProductKind(ProductKind productKind);

    /**
     * 修改商品的种类名字
     */
    void updateProductKind(ProductKind productKind);

    /**
     * 删除商品种类
     */
    void deleteProductKind(ProductKind productKind);

    /**
     * 批量删删除商品种类
     */
    void batchDeletekind(Integer[] kindIds);


}
