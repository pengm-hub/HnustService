package com.pm.controller;


import com.pm.base.BaseController;
import com.pm.po.WebApi;
import com.pm.service.WebApiService;
import com.pm.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * WebApi相关的控制器
 */

@Controller
@RequestMapping("/webapi")
public class WebApiController extends BaseController {

    /**
     * Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 通过 Autowired的使用来消除 set ，get方法。
     */

    @Autowired
    public WebApiService webApiService;


    /**
     * 按关键字查询
     */
    @RequestMapping("/webApiList")
    public String shoplist(WebApi webApi, String condition, Model model){
        String sql = "select * from webapi";
        if(!isEmpty(condition)){
            sql += " where api_name like '%" + condition +"%' ";
            model.addAttribute("condition",condition);
        }
        sql += " order by api_id desc";

        Pager<WebApi> pagers = webApiService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",webApi);
        return "webapi/webApiList";
    }

}
