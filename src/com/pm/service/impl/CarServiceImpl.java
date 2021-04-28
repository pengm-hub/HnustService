package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.CarMapper;
import com.pm.po.Car;
import com.pm.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends BaseServiceImpl<Car> implements CarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public BaseDao<Car> getBaseDao() {
        return carMapper;
    }
}
