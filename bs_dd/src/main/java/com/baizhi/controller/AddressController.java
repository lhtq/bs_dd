package com.baizhi.controller;

import com.baizhi.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("address")
public class AddressController {

    @Resource
    private AddressService addressService;

    @RequestMapping("selectByUser_id")
    public String selectByUser_id(){

        return "";
    }
}
