package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.WebApiMapper;
import com.pm.po.WebApi;
import com.pm.service.WebApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebApiServiceImpl extends BaseServiceImpl<WebApi> implements WebApiService {

    @Autowired
    private WebApiMapper webApiMapper;

    @Override
    public BaseDao<WebApi> getBaseDao(){ return webApiMapper; }
}
