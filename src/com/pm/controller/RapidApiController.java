package com.pm.controller;


import com.pm.base.BaseController;
import com.pm.po.YouTube;
import com.pm.service.RapidApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import static com.pm.utils.HttpTest.*;

@Controller
@RequestMapping("rapidapi")
public class RapidApiController extends BaseController {

    @Autowired
    public RapidApiService rapidApiService;

    @RequestMapping("/rapidApiTest")
    public String rapidApiTest(String query, Model model) throws InterruptedException, ExecutionException, IOException {
        if(isEmpty(query)){
            return "/rapidapi/rapidApiTest";
        }

        List<YouTube> data = new ArrayList<YouTube>();

        List<Map<String, Object>> youtube_search = youtubeSearch(query);

        for(int i=0; i<youtube_search.size(); i++){
            YouTube youTube = new YouTube();
            for(Object key:youtube_search.get(i).keySet()){
                String value = youtube_search.get(i).get(key).toString();
                if(key.equals("type") && !value.equals("video"))continue;
                if(key.equals("id")){
                    Map<String, Object> yb_to_mp3 = ytToMp3(value);
                    for(Object mp3Key:yb_to_mp3.keySet()){
                        String mp3Value = yb_to_mp3.get(mp3Key).toString();
                        if(mp3Key.equals("Status")){youTube.setYoutube_status(mp3Value);}
                        if(mp3Key.equals("Status_Code")){youTube.setYoutube_status_code(mp3Value);}
                        if(mp3Key.equals("Download_Size")){youTube.setYoutube_download_size(mp3Value);}
                        if(mp3Key.equals("Download_url")){youTube.setYoutube_download_url(mp3Value);}
                        if(mp3Key.equals("Video_Thumbnail")){youTube.setYoutube_video_thumbnail(mp3Value);}
                    }

                    Map<String, Object> yb_to_mp4 = fetchVideos(value);
                    for(Object mp4Key:yb_to_mp4.keySet()){
                        String mp4Value = yb_to_mp4.get(mp4Key).toString();
                        if(mp4Key.equals("quality")){youTube.setYoutube_quality(mp4Value);}
                        if(mp4Key.equals("width")){youTube.setYoutube_width(mp4Value);}
                        if(mp4Key.equals("height")){youTube.setYoutube_height(mp4Value);}
                        if(mp4Key.equals("size")){youTube.setYoutube_size(mp4Value);}
                        if(mp4Key.equals("url")){youTube.setYoutube_mp4Url(mp4Value);}
                    }

                    youTube.setYoutube_screenShot(youtubeScreenshot(value,3));
                    youTube.setYoutube_id(value);
                }
                if(key.equals("url")) {
                    Map<String, Object> yb_video_info = youtubeVideoInfo1(value);
                    for(Object infoKey:yb_video_info.keySet()){
                        String infoValue = yb_video_info.get(infoKey).toString();
                        if(infoKey.equals("description")){youTube.setYoutube_description(infoValue);}
                        if(infoKey.equals("uploader")){youTube.setYoutube_uploader(infoValue);}
                        if(infoKey.equals("channel_id")){youTube.setYoutube_channel_id(infoValue);}
                        if(infoKey.equals("average_rating")){youTube.setYoutube_average_rating(infoValue);}
                     }
                    youTube.setYoutube_url(value);
                }
                if(key.equals("title")){youTube.setYoutube_title(value);}
                if(key.equals("type")){youTube.setYoutube_type(value);}
                if(key.equals("views")){youTube.setYoutube_views(value);}
            }
            data.add(youTube);
        }

        model.addAttribute("obj", data);
        return "rapidapi/rapidApiTest";
    }


    @RequestMapping("/rapidMashup")
    public String rapidMashup(String query, Model model) {
        return "/rapidapi/rapidMashup";
    }

}
