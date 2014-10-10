package com.gome.ass.service.test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;

import com.gome.ass.entity.Person;
import com.gome.ass.service.PersonService;
import com.gome.ass.service.common.AbstractTransactionalSpringContextTestCase;

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
	
	@Test
	public void findPersonByPage() throws Exception{
	}
	
}
