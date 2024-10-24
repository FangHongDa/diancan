package com.ms.diancan.service;

import com.ms.diancan.entity.Leave;
import com.ms.diancan.entity.User;
import com.ms.diancan.mapper.LeaveMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Steven on 2017/10/21.
 */
@Service
public class LeaveServiceImpl implements LeaveService {

    @Autowired
    private LeaveMapper leaveMapper;

    public List<Leave> findAllLeaveList() {
        return  leaveMapper.findAllLeaveList();
    }

    public  void deleteById(String leaveId){
          leaveMapper.deleteById(leaveId);
    }
    public  void deleteAll(Integer[] leaveId){
        leaveMapper.deleteAll(leaveId);
    }

    public void updateAll(Integer[] leaveIds,int status){
        leaveMapper.updateAll(leaveIds,status);
    }
    public List<Leave> findConditionLeaveList(String userName){
        return  leaveMapper.findConditionLeaveList(userName);
    }

    @Override
    public void updateStateOnlyOne(Integer leaveId, int status) {
        leaveMapper.updateStateOnlyOne(leaveId,status);
    }

    @Override
    public void createLeave(String content, User user) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Leave leave = new Leave(content,user,sdf.format(date));
        leaveMapper.createLeave(leave);
    }
}
