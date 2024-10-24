package com.ms.diancan.service;

import com.ms.diancan.entity.Leave;
import com.ms.diancan.entity.User;

import java.util.List;

public interface LeaveService {
    public List<Leave> findAllLeaveList();
    //删除一个
    public  void deleteById(String leaveId);
    //删除所有
    public  void deleteAll(Integer[] leaveIds);

    //修改所有的状态---多参数封装成map
    public void updateAll(Integer[] leaveIds, int status);

    //模糊查询，按条件查找
    public List<Leave> findConditionLeaveList(String userName);

    /**
     * 更新一条留言状态
     */
    void updateStateOnlyOne(Integer leaveId, int status);

    /**
     * 前台添加留言
     */
    void createLeave(String content, User user);
}
