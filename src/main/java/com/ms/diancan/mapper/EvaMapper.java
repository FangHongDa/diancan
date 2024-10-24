package com.ms.diancan.mapper;

import com.ms.diancan.entity.Evaluate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EvaMapper {
    /**
     * 保存评论
     * @param evaluate
     */
    void saveEva(Evaluate evaluate);

    /**
     * 查询所有评论列表
     * @return
     */
    List<Evaluate> findAllEvaList();

    /**
     * 通过订单id查询评论
     * @param orderId
     * @return
     */
    Evaluate findEvaListByOrderId(String orderId);

    /**
     * 保存回复评论
     * @param ansDate
     * @param ansContent
     * @param orderId
     */
    void saveAnsEva(@Param("ansDate") String ansDate, @Param("ansContent") String ansContent, @Param("orderId") String orderId);

    /**
     * 查询两条评论用作首页展示
     * @return
     */
    List<Evaluate> find2Eva();
}
