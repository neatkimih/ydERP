package com.yedam.erp.sales;

public class SalesVO
{
	private String saleCode;			// 판매코드
	private String saleDate;			// 판매일자
	private String customerCode;		// 판매처
	
	private String saleItem;			// 품목코드
	private Integer saleQty;			// 품목수량
	private Integer salePrice;			// 품목단가
	private Double item_tax;			// 부가세
	private Integer saleCost;			// 결제금액
	
	private String deliveryAddr;		// 배송지
	private String deliveryEmp;			// 배송사원
	private char deliverStatus;			// 배송상태
	private char payStatus;				// 결제상태
	private char warehouse;				// 출하창고
	
	/* saleCode - GET(), SET() */
	public String getSaleCode() { return saleCode; }
	public void setSaleCode(String saleCode) { this.saleCode = saleCode; }
	
	/* saleDate - GET(), SET() */
	public String getSaleDate() { return saleDate; }
	public void setSaleDate(String saleDate) { this.saleDate = saleDate; }
	
	/* customerCode - GET(), SET() */
	public String getCustomerCode() { return customerCode; }
	public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }
	
	/* saleItem - GET(), SET() */
	public String getSaleItem() { return saleItem; }
	public void setSaleItem(String saleItem) { this.saleItem = saleItem; }
	
	/* saleQty - GET(), SET() */
	public Integer getSaleQty() { return saleQty; }
	public void setSaleQty(Integer saleQty) { this.saleQty = saleQty; }
	
	/* salePrice - GET(), SET() */
	public Integer getSalePrice() { return salePrice; }
	public void setSalePrice(Integer salePrice) { this.salePrice = salePrice; }
	
	/* itemTax - GET(), SET() */
	public Double getItem_tax() { return item_tax; }
	public void setItem_tax(Double item_tax) { this.item_tax = item_tax; }
	
	/* saleCost - GET(), SET() */
	public Integer getSaleCost() { return saleCost;	}
	public void setSaleCost(Integer saleCost) { this.saleCost = saleCost; }
	
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
	
	@Override
	public String toString()
	{
		return "SalesVO [saleCode=" + saleCode + ", saleDate=" + saleDate + ", customerCode=" + customerCode
				+ ", saleItem=" + saleItem + ", saleQty=" + saleQty + ", salePrice=" + salePrice + ", item_tax="
				+ item_tax + ", saleCost=" + saleCost + ", deliveryAddr=" + deliveryAddr + ", deliveryEmp="
				+ deliveryEmp + ", deliverStatus=" + deliverStatus + ", payStatus=" + payStatus + ", warehouse="
				+ warehouse + "]";
	}
}