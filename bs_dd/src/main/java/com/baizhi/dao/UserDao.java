package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
	/**
	 * 根据邮箱查询用户
	 * @param email
	 * @return
	 */
	User selectUserByEmail(String email); 
	
	/**
	 * 添加一个用户
	 * @param user
	 */
	void add(User user);
	/**
	 * 激活用户
	 * @param id
	 * @param code
	 */
	void active(@Param("id") String id, @Param("code") String code);

	/**
	 * 查询所有用户
	 * @return
	 */
	List<User> selectAll();
	/**
	 * 修改用户的状态
	 * @param status
	 */
	void update(@Param("status") String status, @Param("id") String id);
}










