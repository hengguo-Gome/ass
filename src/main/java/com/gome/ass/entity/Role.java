package com.gome.ass.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 角色
 * @author Zhang.Mingji
 * @date 2014年8月27日下午2:08:00
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class Role implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -3621039636447904309L;

	private String roleId;

    private String roleName;

    private Date createTime;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}