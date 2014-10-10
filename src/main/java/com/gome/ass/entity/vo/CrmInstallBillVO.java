package com.gome.ass.entity.vo;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.gome.ass.entity.CrmInstallBill;
import com.gome.ass.util.DateUtils;

public class CrmInstallBillVO {

    //============ 匹配 修改预约时间接口
    private String appointDate;// 预约时间, 只取推送过来日期的yyyy-MM-dd

    private String appointStartDate;// 预约开始时间

    private String appointEndDate;// 预约结束时间

    private String clientAddr;// 联系地址

    private String clientName;// 客户名称

    private String clientPhone;// 联系电话

    private String clientOtherContact;// 手机号码
    
    private String goodsStatusDate;//货物状态时间

    private String installType;// 安装类型

    private Date purchaseDate;// 购货日期

    private String jlOrderNum;// 单号
    private String billType; // 单据类型（1：安装单 2：维修单）
    
    //============匹配安装工
    private String goodCode;
    private String goodName;
    private String gomeOrderAddr;
    private String salesOrgShort;
    private String poNumberSold;
    private String salesOrgCode;
    private String billStatus;
    private Date senderDate;
    private String remark;
    private String orderWorkerBig;
    private String orderWorkerLitter;
    
    /**
     * 获取appointDate
     * @return appointDate
     */
    public String getAppointDate() {
        return appointDate;
    }
    /**
     * 设置appointDate
     * @param appointDate appointDate
     */
    public void setAppointDate(String appointDate) {
        this.appointDate = appointDate;
    }
    /**
     * 获取appointStartDate
     * @return appointStartDate
     */
    public String getAppointStartDate() {
        return appointStartDate;
    }
    /**
     * 设置appointStartDate
     * @param appointStartDate appointStartDate
     */
    public void setAppointStartDate(String appointStartDate) {
        this.appointStartDate = appointStartDate;
    }
    /**
     * 获取appointEndDate
     * @return appointEndDate
     */
    public String getAppointEndDate() {
        return appointEndDate;
    }
    /**
     * 设置appointEndDate
     * @param appointEndDate appointEndDate
     */
    public void setAppointEndDate(String appointEndDate) {
        this.appointEndDate = appointEndDate;
    }
    /**
     * 获取clientAddr
     * @return clientAddr
     */
    public String getClientAddr() {
        return clientAddr;
    }
    /**
     * 设置clientAddr
     * @param clientAddr clientAddr
     */
    public void setClientAddr(String clientAddr) {
        this.clientAddr = clientAddr;
    }
    /**
     * 获取goodsStatusDate
     * @return goodsStatusDate
     */
    public String getGoodsStatusDate() {
        return goodsStatusDate;
    }
    /**
     * 设置goodsStatusDate
     * @param goodsStatusDate goodsStatusDate
     */
    public void setGoodsStatusDate(String goodsStatusDate) {
        this.goodsStatusDate = goodsStatusDate;
    }
    /**
     * 获取clientName
     * @return clientName
     */
    public String getClientName() {
        return clientName;
    }
    /**
     * 设置clientName
     * @param clientName clientName
     */
    public void setClientName(String clientName) {
        this.clientName = clientName;
    }
    /**
     * 获取clientPhone
     * @return clientPhone
     */
    public String getClientPhone() {
        return clientPhone;
    }
    /**
     * 设置clientPhone
     * @param clientPhone clientPhone
     */
    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }
    /**
     * 获取clientOtherContact
     * @return clientOtherContact
     */
    public String getClientOtherContact() {
        return clientOtherContact;
    }
    /**
     * 设置clientOtherContact
     * @param clientOtherContact clientOtherContact
     */
    public void setClientOtherContact(String clientOtherContact) {
        this.clientOtherContact = clientOtherContact;
    }
    /**
     * 获取installType
     * @return installType
     */
    public String getInstallType() {
        return installType;
    }
    /**
     * 设置installType
     * @param installType installType
     */
    public void setInstallType(String installType) {
        this.installType = installType;
    }
    /**
     * 获取purchaseDate
     * @return purchaseDate
     */
    public Date getPurchaseDate() {
        return purchaseDate;
    }
    /**
     * 设置purchaseDate
     * @param purchaseDate purchaseDate
     */
    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    /**
     * 获取jlOrderNum
     * @return jlOrderNum
     */
    public String getJlOrderNum() {
        return jlOrderNum;
    }
    /**
     * 设置jlOrderNum
     * @param jlOrderNum jlOrderNum
     */
    public void setJlOrderNum(String jlOrderNum) {
        this.jlOrderNum = jlOrderNum;
    }

    
    /**
     * 获取billType
     * @return billType
     */
    public String getBillType() {
        return billType;
    }
    /**
     * 设置billType
     * @param billType billType
     */
    public void setBillType(String billType) {
        this.billType = billType;
    }
    /**
     * 获取goodCode
     * @return goodCode
     */
    public String getGoodCode() {
        return goodCode;
    }
    /**
     * 设置goodCode
     * @param goodCode goodCode
     */
    public void setGoodCode(String goodCode) {
        this.goodCode = goodCode;
    }
    /**
     * 获取goodName
     * @return goodName
     */
    public String getGoodName() {
        return goodName;
    }
    /**
     * 设置goodName
     * @param goodName goodName
     */
    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
    /**
     * 获取gomeOrderAddr
     * @return gomeOrderAddr
     */
    public String getGomeOrderAddr() {
        return gomeOrderAddr;
    }
    /**
     * 设置gomeOrderAddr
     * @param gomeOrderAddr gomeOrderAddr
     */
    public void setGomeOrderAddr(String gomeOrderAddr) {
        this.gomeOrderAddr = gomeOrderAddr;
    }
    /**
     * 获取salesOrgShort
     * @return salesOrgShort
     */
    public String getSalesOrgShort() {
        return salesOrgShort;
    }
    /**
     * 设置salesOrgShort
     * @param salesOrgShort salesOrgShort
     */
    public void setSalesOrgShort(String salesOrgShort) {
        this.salesOrgShort = salesOrgShort;
    }
    /**
     * 获取poNumberSold
     * @return poNumberSold
     */
    public String getPoNumberSold() {
        return poNumberSold;
    }
    /**
     * 设置poNumberSold
     * @param poNumberSold poNumberSold
     */
    public void setPoNumberSold(String poNumberSold) {
        this.poNumberSold = poNumberSold;
    }
    /**
     * 获取salesOrgCode
     * @return salesOrgCode
     */
    public String getSalesOrgCode() {
        return salesOrgCode;
    }
    /**
     * 设置salesOrgCode
     * @param salesOrgCode salesOrgCode
     */
    public void setSalesOrgCode(String salesOrgCode) {
        this.salesOrgCode = salesOrgCode;
    }
    /**
     * 获取billStatus
     * @return billStatus
     */
    public String getBillStatus() {
        return billStatus;
    }
    /**
     * 设置billStatus
     * @param billStatus billStatus
     */
    public void setBillStatus(String billStatus) {
        this.billStatus = billStatus;
    }
    /**
     * 获取senderDate
     * @return senderDate
     */
    public Date getSenderDate() {
        return senderDate;
    }
    /**
     * 设置senderDate
     * @param senderDate senderDate
     */
    public void setSenderDate(Date senderDate) {
        this.senderDate = senderDate;
    }
    /**
     * 获取remark
     * @return remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * 设置remark
     * @param remark remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    /**
     * 获取orderWorkerBig
     * @return orderWorkerBig
     */
    public String getOrderWorkerBig() {
        return orderWorkerBig;
    }
    /**
     * 设置orderWorkerBig
     * @param orderWorkerBig orderWorkerBig
     */
    public void setOrderWorkerBig(String orderWorkerBig) {
        this.orderWorkerBig = orderWorkerBig;
    }
    /**
     * 获取orderWorkerLitter
     * @return orderWorkerLitter
     */
    public String getOrderWorkerLitter() {
        return orderWorkerLitter;
    }
    /**
     * 设置orderWorkerLitter
     * @param orderWorkerLitter orderWorkerLitter
     */
    public void setOrderWorkerLitter(String orderWorkerLitter) {
        this.orderWorkerLitter = orderWorkerLitter;
    }
    /**
     * 顾客资料、预约时间修改传售后APP VO到PO的转换
     */
    public static CrmInstallBill voToPoMapping(CrmInstallBillVO vo) throws ParseException{
        CrmInstallBill po = new CrmInstallBill();
        //yyyy-MM-dd HH:mm:ss
        Date inDate = DateUtils.toDate(vo.getAppointDate(), DateUtils.LONG_DATE_FORMAT);
        po.setAppointDate(inDate);
        String day = DateUtils.formatDateTime(inDate, DateUtils.LONG_DATE_FORMAT);
        String yysj_s = vo.getAppointStartDate();
        String yysj_e = vo.getAppointEndDate();
        if(!StringUtils.isBlank(yysj_s) && !StringUtils.isBlank(yysj_e)) {
            Date appointStartDate = DateUtils.toDate(day +" " + yysj_s.trim() + ":00:00");
            Date appointEndDate = DateUtils.toDate(day + " " + yysj_e.trim() + ":00:00");
            po.setAppointStartDate(appointStartDate);
            po.setAppointEndDate(appointEndDate);
        }
        po.setClientAddr(vo.getClientAddr());
        po.setClientName(vo.getClientName());
        po.setClientOtherContact(vo.getClientOtherContact());
        po.setClientPhone(vo.getClientPhone());
        po.setGoodsStatusDate(vo.getGoodsStatusDate());
        po.setInstallType(vo.getInstallType());
        po.setJlOrderNum(vo.getJlOrderNum());
        po.setPurchaseDate(vo.getPurchaseDate());
        
        return po;
    }
    
    /**
     * 同步安装工人(订单)数据接口
     * @param crmInstallBill
     * @return
     */
    public static CrmInstallBill convertJLInstallBill(CrmInstallBillVO vo) {
        
        CrmInstallBill po = new CrmInstallBill();
        String startEndDateHour = vo.getAppointStartDate();
        String start = startEndDateHour.split("-")[0];
        String end = startEndDateHour.split("-")[1];
        //yyyy-MM-dd HH:mm:ss
        Date inDate = DateUtils.toDate(vo.getAppointDate(), DateUtils.LONG_DATE_FORMAT);
        po.setAppointDate(inDate);
        String day = DateUtils.formatDateTime(inDate, DateUtils.LONG_DATE_FORMAT);
        po.setAppointDate(DateUtils.toDate(day, DateUtils.LONG_DATE_FORMAT));
        Date appointStartDate = DateUtils.toDate(day + " " + start + ":00:00");
        Date appointEndDate = DateUtils.toDate(day + " " + end + ":00:00");
        po.setAppointStartDate(appointStartDate);
        po.setAppointEndDate(appointEndDate);
        
        po.setJlOrderNum(vo.getJlOrderNum());
        po.setClientAddr(vo.getClientAddr());
        po.setClientName(vo.getClientName());
        po.setClientOtherContact(vo.getClientOtherContact());
        po.setClientPhone(vo.getClientPhone());
        po.setGoodCode(vo.getGoodCode());
        po.setGoodName(vo.getGoodName());
        po.setGomeOrderAddr(vo.getGomeOrderAddr());
        po.setSalesOrgShort(vo.getSalesOrgShort());
        po.setPoNumberSold(vo.getPoNumberSold());
        po.setSalesOrgCode(vo.getSalesOrgCode());
        
        if("1".equals(vo.getBillStatus())){
            po.setBillStatus("E0014");
        }
        po.setSenderDate(vo.getSenderDate());
        po.setRemark(vo.getRemark());
        return po;
    }
    
}