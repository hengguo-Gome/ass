package com.gome.ass.entity;

import java.io.Serializable;
/**
 * 用户-角色
 * @author Zhang.Mingji
 * @date 2014年8月27日上午11:25:30
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class UserRole implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -4658398102404836806L;

	private String userId;

    private String roleId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}