package com.gome.ass.service.users;

import java.util.Map;

import com.gome.ass.entity.ShUserPwdInfo;

public interface ShUserPwdInfoService {
    public void insert(ShUserPwdInfo shUserPwdInfo);
    
    public void insertByMap(Map<String, Object> shUserPwdInfo);
    
    /**
     * 根据账号，用户类型查询用户密码<br>
     * <b> account</b> 账号<br>
     * <b> fromType</b> 用户类型
     */
    public ShUserPwdInfo findUserByUserId(Map<String, Object> map);
    
    public ShUserPwdInfo findUserByObject(ShUserPwdInfo shUserPwdInfo);
    
    public void deleteByPrimaryKey(Map<String, Object> map);
    
    public void updateByPrimaryKey(Map<String, Object> map);
    
    public void insertOrUpdate(ShUserPwdInfo shUserPwdInfo);

}
