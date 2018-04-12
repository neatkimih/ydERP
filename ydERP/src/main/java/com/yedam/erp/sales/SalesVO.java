package com.yedam.erp.sales;

public class SalesVO
{
	private String saleCode;			// 판매코드
	private String saleDate;			// 판매일자
	private String customerCode;		// 판매처 코드
	private Integer saleCost;			// 결제금액
	
	private String deliveryAddr;		// 배송지
	private String deliveryEmp;			// 배송사원
	private char deliveryStatus;		// 배송상태
	private String deliveryDate;		// 배송희망일자
	private char payStatus;				// 결제상태
	private char warehouse;				// 출하창고
	private char orderPermit;			// 주문허가
	
	private String pTxnNo;
	
	/* saleCode - GET(), SET() */
	public String getSaleCode() { return saleCode; }
	public void setSaleCode(String saleCode) { this.saleCode = saleCode; }
	
	/* saleDate - GET(), SET() */
	public String getSaleDate() { return saleDate; }
	public void setSaleDate(String saleDate) { this.saleDate = saleDate; }
	
	/* customerCode - GET(), SET() */
	public String getCustomerCode() { return customerCode; }
	public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }
	
	/* saleCost - GET(), SET() */
	public Integer getSaleCost() { return saleCost; }
	public void setSaleCost(Integer saleCost) {	this.saleCost = saleCost; }
	
	/* deliveryAddr - GET(), SET() */
	public String getDeliveryAddr() { return deliveryAddr; }
	public void setDeliveryAddr(String deliveryAddr) { this.deliveryAddr = deliveryAddr; }
	
	/* deliveryEmp - GET(), SET() */
	public String getDeliveryEmp() { return deliveryEmp; }
	public void setDeliveryEmp(String deliveryEmp) { this.deliveryEmp = deliveryEmp; }
	
	/* deliveryStatus - GET(), SET() */
	public char getDeliveryStatus() { return deliveryStatus; }
	public void setDeliveryStatus(char deliveryStatus) { this.deliveryStatus = deliveryStatus; }
	
	/* payStatus - GET(), SET() */
	public char getPayStatus() { return payStatus; }
	public void setPayStatus(char payStatus) { this.payStatus = payStatus; }
	
	/* warehouse - GET(), SET() */
	public char getWarehouse() { return warehouse; }
	public void setWarehouse(char warehouse) { this.warehouse = warehouse; }
	
	/* orderPermit - GET(), SET() */	
	public char getOrderPermit() { return orderPermit; }
	public void setOrderPermit(char orderPermit) { this.orderPermit = orderPermit; }
	
	/* deliveryDate - GET(), SET() */	
	public String getDeliveryDate() { return deliveryDate; }
	public void setDeliveryDate(String deliveryDate) { this.deliveryDate = deliveryDate; }
	
	/* pTxnNo - GET(), SET() */
	public String getpTxnNo() { return pTxnNo; }
	public void setpTxnNo(String pTxnNo) { this.pTxnNo = pTxnNo; }
	
	@Override
	public String toString() {
		return "SalesVO [판매코드=" + saleCode
					+ ", 판매일자=" + saleDate
					+ ", 판매처 코드=" + customerCode
					+ ", 배송지=" + deliveryAddr
					+ ", 배송사원="	+ deliveryEmp
					+ ", 배송상태=" + deliveryStatus
					+ ", 배송희망일=" + deliveryDate
					+ ", 결제상태=" + payStatus
					+ ", 출하창고=" + warehouse
					+ ", 승인상태=" + orderPermit + "]";
	}
}