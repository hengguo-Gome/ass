package com.gome.ass.dao.wsdl;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.EmpAccount;
import com.gome.ass.entity.EmpPosition;
import com.gome.ass.entity.EmpSysVar;



@Repository("empDao")
public interface EmpDao {
	
	public EmpAccount getAccountById(String accountNo);
	
	public void addAccount(EmpAccount account);

	public void updateAccount(EmpAccount account);
	
//	void addAccountJobLog(EmpAccountJobLog accountJobLog);

//	void deleteLogByEmpno(String empno);
	
	public void deleteEmpPositionById(String empNo);

	public int addEmpPosition(EmpPosition emp);
	
	int selectCountByPostCodeAndState(String positioncode);
	
	public EmpSysVar getSysVarById(String batch_code);

	public int updateSysVar(EmpSysVar svar);

	public void addSysVar(EmpSysVar svar);

//	public SysUser getAccountByApAccount(String indexLoginId);

}
