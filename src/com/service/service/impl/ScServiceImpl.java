package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.ScMapper;
import com.service.po.Sc;
import com.service.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScServiceImpl extends BaseServiceImpl<Sc> implements ScService {

    @Autowired
    private ScMapper scMapper;

    @Override
    public BaseDao<Sc> getBaseDao() {
        return scMapper;
    }
}
