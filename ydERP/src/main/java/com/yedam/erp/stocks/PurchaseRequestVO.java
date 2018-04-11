package com.yedam.erp.stocks;

public class PurchaseRequestVO {
	String itemCode;
	String itemName;
	String uom;
	Integer inQty;
	Integer supplyPrice;
	Integer sellingPrice;
	String vendorCode;
	Integer minQty;
	Integer itemTax;
	Integer onhandQty;
	Integer reqQty;
	String expireDate;
	String vendorName;
	String vendorOwner;
	String vendorLoc;
	String vendorPhone;
	String vendorBank;
	String vendorAccount;
	String pMsg;

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

	public String getVendorCode() {
		return vendorCode;
	}

	public void setVendorCode(String vendorCode) {
		this.vendorCode = vendorCode;
	}

	public Integer getMinQty() {
		return minQty;
	}

	public void setMinQty(Integer minQty) {
		this.minQty = minQty;
	}

	public Integer getItemTax() {
		return itemTax;
	}

	public void setItemTax(Integer itemTax) {
		this.itemTax = itemTax;
	}

	public Integer getOnhandQty() {
		return onhandQty;
	}

	public void setOnhandQty(Integer onhandQty) {
		this.onhandQty = onhandQty;
	}

	public Integer getReqQty() {
		return reqQty;
	}

	public void setReqQty(Integer reqQty) {
		this.reqQty = reqQty;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getVendorOwner() {
		return vendorOwner;
	}

	public void setVendorOwner(String vendorOwner) {
		this.vendorOwner = vendorOwner;
	}

	public String getVendorLoc() {
		return vendorLoc;
	}

	public void setVendorLoc(String vendorLoc) {
		this.vendorLoc = vendorLoc;
	}

	public String getVendorPhone() {
		return vendorPhone;
	}

	public void setVendorPhone(String vendorPhone) {
		this.vendorPhone = vendorPhone;
	}

	public String getVendorBank() {
		return vendorBank;
	}

	public void setVendorBank(String vendorBank) {
		this.vendorBank = vendorBank;
	}

	public String getVendorAccount() {
		return vendorAccount;
	}

	public void setVendorAccount(String vendorAccount) {
		this.vendorAccount = vendorAccount;
	}

	public String getpMsg() {
		return pMsg;
	}

	public void setpMsg(String pMsg) {
		this.pMsg = pMsg;
	}

	@Override
	public String toString() {
		return "PurchaseRequestVO [itemCode=" + itemCode + ", itemName=" + itemName + ", uom=" + uom + ", inQty="
				+ inQty + ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", vendorCode="
				+ vendorCode + ", minQty=" + minQty + ", itemTax=" + itemTax + ", onhandQty=" + onhandQty + ", reqQty="
				+ reqQty + ", expireDate=" + expireDate + ", vendorName=" + vendorName + ", vendorOwner=" + vendorOwner
				+ ", vendorLoc=" + vendorLoc + ", vendorPhone=" + vendorPhone + ", vendorBank=" + vendorBank
				+ ", vendorAccount=" + vendorAccount + ", pMsg=" + pMsg + "]";
	}

}
