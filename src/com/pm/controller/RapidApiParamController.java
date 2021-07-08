package com.pm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rapidapi")
public class RapidApiParamController {

    @RequestMapping("/rapidmashup")
    public String rapidmashup(){
        return "/rapidapi/rapidmashup";
    }
}
