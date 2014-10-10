package com.gome.ass.service.system.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.system.JlAccountDao;
import com.gome.ass.entity.JlAccount;
import com.gome.ass.service.system.JlAccountService;


@Service("jlAccountService")
public class JlAccountServiceImpl implements JlAccountService {
	
	@Resource
	private JlAccountDao jlAccountDao; 
	
    @Override
    public void deleteBatch(List<String> codes) {
        jlAccountDao.deleteBatch(codes);
    }

    @Override
    public void insertBatch(List<JlAccount> accounts) {
        jlAccountDao.insertBatch(accounts);
        
    }

    @Override
    public void insertOrUpdate(JlAccount jlAccount) {

        Map<String, Object> map = new HashMap<String, Object>();
        JlAccount temp = this.jlAccountDao.selectById(jlAccount.getId());
        if(null == temp){
            this.jlAccountDao.insertBatch(Arrays.asList(jlAccount));
        }else{
            this.jlAccountDao.updateById(jlAccount);
        }
    
        
    }

}
