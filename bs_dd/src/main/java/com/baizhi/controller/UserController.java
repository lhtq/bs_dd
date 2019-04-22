package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.MailService;
import com.baizhi.service.UserService;
import com.baizhi.util.ValidateImageCodeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private MailService mailService;

    @RequestMapping("regist")
    public String regist(User user, String ucode, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        try {
            if(ucode.equals(scode)){
                userService.regist(user,session);
                //向用户邮箱发送验证码
                String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
                String message = "您的注册验证码为："+checkCode;
                //获取登陆的用户对象
                User loginUser = (User) session.getAttribute("loginUser");
                session.setAttribute("emailCode", checkCode);
                mailService.sendSimpleMail(loginUser.getEmail(), "注册验证码", message);
                return "front/user/verify_form";
            }else{
                throw new RuntimeException("验证码错误");
            }
        } catch (Exception e) {
            e.printStackTrace();
            String registMessage = e.getMessage();
            session.setAttribute("registMessage",registMessage);
            return "front/user/register_form";
        }
    }

    @RequestMapping("login")
    public String login(User user) {

        return "";
    }

    @RequestMapping("active")
    public String active(String inputEmailCode,HttpSession session) {
        try {
            userService.active(inputEmailCode,session);
            return "front/user/register_ok";
        } catch (Exception e) {
            e.printStackTrace();
            String activeMessage = e.getMessage();
            return "front/user/verify_form";
        }
    }



    @RequestMapping("code")
    public String code(HttpSession session, HttpServletResponse response) throws IOException {
        //获取验证码
        String code = ValidateImageCodeUtils.getSecurityCode();
        //存入session
        session.setAttribute("scode", code);
        //获取验证码图片
        BufferedImage image = ValidateImageCodeUtils.createImage(code);
        //获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //响应图片到客户端
        ImageIO.write(image, "png", os);
        //关流
        os.close();
        return null;
    }
}
