package com.gome.ass.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 系统菜单
 * @author Zhang.Mingji
 * @date 2014年8月27日下午2:06:50
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class ShMenu implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -6110155007524767370L;

	private String menuId;

    private String menuName;

    private String parentId;

    private String menuUrl;

    private Date createTime;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl == null ? null : menuUrl.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}