package com.pm.controller;

import com.pm.base.BaseController;
import com.pm.po.Mashup;
import com.pm.service.MashupService;
import com.pm.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mashup")
public class MashupController extends BaseController {

    @Autowired
    public MashupService mashupService;

    @RequestMapping("/mashupList")
    public String mashupList(Mashup mashup, String searchMashup, Model model){
        String sql = "select * from mashup ";
        if(!isEmpty(searchMashup)){
            sql += "where mashup_name like '% " + searchMashup + "%'";
            model.addAttribute("searchMashup",searchMashup);
        }
        sql += " order by mashup_id asc";

        Pager<Mashup> pagers = mashupService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", mashup);

        return "mashup/mashupList";
    }

    @RequestMapping("mashupView")
    public String mashupView(int id, Model model){
        Mashup mashup = mashupService.getById(id);
        model.addAttribute("mashup",mashup);
        return "mashup/mashupView";
    }
}
