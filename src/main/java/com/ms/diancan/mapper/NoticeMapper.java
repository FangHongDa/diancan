package com.ms.diancan.mapper;

import com.ms.diancan.entity.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {
    /**
     * 查找所有公告
     * @return  List<Notice>公告集合
     */
    List<Notice> findAll();

    void deleteNotices(Integer[] noticeIds);

    void addNotice(Notice notice);

    void updateStatus(@Param("status") int status, @Param("noticeIds") Integer[] noticeIds);

    void updateNotice(Notice notice);
}
