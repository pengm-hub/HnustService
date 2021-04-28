package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.ItemMapper;
import com.pm.po.Item;
import com.pm.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {

    @Autowired
    private ItemMapper itemMapper;
    @Override
    public BaseDao<Item> getBaseDao() {
        return itemMapper;
    }
}
