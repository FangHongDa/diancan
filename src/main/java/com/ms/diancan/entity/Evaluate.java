package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户评论
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Evaluate {
    private Integer id;
    private String orderId;          //订单编号
    private String evaluateContent;  //评论内容evaluateContent
    private String evaluateDate;     //评价时间
    private String answerContent;    //回复评论内容
    private String answerDate;       //回复评论时间
    private Integer status;          //评论状态

    public Evaluate(String orderId,String evaluateContent,String evaluateDate) {
        this.orderId = orderId;
        this.evaluateContent = evaluateContent;
        this.evaluateDate = evaluateDate;
        this.status = 0;
    }
}
