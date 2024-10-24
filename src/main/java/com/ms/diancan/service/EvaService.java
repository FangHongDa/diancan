package com.ms.diancan.service;


import com.ms.diancan.entity.Evaluate;

import java.util.List;

/**
 * 用户评论
 */
public interface EvaService {

    void saveEva(String orderId, String evaContent, Integer status);

    List<Evaluate> findAllEvaList();

    Evaluate findEvaListByOrderId(String orderId);

    void saveAnsEva(String orderId, String ansContent);

    /**
     * 查询两条评论
     * @return
     */
    List<Evaluate> find2Eva();
}
