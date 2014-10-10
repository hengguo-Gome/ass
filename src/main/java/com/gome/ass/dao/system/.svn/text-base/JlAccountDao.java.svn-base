package com.gome.ass.dao.system;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.JlAccount;

@Repository("jlAccountDao")
public interface JlAccountDao {

    public void deleteBatch(List<String> codes);

    public void insertBatch(List<JlAccount> accounts);
    
    public JlAccount selectById(String id);

    public void updateById(JlAccount jlAccount);
}
