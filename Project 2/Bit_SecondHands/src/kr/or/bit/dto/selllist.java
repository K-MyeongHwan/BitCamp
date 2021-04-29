package kr.or.bit.dto;

import java.util.Date;

public class selllist {
	private int sell_num;
	private int p_num;
	private String storename_buyer;
	private String sotrename_seller;
	private Date sell_date;
	
	public selllist() {}
	
	public selllist(int sell_num, int p_num, String storename_buyer, String sotrename_seller, Date sell_date) {
		super();
		this.sell_num = sell_num;
		this.p_num = p_num;
		this.storename_buyer = storename_buyer;
		this.sotrename_seller = sotrename_seller;
		this.sell_date = sell_date;
	}
	
	public int getSell_num() {
		return sell_num;
	}
	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getStorename_buyer() {
		return storename_buyer;
	}
	public void setStorename_buyer(String storename_buyer) {
		this.storename_buyer = storename_buyer;
	}
	public String getSotrename_seller() {
		return sotrename_seller;
	}
	public void setSotrename_seller(String sotrename_seller) {
		this.sotrename_seller = sotrename_seller;
	}
	public Date getSell_date() {
		return sell_date;
	}
	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}
	@Override
	public String toString() {
		return "selllist [sell_num=" + sell_num + ", p_num=" + p_num + ", storename_buyer=" + storename_buyer
				+ ", sotrename_seller=" + sotrename_seller + ", sell_date=" + sell_date + "]";
	}
	
	
	
	
}
