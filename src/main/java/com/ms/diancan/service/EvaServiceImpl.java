package com.ms.diancan.service;

import com.ms.diancan.entity.Evaluate;
import com.ms.diancan.mapper.EvaMapper;
import com.ms.diancan.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 评论管理
 */
@Service
public class EvaServiceImpl implements EvaService {

    @Autowired
    private EvaMapper evaMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public void saveEva(String orderId, String evaContent, Integer status) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Evaluate evaluate = new Evaluate(orderId,evaContent,sdf.format(date));
        orderMapper.updateOrderStatus(status, orderId);
        evaMapper.saveEva(evaluate);
    }

    @Override
    public List<Evaluate> findAllEvaList() {
        return evaMapper.findAllEvaList();
    }

    @Override
    public Evaluate findEvaListByOrderId(String orderId) {
        return evaMapper.findEvaListByOrderId(orderId);
    }

    @Override
    public void saveAnsEva(String orderId, String ansContent) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
       String ansDate = sdf.format(date);
        evaMapper.saveAnsEva(ansDate,ansContent,orderId);

    }

    @Override
    public List<Evaluate> find2Eva() {
        return evaMapper.find2Eva();
    }
}
