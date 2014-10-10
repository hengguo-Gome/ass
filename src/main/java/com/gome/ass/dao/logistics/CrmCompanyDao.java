package com.gome.ass.dao.logistics;

import java.util.List;

import com.gome.ass.entity.CrmCompany;

public interface CrmCompanyDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    int insert(CrmCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    int insertSelective(CrmCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    CrmCompany selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CrmCompany record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_company
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CrmCompany record);
    
    
    public void deleteBatch(List<String> ids);

    public void insertBatch(List<CrmCompany> crmCompanies);
}