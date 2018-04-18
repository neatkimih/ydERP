package com.yedam.erp.items;

import java.util.Date;

public class Sales_tempVO {

	
	private String customerCode;
	private String itemCode;
	private Integer requestQty;
	private Date needDate;
	private Date createDate;
	private int first;
	private int last;
	
	
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public Integer getRequestQty() {
		return requestQty;
	}
	public void setRequestQty(Integer requestQty) {
		this.requestQty = requestQty;
	}
	public Date getNeedDate() {
		return needDate;
	}
	public void setNeedDate(Date needDate) {
		this.needDate = needDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "Sales_tempVO [customerCode=" + customerCode + ", itemCode=" + itemCode + ", requestQty=" + requestQty
				+ ", needDate=" + needDate + ", createDate=" + createDate + ", first=" + first + ", last=" + last + "]";
	}
	
	
	
}
