package com.gome.ass.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.gome.ass.entity.Person;
import com.gome.common.page.Page;

/**
 * 该接口只作为模板参考，不参与具体的业务
 * @author Zhang.Mingji
 * @date 2014年8月7日上午10:58:28
 * @Copyright(c) gome inc Gome Co.,LTD
 */
@Repository("personDao")
public interface PersonDao {

	/**
	 * 添加人员
	 * @param person
	 * @
	 */
	public void insertPerson(Person person) ;
	/**
	 * 更新人员
	 * @param person
	 * @
	 */
	public void updatePerson(Person person) ;
	/**
	 * 删除人员
	 * @param inMap
	 * @
	 */
	public void deletePerson(Map<String, Object> inMap) ;
	/**
	 * 通过Id查找人员
	 * @param inMap
	 * @return
	 * @
	 */
	public Person findPersonById(Map<String, Object> inMap) ;
	/**
	 * 分页查询
	 * @param inMap
	 * @param param
	 * @return
	 * @
	 */
	public List<Map<String, Object>> findPersonPageList(Page page) ;
}
