package com.pm.service.impl;

import com.pm.base.BaseDao;
import com.pm.base.BaseServiceImpl;
import com.pm.mapper.CommentMapper;
import com.pm.po.Comment;
import com.pm.service.CommentService;
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
