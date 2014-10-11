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

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
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
import com.gome.ass.util.BeanTool;
import com.gome.ass.util.UUIDUtil;
import com.gome.ass.util.XmlUtil;
import com.gome.common.util.AsynchronousSendMsgUtils;

@Service("jlOrderService")
public class JlOrderServiceImpl implements JlOrderService{
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
            if(result.get("RESULT") != null && result.get("RESULT").equals("1")){
                this.crmInstallBillService.updateApointDate(map);
                
                //将安装单信息发送给mq
    			String jlOrderNum = (String)map.get("azd01");
    			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
                AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
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
            js.put("RESULT", "1");
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
            System.out.println(new JlOrderServiceImpl().parseOrderDelayXml(""));
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	@Override
	public void  appComplete(Map<String, Object> map)  {
		try{
			String jlOrderNum = (String)map.get("jlOrderNum");
			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
			if("E0014".equals(crmInstallBill.getBillStatus())){
				throw new RuntimeException("该单已回执！");
			}
			//TODO根据金力单号查询，修改状相关信息，保存
			crmInstallBill.setBillStatus("E0014");
			crmInstallBill.setReceiptCode( (String)map.get("receiptCode"));
			
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
					BeanTool.map2Bean((Map)service, crmService);
					crmService.setInstallBillId(jlOrderNum);
					crmService.setId(UUIDUtil.getUUID());
					crmServices.add(crmService);
				}
				//this.crmInstallBillService.delServiceByJlorderCode(jlOrderNum);
				//this.crmInstallBillService.insertServiceBatch(crmServices);
			}
			List accessorieses = (List)map.get("accessorieses");
			List<CrmAccessories> crmAccessorieses = new ArrayList<CrmAccessories>();
			if(accessorieses!=null&&accessorieses.size()!=0){
				for(Object accessories : accessorieses){
					CrmAccessories crmAccessories = new CrmAccessories();
					BeanTool.map2Bean((Map)accessories, crmAccessories);
					crmAccessories.setInstallBillId(jlOrderNum);
					crmAccessories.setId(UUIDUtil.getUUID());
					crmAccessorieses.add(crmAccessories);
				}
//				this.crmInstallBillService.delAccessoriesByJlorderCode(jlOrderNum);
//				this.crmInstallBillService.insertAccessoriesBatch(crmAccessorieses);
			}
			
			Map param = new HashMap();
			param.put("crmInstallBill", crmInstallBill);
			param.put("services", crmServices);
			param.put("accessorieses", accessorieses);
			String gomeOrderAddr = crmInstallBill.getGomeOrderAddr();//接单网店代码
			//网点代码以3开头为第三方网点，回执到金力系统
			if(gomeOrderAddr.startsWith("3")){
				AsynchronousSendMsgUtils.receiptJLCompleteLegMessage(param);
			}else{//网点代码其他以字母开头为自建网点，回执到crm
				AsynchronousSendMsgUtils.receiptCrmCompleteLegMessage(param);
			}
			//将安装单信息发送到mq
			AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
			
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public void appConcel(Map<String, Object> map) {
		try{
			String jlOrderNum = (String)map.get("jlOrderNum");
			CrmInstallBill crmInstallBill = this.crmInstallBillService.queryCrmInstallBillByJlOrderNum(jlOrderNum);
			if("E0021".equals(crmInstallBill.getBillStatus())){
				throw new RuntimeException("该单已取消！");
			}
			crmInstallBill.setBillStatus("E0021");
			Map param = new HashMap();
			param.put("crmInstallBill", crmInstallBill);
			String gomeOrderAddr = crmInstallBill.getGomeOrderAddr();//接单网店代码
			//网点代码以3开头为第三方网点，回执到金力系统
			if(gomeOrderAddr.startsWith("3")){
				AsynchronousSendMsgUtils.receiptJLConcelLegMessage(param);
			}else{//网点代码其他以字母开头为自建网点，回执到crm
				AsynchronousSendMsgUtils.receiptCrmConcelLegMessage(param);
			}
			//将安装单信息发送到mq
			AsynchronousSendMsgUtils.sendInstallBillToMq(crmInstallBill, BusinessGlossary.SYSTEM_NAME_APP);
			
		}catch(Exception e){
			throw new RuntimeException(e);
		}
		
	}

}
