package com.gome.ass.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gome.ass.dao.PersonDao;
import com.gome.ass.entity.Person;
import com.gome.ass.service.PersonService;
import com.gome.common.page.Page;
/**
 * 该类只作为模板参考，不参与具体的业务
 * @author Zhang.Mingji
 * @date 2014年8月7日上午11:20:18
 * @Copyright(c) gome inc Gome Co.,LTD
 */
@Service("personService")
public class PersonServiceImpl implements PersonService {
	@Resource
	private PersonDao personDao;

	@Override
	public void insertPerson(Person person)  {
		this.personDao.insertPerson(person);
	}

	@Override
	public void updatePerson(Person person)  {
		this.personDao.updatePerson(person);
	}

	@Override
	public void deletePerson(Map<String, Object> inMap)  {
		this.personDao.deletePerson(inMap);
	}

	@Override
	public Person findPersonById(Map<String, Object> inMap)
			 {
		return this.personDao.findPersonById(inMap);
	}

	@Override
	public List<Map<String, Object>> findPersonPageList(Page page)  {
		return this.personDao.findPersonPageList(page);
	}

}
