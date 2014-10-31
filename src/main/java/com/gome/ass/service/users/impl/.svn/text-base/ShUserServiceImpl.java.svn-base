package com.gome.ass.service.users.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.users.ShUserDao;
import com.gome.ass.entity.ShUser;
import com.gome.ass.service.users.ShUserService;
import com.gome.common.page.Page;

@Service("shUserService")
public class ShUserServiceImpl implements ShUserService {

    @Resource
    private ShUserDao shUserDao;
    @Override
    public List<Map<String, Object>> getUserPageList(Page page) {
        return this.shUserDao.getUserPageList(page);
    }
    
    public ShUser getUserSelective(Page page){
        return this.shUserDao.getUserSelective(page);
    }

	@Override
	public void deleteShUser(Map<String, Object> inMap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateShUserRoles(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertUserRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, Object>> getUserRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
