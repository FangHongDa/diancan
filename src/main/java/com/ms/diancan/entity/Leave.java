package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Leave {
    private Integer id;
    private Integer userId;
    private String content;
    private String leaveDate;
    private String answerContent;
    private String answerDate;            //回复时间
    private Integer status;               // 状态  1表示已浏览 0未浏览

    private User user;


    public Leave(String content,User user,String date) {
        this.userId = user.getId();
        this.content = content;
        this.leaveDate = date;
        //留言默认状态为0，表示未浏览
        this.status = 0;
    }
}
