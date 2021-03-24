package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.OrderDetailMapper;
import com.service.po.OrderDetail;
import com.service.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl extends BaseServiceImpl<OrderDetail> implements OrderDetailService {
    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public BaseDao<OrderDetail> getBaseDao() {
        return orderDetailMapper;
    }
}
