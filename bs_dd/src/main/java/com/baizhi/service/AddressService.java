package com.baizhi.service;

import com.baizhi.entity.Address;

import java.util.List;

public interface AddressService {
    /**
     * 添加一个地址
     * @param address
     */
    void add(Address address);
    /**
     * 根据用户id查询用户的地址
     * @param id
     * @return
     */
    List<Address> selectByUser_id(String id);
    /**
     * 根据id查询一个地址
     * @param id
     * @return
     */
    Address selectById(String id);
}
