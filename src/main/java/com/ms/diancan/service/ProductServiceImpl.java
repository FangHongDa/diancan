package com.ms.diancan.service;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductBanner;
import com.ms.diancan.entity.ProductKind;
import com.ms.diancan.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> findAllProductList() {
        return productMapper.findAllProductList();
    }

    @Override
    public List<Product> findAllProductListByStatus(Integer status){
         return productMapper.findAllProductListByStatus(status);
    }

    @Override
    public List findAllProductKindNameList() {
        return productMapper.findAllProductKindNameList();
    }

    @Override
    public List<Product> findHotProductList() {
        return productMapper.findHotProductList();
    }

    @Override
    public List<Product> findProductByCondition(String product_name,String name,Double minprice,Double maxprice) {

        return productMapper.findProductByCondition(product_name,name,minprice,maxprice);
    }

    @Override
    public Product findProductById(Integer productId) {
        return productMapper.findProductById(productId);
    }

    @Override
    public List<Product> findProductsById(Integer[] productIds) {
        return productMapper.findProductsById(productIds);
    }

    @Override
    public List<Product> findThreeProductList() {
        return productMapper.findThreeProductList();
    }
    @Override
    public  void deleteAllProduct(Integer[] productIds){
        productMapper.deleteAllProduct(productIds);
    }

    @Override
    public  void updateOne(Product p){
        productMapper.updateOne(p);
    }
    @Override
    public  void deleteById(Integer id){
        productMapper.deleteById(id);
    }
    @Override
    public  void addOne(Product p){
      productMapper.addOne(p);
    }

    public  List<ProductKind> findAllKind(){
        return  productMapper.findAllKind();
    }

    public  List<Product> findAllProductCondition(String Pname){
        return  productMapper.findAllProductCondition(Pname);
    }

    @Override
    public List<Product> findProductByName(String name) {
        return productMapper.findProductByName(name);
    }

    @Override
    public List<Product> findProductByCategory(Integer kindId) {
        return productMapper.findProductByCategory(kindId);
    }

    @Override
    public List<Product> searchByConditition(String keyword) {
        return productMapper.searchByConditition(keyword);
    }

    @Override
    public List<Product> findProductsById() {

        return productMapper.findCardProductsById();
    }

    public void updateProductStatusById(Product product){
        productMapper.updateProductStatusById(product);
    }

    @Override
    public List<ProductBanner> findProductBannerByCount(Integer count) {
        return productMapper.findProductBannerByCount(count);
    }

    @Override
    public List<ProductBanner> findAllProductBanner() {
        return productMapper.findAllProductBanner();
    }

    @Override
    public void addNewProductBanner(ProductBanner productBanner) {
        productMapper.addNewProductBanner(productBanner);
    }

    @Override
    public void deleteProductBanner(Integer id) {
        productMapper.deleteProductBanner(id);
    }

    @Override
    public ProductBanner findProductBannerById(Integer id) {
        return productMapper.findProductBannerById(id);
    }

    @Override
    public void updateProductBanner(ProductBanner productBanner) {
        productMapper.updateProductBanner(productBanner);
    }

    @Override
    public ProductBanner findProductBannerByProductId(Integer productId) {
        return productMapper.findProductBannerByProductId(productId);
    }
}
