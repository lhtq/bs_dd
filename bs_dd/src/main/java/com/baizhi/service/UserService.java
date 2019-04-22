package com.baizhi.service;

import com.baizhi.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    /**
     * 登录
     * @param user
     */
    void regist(User user, HttpSession session);
    /**
     * 激活用户
     * @param inputEmailCode
     */
    void active(String inputEmailCode,HttpSession session);
    /**
     * 登录
     * @param email
     * @param password
     */
    void login(String email,String password);
    /**
     * 查询所有用户
     * @return
     */
    List<User> selectAll();
    /**
     * 修改用户的状态
     * @param status,id
     */
    void update(String status,String id);
}
