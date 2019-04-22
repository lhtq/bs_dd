package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.baizhi.dao")//配置扫描dao接口所在的包
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class,args);
    }
}
