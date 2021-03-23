package com.pmdraw.service.impl;

import com.pmdraw.base.BaseDao;
import com.pmdraw.base.BaseServiceImpl;
import com.pmdraw.mapper.NewsMapper;
import com.pmdraw.po.News;
import com.pmdraw.service.NewsService;
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
