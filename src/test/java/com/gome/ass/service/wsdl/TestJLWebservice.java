package com.gome.ass.service.wsdl;

import java.util.HashMap;
import java.util.Map;

import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gome.ass.service.wsdl.service.CENJKServiceLocator;
import com.gome.ass.util.UUIDUtil;
import com.gome.ass.util.XmlUtil;
//告诉framework怎么运行这个类  
@RunWith(SpringJUnit4ClassRunner.class)   
//bean的配置文件路径，这个是Test类的classpath路径，如果是Spring推荐的目录结构，应该在：项目目录/src/test/resources/里  
@ContextConfiguration(locations = "classpath:spring-*.xml")
public class TestJLWebservice {

//    @Resource  
//    private AppTimeWindowController timeWindowController;  
//  
//    //这种方法适用于Springframework3.0，3.1换了handler的处理类。  
//    @Autowired  
//    private AnnotationMethodHandlerAdapter handlerAdapter;  
//  
//    private final MockHttpServletRequest request = new MockHttpServletRequest();  
//    private final MockHttpServletResponse response = new MockHttpServletResponse();  
    
    @Test
    public void test() throws ResourceNotFoundException, ParseErrorException, Exception {
        /**
         * 弹时间窗接口类型：AZNLCX
       */
        Map<String, String> context = new HashMap<String, String>();
        context.put("type", "AZNLCX");
        context.put("sender", "CEN");
        context.put("receiver", "DIS");
        context.put("messageId", "a5c89616-b229-4a69-9436-154e45659a78");
        context.put("azd01", "52557");
        context.put("yysj", "2014-10-13");
        System.out.println(XmlUtil.getInstance().genXmlByTemplate("jl/JL_TimeWindow.xml", context));
        
        String result = new CENJKServiceLocator().getCENJK().invokeSHService(XmlUtil.getInstance().genXmlByTemplate("jl/JL_TimeWindow.xml", context));
        System.out.println("--> "+result);
         
        /**
         * 订单延期修改预约时间接口:YYAZ
        
        Map<String, String> context = new HashMap<String, String>();
        context.put("type", "YYAZ");
        context.put("sender", "CEN");
        context.put("receiver", "DIS");
        context.put("messageId", UUIDUtil.getUUID());
        context.put("azd01", "52557");
        context.put("yysj", "2014-10-10");
        context.put("nlsd", "5");
        context.put("azwd01", "0003000125");
        context.put("yysj_s","17");
        context.put("yysj_e","19");
        System.out.println(XmlUtil.getInstance().genXmlByTemplate("jl/JL_OrderDelay.xml", context));
        
        String result = new CENJKServiceLocator().getCENJK().invokeSHService(XmlUtil.getInstance().genXmlByTemplate("jl/JL_OrderDelay.xml", context));
        System.out.println("--> "+result);
        */
        
    }
}
