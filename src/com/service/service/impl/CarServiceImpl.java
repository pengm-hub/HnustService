package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.CarMapper;
import com.service.po.Car;
import com.service.service.CarService;
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
