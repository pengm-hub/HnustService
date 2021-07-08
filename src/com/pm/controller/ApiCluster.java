package com.pm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cluster")
public class ApiCluster {
    @RequestMapping("/ApiClusterByLDA")
    public String ApiClusterByLDA(){
        return "/cluster/ApiClusterByLDA";
    }
}
