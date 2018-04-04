package com.yedam.erp.purchases;

public class PurchasesVO
{
	private String PURCHASE_CODE;			// 구매코드
	private String PURCHASE_DATE;			// 구매일자
	private String VENDOR_CODE;		// 구매처
	
	private String PURCHASE_ITEM;			// 품목코드
	private Integer PURCHASE_QTY;			// 구매수량
	private Integer PURCHASE_PRICE;			// 구매단가
	private Double ITEM_TAX;			// 부가세
	private Integer PURCHASE_COST;			// 결제금액	
	
	
	public String getPURCHASE_CODE() {
		return PURCHASE_CODE;
	}
	public void setPURCHASE_CODE(String pURCHASE_CODE) {
		PURCHASE_CODE = pURCHASE_CODE;
	}
	public String getPURCHASE_DATE() {
		return PURCHASE_DATE;
	}
	public void setPURCHASE_DATE(String pURCHASE_DATE) {
		PURCHASE_DATE = pURCHASE_DATE;
	}
	public String getVENDOR_CODE() {
		return VENDOR_CODE;
	}
	public void setVENDOR_CODE(String vENDOR_CODE) {
		VENDOR_CODE = vENDOR_CODE;
	}
	public String getPURCHASE_ITEM() {
		return PURCHASE_ITEM;
	}
	public void setPURCHASE_ITEM(String pURCHASE_ITEM) {
		PURCHASE_ITEM = pURCHASE_ITEM;
	}
	public Integer getPURCHASE_QTY() {
		return PURCHASE_QTY;
	}
	public void setPURCHASE_QTY(Integer pURCHASE_QTY) {
		PURCHASE_QTY = pURCHASE_QTY;
	}
	public Integer getPURCHASE_PRICE() {
		return PURCHASE_PRICE;
	}
	public void setPURCHASE_PRICE(Integer pURCHASE_PRICE) {
		PURCHASE_PRICE = pURCHASE_PRICE;
	}
	public Double getITEM_TAX() {
		return ITEM_TAX;
	}
	public void setITEM_TAX(Double iTEM_TAX) {
		ITEM_TAX = iTEM_TAX;
	}
	public Integer getPURCHASE_COST() {
		return PURCHASE_COST;
	}
	public void setPURCHASE_COST(Integer pURCHASE_COST) {
		PURCHASE_COST = pURCHASE_COST;
	}
	@Override
	public String toString() {
		return "PurchasesVO [PURCHASE_CODE=" + PURCHASE_CODE + ", PURCHASE_DATE=" + PURCHASE_DATE + ", VENDOR_CODE="
				+ VENDOR_CODE + ", PURCHASE_ITEM=" + PURCHASE_ITEM + ", PURCHASE_QTY=" + PURCHASE_QTY
				+ ", PURCHASE_PRICE=" + PURCHASE_PRICE + ", ITEM_TAX=" + ITEM_TAX + ", PURCHASE_COST=" + PURCHASE_COST
				+ "]";
	}	
}