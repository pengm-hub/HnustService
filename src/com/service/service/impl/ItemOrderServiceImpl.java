package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.ItemOrderMapper;
import com.service.po.ItemOrder;
import com.service.service.ItemOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemOrderServiceImpl extends BaseServiceImpl<ItemOrder> implements ItemOrderService {

    @Autowired
    private ItemOrderMapper itemOrderMapper;

    @Override
    public BaseDao<ItemOrder> getBaseDao() {
        return itemOrderMapper;
    }
}
