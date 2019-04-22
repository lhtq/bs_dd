package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.MD5Utils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public void regist(User user, HttpSession session) {
        User checkUser = userDao.selectUserByEmail(user.getEmail());
        if(checkUser == null) {
            //如果该用户不存在，进行添加
            user.setId(UUID.randomUUID().toString());
            user.setStatus("正常");
            String salt = MD5Utils.getSalt();
            user.setSalt(salt);
            //加密方式    密码+盐
            user.setPassword(MD5Utils.getPassword(user.getPassword()+salt));
            user.setCreate_date(new Date());
            try {
                userDao.add(user);
                //为已经注册的用户自动登录
                session.setAttribute("loginUser", user);
            } catch (Exception e) {
                throw new RuntimeException("注册失败");
            }
        }else{
            //用户已经存在
            throw new RuntimeException("该邮箱已经被注册");
        }

    }

    @Override
    public void active(String inputEmailCode,HttpSession session) {
        String emailCode = (String) session.getAttribute("emailCode");
        User loginUser = (User) session.getAttribute("loginUser");
        if(emailCode.equals(inputEmailCode)) {
            userDao.active(loginUser.getId(),inputEmailCode);
        }else{
            throw new RuntimeException("邮箱验证码错误");
        }
    }

    @Override
    public void login(String email, String password) {

    }

    @Override
    public List<User> selectAll() {
        return null;
    }

    @Override
    public void update(String status, String id) {

    }
}
