package com.pm.po;

import java.io.Serializable;

public class WebTag implements Serializable {
    private Integer tag_id;
    private String tag_name;
    private String tag_apis;
    private String tag_mashups;

    public WebTag(Integer tag_id,String tag_name, String tag_apis, String tag_mashups){
        this.tag_id = tag_id;
        this.tag_name = tag_name;
        this.tag_apis = tag_apis;
        this.tag_mashups = tag_mashups;
    }

    public WebTag(){}

    public Integer getTag_id() {
        return tag_id;
    }

    public void setTag_id(Integer tag_id) {
        this.tag_id = tag_id;
    }

    public String getTag_name() {
        return tag_name;
    }

    public void setTag_name(String tag_name) {
        this.tag_name = tag_name;
    }

    public String getTag_apis() {
        return tag_apis;
    }

    public void setTag_apis(String tag_apis) {
        this.tag_apis = tag_apis;
    }

    public String getTag_mashups() {
        return tag_mashups;
    }

    public void setTag_mashups(String tag_mashups) {
        this.tag_mashups = tag_mashups;
    }

    @Override
    public String toString(){
        return "WebTag{"+
                "tag_id="+ tag_id +
                ",tag_name='" + tag_name + '\''+
                ",tag_apis='" + tag_apis + '\''+
                ",tag_mashups='" + tag_mashups + '\''+
                "}";
    }
}
