package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.NewsMapper;
import com.service.po.News;
import com.service.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public BaseDao<News> getBaseDao() {
        return newsMapper;
    }
}
