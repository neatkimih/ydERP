package com.yedam.erp.sales;

public class SalesVO
{
	private String saleCode;			// 판매코드
	private String saleDate;			// 판매일자
	private String customerCode;		// 판매처
	
	private String deliveryAddr;		// 배송지
	private String deliveryEmp;			// 배송사원
	private char deliverStatus;			// 배송상태
	private char payStatus;				// 결제상태
	private char warehouse;				// 출하창고
	
	private char orderPermit;			// 주문허가
	
	/* saleCode - GET(), SET() */
	public String getSaleCode() { return saleCode; }
	public void setSaleCode(String saleCode) { this.saleCode = saleCode; }
	
	/* saleDate - GET(), SET() */
	public String getSaleDate() { return saleDate; }
	public void setSaleDate(String saleDate) { this.saleDate = saleDate; }
	
	/* customerCode - GET(), SET() */
	public String getCustomerCode() { return customerCode; }
	public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }
		
	/* deliveryAddr - GET(), SET() */
	public String getDeliveryAddr() { return deliveryAddr; }
	public void setDeliveryAddr(String deliveryAddr) { this.deliveryAddr = deliveryAddr; }
	
	/* deliveryEmp - GET(), SET() */
	public String getDeliveryEmp() { return deliveryEmp; }
	public void setDeliveryEmp(String deliveryEmp) { this.deliveryEmp = deliveryEmp; }
	
	/* deliverStatus - GET(), SET() */
	public char getDeliverStatus() { return deliverStatus; }
	public void setDeliverStatus(char deliverStatus) { this.deliverStatus = deliverStatus; }
	
	/* payStatus - GET(), SET() */
	public char getPayStatus() { return payStatus; }
	public void setPayStatus(char payStatus) { this.payStatus = payStatus; }
	
	/* warehouse - GET(), SET() */
	public char getWarehouse() { return warehouse; }
	public void setWarehouse(char warehouse) { this.warehouse = warehouse; }
	
	/* orderPermit - GET(), SET() */	
	public char getOrderPermit() { return orderPermit; }
	public void setOrderPermit(char orderPermit) { this.orderPermit = orderPermit; }
	
	@Override
	public String toString() {
		return "SalesVO [saleCode=" + saleCode
					+ ", saleDate=" + saleDate
					+ ", customerCode=" + customerCode
					+ ", deliveryAddr=" + deliveryAddr
					+ ", deliveryEmp="	+ deliveryEmp
					+ ", deliverStatus=" + deliverStatus
					+ ", payStatus=" + payStatus
					+ ", warehouse=" + warehouse
					+ ", orderPermit=" + orderPermit + "]";
	}
}