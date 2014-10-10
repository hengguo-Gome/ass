package com.gome.ass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gome.ass.entity.Person;
import com.gome.ass.service.PersonService;
import com.gome.ass.util.BeanMapUtils;
import com.gome.ass.util.JsonUtil;
import com.gome.ass.util.UUIDUtil;
import com.gome.common.page.Page;

/**
 * 该类只作为模板参考，不参与具体的业务
 * @author Zhang.Mingji
 * @date 2014年8月8日上午9:03:23
 * @Copyright(c) gome inc Gome Co.,LTD
 */
@Controller
@RequestMapping("/person")
public class PersonController {
	@Resource
	private PersonService personService;

	@RequestMapping(value="/findPerson", produces="text/plain;charset=UTF-8")
	public @ResponseBody String findPersonById(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> inMap = new HashMap<String, Object>();
		inMap.put("id", request.getParameter("pId"));
		System.out.println(request.getParameter("name"));
		Person p = this.personService.findPersonById(inMap);
		result.put("data", p);
		return JsonUtil.javaObjectToJsonString(result);
	}
	

    @RequestMapping(value="/personListView")
    public String personListView(){
        return "demo/personList";
    }
    
    @RequestMapping(value="/addView")
    public String addView(){
        return "basicData/feeStandard/checkoutStandardAdd";
    }
    

    @RequestMapping(value="personAdd")
    @ResponseBody
    public String addCheckout(HttpServletRequest request, Person person) {
        try {
 
            person.setId(UUIDUtil.getUUID());
            personService.insertPerson(person);
            return "{\"flag\" : \"success\"}";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping(value="/updateView/{id}")
    public ModelAndView updateView(@PathVariable(value = "id") String id){
        ModelAndView mav = new ModelAndView("demo/personUpdate");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id", id);
        Person person = personService.findPersonById(map);
        mav.addObject("person", person);
        return mav;
    }
    
    @RequestMapping(value="/personUpdate")
    @ResponseBody
    public String personUpdate(HttpServletRequest request, Person person){
        try {
            personService.updatePerson(person);
            return "{\"flag\" : \"success\"}";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//    
//    @RequestMapping(value="/showView/{id}")
//    public ModelAndView showView(@PathVariable(value = "id") String feeID){
//        ModelAndView mav = new ModelAndView("basicData/feeStandard/checkoutStandardShow");
//        HxFeeMoveMachine checkout = hxCheckoutService.getCheckoutById(feeID);
//        mav.addObject("checkout", checkout);
//        return mav;
//    }
    
//    @RequestMapping(value="/deleteMoveCheckout/{idString}")
//    @ResponseBody
//    public String deleteMoveCheckout(@PathVariable(value = "idString") String idString){
//        try {
//            hxCheckoutService.deleteMoveCheckout(idString);
//            return "{\"flag\" : \"success\"}";
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
    
    @RequestMapping(value="/personPageList", produces="text/plain;charset=utf-8")
    @ResponseBody
    public String personPageList(HttpServletResponse response, Page page, Person person) throws Exception{
        Map<String, Object> map = BeanMapUtils.convertBean(person);
        page.setParam(map);
        List<Map<String, Object>> list = personService.findPersonPageList(page);
        return JsonUtil.writeListToDataGrid(page.getTotalResult(), list);
    }
    
}
