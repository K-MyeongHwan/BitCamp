package kr.or.bit.dto;

public class likelist {
	private int p_num;
	private String storename;
	public likelist() {	}
	public likelist(int p_num, String storename) {
		super();
		this.p_num = p_num;
		this.storename = storename;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	@Override
	public String toString() {
		return "likelist [p_num=" + p_num + ", storename=" + storename + "]";
	}
	
	
	
	
	
}
