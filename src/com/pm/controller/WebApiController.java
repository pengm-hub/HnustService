package com.pm.controller;


import com.pm.base.BaseController;
import com.pm.po.WebApi;
import com.pm.service.WebApiService;
import com.pm.utils.Pager;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.File;
import java.util.*;

import static com.pm.utils.LuceneUtil.createIndexByName;
import static com.pm.utils.LuceneUtil.searchByQuey;

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
    public String webApiList(WebApi webApi, String searchWebApi, Model model) throws Exception {
//        boolean flag = false;
        if(!isEmpty(searchWebApi)){
//            flag = true;
//            sql += " where api_name like '%" + searchWebApi +"%' ";
//            model.addAttribute("searchWebApi",searchWebApi);
            String projectPath = this.getClass().getClassLoader().getResource("").getPath();
            // 索引目录对象
            Directory directory = FSDirectory.open(new File(projectPath+"webapi"));
            // 索引读取工具
            IndexReader reader = DirectoryReader.open(directory);
            // 索引搜索工具
            List<String> useTitles = new ArrayList<>();
            useTitles.add("api_name");
            useTitles.add("category");
            useTitles.add("description");
            useTitles.add("api_endpoint");
            useTitles.add("secondary_categories");
            useTitles.add("architectural_style");
            Set keySet = new HashSet(useTitles);
            List<Map<String,String>> res = new ArrayList<>();
            System.out.println(projectPath+"webapi");
            if(new File(projectPath+"webapi").exists()){
                res = searchByQuey(searchWebApi, projectPath+"webapi", keySet);
            }
            List<WebApi> webApiList = new ArrayList<>();
            for (int i = 0; i < res.size(); i++) {
                int id = Integer.valueOf(res.get(i).get("id"));
                String mySql = "select * from webapi where api_id = "+id;
                WebApi webApi1 = webApiService.getBySqlReturnEntity(mySql);
                webApi1.setApi_score(Float.valueOf(res.get(i).get("id")));
                webApiList.add(webApi1);
            }
            Pager<WebApi> pagers = new Pager<WebApi>(webApiList);
            model.addAttribute("pagers",pagers);
            model.addAttribute("obj",webApi);
//            model.addAttribute("flag",flag);
            return "webapi/webApiList";
        }else {
//        sql += " order by api_id desc"; //减序,默认是增序
            String sql = "select * from webapi order by api_id asc";
            Pager<WebApi> pagers = webApiService.findBySqlRerturnEntity(sql);
            model.addAttribute("pagers",pagers);
            model.addAttribute("obj",webApi);
//            model.addAttribute("flag",flag);
            return "webapi/webApiList";
        }
    }

    @RequestMapping("webApiView")
    public String webApiView(int id, Model model){
        WebApi webApi = webApiService.getById(id);
        model.addAttribute("webapi",webApi);

        return "webapi/webApiView";
    }

//    @Test
//    public void createLuceneIndex() throws Exception {
//        String projectPath = this.getClass().getClassLoader().getResource("").getPath();
//        String sql = "select * from webapi order by api_id asc";
//        List<WebApi> webApiList = webApiService.listBySqlReturnEntity(sql);
//        createIndexByName(webApiList,projectPath+"WebApi");
//    }

}
