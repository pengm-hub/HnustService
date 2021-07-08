package com.pm.po;

import java.io.Serializable;

public class YouTube implements Serializable {
        private String youtube_title;
        private String youtube_type;
        private String youtube_id;
        private String youtube_url;
        private String youtube_views;

        private String youtube_description;
        private String youtube_uploader;
        private String youtube_channel_id;
        private String youtube_average_rating;
        private String youtube_age_limit;

        private String youtube_status;
        private String youtube_status_code;
        private String youtube_download_size;
        private String youtube_download_url;
        private String youtube_video_thumbnail;

        private String youtube_quality;
        private String youtube_width;
        private String youtube_height;
        private String youtube_size;
        private String youtube_mp4Url;
        private String youtube_screenShot;

    public YouTube(String youtube_title, String youtube_type, String youtube_id, String youtube_url, String youtube_views, String youtube_description, String youtube_uploader, String youtube_channel_id, String youtube_average_rating, String youtube_age_limit, String youtube_status, String youtube_status_code, String youtube_download_size, String youtube_download_url, String youtube_video_thumbnail, String youtube_quality, String youtube_width, String youtube_height, String youtube_size, String youtube_mp4Url, String youtube_screenShot) {
        this.youtube_title = youtube_title;
        this.youtube_type = youtube_type;
        this.youtube_id = youtube_id;
        this.youtube_url = youtube_url;
        this.youtube_views = youtube_views;
        this.youtube_description = youtube_description;
        this.youtube_uploader = youtube_uploader;
        this.youtube_channel_id = youtube_channel_id;
        this.youtube_average_rating = youtube_average_rating;
        this.youtube_age_limit = youtube_age_limit;
        this.youtube_status = youtube_status;
        this.youtube_status_code = youtube_status_code;
        this.youtube_download_size = youtube_download_size;
        this.youtube_download_url = youtube_download_url;
        this.youtube_video_thumbnail = youtube_video_thumbnail;
        this.youtube_quality = youtube_quality;
        this.youtube_width = youtube_width;
        this.youtube_height = youtube_height;
        this.youtube_size = youtube_size;
        this.youtube_mp4Url = youtube_mp4Url;
        this.youtube_screenShot = youtube_screenShot;
    }

    public YouTube() {

    }

    public String getYoutube_title() {
        return youtube_title;
    }

    public void setYoutube_title(String youtube_title) {
        this.youtube_title = youtube_title;
    }

    public String getYoutube_type() {
        return youtube_type;
    }

    public void setYoutube_type(String youtube_type) {
        this.youtube_type = youtube_type;
    }

    public String getYoutube_id() {
        return youtube_id;
    }

    public void setYoutube_id(String youtube_id) {
        this.youtube_id = youtube_id;
    }

    public String getYoutube_url() {
        return youtube_url;
    }

    public void setYoutube_url(String youtube_url) {
        this.youtube_url = youtube_url;
    }

    public String getYoutube_views() {
        return youtube_views;
    }

    public void setYoutube_views(String youtube_views) {
        this.youtube_views = youtube_views;
    }

    public String getYoutube_description() {
        return youtube_description;
    }

    public void setYoutube_description(String youtube_description) {
        this.youtube_description = youtube_description;
    }

    public String getYoutube_uploader() {
        return youtube_uploader;
    }

    public void setYoutube_uploader(String youtube_uploader) {
        this.youtube_uploader = youtube_uploader;
    }

    public String getYoutube_channel_id() {
        return youtube_channel_id;
    }

    public void setYoutube_channel_id(String youtube_channel_id) {
        this.youtube_channel_id = youtube_channel_id;
    }

    public String getYoutube_average_rating() {
        return youtube_average_rating;
    }

    public void setYoutube_average_rating(String youtube_average_rating) {
        this.youtube_average_rating = youtube_average_rating;
    }

    public String getYoutube_age_limit() {
        return youtube_age_limit;
    }

    public void setYoutube_age_limit(String youtube_age_limit) {
        this.youtube_age_limit = youtube_age_limit;
    }

    public String getYoutube_status() {
        return youtube_status;
    }

    public void setYoutube_status(String youtube_status) {
        this.youtube_status = youtube_status;
    }

    public String getYoutube_status_code() {
        return youtube_status_code;
    }

    public void setYoutube_status_code(String youtube_status_code) {
        this.youtube_status_code = youtube_status_code;
    }

    public String getYoutube_download_size() {
        return youtube_download_size;
    }

    public void setYoutube_download_size(String youtube_download_size) {
        this.youtube_download_size = youtube_download_size;
    }

    public String getYoutube_download_url() {
        return youtube_download_url;
    }

    public void setYoutube_download_url(String youtube_download_url) {
        this.youtube_download_url = youtube_download_url;
    }

    public String getYoutube_video_thumbnail() {
        return youtube_video_thumbnail;
    }

    public void setYoutube_video_thumbnail(String youtube_video_thumbnail) {
        this.youtube_video_thumbnail = youtube_video_thumbnail;
    }

    public String getYoutube_quality() {
        return youtube_quality;
    }

    public void setYoutube_quality(String youtube_quality) {
        this.youtube_quality = youtube_quality;
    }

    public String getYoutube_width() {
        return youtube_width;
    }

    public void setYoutube_width(String youtube_width) {
        this.youtube_width = youtube_width;
    }

    public String getYoutube_height() {
        return youtube_height;
    }

    public void setYoutube_height(String youtube_height) {
        this.youtube_height = youtube_height;
    }

    public String getYoutube_size() {
        return youtube_size;
    }

    public void setYoutube_size(String youtube_size) {
        this.youtube_size = youtube_size;
    }

    public String getYoutube_mp4Url() {
        return youtube_mp4Url;
    }

    public void setYoutube_mp4Url(String youtube_mp4Url) {
        this.youtube_mp4Url = youtube_mp4Url;
    }

    public String getYoutube_screenShot() {
        return youtube_screenShot;
    }

    public void setYoutube_screenShot(String youtube_screenShot) {
        this.youtube_screenShot = youtube_screenShot;
    }

    @Override
    public String toString() {
        return "RapidApi{" +
                ", youtube_title = '" + youtube_title + '\'' +
                ", youtube_type ='" + youtube_type + '\'' +
                ", youtube_id = '" + youtube_id + '\'' +
                ", youtube_url = '" + youtube_url + '\'' +
                ", youtube_views = '" + youtube_views + '\'' +
                ", youtube_description = '" + youtube_description + '\'' +
                " ,youtube_uploader = '" + youtube_uploader + '\'' +
                " ,youtube_channel_id = '" + youtube_channel_id + '\'' +
                ", youtube_average_rating = '" + youtube_average_rating + '\'' +
                ", youtube_age_limit = '" + youtube_age_limit + '\'' +
                ", youtube_status = '" + youtube_status + '\'' +
                ", youtube_status_code = '" + youtube_status_code + '\'' +
                " ,youtube_download_size = '" + youtube_download_size + '\'' +
                " ,youtube_download_url = '" + youtube_download_url + '\'' +
                " ,youtube_video_thumbnail = '" + youtube_video_thumbnail + '\'' +
                " ,youtube_quality = '" + youtube_quality + '\'' +
                " ,youtube_width = '" + youtube_width + '\'' +
                " ,youtube_height = '" + youtube_height + '\'' +
                " ,youtube_size = '" + youtube_size + '\'' +
                " ,youtube_mp4Url = '" + youtube_mp4Url + '\'' +
                " ,youtube_screenShot = '" + youtube_screenShot + '\'' +
                "}";
    }

}
