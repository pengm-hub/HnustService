package com.pm.po;

import java.io.Serializable;

public class WebApi implements Serializable {
    private Integer api_id;
    private String api_name;
    private String api_category;
    private String api_describe;
    private String api_url;
    private String api_tags;
    private String api_protocol;
    private Integer api_followers;
    private Float api_score;

    public WebApi(Integer api_id, String api_name, String api_category, String api_describe, String api_url, String api_tags, String api_protocol, Integer api_followers, Float api_score) {
        this.api_id = api_id;
        this.api_name = api_name;
        this.api_category = api_category;
        this.api_describe = api_describe;
        this.api_url = api_url;
        this.api_tags = api_tags;
        this.api_protocol = api_protocol;
        this.api_followers = api_followers;
        this.api_score = api_score;
    }

    public WebApi(){}

    public Integer getApi_id() {
        return api_id;
    }

    public void setApi_id(Integer api_id) {
        this.api_id = api_id;
    }

    public String getApi_name() {
        return api_name;
    }

    public void setApi_name(String api_name) {
        this.api_name = api_name;
    }

    public String getApi_category() {
        return api_category;
    }

    public void setApi_category(String api_category) {
        this.api_category = api_category;
    }

    public String getApi_describe() {
        return api_describe;
    }

    public void setApi_describe(String api_describe) {
        this.api_describe = api_describe;
    }

    public String getApi_url() {
        return api_url;
    }

    public void setApi_url(String api_url) {
        this.api_url = api_url;
    }

    public String getApi_tags() {
        return api_tags;
    }

    public void setApi_tags(String api_tags) {
        this.api_tags = api_tags;
    }

    public String getApi_protocol() {
        return api_protocol;
    }

    public void setApi_protocol(String api_protocol) {
        this.api_protocol = api_protocol;
    }

    public Integer getApi_followers() {
        return api_followers;
    }

    public void setApi_followers(Integer api_followers) {
        this.api_followers = api_followers;
    }

    @Override
    public String toString(){
        return "WebApi{" +
                "api_id=" + api_id +
                ", api_name='" + api_name + '\'' +
                ", api_category='" + api_category + '\'' +
                ", api_describe='" + api_describe + '\'' +
                ", api_url='" + api_url + '\'' +
                ", api_tags='" + api_tags + '\'' +
                ", api_protocol='" + api_protocol + '\'' +
                ", api_followers=" + api_followers +
                '}';
    }

    public Float getApi_score() {
        return api_score;
    }

    public void setApi_score(Float api_score) {
        this.api_score = api_score;
    }
}
