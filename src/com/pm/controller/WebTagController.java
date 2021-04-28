package com.pm.controller;

import com.pm.base.BaseController;
import com.pm.po.WebTag;
import com.pm.service.WebTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/webtag")
public class WebTagController extends BaseController {

    @Autowired
    public WebTagService webTagService;

    @RequestMapping("/webtagcloud")
    public String webtagcloud(Model model, WebTag webTag){
        // String sql = "select tag_name from webtag";
        List<WebTag> listTag = webTagService.listAll();

        String listWebTag = "";// x轴的数据
        int cnt = 0, count = 0;
        for (WebTag t : listTag) {
            if(t.getTag_apis()!=null){
                count = t.getTag_apis().split(",").length;
                System.out.println(t.getTag_apis());
                System.out.println(Arrays.toString(t.getTag_apis().split(",")));
                System.out.println(count);
            }
            if(count > 3){
                //apiTag = apiTag + "\"" + t.getTag_name() + "\"," + "\"" + count + "\",";
                listWebTag = listWebTag + "{\"name\":\'" + t.getTag_name() + "\',\"value\":" + count + "},";
                System.out.println("{name:\'" + t.getTag_name() + "\',value:" + count + "},");
                cnt += 1;
            }
        }

        listWebTag = listWebTag.substring(0, listWebTag.length()-1);
        //listWebTag = listWebTag.substring(0, listWebTag.lastIndexOf(","));
        System.out.println(listWebTag);

        model.addAttribute("listWebTag", listWebTag);
        return "webtag/webtagcloud";
    }
}
