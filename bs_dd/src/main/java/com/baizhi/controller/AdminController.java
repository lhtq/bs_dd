package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.ValidateImageCodeUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;


@Controller
@RequestMapping("admin")
public class AdminController {
    private Logger logger = Logger.getLogger(AdminController.class);
    @Resource
    private AdminService adminService;

    @RequestMapping("login")
    public String login(Admin admin, HttpSession session, String vcode) {
        String code = (String) session.getAttribute("code");
        try {
            if(code.equals(vcode)) {
                adminService.login(admin);
                session.setAttribute("username",admin.getUsername());
                return "redirect:/back/main/main.jsp";
            }else{
                throw new RuntimeException("验证码错误！！!");
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            session.setAttribute("message",e.getMessage());
            return "back/login";
        }

    }
    //安全退出
    @RequestMapping("safeOut")
    public String safeOut(HttpSession session) {
        session.invalidate();
        return "redirect:/back/login.jsp";
    }



    @RequestMapping("code")
    public String code(HttpSession session, HttpServletResponse response) throws IOException {
        //获取验证码
        String code = ValidateImageCodeUtils.getSecurityCode();
        //存入session
        session.setAttribute("code", code);
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
