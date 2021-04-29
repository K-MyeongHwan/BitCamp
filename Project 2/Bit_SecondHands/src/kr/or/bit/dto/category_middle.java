package kr.or.bit.dto;

public class category_middle {

	private int m_num;
	private String m_name;
	private int t_num;
	public category_middle() {	}
	public category_middle(int m_num, String m_name, int t_num) {
		super();
		this.m_num = m_num;
		this.m_name = m_name;
		this.t_num = t_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	@Override
	public String toString() {
		return "category_middle [m_num=" + m_num + ", m_name=" + m_name + ", t_num=" + t_num + "]";
	}
	
	
	
}
