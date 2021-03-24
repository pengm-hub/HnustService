package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.ItemCategoryMapper;
import com.service.po.ItemCategory;
import com.service.service.ItemCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemCategoryServiceImpl extends BaseServiceImpl<ItemCategory> implements ItemCategoryService {
    @Autowired
    ItemCategoryMapper itemCategoryMapper;

    @Override
    public BaseDao<ItemCategory> getBaseDao() {
        return itemCategoryMapper;
    }
}
