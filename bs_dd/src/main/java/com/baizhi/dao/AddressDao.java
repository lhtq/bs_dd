package com.baizhi.dao;

import com.baizhi.entity.Address;

import java.util.List;

public interface AddressDao {
	/**
	 * 添加一个地址
	 * @param address
	 */
	void add(Address address);
	/**
	 * 根据用户id查询用户的地址
	 * @param user_id
	 * @return
	 */
	List<Address> selectByUser_id(String user_id);
	/**
	 * 根据id查询地址
	 * @param id
	 * @return
	 */
	Address selectById(String id);
	/**
	 * 更新一个地址的信息
	 * @param address
	 */
	void update(Address address);
}
