package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.WebTagMapper;
import com.pm.po.WebTag;
import com.pm.service.WebTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebTagServiceImpl extends BaseServiceImpl<WebTag> implements WebTagService {

    @Autowired
    private WebTagMapper webTagMapper;

    @Override
    public BaseDao<WebTag> getBaseDao(){ return webTagMapper; }
}
