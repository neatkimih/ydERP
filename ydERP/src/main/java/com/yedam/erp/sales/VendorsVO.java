package com.yedam.erp.sales;

public class VendorsVO {
	private String customerCode;		// 판매처 코드
	private String customerName;		// 판매처 이름
	private String customerOwner;		// 판매처 대표자명
	private String customerLoc;			// 판매처 소재지
	private String customerPhone;		// 판매처 연락처
	private String customerPw;			// 판매처 접근 패스워드
	
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerOwner() {
		return customerOwner;
	}
	public void setCustomerOwner(String customerOwner) {
		this.customerOwner = customerOwner;
	}
	public String getCustomerLoc() {
		return customerLoc;
	}
	public void setCustomerLoc(String customerLoc) {
		this.customerLoc = customerLoc;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerPw() {
		return customerPw;
	}
	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}
}