package com.gome.ass.service.wsdl.service;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.EmpAccount;
import com.gome.ass.entity.EmpPosition;
import com.gome.ass.entity.EmpSysVar;
import com.gome.ass.schedule.GetAccountJob;


public interface EmpService {
	
	public EmpAccount getAccountById(String accountNo);
	
	/**
	 * 查找账户是否是初始化密码
	 * @param apAccount
	 * @return
	 */
	public String getFlagByApAccount(String account);
	
	public void addAccount(EmpAccount account);

	public void updateAccount(EmpAccount account);
	
	public void updateModifyPwdByApAccount(String account);
	
//	void addAccountJobLog(EmpAccountJobLog accountJobLog);

//	void deleteLogByEmpno(String empno);
	
	public void deleteEmpPositionById(String empNo);

	public int addEmpPosition(EmpPosition emp);
	
	int selectCountByPostCodeAndState(String positioncode);
	
	public EmpSysVar getSysVarById(String batch_code);

	public int updateSysVar(EmpSysVar svar);

	public void addSysVar(EmpSysVar svar);

	public void saveAccountAndEmp(Map<EmpAccount, List<EmpPosition>> accMap,
			List<EmpAccount> accounts, GetAccountJob getAccountJob);

	//public SysUser getAccountByApAccount(String indexLoginId);
}
