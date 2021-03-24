package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.WebApiMapper;
import com.service.po.WebApi;
import com.service.service.WebApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebApiServiceImpl extends BaseServiceImpl<WebApi> implements WebApiService {

    @Autowired
    private WebApiMapper webApiMapper;

    @Override
    public BaseDao<WebApi> getBaseDao(){ return webApiMapper; }
}
