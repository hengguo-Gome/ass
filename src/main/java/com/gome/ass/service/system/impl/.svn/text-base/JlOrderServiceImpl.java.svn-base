package com.gome.ass.service.system.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gome.ass.common.APPErrorInfo;
import com.gome.ass.common.BusinessGlossary;
import com.gome.ass.entity.CrmAccessories;
import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.entity.CrmService;
import com.gome.ass.service.appUser.JlOrderService;
import com.gome.ass.service.logistics.CrmInstallBillService;
import com.gome.ass.service.system.ShDataRecordService;
import com.gome.ass.service.wsdl.service.CENJKServiceLocator;
import com.gome.ass.util.BeanJsonUtils;
import com.gome.ass.util.BeanTool;
import com.gome.ass.util.UUIDUtil;
import com.gome.ass.util.XmlUtil;
import com.gome.common.util.AsynchronousSendMsgUtils;

@Service("jlOrderService")
public class JlOrderServiceImpl implements JlOrderService{
	
	private static final Logger log = LoggerFactory.getLogger(JlOrderServiceImpl.class);
    @Resource
    private ShDataRecordService shDataRecordService;
    @Resource
    private CrmInstallBillService crmInstallBillService;
    
    @Override
    public JSONObject findAvailableOrderDate(Map<String, Object> map) throws Exception {
        String inXml = prepareTimeWindowXml(map);
        
        String jlResult = new CENJKServiceLocator().getCENJK().invokeSHService(inXml);
        JSONObject result = null;
        try {
            result = this.parseTimeWindowXml((String)map.get("yysj"), jlResult);
        } catch (Exception e) {
            result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
            e.printStackTrace();
        }
        return result;
    }
    
    @Override
    public JSONObject updateOrderAppoint(Map<String, Object> map) throws Exception {
        String inXml = prepareOrderDelayXml(map);
        
        String jlResult = new CENJKServiceLocator().getCENJK().invokeSHService(inXml);
        JSONObject result = null;
        try {
            result = this.parseOrderDelayXml(jlResult);
            //更新本地安装单状态
            if(result.get("result") != null && result.get("result").equals("1")){
                this.crmInstallBillService.updateApointDate(map);
                
                //将安装单信息发送给mq
    			String jlOrderNum = (String)map.get("azd01");
    			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
    			if(null != crmInstallBill ){
    				AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
    			}
            }
        } catch (Exception e) {
            result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
            e.printStackTrace();
        }
        return result;
    }

    private String prepareTimeWindowXml(Map<String, Object> map) throws Exception {
        Map<String, String> context = new HashMap<String, String>();
        context.put("type", "AZNLCX");
        context.put("sender", "CEN");
        context.put("receiver", "DIS");
        context.put("messageId", UUIDUtil.getUUID());
        context.put("azd01", map.get("azd01").toString());
        context.put("yysj", map.get("yysj").toString());
        return XmlUtil.getInstance().genXmlByTemplate("jl/JL_TimeWindow.xml", context);
    }

    private String prepareOrderDelayXml(Map<String, Object> map) throws Exception {
        Map<String, String> context = new HashMap<String, String>();
        context.put("type", "YYAZ");
        context.put("sender", "CEN");
        context.put("receiver", "DIS");
        context.put("messageId", UUIDUtil.getUUID());
        context.put("azd01", map.get("azd01").toString());
        context.put("yysj", map.get("yysj").toString());
        context.put("nlsd", map.get("nlsd").toString());
        context.put("azwd01", map.get("azwd01").toString());
        context.put("yysj_s", map.get("yysj_s").toString());
        context.put("yysj_e", map.get("yysj_e").toString());
        return XmlUtil.getInstance().genXmlByTemplate("jl/JL_OrderDelay.xml", context);
    }


