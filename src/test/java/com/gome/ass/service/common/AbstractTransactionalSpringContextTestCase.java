package com.gome.ass.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeansException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gome.ass.dao.users.CrmWorkerDao;
import com.gome.ass.dao.users.ShUserDao;
import com.gome.ass.entity.ShUser;
import com.gome.common.page.Page;
/**
 * @author Zhang.Mingji
 * @date 2014年5月21日上午10:58:40
 * @Copyright(c) gome inc Gome Co.,LTD
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
        "classpath:/spring/spring-appContext.xml"
})
public class AbstractTransactionalSpringContextTestCase extends AbstractTransactionalJUnit4SpringContextTests{

	/**
     * 初始化Bean
     * 
     * @param name
     * @return
     * @throws BeansException
     */
    public Object getBeanByName(String name) throws BeansException {
        return applicationContext.getBean(name);
    }
    
    @Test
    public void testBean(){
    	ShUserDao shUserDao = (ShUserDao) getBeanByName("shUserDao");
    	Page page = new Page();
    	Map<String, Object> map = new HashMap<String, Object>();
//    	map.put("account", "222222");
//	    map.put("password", "1");
//	    map.put("fromType", 1);
    	map.put("workerCode", "123456789");
    	page.setParam(map);
    	List list = shUserDao.getUserPageList(page);
    	System.out.println(list.size());
    }
}
