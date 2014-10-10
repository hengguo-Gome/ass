package com.gome.ass.service.system;

import java.util.List;

import com.gome.ass.entity.JlAccount;

public interface JlAccountService {

    public void deleteBatch(List<String> codes);

    public void insertBatch(List<JlAccount> accounts);

    public void insertOrUpdate(JlAccount jlAccount);
}
