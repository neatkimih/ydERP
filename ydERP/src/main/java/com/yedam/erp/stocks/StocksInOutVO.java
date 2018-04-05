package com.yedam.erp.stocks;

public class StocksInOutVO extends StocksVO {
	Integer stockId;
	String itemName;
	String uom;
	Integer quantities;
	Integer supplyPrice;
	Integer sellingPrice;
	String itemTax;
	String expireDate;
	String vendorCode;
	Integer minQty;
	String dealerCode;

	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
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

	public Integer getQuantities() {
		return quantities;
	}

	public void setQuantities(Integer quantities) {
		this.quantities = quantities;
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

	public String getItemTax() {
		return itemTax;
	}

	public void setItemTax(String itemTax) {
		this.itemTax = itemTax;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
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

	public String getDealerCode() {
		return dealerCode;
	}

	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

	@Override
	public String toString() {
		return "StocksInOutVO [stockId=" + stockId + ", itemName=" + itemName + ", uom=" + uom + ", quantities="
				+ quantities + ", supplyPrice=" + supplyPrice + ", sellingPrice=" + sellingPrice + ", itemTax="
				+ itemTax + ", expireDate=" + expireDate + ", vendorCode=" + vendorCode + ", minQty=" + minQty
				+ ", dealerCode=" + dealerCode + "]";
	}

}