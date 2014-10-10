package com.gome.ass.dao.users;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.ShUserPwdInfo;

@Repository("shUserPwdInfoDao")
public interface ShUserPwdInfoDao {

    public int deleteByPrimaryKey(Map<String, Object> shUserPwdInfo);

    /**
     * 插入用户密码信息，插入已存在用户时，忽略此异常
     */
    public void insert(ShUserPwdInfo shUserPwdInfo);

    public void insertByMap(Map<String, Object> shUserPwdInfo);

    public int insertSelective(Map<String, Object> shUserPwdInfo);

    /**
     * 根据账号，用户类型查询用户密码<br>
     * <b> account</b> 账号<br>
     * <b> fromType</b> 用户类型
     */
    public ShUserPwdInfo selectByPrimaryKey(Map<String, Object> shUserPwdInfo);
    
    public ShUserPwdInfo selectByObject(ShUserPwdInfo shUserPwdInfo);

    /**
     * 根据用户名与用户类型修改密码 <br>
     * @param userId 账号<br>
     * @param userType 用户类型
     */
    public int updateByPrimaryKey(Map<String, Object> shUserPwdInfo);
    
    /**
     * 根据已有存在的用户账号及用户类型修改密码
     * @param shUserPwdInfo
     * @return
     */
    public int updateByObject(ShUserPwdInfo shUserPwdInfo);
}