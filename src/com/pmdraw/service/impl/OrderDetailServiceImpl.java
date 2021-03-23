package com.pmdraw.service.impl;

import com.pmdraw.base.BaseDao;
import com.pmdraw.base.BaseServiceImpl;
import com.pmdraw.mapper.OrderDetailMapper;
import com.pmdraw.po.OrderDetail;
import com.pmdraw.service.OrderDetailService;
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
