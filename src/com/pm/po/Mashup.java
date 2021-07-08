package com.pm.po;

import java.io.Serializable;

/**
 * 理解：就像我们搬桌子，桌子太大了不能通过比较小的门，所以我们要把它拆了再运进去，这个拆桌子的过程就是序列化。
 * 而反序列化就是等我们需要用桌子的时候再把它窦起来，这个过程就是反序列化。
 * 当两个进程进行远程通信时，可以相互发送各种类型的数据，包括文本、图片、音频、视频等，
 * 而这些数据都会以二进制序列的形式在网络上传送。那么当两个Java进程进行通信时，实现进程间的对象传送:
 * 一方面，发送方需要把这个Java对象转换为字节序列，然后在网络上传送；另一方面，接收方需要从字节序列中恢复出Java对象。
 * 好处一是实现了数据的持久化，通过序列化可以把数据永久地保存到硬盘上（通常存放在文件里），
 * 二是，利用序列化实现远程通信，即在网络上传送对象的字节序列。
 * */
public class Mashup implements Serializable {
    private Integer mashup_id;
    private String mashup_name;
    private String mashup_tags;
    private String mashup_apis;

    public Mashup(Integer mashup_id, String mashup_name, String mashup_tags, String mashup_apis) {
        this.mashup_id = mashup_id;
        this.mashup_name = mashup_name;
        this.mashup_tags = mashup_tags;
        this.mashup_apis = mashup_apis;
    }

    public Mashup(){}

    public Integer getMashup_id() {
        return mashup_id;
    }

    public void setMashup_id(Integer mashup_id) {
        this.mashup_id = mashup_id;
    }

    public String getMashup_name() {
        return mashup_name;
    }

    public void setMashup_name(String mashup_name) {
        this.mashup_name = mashup_name;
    }

    public String getMashup_tags() {
        return mashup_tags;
    }

    public void setMashup_tags(String mashup_tags) {
        this.mashup_tags = mashup_tags;
    }

    public String getMashup_apis() {
        return mashup_apis;
    }

    public void setMashup_apis(String mashup_apis) {
        this.mashup_apis = mashup_apis;
    }

    /**
     * 在System.out.println(类的对象名)时，类的对象名是个引用，如果不重写，就输出引用地址。
     * 其实实际是这样的System.out.println(类的对象名.toString()),只是我们平时默认不用写，它自动加上。
     * */
    @Override
    public String toString(){
        return "Mashup{"+
                "mashup_id="+mashup_id+
                ",mashup_name='"+mashup_name+"\'"+
                ",mashup_tags='"+mashup_tags+"\'"+
                ",mashup_apis='"+mashup_apis+"\'"+
                "}";
    }
}
