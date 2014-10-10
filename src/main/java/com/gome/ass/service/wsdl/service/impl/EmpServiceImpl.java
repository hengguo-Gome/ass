package com.gome.ass.service.wsdl.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.gome.ass.common.Constrants;
import com.gome.ass.dao.wsdl.EmpDao;
import com.gome.ass.entity.EmpAccount;
import com.gome.ass.entity.EmpPosition;
import com.gome.ass.entity.EmpSysVar;
import com.gome.ass.entity.ShUserPwdInfo;
import com.gome.ass.schedule.GetAccountJob;
import com.gome.ass.service.users.ShUserPwdInfoService;
import com.gome.ass.service.wsdl.service.EmpService;
import com.gome.ass.util.UUIDUtil;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;


@Service("empService")
public class EmpServiceImpl implements EmpService {
    private Logger log = LoggerFactory.getLogger(EmpServiceImpl.class);
	@Resource
	private EmpDao empDao;
	@Resource
	private ShUserPwdInfoService shUserPwdInfoService;

	@Override
	public EmpAccount getAccountById(String accountNo) {
		return empDao.getAccountById(accountNo);
	}

	@Override
	public void addAccount(EmpAccount account) {
		empDao.addAccount(account);
	}

	@Override
	public void updateAccount(EmpAccount account) {
		empDao.updateAccount(account);
	}

//	@Override
//	public void addAccountJobLog(EmpAccountJobLog accountJobLog) {
//		empDao.addAccountJobLog(accountJobLog);
//	}

//	@Override
//	public void deleteLogByEmpno(String empno) {
//		empDao.deleteLogByEmpno(empno);
//	}

	@Override
	public void deleteEmpPositionById(String empNo) {
		empDao.deleteEmpPositionById(empNo);
	}

	@Override
	public int addEmpPosition(EmpPosition emp) {
		return empDao.addEmpPosition(emp);
	}

	@Override
	public int selectCountByPostCodeAndState(String positioncode) {
		return empDao.selectCountByPostCodeAndState(positioncode);
	}

	@Override
	public EmpSysVar getSysVarById(String batch_code) {
		return empDao.getSysVarById(batch_code);
	}

	@Override
	public int updateSysVar(EmpSysVar svar) {
		return empDao.updateSysVar(svar);
	}

	@Override
	public void addSysVar(EmpSysVar svar) {
		empDao.addSysVar(svar);
	}
	
