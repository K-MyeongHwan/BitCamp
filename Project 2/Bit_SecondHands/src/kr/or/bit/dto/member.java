package kr.or.bit.dto;

public class member {
	private String stroename;
	private String m_name;
	private String m_phone;
	private String m_email;
	private String m_pwd;
	private String m_profile;
	
	public member() {}

	public member(String stroename, String m_name, String m_phone, String m_email, String m_pwd, String m_profile) {
		super();
		this.stroename = stroename;
		this.m_name = m_name;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_pwd = m_pwd;
		this.m_profile = m_profile;
	}

	public String getStroename() {
		return stroename;
	}

	public void setStroename(String stroename) {
		this.stroename = stroename;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_profile() {
		return m_profile;
	}

	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}

	@Override
	public String toString() {
		return "Member [stroename=" + stroename + ", m_name=" + m_name + ", m_phone=" + m_phone + ", m_email=" + m_email
				+ ", m_pwd=" + m_pwd + ", m_profile=" + m_profile + "]";
	};
	
}
