package com.gome.ass.entity;

import java.io.Serializable;
/**
 * 百度推送人员分组
 * @author Zhang.Mingji
 * @date 2014年8月27日上午11:26:16
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class UserTag implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4330981152901115722L;

	private String id;

    private String baiduUserId;

    private String tagName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getBaiduUserId() {
        return baiduUserId;
    }

    public void setBaiduUserId(String baiduUserId) {
        this.baiduUserId = baiduUserId == null ? null : baiduUserId.trim();
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName == null ? null : tagName.trim();
    }
}