	public void saveAccountAndEmp(Map<EmpAccount, List<EmpPosition>> accMap,List<EmpAccount> accounts,
			GetAccountJob getAccountJob) {
		try {
			EmpAccount tempAcc = null;
			for(int j=0;j<accounts.size();j++){
				EmpAccount account = accounts.get(j);
				List<EmpPosition> emps = accMap.get(account);
				String operatorType="";
				tempAcc = empDao.getAccountById(account.getEmpno());
//				int row = -1;
//				EmpAccountJobLog accountJobLog =  null;
				if(account.getState().equals("1")){
					if(emps.size()>0){//1+岗位
						if(tempAcc==null){//原来不存在
							operatorType = "新增";
						}else{
							operatorType = "异动";
						}
					}else{
						if(tempAcc==null){//原来不存在
							continue;
						}else{
							operatorType = "注销";
							account.setState("3");
						}						
					}
				}else if(account.getState().equals("3")){//注销
					operatorType = "注销";
				}else if(account.getState().equals("5")){//锁定
					operatorType = "锁定";
				}
				
				account.setOperatortype(operatorType);
				if(tempAcc==null){
					account.setNeedmodify("Y");
					empDao.addAccount(account);

                    ShUserPwdInfo shUserPwdInfo = new ShUserPwdInfo();
                    shUserPwdInfo.setUserId(account.getApAccount());
                    shUserPwdInfo.setPassword(account.getAdAccountpwd());
                    shUserPwdInfo.setUserType(Constrants.GOME_USER);
                    shUserPwdInfoService.insert(shUserPwdInfo);
                    
				}else{
					account.setNeedmodify(tempAcc.getNeedmodify());
					account.setApAccountpwd(tempAcc.getApAccountpwd());
					account.setAdAccountpwd(tempAcc.getAdAccountpwd());
					empDao.updateAccount(account);
				}
				/*
				empDao.deleteEmpPositionById(account.getEmpno());
				empDao.deleteLogByEmpno(account.getEmpno());
				if(emps.size()==0){
					accountJobLog =  new EmpAccountJobLog();
					accountJobLog.setBatchno(getAccountJob.getBatchNo());
					accountJobLog.setEmpno(account.getEmpno());
					accountJobLog.setEmpname(account.getEmpname());
					accountJobLog.setAdAccount(account.getAdAccount());
					accountJobLog.setApAccount(account.getApAccount());
					accountJobLog.setCompname(account.getCompname());
//					accountJobLog.setDeptcode(emp.getDeptcode());
//					accountJobLog.setDeptname(emp.getDeptname());
//					accountJobLog.setPositioncode(emp.getPositioncode());
//					accountJobLog.setPositionname(emp.getPositionname());
//					accountJobLog.setDutyflag(emp.getDutyflag());
					accountJobLog.setCreatedate(SysUtils.getCurrentDate());
					accountJobLog.setCreatetime(SysUtils.getCurrentTime());
					accountJobLog.setModifydate(SysUtils.getCurrentDate());
					accountJobLog.setModifytime(SysUtils.getCurrentTime());
					accountJobLog.setOperatortype(operatorType);
//					account.setState("3");
//					getAccountJob.getAccountService().updateAccount(account);
					
					
					accountJobLog.setState("成功");
					accountJobLog.setLoginfo("用户"+account.getApAccount()+"更新成功,权限分配失败.因为该账户是空岗！");	
					String logid = UUIDUtil.getUUID();
					accountJobLog.setLogid(logid);
					empDao.addAccountJobLog(accountJobLog);
				}
				*/
				int fitNum = 0;
				for(int i=0;i<emps.size();i++){
					try {
						EmpPosition emp = emps.get(i);
//						accountJobLog =  new EmpAccountJobLog();
//						accountJobLog.setBatchno(getAccountJob.getBatchNo());
//						accountJobLog.setEmpno(account.getEmpno());
//						accountJobLog.setEmpname(account.getEmpname());
//						accountJobLog.setAdAccount(account.getAdAccount());
//						accountJobLog.setApAccount(account.getApAccount());
//						accountJobLog.setCompname(account.getCompname());
//						accountJobLog.setDeptcode(emp.getDeptcode());
//						accountJobLog.setDeptname(emp.getDeptname());
//						accountJobLog.setPositioncode(emp.getPositioncode());
//						accountJobLog.setPositionname(emp.getPositionname());
//						accountJobLog.setDutyflag(emp.getDutyflag());
//						accountJobLog.setCreatedate(SysUtils.getCurrentDate());
//						accountJobLog.setCreatetime(SysUtils.getCurrentTime());
//						accountJobLog.setModifydate(SysUtils.getCurrentDate());
//						accountJobLog.setModifytime(SysUtils.getCurrentTime());
//						accountJobLog.setOperatortype(operatorType);
						emp.setId(UUIDUtil.getUUID());
//						row = 
						empDao.addEmpPosition(emp);
						/*
						if(row==1){
							if(empDao.selectCountByPostCodeAndState(emp.getPositioncode())>0){
								fitNum ++;
								accountJobLog.setState("成功");
								accountJobLog.setLoginfo("用户"+account.getApAccount()+"更新成功,权限分配成功.");
							}else{
								accountJobLog.setState("失败");
								accountJobLog.setLoginfo("用户"+account.getApAccount()+"更新成功,但权限分配时出错:岗位编码"+emp.getPositioncode()+"不存在.");
							}
						}else{
							accountJobLog.setState("失败");
							accountJobLog.setLoginfo("用户"+account.getApAccount()+"更新失败.");							
						}
						row = -1;
						*/
					} catch (Exception e) {
//						accountJobLog.setState("失败");
//						accountJobLog.setLoginfo("用户"+account.getApAccount()+"更新失败.");	
						e.printStackTrace();
//						accountJobLog.setErrorinfo(SysUtils.subString(e.getLocalizedMessage(),300));
					}finally{
//						String logid = UUIDUtil.getUUID();
//						accountJobLog.setLogid(logid);
//						empDao.addAccountJobLog(accountJobLog);
					}
				}
				
				if(fitNum==0){
//					account.setState("3");
//					getAccountJob.getAccountService().updateAccount(account);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isMove(List<EmpPosition> newEmpPosition,List<EmpPosition> oldEmpPosition){
		boolean flag = false;
		for(EmpPosition np : newEmpPosition){
			for(EmpPosition op : oldEmpPosition){
				if(np.getPositioncode().equals(op.getPositioncode())){
					flag = true;
				}
			}
			if(!flag){
				return false;
			}
		}
		return true;
	}

//	@Override
//	public SysUser getAccountByApAccount(String indexLoginId) {
//		return empDao.getAccountByApAccount(indexLoginId);
//	}

}
