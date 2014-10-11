package com.gome.ass.entity;

/**
 * EMP Account与JL Account抽出来的视图
 * @author Wang.Hengguo
 * @date 2014年9月28日下午5:06:19
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class ShUser {
    private String name;

    private String account;

    private String password;

    private String fromType;
    
    private String webcode;
    
    private String companyCode;
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
	public String getFromType() {
		return fromType;
	}

	public void setFromType(String fromType) {
		this.fromType = fromType;
	}

	public String getWebcode() {
		return webcode;
	}

	public void setWebcode(String webcode) {
		this.webcode = webcode;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

    
}