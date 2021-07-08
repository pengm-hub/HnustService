package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.po.RapidApiParam;
import com.pm.service.RapidApiParamService;
import com.pm.service.RapidApiService;
import org.springframework.stereotype.Service;

@Service
public class RapidApiParamServiceImpl extends BaseServiceImpl<RapidApiParam> implements RapidApiParamService {
    @Override
    public BaseDao<RapidApiParam> getBaseDao() {
        return null;
    }
}
