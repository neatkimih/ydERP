package com.yedam.erp.items;

public class ItemsVO {
	private String item_code;
	private String item_name;
	private String uom;
	private Integer in_qty;
	private Integer supply_price;
	private Integer selling_price;
	private Integer item_tax;
	private Integer expire_date;
	private String vendor_code;
	private int first;
	private int last;
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public Integer getIn_qty() {
		return in_qty;
	}
	public void setIn_qty(Integer in_qty) {
		this.in_qty = in_qty;
	}
	public Integer getSupply_price() {
		return supply_price;
	}
	public void setSupply_price(Integer supply_price) {
		this.supply_price = supply_price;
	}
	public Integer getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(Integer selling_price) {
		this.selling_price = selling_price;
	}
	public Integer getItem_tax() {
		return item_tax;
	}
	public void setItem_tax(Integer item_tax) {
		this.item_tax = item_tax;
	}
	public Integer getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Integer expire_date) {
		this.expire_date = expire_date;
	}
	public String getVendor_code() {
		return vendor_code;
	}
	public void setVendor_code(String vendor_code) {
		this.vendor_code = vendor_code;
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
		return "ItemsVO [item_code=" + item_code + ", item_name=" + item_name + ", uom=" + uom + ", in_qty=" + in_qty
				+ ", supply_price=" + supply_price + ", selling_price=" + selling_price + ", item_tax=" + item_tax
				+ ", expire_date=" + expire_date + ", vendor_code=" + vendor_code + ", first=" + first + ", last="
				+ last + "]";
	}
	
	
	
}
