package com.ms.diancan.service;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductKind;
import com.ms.diancan.mapper.ProductKindMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ms_miao
 * @createTime 2020-03-17 21:13
 */
@Service
public class ProductKindServiceImpl implements ProductKindService {

    @Autowired
    private ProductKindMapper productKindMapper;

    @Override
    public void addProductKind(ProductKind productKind) {
        productKindMapper.saveProductKind(productKind);
    }

    @Override
    public void updateProductKind(ProductKind productKind) {
        productKindMapper.updateProductKind(productKind);
    }

    /**
     * 删除商品种类
     */
    @Override
    public void deleteProductKind(ProductKind productKind) {

        productKindMapper.deleteProductKind(productKind);
    }

    /**
     * 批量删商品的种类
     * @param kindIds
     */
    @Override
    public void batchDeletekind(Integer[] kindIds) {
        productKindMapper.batchDeletekind(kindIds);
    }

}
