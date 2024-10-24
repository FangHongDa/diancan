package com.ms.diancan.mapper;

import com.ms.diancan.entity.Product;
import com.ms.diancan.entity.ProductBanner;
import com.ms.diancan.entity.ProductKind;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> findAllProductList();

    List<Product> findAllProductListByStatus(@Param("status") Integer status);

    List findAllProductKindNameList();

    List<Product> findHotProductList();

    List<Product> findProductByCondition(@Param("product_name") String product_name, @Param("name") String name, @Param("minprice") Double minprice, @Param("maxprice") Double maxprice);


    Product findProductById(Integer productId);

    List<Product> findProductsById(Integer[] productIds);


    /**
     * 查询所有的商品列表，然后根据销量排序并截取前三条
     * @return
     */
    List<Product> findThreeProductList();

    List<ProductBanner> findProductBannerByCount(@Param("count")Integer count);


    //批量删除!
    void deleteAllProduct(Integer[] productIds);
    //修改单个对象
    void updateOne(Product p);

    //修改商品的销量
    void updateBuyCount( @Param("id") Integer id,@Param("buyMount") Integer buyMount);
    //添加对象
    void addOne(Product p);

    //根据id删除对象
    void deleteById(Integer Id);

    //查找所有的product_kind_id--为了获取菜品名称
    List<ProductKind> findAllKind();

    //模糊查询
    List<Product> findAllProductCondition(String Pname);

    /**
     * 根据条件查询商品
     * @param name
     * @return
     */
    List<Product> findProductByName(String name);
    /**
     * 根据类别查询所有
     * @param kindId
     * @return
     */
    List<Product> findProductByCategory(Integer kindId);

    /**
     * 根据条件全文检索
     * @param keyword
     * @return
     */
    List<Product> searchByConditition(String keyword);

    List<Product> findCardProductsById();

    void updateProductStatusById(Product product);

    //---------------------------------------------------------------------------------------

    List<ProductBanner> findAllProductBanner();

    void addNewProductBanner(ProductBanner productBanner);

    void deleteProductBanner(Integer id);

    ProductBanner findProductBannerById(Integer id);

    void updateProductBanner(ProductBanner productBanner);

    ProductBanner findProductBannerByProductId(Integer productId);
}
