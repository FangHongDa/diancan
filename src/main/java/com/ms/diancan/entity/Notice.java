package com.ms.diancan.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import sun.java2d.pipe.SpanShapeRenderer;

import java.text.SimpleDateFormat;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Notice {
    private Integer id;
    private String title;      //公告标题
    private String content;    //公告内容
    private String noticeDate; //公告时间
    private Integer status;         //公告状态  1显示 0关闭

    public Notice(String title, String content, String date, int status) {
        this.title = title;
        this.content = content;
        this.noticeDate = date;
        this.status = status;
    }

}
