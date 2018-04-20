package com.yedam.erp.items;

import java.util.Date;

public class ItemsVO {
	private String itemCode;
	private String itemName;
	private String uom;
	private Integer inQty;
	private Integer supplyPrice;
	private Integer sellingPrice;
	private Integer itemTax;
	private Integer expireDate;
	private String vendorCode;
	private String vendorName;
	private Date addDate;
	private int first;
	private int last;
	private String searchCondition;
	private String searchKeyword;
	private String pGroup1;
	private String pGroup2;
	private String pGroup3;
	private Integer minQty;
	private String msg;
	

	

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public Integer getInQty() {
		return inQty;
	}

	public void setInQty(Integer inQty) {
		this.inQty = inQty;
	}

	public Integer getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(Integer supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public Integer getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(Integer sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	public Integer getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Integer expireDate) {
		this.expireDate = expireDate;
	}

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public Date getAddDate() {
		return addDate;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
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

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public String getpGroup1() {
		return pGroup1;
	}

	public void setpGroup1(String pGroup1) {
		this.pGroup1 = pGroup1;
	}

	public String getpGroup2() {
		return pGroup2;
	}

	public void setpGroup2(String pGroup2) {
		this.pGroup2 = pGroup2;
	}

	public String getpGroup3() {
		return pGroup3;
	}

	public void setpGroup3(String pGroup3) {
		this.pGroup3 = pGroup3;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public Integer getMinQty() {
		return minQty;
	}

	public void setMinQty(Integer minQty) {
		this.minQty = minQty;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	@Override
	public String toString() {
		return "ItemsVO [itemCode=" + itemCode + ", itemName=" + itemName + ", uom=" + uom + ", inQty=" + inQty
				+ ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax=" + itemTax
				+ ", expireDate=" + expireDate + ", vendorCode=" + vendorCode + ", vendorName=" + vendorName
				+ ", addDate=" + addDate + ", first=" + first + ", last=" + last + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", pGroup1=" + pGroup1 + ", pGroup2=" + pGroup2
				+ ", pGroup3=" + pGroup3 + ", minQty=" + minQty + ", msg=" + msg + "]";
	}

	

}
