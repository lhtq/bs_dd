package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class Book {
    private String id;
    private String name;//书名
    private Double price;//原价
    private Double dd_price;//当当价
    private Integer stock;//库存
    private Integer sales;//销量
    private String author;//作者
    private String press;//出版社
    @JsonFormat(timezone = "GTM+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pub_date;//出版时间
    private String edition;//版次
    @JsonFormat(timezone = "GTM+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date printing_time;//印刷时间
    private String imperssion;//印次
    private String book_size;//开本
    private String paper_size;//纸张
    private String packing;//包装
    private Integer word_number;//字数
    private Integer page;//页数
    private String isbn;//isbn
    private String editor_writer;//编辑推荐
    private String book_abstract;//内容简介
    private String author_introduct;//作者简介
    private String catelog;//基本目录
    private String media_revie;//媒体评论
    private Date create_date;//添加时间
    private String cover_name;//封面名字
    private String category_id;//类别id
}
