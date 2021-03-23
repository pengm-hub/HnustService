package com.pmdraw.service.impl;

import com.pmdraw.base.BaseDao;
import com.pmdraw.base.BaseServiceImpl;
import com.pmdraw.mapper.ScMapper;
import com.pmdraw.po.Sc;
import com.pmdraw.service.ScService;
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
