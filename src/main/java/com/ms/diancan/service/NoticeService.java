package com.ms.diancan.service;


import com.ms.diancan.entity.Notice;

import java.util.List;

/**
 * 实现公告的增删改查
 */
public interface NoticeService {

    /**
     * 查询全部Notice集合
     * @return List<Notice> 公告集合
     */
    List<Notice> findAll();

    /**
     * 批量删除公告
     * @param noticeIds id数组
     */
    void deleteNotices(Integer[] noticeIds);

    /**
     * 添加公告
     */
    void addNotice(String title, String content, int status);

    /**
     * 显示公告
     * @param noticeIds
     */
    void closeNotices(Integer[] noticeIds);

    /**
     * 关闭公告
     * @param noticeIds
     */
    void showNotices(Integer[] noticeIds);

    void updateNotice(Integer noticeId, String utitle, String ucontent, int ustatus);
}