    private JSONObject parseTimeWindowXml(String yysj, String xml) throws Exception {
//        org.dom4j.io.SAXReader reader=new org.dom4j.io.SAXReader();  
//        创建一个文档对象  
//        org.dom4j.Document doc=reader.read(new File("E://1.xml"));
        Document doc = DocumentHelper.parseText(xml);
        Element jl = doc.getRootElement();
        if(jl.element("MESSAGE") != null){
            JSONObject js = new JSONObject();
            js.put("DATE", yysj);
            JSONArray details = new JSONArray();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            for (Iterator<Element> i =jl.elementIterator("MESSAGE"); i.hasNext();) {
                Element el =(Element) i.next();
                Element aznl = el.element("AZNL");
                if(aznl !=  null && Integer.valueOf(aznl.getText()) > 0){
                    JSONObject mes = new JSONObject();
                    Element startDate = el.element("SDQSSJ");
                    Element endDate = el.element("SDJZSJ");
                    Element nlsd = el.element("NLSD");
                    Element nlsdmc = el.element("NLSDMC");
                    
                    Calendar startC = Calendar.getInstance();
                    startC.setTime(df.parse(startDate.getText()));
                    
                    Calendar endC = Calendar.getInstance();
                    endC.setTime(df.parse(endDate.getText()));
                    mes.accumulate("AMPM", nlsdmc.getText());
                    mes.accumulate("NLSD", nlsd.getText());
                    mes.accumulate("START", startC.get(Calendar.HOUR_OF_DAY));
                    mes.accumulate("END", endC.get(Calendar.HOUR_OF_DAY));
                    details.add(mes);
                }else{
                    continue;
                }
            }
            js.put("DETAILS", details);
            return js;
        }else {
            JSONObject result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10011);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10011);
            return result;
        }
    }
    
    private JSONObject parseOrderDelayXml(String xml) throws Exception {
//        org.dom4j.io.SAXReader reader=new org.dom4j.io.SAXReader();  
//        //创建一个文档对象  
//        org.dom4j.Document doc=reader.read(new File("E://2.xml"));
        Document doc = DocumentHelper.parseText(xml);
        Element jl = doc.getRootElement();
        if(jl.element("MESSAGE") != null && ("1".equals(jl.element("MESSAGE").element("ISCG").getText()))){
            JSONObject js = new JSONObject();
//            String result = jl.element("MESSAGE").element("ISCG").getText();
            js.put("result", "1");
            return js;
        }else {
            JSONObject result = new JSONObject();
            result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10012);
            result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10012);
            return result;
        }
    }
    
    public static void main(String[] args) {
        try {
        	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
    		String format = sdf.format(new Date(1413777600000L));
    		System.out.println(format);
//            System.out.println(new JlOrderServiceImpl().parseOrderDelayXml(""));
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@Override
	public JSONObject appComplete(Map<String, Object> map)  {
		JSONObject result = new JSONObject();
		try{
			String jlOrderNum = (String)map.get("jlOrderNum");
			if(StringUtils.isBlank(jlOrderNum)){
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00001);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00001);
				return result;
			}
			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
			if(crmInstallBill == null){
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00002);
				return result;
			}
			String gomeOrderAddr = crmInstallBill.getGomeOrderAddr();//接单网店代码
			if(!BusinessGlossary.BILL_STATUS_DISPATCHED.equals(crmInstallBill.getBillStatus())){
				result.put(APPErrorInfo.ERRORCODE, "E");
				result.put(APPErrorInfo.ERRORMSG, "改单已操作");
				return result;
			}
			
			List accessorieses = null;
			List<CrmAccessories> crmAccessorieses = new ArrayList<CrmAccessories>();
			//TODO根据金力单号查询，修改状相关信息，保存
			if(gomeOrderAddr.startsWith("S")){
				crmInstallBill.setBillStatus(BusinessGlossary.BILL_STATUS_COMPLETE);
				if(accessorieses!=null&&accessorieses.size()!=0){
					for(Object accessories : accessorieses){
						CrmAccessories crmAccessories = new CrmAccessories();
						Map accessoriesMap = (Map)accessories;
						accessoriesMap.put("legNo", jlOrderNum);
						BeanTool.map2Bean(accessoriesMap, crmAccessories);
						crmAccessories.setInstallBillId(jlOrderNum);
						crmAccessories.setId(UUIDUtil.getUUID());
						crmAccessorieses.add(crmAccessories);
					}
//					this.crmInstallBillService.delAccessoriesByJlorderCode(jlOrderNum);
//					this.crmInstallBillService.insertAccessoriesBatch(crmAccessorieses);
				}
			}else{
				crmInstallBill.setBillStatus(BusinessGlossary.BILL_STATUS_SIGNED);
			}
			crmInstallBill.setReceiptCode( (String)map.get("receiptCode"));
			crmInstallBill.setReceiptName( (String)map.get("receiptName"));
			crmInstallBill.setInnerMachineCode((String)map.get("innerMachineCode"));
			crmInstallBill.setOuterMachineCode((String)map.get("outerMachineCode"));
			
			if(map.get("receiptDate")!=null&&!"".equals(map.get("receiptDate"))){
				crmInstallBill.setReceiptDate(new SimpleDateFormat("yyyy-mm-dd hh").parse((String)map.get("receiptDate")));
			}else{
				crmInstallBill.setReceiptDate(new Date());
			}
			
			this.crmInstallBillService.updateByPrimaryKeySelective(crmInstallBill);
			List services = (List)map.get("services");
			List<CrmService> crmServices = new ArrayList<CrmService>();
			if(services!=null&&services.size()!=0){
				for(Object service : services){
					CrmService crmService = new CrmService();
					Map serviceMap = (Map)service;
					serviceMap.put("legNo", jlOrderNum);
					BeanTool.map2Bean(serviceMap, crmService);
					crmService.setInstallBillId(jlOrderNum);
					crmService.setId(UUIDUtil.getUUID());
					crmServices.add(crmService);
				}
				//this.crmInstallBillService.delServiceByJlorderCode(jlOrderNum);
				//this.crmInstallBillService.insertServiceBatch(crmServices);
			}
			
			Map param = new HashMap();
			Map<String, Object> convertMap = BeanJsonUtils.convertMapToMap(crmInstallBill);
			String appointStartDate = (String)convertMap.get("appointStartDate");
			String appointEndDate = (String)convertMap.get("appointEndDate");
			if(StringUtils.isNotBlank(appointStartDate) && StringUtils.isNotBlank(appointEndDate)){
				String appointDatePeriod = appointStartDate.substring(8, 10)+"-"+appointEndDate.substring(8, 10);
				convertMap.put("appointDatePeriod", appointDatePeriod);
			}
			param.put("crmInstallBill", convertMap);
			param.put("crmServices", crmServices);
//			String gomeOrderAddr = crmInstallBill.getGomeOrderAddr();//接单网店代码
			//网点代码以S开头为第三方网点，回执到crm
			if(gomeOrderAddr.startsWith("S")){
				param.put("crmAccessorieses", accessorieses);
				AsynchronousSendMsgUtils.receiptCrmCompleteLegMessage(param);
			}else{//网点代码其他以字母开头为自建网点，回执到金力系统
				AsynchronousSendMsgUtils.receiptJLCompleteLegMessage(param);
			}
			//将安装单信息发送到mq
			AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
			
		}catch(Exception e){
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
			return result;
		}
		result.put("result", 0);
		return result;
	}

	@Override
	public JSONObject appConcel(Map<String, Object> map) {
		JSONObject result = new JSONObject();
		try{
			String jlOrderNum = (String)map.get("jlOrderNum");
			if(StringUtils.isBlank(jlOrderNum)){
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00001);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00001);
				return result;
			}
			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
			if(crmInstallBill == null){
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E00002);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M00002);
				return result;
			}
			String gomeOrderAddr = crmInstallBill.getGomeOrderAddr();//接单网店代码
			
			if(gomeOrderAddr.startsWith("S") && !BusinessGlossary.BILL_STATUS_COMPLETE.equals(crmInstallBill.getBillStatus())){
				result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10014);
				result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10014);
				return result;
			}else if (!BusinessGlossary.BILL_STATUS_DISPATCHED.equals(crmInstallBill.getBillStatus())){
				result.put(APPErrorInfo.ERRORCODE, "E");
				result.put(APPErrorInfo.ERRORMSG, "改单已操作");
				return result;
			}
			crmInstallBill.setBillStatus(BusinessGlossary.BILL_STATUS_CANCEL);
			Map param = new HashMap();
			Map<String, Object> convertMap = BeanJsonUtils.convertMapToMap(crmInstallBill);
			String appointStartDate = (String)convertMap.get("appointStartDate");
			String appointEndDate = (String)convertMap.get("appointEndDate");
			if(StringUtils.isNotBlank(appointStartDate) && StringUtils.isNotBlank(appointEndDate)){
				String appointDatePeriod = appointStartDate.substring(8, 10)+"-"+appointEndDate.substring(8, 10);
				convertMap.put("appointDatePeriod", appointDatePeriod);
			}
			param.put("crmInstallBill", convertMap);
			//网点代码以S开头为第三方网点，回执到crm
			if(gomeOrderAddr.startsWith("S")){
				AsynchronousSendMsgUtils.receiptCrmCompleteLegMessage(param);
			}else{//网点代码其他以字母开头为自建网点，回执到金力系统
				AsynchronousSendMsgUtils.receiptJLCompleteLegMessage(param);
			}
			//将安装单信息发送到mq
			AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
			
		}catch(Exception e){
			log.error(e.getMessage(),e);
			result.put(APPErrorInfo.ERRORCODE, APPErrorInfo.E10000);
			result.put(APPErrorInfo.ERRORMSG, APPErrorInfo.M10000);
			return result;
		}
		result.put("result", 0);
		return result;
		
	}

}
