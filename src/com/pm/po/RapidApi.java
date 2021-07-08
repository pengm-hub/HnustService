package com.pm.po;

import java.io.Serializable;

public class RapidApi implements Serializable {
    private int rapid_api_id;
    private String rapid_api_name;
    private String rapid_api_price;
    private String rapid_api_rapid;
    private String rapid_api_endpoint;
    private String rapid_api_des;
    private String rapid_api_method;
    private String rapid_api_host;
    private String rapid_api_key;


    public RapidApi(int rapid_api_id, String rapid_api_name, String rapid_api_price, String rapid_api_rapid, String rapid_api_endpoint, String rapid_api_des, String rapid_api_method, String rapid_api_host, String rapid_api_key) {
        this.rapid_api_id = rapid_api_id;
        this.rapid_api_name = rapid_api_name;
        this.rapid_api_price = rapid_api_price;
        this.rapid_api_rapid = rapid_api_rapid;
        this.rapid_api_endpoint = rapid_api_endpoint;
        this.rapid_api_des = rapid_api_des;
        this.rapid_api_method = rapid_api_method;
        this.rapid_api_host = rapid_api_host;
        this.rapid_api_key = rapid_api_key;
    }

    public int getRapid_api_id() {
        return rapid_api_id;
    }

    public void setRapid_api_id(int rapid_api_id) {
        this.rapid_api_id = rapid_api_id;
    }

    public String getRapid_api_name() {
        return rapid_api_name;
    }

    public void setRapid_api_name(String rapid_api_name) {
        this.rapid_api_name = rapid_api_name;
    }

    public String getRapid_api_price() {
        return rapid_api_price;
    }

    public void setRapid_api_price(String rapid_api_price) {
        this.rapid_api_price = rapid_api_price;
    }

    public String getRapid_api_rapid() {
        return rapid_api_rapid;
    }

    public void setRapid_api_rapid(String rapid_api_rapid) {
        this.rapid_api_rapid = rapid_api_rapid;
    }

    public String getRapid_api_endpoint() {
        return rapid_api_endpoint;
    }

    public void setRapid_api_endpoint(String rapid_api_endpoint) {
        this.rapid_api_endpoint = rapid_api_endpoint;
    }

    public String getRapid_api_des() {
        return rapid_api_des;
    }

    public void setRapid_api_des(String rapid_api_des) {
        this.rapid_api_des = rapid_api_des;
    }

    public String getRapid_api_method() {
        return rapid_api_method;
    }

    public void setRapid_api_method(String rapid_api_method) {
        this.rapid_api_method = rapid_api_method;
    }

    public String getRapid_api_host() {
        return rapid_api_host;
    }

    public void setRapid_api_host(String rapid_api_host) {
        this.rapid_api_host = rapid_api_host;
    }

    public String getRapid_api_key() {
        return rapid_api_key;
    }

    public void setRapid_api_key(String rapid_api_key) {
        this.rapid_api_key = rapid_api_key;
    }

    @Override
    public String toString() {
        return "RapidApi{" +
                "rapid_api_id = " + rapid_api_id +
                ", rapid_api_name = '" + rapid_api_name + '\'' +
                ", rapid_api_price ='" + rapid_api_price + '\'' +
                ", rapid_api_rapid = '" + rapid_api_rapid + '\'' +
                ", rapid_api_endpoint = '" + rapid_api_endpoint + '\'' +
                ", rapid_api_des = '" + rapid_api_des + '\'' +
                ", rapid_api_method = '" + rapid_api_method + '\'' +
                " ,rapid_api_host = '" + rapid_api_host + '\'' +
                " ,rapid_api_key = '" + rapid_api_key + '\'' +
                "}";
    }

}
