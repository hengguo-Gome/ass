package com.gome.ass.entity;

import java.io.Serializable;
/**
 * 角色-资源
 * @author Zhang.Mingji
 * @date 2014年8月27日上午11:23:59
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class RoleResource implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -5548224661680573112L;

	private String roleId;

    private String resourceId;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getResourceId() {
        return resourceId;
    }

    public void setResourceId(String resourceId) {
        this.resourceId = resourceId == null ? null : resourceId.trim();
    }
}