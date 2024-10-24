package com.ms.diancan.controller.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ms.diancan.entity.Notice;
import com.ms.diancan.entity.Product;
import com.ms.diancan.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ms_miao  公告相关controller
 * @createTime 2020-03-05 19:11
 */
@Controller
public class Back_NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 展示公告列表
     * @return
     */
    @RequestMapping("/admin/toNoticeList")
    public String sortAds(@RequestParam(required = true, defaultValue = "1") Integer page,Model model) {
        PageHelper.startPage(page, 10);
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList",noticeList);
        PageInfo<Notice> p = new PageInfo<>(noticeList);
        model.addAttribute("page", p);
        return "/admin/notice/notice_list";
    }

    /**
     * 创建公告
     */
    @RequestMapping("/admin/createNotice")
    public  String createNotice(String title,String content,int status){
        noticeService.addNotice(title,content,status);
        return "redirect:/admin/toNoticeList";
    }

    /**
     * 修改公告
     */
    @RequestMapping("/admin/updateNotice")
    public  String updateNotice(Integer id,String utitle,String ucontent,int ustatus){
        noticeService.updateNotice(id,utitle,ucontent,ustatus);
        return "redirect:/admin/toNoticeList";
    }

    /**
     * 批量删除公告
     */
    @RequestMapping("/admin/deleteBatchNotice")
    public  String deleteBatchNotice(@RequestParam("id") Integer[] id){
        noticeService.deleteNotices(id);
        return "redirect:/admin/toNoticeList";
    }

    /**
     * 批量显示公告
     */
    @RequestMapping("/admin/showBatchNotice")
    public  String showBatchNotice(@RequestParam("id") Integer[] id){
        noticeService.showNotices(id);
        return "redirect:/admin/toNoticeList";
    }

    /**
     * 批量关闭公告
     */
    @RequestMapping("/admin/closeBatchNotice")
    public  String closeBatchNotice(@RequestParam("id") Integer[] id){
        noticeService.closeNotices(id);
        return "redirect:/admin/toNoticeList";
    }

}
