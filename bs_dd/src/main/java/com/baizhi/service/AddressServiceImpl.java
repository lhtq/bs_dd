package com.baizhi.service;

import com.baizhi.dao.AddressDao;
import com.baizhi.entity.Address;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService {
    @Resource
    private AddressDao addressDao;

    @Override
    public void add(Address address) {
        addressDao.add(address);
    }

    @Override
    public List<Address> selectByUser_id(String id) {
        List<Address> addresses = addressDao.selectByUser_id(id);
        return addresses;
    }

    @Override
    public Address selectById(String id) {
        Address address = addressDao.selectById(id);
        return address;
    }
}
