package com.pmdraw.service.impl;

import com.pmdraw.base.BaseDao;
import com.pmdraw.base.BaseServiceImpl;
import com.pmdraw.mapper.MessageMapper;
import com.pmdraw.po.Message;
import com.pmdraw.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public BaseDao<Message> getBaseDao() {
        return messageMapper;
    }
}
