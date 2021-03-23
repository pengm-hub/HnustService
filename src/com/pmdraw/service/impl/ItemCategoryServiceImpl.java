package com.pmdraw.service.impl;

import com.pmdraw.base.BaseDao;
import com.pmdraw.base.BaseServiceImpl;
import com.pmdraw.mapper.ItemCategoryMapper;
import com.pmdraw.po.ItemCategory;
import com.pmdraw.service.ItemCategoryService;
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
