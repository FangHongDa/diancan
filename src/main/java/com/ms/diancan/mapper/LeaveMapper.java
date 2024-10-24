package com.ms.diancan.mapper;

import com.ms.diancan.entity.Leave;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LeaveMapper {
    //查找所有数据
    public List<Leave> findAllLeaveList();

    //根据id删除
    public void deleteById(String leaveId);

    public  void deleteAll(Integer[] leaveIds);

    //批量状态修改
    public void updateAll(@Param(value = "leaveIds") Integer[] leaveIds, @Param(value = "status") int status);

    //按条件查询
    public List<Leave> findConditionLeaveList(@Param("userName") String userName);

    /**
     * 更新一条留言状态
     */
    void updateStateOnlyOne(@Param("leaveId") Integer leaveId, @Param("status") int status);

    /**
     * 前台添加留言
     * @param leave
     */
    void createLeave(Leave leave);
}
