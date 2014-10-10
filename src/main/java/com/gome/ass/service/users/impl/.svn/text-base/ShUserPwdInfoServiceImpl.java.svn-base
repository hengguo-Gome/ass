package com.gome.ass.service.users.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.gome.ass.dao.users.ShUserPwdInfoDao;
import com.gome.ass.entity.ShUserPwdInfo;
import com.gome.ass.service.users.ShUserPwdInfoService;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

@Service("shUserPwdInfoService")
public class ShUserPwdInfoServiceImpl implements ShUserPwdInfoService {
    
    @Resource
    private ShUserPwdInfoDao shUserPwdDao;
    
    public void insert(ShUserPwdInfo shUserPwdInfo){
        try{
            this.shUserPwdDao.insert(shUserPwdInfo);
        }catch(DataAccessException  e){
            if(e.getCause() instanceof MySQLIntegrityConstraintViolationException){
                //ignored 推送已经存在用户数据时不更新密码
            }else {
                throw e;
            }
        }
    }

    @Override
    public ShUserPwdInfo findUserByObject(ShUserPwdInfo shUserPwdInfo) {
        return this.shUserPwdDao.selectByObject(shUserPwdInfo);
    }

    @Override
    public void deleteByPrimaryKey(Map<String, Object> map) {
        this.shUserPwdDao.deleteByPrimaryKey(map);
    }

    @Override
    public void updateByPrimaryKey(Map<String, Object> map) {
        this.shUserPwdDao.updateByPrimaryKey(map);
    }

    @Override
    public void insertByMap(Map<String, Object> shUserPwdInfo) {
        try{
            this.shUserPwdDao.insertByMap(shUserPwdInfo);
        }catch(DataAccessException  e){
            if(e.getCause() instanceof MySQLIntegrityConstraintViolationException){
                //ignored 推送已经存在用户数据时不更新密码
            }else {
                throw e;
            }
        }
    }

    @Override
    public void insertOrUpdate(ShUserPwdInfo shUserPwdInfo) {
        ShUserPwdInfo shUser = this.shUserPwdDao.selectByObject(shUserPwdInfo);
        if(shUser == null){
            this.shUserPwdDao.insert(shUserPwdInfo);
        } else {
            this.shUserPwdDao.updateByObject(shUserPwdInfo);
        }
    }

    @Override
    public ShUserPwdInfo findUserByUserId(Map<String, Object> map) {
        return this.shUserPwdDao.selectByPrimaryKey(map);
    }


}
