package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.ItemOrderMapper;
import com.pm.po.ItemOrder;
import com.pm.service.ItemOrderService;
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
