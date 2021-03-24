package com.service.service.impl;

import com.service.base.BaseDao;
import com.service.base.BaseServiceImpl;
import com.service.mapper.CommentMapper;
import com.service.po.Comment;
import com.service.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public BaseDao<Comment> getBaseDao() {
        return commentMapper;
    }
}
