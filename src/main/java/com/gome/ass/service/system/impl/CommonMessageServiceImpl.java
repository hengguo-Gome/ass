package com.gome.ass.service.system.impl;

import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.interceptor.LoggingOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.gome.ass.service.system.CommonMessageService;
import com.gome.ass.webService.WmgwSoap;

public class CommonMessageServiceImpl implements CommonMessageService {

	@Override
	public String sendMessageToMobile(String mobileNo, String message) {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.getInInterceptors().add(new LoggingInInterceptor());
		factory.getOutInterceptors().add(new LoggingOutInterceptor());
		factory.setAddress(this.msgAddress);
		factory.setServiceClass(WmgwSoap.class);
		WmgwSoap wmgw = (WmgwSoap) factory.create();
		String smsNew = wmgw.mongateCsSpSendSmsNew(this.msgUsername,
				this.msgPassword, mobileNo, message, 1, null);
		return smsNew;
	}

	private String msgUsername;
	private String msgPassword;
	private String msgAddress;

	public String getMsgUsername() {
		return msgUsername;
	}

	public void setMsgUsername(String msgUsername) {
		this.msgUsername = msgUsername;
	}

	public String getMsgPassword() {
		return msgPassword;
	}

	public void setMsgPassword(String msgPassword) {
		this.msgPassword = msgPassword;
	}

	public String getMsgAddress() {
		return msgAddress;
	}

	public void setMsgAddress(String msgAddress) {
		this.msgAddress = msgAddress;
	}

}
