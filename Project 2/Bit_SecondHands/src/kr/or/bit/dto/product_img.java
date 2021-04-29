package kr.or.bit.dto;

public class product_img {
	private int pimg_num;
	private String pimg_name;
	private int pimg_size;
	private String p_num;
	
	public product_img() {}

	public product_img(int pimg_num, String pimg_name, int pimg_size, String p_num) {
		super();
		this.pimg_num = pimg_num;
		this.pimg_name = pimg_name;
		this.pimg_size = pimg_size;
		this.p_num = p_num;
	}

	public int getPimg_num() {
		return pimg_num;
	}

	public void setPimg_num(int pimg_num) {
		this.pimg_num = pimg_num;
	}

	public String getPimg_name() {
		return pimg_name;
	}

	public void setPimg_name(String pimg_name) {
		this.pimg_name = pimg_name;
	}

	public int getPimg_size() {
		return pimg_size;
	}

	public void setPimg_size(int pimg_size) {
		this.pimg_size = pimg_size;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	@Override
	public String toString() {
		return "product_img [pimg_num=" + pimg_num + ", pimg_name=" + pimg_name + ", pimg_size=" + pimg_size
				+ ", p_num=" + p_num + "]";
	};
	
}
