package com.gome.ass.dao.logistics;

import java.util.List;

import com.gome.ass.entity.CrmAccessories;

public interface CrmAccessoriesDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    int insert(CrmAccessories record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    int insertSelective(CrmAccessories record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    CrmAccessories selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(CrmAccessories record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table crm_accessories
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(CrmAccessories record);
    
    
    void insertBatch(List<CrmAccessories> crmAccessories);
    
	void deleteByJlorderCode(String jlorderCodes);
}