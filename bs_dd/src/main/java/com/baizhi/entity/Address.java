package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class Address {
	
	private String id;
	private String zip_code;//邮编
	private String phone;//电话
	private String local;//详细地址
	private String name;//收件人姓名
	private String user_id;//用户id

	
}
