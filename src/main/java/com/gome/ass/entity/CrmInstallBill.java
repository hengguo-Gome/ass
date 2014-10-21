package com.gome.ass.entity;

import java.io.Serializable;
import java.util.Date;

public class CrmInstallBill implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -7722963762964110880L;

	
	private Double longitude;
	private Double latitude;
	private Integer planFinishSuquence;
	
	
	public Integer getPlanFinishSuquence() {
		return planFinishSuquence;
	}

	public void setPlanFinishSuquence(Integer planFinishSuquence) {
		this.planFinishSuquence = planFinishSuquence;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.bill_id
     *
     * @mbggenerated
     */
    private String billId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.sales_org_short
     *
     * @mbggenerated
     */
    private String salesOrgShort;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.business_type
     *
     * @mbggenerated
     */
    private String businessType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.po_number_sold
     *
     * @mbggenerated
     */
    private String poNumberSold;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.bill_status
     *
     * @mbggenerated
     */
    private String billStatus;
    
    private String billType;
    
    private String appointDatePeriod;

	public void setAppointDatePeriod(String appointDatePeriod) {
		if(this.appointDate!=null){
			String[] ss = appointDatePeriod.split("-");
			Date startDate =  (Date)this.appointDate.clone();
			startDate.setHours(Integer.parseInt(ss[0]));
			this.appointStartDate = startDate;
			Date endDate =  (Date)this.appointDate.clone();
			endDate.setHours(Integer.parseInt(ss[1]));
			this.appointEndDate = endDate;
		}
	}
	
	public String getAppointDatePeriod() {
		return appointDatePeriod;
	}

	public String getBillType() {
		return billType;
	}

	public void setBillType(String billType) {
		this.billType = billType;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.appoint_date
     *
     * @mbggenerated
     */
    private Date appointDate;
    
    private Date appointStartDate;
    private Date appointEndDate;


    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.client_addr
     *
     * @mbggenerated
     */
    private String clientAddr;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.client_name
     *
     * @mbggenerated
     */
    private String clientName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.client_phone
     *
     * @mbggenerated
     */
    private String clientPhone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.client_other_contact
     *
     * @mbggenerated
     */
    private String clientOtherContact;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.goods_status_date
     *
     * @mbggenerated
     */
    private String goodsStatusDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.gome_order_addr
     *
     * @mbggenerated
     */
    private String gomeOrderAddr;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.gome_exec_website
     *
     * @mbggenerated
     */
    private String gomeExecWebsite;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.order_worker_big
     *
     * @mbggenerated
     */
    private String orderWorkerBig;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.order_worker_litter
     *
     * @mbggenerated
     */
    private String orderWorkerLitter;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.good_code
     *
     * @mbggenerated
     */
    private String goodCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.good_name
     *
     * @mbggenerated
     */
    private String goodName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.receipt_code
     *
     * @mbggenerated
     */
    private String receiptCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.receipt_name
     *
     * @mbggenerated
     */
    private String receiptName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.receipt_date
     *
     * @mbggenerated
     */
    private Date receiptDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.sender_name
     *
     * @mbggenerated
     */
    private String senderName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.sender_date
     *
     * @mbggenerated
     */
    private Date senderDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.remark
     *
     * @mbggenerated
     */
    private String remark;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.install_type
     *
     * @mbggenerated
     */
    private String installType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.attachment
     *
     * @mbggenerated
     */
    private String attachment;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.purchase_date
     *
     * @mbggenerated
     */
    private Date purchaseDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.finish_status
     *
     * @mbggenerated
     */
    private String finishStatus;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.extend_po_num
     *
     * @mbggenerated
     */
    private String extendPoNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.invoice_num
     *
     * @mbggenerated
     */
    private String invoiceNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.info_source
     *
     * @mbggenerated
     */
    private String infoSource;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.sap_order_num
     *
     * @mbggenerated
     */
    private String sapOrderNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.jl_order_num
     *
     * @mbggenerated
     */
    private String jlOrderNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.sales_org_code
     *
     * @mbggenerated
     */
    private String salesOrgCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.install_card_code
     *
     * @mbggenerated
     */
    private String installCardCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.outer_machine_code
     *
     * @mbggenerated
     */
    private String outerMachineCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column crm_install_bill.inner_machine_code
     *
     * @mbggenerated
     */
    private String innerMachineCode;
    
    
    private String installationType;
    
    public String getInstallationType() {
		return installationType;
	}

	public void setInstallationType(String installationType) {
		this.installationType = installationType;
	}

	private String isFinish;
    
    
    public String getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.bill_id
     *
     * @return the value of crm_install_bill.bill_id
     *
     * @mbggenerated
     */
    public String getBillId() {
        return billId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.bill_id
     *
     * @param billId the value for crm_install_bill.bill_id
     *
     * @mbggenerated
     */
    public void setBillId(String billId) {
        this.billId = billId == null ? null : billId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.sales_org_short
     *
     * @return the value of crm_install_bill.sales_org_short
     *
     * @mbggenerated
     */
    public String getSalesOrgShort() {
        return salesOrgShort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.sales_org_short
     *
     * @param salesOrgShort the value for crm_install_bill.sales_org_short
     *
     * @mbggenerated
     */
    public void setSalesOrgShort(String salesOrgShort) {
        this.salesOrgShort = salesOrgShort == null ? null : salesOrgShort.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.business_type
     *
     * @return the value of crm_install_bill.business_type
     *
     * @mbggenerated
     */
    public String getBusinessType() {
        return businessType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.business_type
     *
     * @param businessType the value for crm_install_bill.business_type
     *
     * @mbggenerated
     */
    public void setBusinessType(String businessType) {
        this.businessType = businessType == null ? null : businessType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.po_number_sold
     *
     * @return the value of crm_install_bill.po_number_sold
     *
     * @mbggenerated
     */
    public String getPoNumberSold() {
        return poNumberSold;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.po_number_sold
     *
     * @param poNumberSold the value for crm_install_bill.po_number_sold
     *
     * @mbggenerated
     */
    public void setPoNumberSold(String poNumberSold) {
        this.poNumberSold = poNumberSold == null ? null : poNumberSold.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.bill_status
     *
     * @return the value of crm_install_bill.bill_status
     *
     * @mbggenerated
     */
    public String getBillStatus() {
        return billStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.bill_status
     *
     * @param billStatus the value for crm_install_bill.bill_status
     *
     * @mbggenerated
     */
    public void setBillStatus(String billStatus) {
    	if("2".equals(billStatus.trim())){
    		billStatus = "E0010";
    	}else if("4".equals(billStatus.trim())){
    		billStatus = "E0014";
    	}
        this.billStatus = billStatus == null ? null : billStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.appoint_date
     *
     * @return the value of crm_install_bill.appoint_date
     *
     * @mbggenerated
     */
    public Date getAppointDate() {
        return appointDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.appoint_date
     *
     * @param appointDate the value for crm_install_bill.appoint_date
     *
     * @mbggenerated
     */
    public void setAppointDate(Date appointDate) {
        this.appointDate = appointDate;
    }
    

    /**
     * 获取appointStartDate
     * @return appointStartDate
     */
    public Date getAppointStartDate() {
        return appointStartDate;
    }

    /**
     * 设置appointStartDate
     * @param appointStartDate appointStartDate
     */
    public void setAppointStartDate(Date appointStartDate) {
        this.appointStartDate = appointStartDate;
    }

    /**
     * 获取appointEndDate
     * @return appointEndDate
     */
    public Date getAppointEndDate() {
        return appointEndDate;
    }

    /**
     * 设置appointEndDate
     * @param appointEndDate appointEndDate
     */
    public void setAppointEndDate(Date appointEndDate) {
        this.appointEndDate = appointEndDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.client_addr
     *
     * @return the value of crm_install_bill.client_addr
     *
     * @mbggenerated
     */
    public String getClientAddr() {
        return clientAddr;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.client_addr
     *
     * @param clientAddr the value for crm_install_bill.client_addr
     *
     * @mbggenerated
     */
    public void setClientAddr(String clientAddr) {
        this.clientAddr = clientAddr == null ? null : clientAddr.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.client_name
     *
     * @return the value of crm_install_bill.client_name
     *
     * @mbggenerated
     */
    public String getClientName() {
        return clientName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.client_name
     *
     * @param clientName the value for crm_install_bill.client_name
     *
     * @mbggenerated
     */
    public void setClientName(String clientName) {
        this.clientName = clientName == null ? null : clientName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.client_phone
     *
     * @return the value of crm_install_bill.client_phone
     *
     * @mbggenerated
     */
    public String getClientPhone() {
        return clientPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.client_phone
     *
     * @param clientPhone the value for crm_install_bill.client_phone
     *
     * @mbggenerated
     */
    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone == null ? null : clientPhone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.client_other_contact
     *
     * @return the value of crm_install_bill.client_other_contact
     *
     * @mbggenerated
     */
    public String getClientOtherContact() {
        return clientOtherContact;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.client_other_contact
     *
     * @param clientOtherContact the value for crm_install_bill.client_other_contact
     *
     * @mbggenerated
     */
    public void setClientOtherContact(String clientOtherContact) {
        this.clientOtherContact = clientOtherContact == null ? null : clientOtherContact.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.goods_status_date
     *
     * @return the value of crm_install_bill.goods_status_date
     *
     * @mbggenerated
     */
    public String getGoodsStatusDate() {
        return goodsStatusDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.goods_status_date
     *
     * @param goodsStatusDate the value for crm_install_bill.goods_status_date
     *
     * @mbggenerated
     */
    public void setGoodsStatusDate(String goodsStatusDate) {
        this.goodsStatusDate = goodsStatusDate == null ? null : goodsStatusDate.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.gome_order_addr
     *
     * @return the value of crm_install_bill.gome_order_addr
     *
     * @mbggenerated
     */
    public String getGomeOrderAddr() {
        return gomeOrderAddr;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.gome_order_addr
     *
     * @param gomeOrderAddr the value for crm_install_bill.gome_order_addr
     *
     * @mbggenerated
     */
    public void setGomeOrderAddr(String gomeOrderAddr) {
        this.gomeOrderAddr = gomeOrderAddr == null ? null : gomeOrderAddr.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.gome_exec_website
     *
     * @return the value of crm_install_bill.gome_exec_website
     *
     * @mbggenerated
     */
    public String getGomeExecWebsite() {
        return gomeExecWebsite;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.gome_exec_website
     *
     * @param gomeExecWebsite the value for crm_install_bill.gome_exec_website
     *
     * @mbggenerated
     */
    public void setGomeExecWebsite(String gomeExecWebsite) {
        this.gomeExecWebsite = gomeExecWebsite == null ? null : gomeExecWebsite.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.order_worker_big
     *
     * @return the value of crm_install_bill.order_worker_big
     *
     * @mbggenerated
     */
    public String getOrderWorkerBig() {
        return orderWorkerBig;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.order_worker_big
     *
     * @param orderWorkerBig the value for crm_install_bill.order_worker_big
     *
     * @mbggenerated
     */
    public void setOrderWorkerBig(String orderWorkerBig) {
        this.orderWorkerBig = orderWorkerBig == null ? null : orderWorkerBig.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.order_worker_litter
     *
     * @return the value of crm_install_bill.order_worker_litter
     *
     * @mbggenerated
     */
    public String getOrderWorkerLitter() {
        return orderWorkerLitter;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.order_worker_litter
     *
     * @param orderWorkerLitter the value for crm_install_bill.order_worker_litter
     *
     * @mbggenerated
     */
    public void setOrderWorkerLitter(String orderWorkerLitter) {
        this.orderWorkerLitter = orderWorkerLitter == null ? null : orderWorkerLitter.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.good_code
     *
     * @return the value of crm_install_bill.good_code
     *
     * @mbggenerated
     */
    public String getGoodCode() {
        return goodCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.good_code
     *
     * @param goodCode the value for crm_install_bill.good_code
     *
     * @mbggenerated
     */
    public void setGoodCode(String goodCode) {
        this.goodCode = goodCode == null ? null : goodCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.good_name
     *
     * @return the value of crm_install_bill.good_name
     *
     * @mbggenerated
     */
    public String getGoodName() {
        return goodName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.good_name
     *
     * @param goodName the value for crm_install_bill.good_name
     *
     * @mbggenerated
     */
    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.receipt_code
     *
     * @return the value of crm_install_bill.receipt_code
     *
     * @mbggenerated
     */
    public String getReceiptCode() {
        return receiptCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.receipt_code
     *
     * @param receiptCode the value for crm_install_bill.receipt_code
     *
     * @mbggenerated
     */
    public void setReceiptCode(String receiptCode) {
        this.receiptCode = receiptCode == null ? null : receiptCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.receipt_name
     *
     * @return the value of crm_install_bill.receipt_name
     *
     * @mbggenerated
     */
    public String getReceiptName() {
        return receiptName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.receipt_name
     *
     * @param receiptName the value for crm_install_bill.receipt_name
     *
     * @mbggenerated
     */
    public void setReceiptName(String receiptName) {
        this.receiptName = receiptName == null ? null : receiptName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.receipt_date
     *
     * @return the value of crm_install_bill.receipt_date
     *
     * @mbggenerated
     */
    public Date getReceiptDate() {
        return receiptDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.receipt_date
     *
     * @param receiptDate the value for crm_install_bill.receipt_date
     *
     * @mbggenerated
     */
    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.sender_name
     *
     * @return the value of crm_install_bill.sender_name
     *
     * @mbggenerated
     */
    public String getSenderName() {
        return senderName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.sender_name
     *
     * @param senderName the value for crm_install_bill.sender_name
     *
     * @mbggenerated
     */
    public void setSenderName(String senderName) {
        this.senderName = senderName == null ? null : senderName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.sender_date
     *
     * @return the value of crm_install_bill.sender_date
     *
     * @mbggenerated
     */
    public Date getSenderDate() {
        return senderDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.sender_date
     *
     * @param senderDate the value for crm_install_bill.sender_date
     *
     * @mbggenerated
     */
    public void setSenderDate(Date senderDate) {
        this.senderDate = senderDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.remark
     *
     * @return the value of crm_install_bill.remark
     *
     * @mbggenerated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.remark
     *
     * @param remark the value for crm_install_bill.remark
     *
     * @mbggenerated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.install_type
     *
     * @return the value of crm_install_bill.install_type
     *
     * @mbggenerated
     */
    public String getInstallType() {
        return installType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.install_type
     *
     * @param installType the value for crm_install_bill.install_type
     *
     * @mbggenerated
     */
    public void setInstallType(String installType) {
        this.installType = installType == null ? null : installType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.attachment
     *
     * @return the value of crm_install_bill.attachment
     *
     * @mbggenerated
     */
    public String getAttachment() {
        return attachment;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.attachment
     *
     * @param attachment the value for crm_install_bill.attachment
     *
     * @mbggenerated
     */
    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.purchase_date
     *
     * @return the value of crm_install_bill.purchase_date
     *
     * @mbggenerated
     */
    public Date getPurchaseDate() {
        return purchaseDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.purchase_date
     *
     * @param purchaseDate the value for crm_install_bill.purchase_date
     *
     * @mbggenerated
     */
    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.finish_status
     *
     * @return the value of crm_install_bill.finish_status
     *
     * @mbggenerated
     */
    public String getFinishStatus() {
        return finishStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.finish_status
     *
     * @param finishStatus the value for crm_install_bill.finish_status
     *
     * @mbggenerated
     */
    public void setFinishStatus(String finishStatus) {
        this.finishStatus = finishStatus == null ? null : finishStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.extend_po_num
     *
     * @return the value of crm_install_bill.extend_po_num
     *
     * @mbggenerated
     */
    public String getExtendPoNum() {
        return extendPoNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.extend_po_num
     *
     * @param extendPoNum the value for crm_install_bill.extend_po_num
     *
     * @mbggenerated
     */
    public void setExtendPoNum(String extendPoNum) {
        this.extendPoNum = extendPoNum == null ? null : extendPoNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.invoice_num
     *
     * @return the value of crm_install_bill.invoice_num
     *
     * @mbggenerated
     */
    public String getInvoiceNum() {
        return invoiceNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.invoice_num
     *
     * @param invoiceNum the value for crm_install_bill.invoice_num
     *
     * @mbggenerated
     */
    public void setInvoiceNum(String invoiceNum) {
        this.invoiceNum = invoiceNum == null ? null : invoiceNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.info_source
     *
     * @return the value of crm_install_bill.info_source
     *
     * @mbggenerated
     */
    public String getInfoSource() {
        return infoSource;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.info_source
     *
     * @param infoSource the value for crm_install_bill.info_source
     *
     * @mbggenerated
     */
    public void setInfoSource(String infoSource) {
        this.infoSource = infoSource == null ? null : infoSource.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.sap_order_num
     *
     * @return the value of crm_install_bill.sap_order_num
     *
     * @mbggenerated
     */
    public String getSapOrderNum() {
        return sapOrderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.sap_order_num
     *
     * @param sapOrderNum the value for crm_install_bill.sap_order_num
     *
     * @mbggenerated
     */
    public void setSapOrderNum(String sapOrderNum) {
        this.sapOrderNum = sapOrderNum == null ? null : sapOrderNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.jl_order_num
     *
     * @return the value of crm_install_bill.jl_order_num
     *
     * @mbggenerated
     */
    public String getJlOrderNum() {
        return jlOrderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.jl_order_num
     *
     * @param jlOrderNum the value for crm_install_bill.jl_order_num
     *
     * @mbggenerated
     */
    public void setJlOrderNum(String jlOrderNum) {
        this.jlOrderNum = jlOrderNum == null ? null : jlOrderNum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.sales_org_code
     *
     * @return the value of crm_install_bill.sales_org_code
     *
     * @mbggenerated
     */
    public String getSalesOrgCode() {
        return salesOrgCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.sales_org_code
     *
     * @param salesOrgCode the value for crm_install_bill.sales_org_code
     *
     * @mbggenerated
     */
    public void setSalesOrgCode(String salesOrgCode) {
        this.salesOrgCode = salesOrgCode == null ? null : salesOrgCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.install_card_code
     *
     * @return the value of crm_install_bill.install_card_code
     *
     * @mbggenerated
     */
    public String getInstallCardCode() {
        return installCardCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.install_card_code
     *
     * @param installCardCode the value for crm_install_bill.install_card_code
     *
     * @mbggenerated
     */
    public void setInstallCardCode(String installCardCode) {
        this.installCardCode = installCardCode == null ? null : installCardCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.outer_machine_code
     *
     * @return the value of crm_install_bill.outer_machine_code
     *
     * @mbggenerated
     */
    public String getOuterMachineCode() {
        return outerMachineCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.outer_machine_code
     *
     * @param outerMachineCode the value for crm_install_bill.outer_machine_code
     *
     * @mbggenerated
     */
    public void setOuterMachineCode(String outerMachineCode) {
        this.outerMachineCode = outerMachineCode == null ? null : outerMachineCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column crm_install_bill.inner_machine_code
     *
     * @return the value of crm_install_bill.inner_machine_code
     *
     * @mbggenerated
     */
    public String getInnerMachineCode() {
        return innerMachineCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column crm_install_bill.inner_machine_code
     *
     * @param innerMachineCode the value for crm_install_bill.inner_machine_code
     *
     * @mbggenerated
     */
    public void setInnerMachineCode(String innerMachineCode) {
        this.innerMachineCode = innerMachineCode == null ? null : innerMachineCode.trim();
    }
    
    
}