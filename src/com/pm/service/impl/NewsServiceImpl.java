package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.NewsMapper;
import com.pm.po.News;
import com.pm.service.NewsService;
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
