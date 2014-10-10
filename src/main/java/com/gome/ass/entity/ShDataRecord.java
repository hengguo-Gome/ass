package com.gome.ass.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 与第三方系统通信数据记录
 * @author Zhang.Mingji
 * @date 2014年8月27日上午11:20:14
 * @Copyright(c) gome inc Gome Co.,LTD
 */
public class ShDataRecord implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2958092980608489178L;

	private String id;

    private String interfaceType;

    private Date createTime;

    private String direction;

    private String resultContent = "1";

    private String sender;

    private String receiver;

    private String messageId;

    private Date dateSend;

    private String xmlContent;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getInterfaceType() {
        return interfaceType;
    }

    public void setInterfaceType(String interfaceType) {
        this.interfaceType = interfaceType == null ? null : interfaceType.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction == null ? null : direction.trim();
    }

    public String getResultContent() {
        return resultContent;
    }

    public void setResultContent(String resultContent) {
        this.resultContent = resultContent == null ? null : resultContent.trim();
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender == null ? null : sender.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId == null ? null : messageId.trim();
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public String getXmlContent() {
        return xmlContent;
    }

    public void setXmlContent(String xmlContent) {
        this.xmlContent = xmlContent == null ? null : xmlContent.trim();
    }
}