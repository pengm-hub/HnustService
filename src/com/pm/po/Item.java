package com.pm.po;

import java.io.Serializable;
import java.util.List;

/**
 * 商品
 */
public class Item implements Serializable{
    /**
     * 主键
     */
    private Integer id;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品价格
     */
    private String price;

    /**
     * 折扣
     */
    private Integer zk;

    /**
     * 收藏数
     */
    private Integer scNum;

    /**
     * 购买数
     */
    private Integer gmNum;

    /**
     * 主图
     */
    private String url1;

    /**
     * 描述
     */
    private String ms;

    private String pam1;
    private String pam2;
    private String pam3;
    private String val1;
    private String val2;
    private String val3;

    private Integer type;

    /**
     * 类别id一级
     */
    private Integer categoryIdOne;

    private ItemCategory yiji;

    /**
     * 类别id二级
     */
    private Integer categoryIdTwo;

    private ItemCategory erji;

    /**
     * 是否有效 0有效 1已删除
     */
    private Integer isDelete;

    /**
     * 是否审核 0未审核 1已审核
     */
    private Integer isExamine;

    /**
     * 评论列表
     */
    private List<Comment> pls;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Integer getZk() {
        return zk;
    }

    public void setZk(Integer zk) {
        this.zk = zk;
    }

    public Integer getScNum() {
        return scNum;
    }

    public void setScNum(Integer scNum) {
        this.scNum = scNum;
    }

    public Integer getGmNum() {
        return gmNum;
    }

    public void setGmNum(Integer gmNum) {
        this.gmNum = gmNum;
    }

    public String getUrl1() {
        return url1;
    }

    public void setUrl1(String url1) {
        this.url1 = url1;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms;
    }

    public String getPam1() {
        return pam1;
    }

    public void setPam1(String pam1) {
        this.pam1 = pam1;
    }

    public String getPam2() {
        return pam2;
    }

    public void setPam2(String pam2) {
        this.pam2 = pam2;
    }

    public String getPam3() {
        return pam3;
    }

    public void setPam3(String pam3) {
        this.pam3 = pam3;
    }

    public String getVal1() {
        return val1;
    }

    public void setVal1(String val1) {
        this.val1 = val1;
    }

    public String getVal2() {
        return val2;
    }

    public void setVal2(String val2) {
        this.val2 = val2;
    }

    public String getVal3() {
        return val3;
    }

    public void setVal3(String val3) {
        this.val3 = val3;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getCategoryIdOne() {
        return categoryIdOne;
    }

    public void setCategoryIdOne(Integer categoryIdOne) {
        this.categoryIdOne = categoryIdOne;
    }

    public ItemCategory getYiji() {
        return yiji;
    }

    public void setYiji(ItemCategory yiji) {
        this.yiji = yiji;
    }

    public Integer getCategoryIdTwo() {
        return categoryIdTwo;
    }

    public void setCategoryIdTwo(Integer categoryIdTwo) {
        this.categoryIdTwo = categoryIdTwo;
    }

    public ItemCategory getErji() {
        return erji;
    }

    public void setErji(ItemCategory erji) {
        this.erji = erji;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getIsExamine() { return isExamine; }

    public void setIsExamine(Integer isExamine) { this.isExamine = isExamine; }

    public List<Comment> getPls() {
        return pls;
    }

    public void setPls(List<Comment> pls) {
        this.pls = pls;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", zk=" + zk +
                ", scNum=" + scNum +
                ", gmNum=" + gmNum +
                ", url1='" + url1 + '\'' +
                ", ms='" + ms + '\'' +
                ", pam1='" + pam1 + '\'' +
                ", pam2='" + pam2 + '\'' +
                ", pam3='" + pam3 + '\'' +
                ", val1='" + val1 + '\'' +
                ", val2='" + val2 + '\'' +
                ", val3='" + val3 + '\'' +
                ", type=" + type +
                ", categoryIdOne=" + categoryIdOne +
                ", yiji=" + yiji +
                ", categoryIdTwo=" + categoryIdTwo +
                ", erji=" + erji +
                ", isDelete=" + isDelete +
                ", isExamine=" + isExamine +
                '}';
    }

}
