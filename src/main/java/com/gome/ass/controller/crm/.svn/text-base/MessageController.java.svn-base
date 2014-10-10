package com.gome.ass.controller.crm;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gome.ass.service.crm.MessageService;
import com.gome.ass.util.XmlUtil;

/**
* @ClassName: MessageController
* @Description: 其他系统消息数据推送统一接口
* @author  liuchao43
* @date 2014年9月19日 上午9:54:17
*
*/
@Controller
@RequestMapping("/message")
public class MessageController {
	private static Logger log = LoggerFactory.getLogger(MessageController.class);
	
	@Resource
	private MessageService messageService;
	
	@RequestMapping(value="/processCrmMessage" ,produces = "text/plain;charset=utf-8")
	public void processCrmMessage(HttpServletRequest request, HttpServletResponse response) throws Exception{
        try {
            request.setCharacterEncoding("utf-8");
            this.messageService.processCrmMessage( XmlUtil.getInstance().getDocument(request.getInputStream()));
        } catch (Exception e) {
        	e.printStackTrace();
        	log.error(e.getMessage(),e);
        }
	}
	
	@RequestMapping(value="/processJLMessage" ,produces = "text/plain;charset=utf-8")
	public  void processJLMessage(HttpServletRequest request, HttpServletResponse response) throws Exception{
        try {
           request.setCharacterEncoding("utf-8");
           this.messageService.processJLMessage( XmlUtil.getInstance().getDocument(request.getInputStream()));
        } catch (Exception e) {
        	e.printStackTrace();
        	log.error(e.getMessage(),e);
        }
	}
}
