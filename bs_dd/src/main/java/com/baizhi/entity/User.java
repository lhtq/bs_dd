package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class User {
	private String id;
	private String email;
	private String nickname;//昵称
	private String password;//密码
	private String status;//状态
	private String code;//激活码
	private String salt;//盐
	private Date create_date;//创建时间

}
