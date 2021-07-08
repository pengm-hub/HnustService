package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.MashupMapper;
import com.pm.po.Mashup;
import com.pm.service.MashupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//声明是个Service，@Service用于标注业务层组件
@Service
public class MashupServiceImpl extends BaseServiceImpl<Mashup> implements MashupService {

    @Autowired
    private MashupMapper mashupMapper;

    @Override
    public BaseDao<Mashup> getBaseDao() {
        return mashupMapper;
    }
}
