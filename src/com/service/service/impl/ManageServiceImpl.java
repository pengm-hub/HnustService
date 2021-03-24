package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.ManageMapper;
import com.service.po.Manage;
import com.service.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//声明是一个service，这样才能扫描到
@Service
public class ManageServiceImpl extends BaseServiceImpl<Manage> implements ManageService {

    //@Autowired是用在JavaBean中的注解,通过byType形式,用来给指定的字段或方法注入所需的外部资源。
    @Autowired
    ManageMapper manageMapper;

    @Override
    public BaseDao<Manage> getBaseDao() {
        return manageMapper;
    }
}
