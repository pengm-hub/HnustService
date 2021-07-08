package com.pm.po;

import java.io.Serializable;

public class RapidApiParam implements Serializable {
    private int rapid_para_id;
    private int rapid_api_id;
    private String rapid_para_name;
    private String rapid_para_type;
    private String rapid_para_required;
    private String rapid_para_des;
    private String rapid_para_example;

    public RapidApiParam(int rapid_para_id, int rapid_api_id, String rapid_para_name, String rapid_para_type, String rapid_para_required, String rapid_para_des, String rapid_para_example) {
        this.rapid_para_id = rapid_para_id;
        this.rapid_api_id = rapid_api_id;
        this.rapid_para_name = rapid_para_name;
        this.rapid_para_type = rapid_para_type;
        this.rapid_para_required = rapid_para_required;
        this.rapid_para_des = rapid_para_des;
        this.rapid_para_example = rapid_para_example;
    }

    public int getRapid_para_id() {
        return rapid_para_id;
    }

    public void setRapid_para_id(int rapid_para_id) {
        this.rapid_para_id = rapid_para_id;
    }

    public int getRapid_api_id() {
        return rapid_api_id;
    }

    public void setRapid_api_id(int rapid_api_id) {
        this.rapid_api_id = rapid_api_id;
    }

    public String getRapid_para_name() {
        return rapid_para_name;
    }

    public void setRapid_para_name(String rapid_para_name) {
        this.rapid_para_name = rapid_para_name;
    }

    public String getRapid_para_type() {
        return rapid_para_type;
    }

    public void setRapid_para_type(String rapid_para_type) {
        this.rapid_para_type = rapid_para_type;
    }

    public String getRapid_para_required() {
        return rapid_para_required;
    }

    public void setRapid_para_required(String rapid_para_required) {
        this.rapid_para_required = rapid_para_required;
    }

    public String getRapid_para_des() {
        return rapid_para_des;
    }

    public void setRapid_para_des(String rapid_para_des) {
        this.rapid_para_des = rapid_para_des;
    }

    public String getRapid_para_example() {
        return rapid_para_example;
    }

    public void setRapid_para_example(String rapid_para_example) {
        this.rapid_para_example = rapid_para_example;
    }

    @Override
    public String toString() {
        return "RapidApiParameter{" +
                "rapid_para_id = " + rapid_para_id +
                "rapid_api_id = " + rapid_api_id +
                "rapid_para_name = '" + rapid_para_name + '\'' +
                "rapid_para_type = '" + rapid_para_type + '\'' +
                "rapid_para_required = '" + rapid_para_required + '\'' +
                "rapid_para_des = '" + rapid_para_des + '\'' +
                "rapid_para_example = '" + rapid_para_example + '\'' +
                "}";
    }
}
