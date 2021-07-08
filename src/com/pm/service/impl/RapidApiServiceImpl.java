package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.RapidApiMapper;
import com.pm.po.RapidApi;
import com.pm.service.RapidApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RapidApiServiceImpl extends BaseServiceImpl<RapidApi> implements RapidApiService {

    @Autowired
    private RapidApiMapper rapidApiMapperl;

    @Override
    public BaseDao<RapidApi> getBaseDao() {
        return rapidApiMapperl;
    }
}
