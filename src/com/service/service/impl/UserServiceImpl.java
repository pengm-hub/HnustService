package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.UserMapper;
import com.service.po.User;
import com.service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public BaseDao<User> getBaseDao() {
        return userMapper;
    }
}
