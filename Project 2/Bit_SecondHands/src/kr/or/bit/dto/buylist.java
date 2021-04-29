package kr.or.bit.dto;

import java.util.Date;

public class buylist {
	private int buy_num;
	private int p_num;
	private String storename_buyer;
	private String sotrename_seller;
	private Date buy_date;
	public buylist() {}
	public buylist(int buy_num, int p_num, String storename_buyer, String sotrename_seller, Date buy_date) {
		super();
		this.buy_num = buy_num;
		this.p_num = p_num;
		this.storename_buyer = storename_buyer;
		this.sotrename_seller = sotrename_seller;
		this.buy_date = buy_date;
	}
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
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
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	@Override
	public String toString() {
		return "buylist [buy_num=" + buy_num + ", p_num=" + p_num + ", storename_buyer=" + storename_buyer
				+ ", sotrename_seller=" + sotrename_seller + ", buy_date=" + buy_date + "]";
	}
	
	
}
