package com.gome.ass.service.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;

import com.gome.ass.entity.Person;
import com.gome.ass.service.PersonService;
import com.gome.ass.service.common.AbstractTransactionalSpringContextTestCase;
import com.gome.ass.service.logistics.CrmInstallBillService;

/**
 * 该类只作为模板参考，不参与具体的业务
 * @author Zhang.Mingji
 * @date 2014年8月7日上午11:26:11
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class PersonServiceTest extends AbstractTransactionalSpringContextTestCase{
	
	@Resource
	private PersonService personService;
	
	@Test
	@Rollback(false)
	public void insertPersonTest() throws Exception{
		Person p = new Person();
		p.setAddress("北京市海淀区");
		p.setAge(20);
		p.setCreateTime(new Date());
		p.setName("李四");
		personService.insertPerson(p);
	}
	
	@Test
	public void findByIdTest() throws Exception{
		Map<String,Object> inMap = new HashMap<String,Object>();
		inMap.put("id", "2");
		Person person = personService.findPersonById(inMap);
		System.out.println(person.getName());
	}
	
	@Test
	public void deletePersonTest() throws Exception{
		Map<String,Object> inMap = new HashMap<String,Object>();
		inMap.put("id", "2");
		personService.deletePerson(inMap);
	}
	
	@Resource
	private CrmInstallBillService crmInstallBillService;
	@Test
	public void findPersonByPage() throws Exception{
		List<Map> list = new ArrayList<Map>();
		for (int i = 0; i < 2; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("azdh", "0200080383");
			map.put("thd", "1224334901");
			map.put("gsdm", "1001");
			map.put("order", "1");
			list.add(map);
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("suquence", list);
		crmInstallBillService.updateInstallSuquence(param);
		
	}
	
}
