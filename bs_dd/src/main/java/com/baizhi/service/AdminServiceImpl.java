package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
    private Logger logger = Logger.getLogger(AdminServiceImpl.class);
    @Resource
    private AdminDao adminDao;


    @Override
    public void login(Admin admin) {
        Admin check = adminDao.selectByUsername(admin.getUsername());
        if(check!=null){
            if(!check.getPassword().equals(admin.getPassword())) {
                throw new RuntimeException("密码错误");
            }
        }else{
            throw new RuntimeException("用户名不存在");
        }
    }
}
