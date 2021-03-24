package com.service.controller;

import com.service.base.BaseController;
import com.service.po.ItemCategory;
import com.service.po.User;
import com.service.service.ItemCategoryService;
import com.service.service.UserService;
import com.service.utils.Consts;
import com.service.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户c层
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    /**
     * Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 通过 Autowired的使用来消除 set ，get方法。
     */

    @Autowired
    private UserService userService;

    @Autowired
    private ItemCategoryService itemCategoryService;

    @RequestMapping("/findBySql")
    public String findBySql(Model model,User user){
        String sql = "select * from user where 1=1 ";
        if(!isEmpty(user.getUserName())){
            sql += " and userName like '%"+user.getUserName()+"%' ";
        }
        sql+=" order by id";
        Pager<User> pagers = userService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",user);
        return "user/user";
    }

    /**
     * 查看用户信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/view")
    public String view(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User obj = userService.load(userId);
        model.addAttribute("obj",obj);
        return "user/view";
    }

    /**
     * 进入个人中心
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/myUpload")
    public String myUpload(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }

        String sql = "select * from item_category where pid is null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);
        Integer userId = Integer.valueOf(attribute.toString());
        User obj = userService.load(userId);
        model.addAttribute("obj",obj);
        model.addAttribute("types",listBySqlReturnEntity);
        return "user/myUpload";
    }

    /**
     * 执行修改用户信息的操作
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(User user,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        user.setId(Integer.valueOf(attribute.toString()));
        userService.updateById(user);
        return "redirect:/user/view.action";
    }


    /**
     * 个人作品
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/myWork")
    public String myWork(Model model, HttpServletRequest request){

        return "user/myWork";
    }

}
