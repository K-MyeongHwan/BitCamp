package kr.or.bit.dto;

public class review_img {
	private int rimg_num;
	private String rimg_name;
	private int rimg_size;
	private int rv_num;
	private int buy_num;
	
	public review_img() {}

	public review_img(int rimg_num, String rimg_name, int rimg_size, int rv_num, int buy_num) {
		super();
		this.rimg_num = rimg_num;
		this.rimg_name = rimg_name;
		this.rimg_size = rimg_size;
		this.rv_num = rv_num;
		this.buy_num = buy_num;
	}

	public int getRimg_num() {
		return rimg_num;
	}

	public void setRimg_num(int rimg_num) {
		this.rimg_num = rimg_num;
	}

	public String getRimg_name() {
		return rimg_name;
	}

	public void setRimg_name(String rimg_name) {
		this.rimg_name = rimg_name;
	}

	public int getRimg_size() {
		return rimg_size;
	}

	public void setRimg_size(int rimg_size) {
		this.rimg_size = rimg_size;
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	@Override
	public String toString() {
		return "review_img [rimg_num=" + rimg_num + ", rimg_name=" + rimg_name + ", rimg_size=" + rimg_size
				+ ", rv_num=" + rv_num + ", buy_num=" + buy_num + "]";
	}
	
	
	
}
