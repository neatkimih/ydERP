package com.yedam.erp.common;

public class LookupValuesVO {
	private String lookup;
	private String lookupCode;
	private String lookupValues;
	private String descriptions;
	private char flag;
	private String dff;
	public String getLookup() {
		return lookup;
	}
	public void setLookup(String lookup) {
		this.lookup = lookup;
	}
	public String getLookupCode() {
		return lookupCode;
	}
	public void setLookupCode(String lookupCode) {
		this.lookupCode = lookupCode;
	}
	public String getLookupValues() {
		return lookupValues;
	}
	public void setLookupValues(String lookupValues) {
		this.lookupValues = lookupValues;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public char getFlag() {
		return flag;
	}
	public void setFlag(char flag) {
		this.flag = flag;
	}
	public String getDff() {
		return dff;
	}
	public void setDff(String dff) {
		this.dff = dff;
	}
	
	@Override
	public String toString() {
		return "LookupValuesVO [lookup=" + lookup + ", lookupCode=" + lookupCode + ", lookupValues=" + lookupValues
				+ ", descriptions=" + descriptions + ", flag=" + flag + ", dff=" + dff + "]";
	}
}