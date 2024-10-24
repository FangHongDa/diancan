package com.ms.diancan.service;

import com.ms.diancan.entity.Notice;
import com.ms.diancan.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class NoticeServiceImpl implements  NoticeService {
    @Autowired
    NoticeMapper noticeMapper ;

    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public List<Notice> findAll() {
        return noticeMapper.findAll();
    }

    @Override
    public void deleteNotices(Integer[] noticeIds) {
        noticeMapper.deleteNotices(noticeIds);
    }

    @Override
    public void addNotice(String title, String content, int status) {

        Notice notice = new Notice(title,content,sdf.format(date),status);
        noticeMapper.addNotice(notice);
    }

    @Override
    public void closeNotices(Integer[] noticeIds) {
        int status = 0;
        noticeMapper.updateStatus(status,noticeIds);
    }

    @Override
    public void showNotices(Integer[] noticeIds) {
        int status = 1;
        noticeMapper.updateStatus(status,noticeIds);
    }


    @Override
    public void updateNotice(Integer id, String utitle, String ucontent, int ustatus) {
        Notice notice = new Notice(id,utitle,ucontent,sdf.format(date),ustatus);
        noticeMapper.updateNotice(notice);
    }
}
