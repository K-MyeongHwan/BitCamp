package net.member.db;

public class MemberBean {
	/**
	 * @uml.property  name="mEMBER_ID"
	 */
	private String MEMBER_ID;
	/**
	 * @uml.property  name="mEMBER_PW"
	 */
	private String MEMBER_PW;
	/**
	 * @uml.property  name="mEMBER_NAME"
	 */
	private String MEMBER_NAME;
	/**
	 * @uml.property  name="mEMBER_AGE"
	 */
	private int MEMBER_AGE;
	/**
	 * @uml.property  name="mEMBER_GENDER"
	 */
	private String MEMBER_GENDER;
	/**
	 * @uml.property  name="mEMBER_EMAIL"
	 */
	private String MEMBER_EMAIL;
	
	/**
	 * @return
	 * @uml.property  name="mEMBER_ID"
	 */
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	/**
	 * @param member_id
	 * @uml.property  name="mEMBER_ID"
	 */
	public void setMEMBER_ID(String member_id) {
		MEMBER_ID = member_id;
	}
	/**
	 * @return
	 * @uml.property  name="mEMBER_PW"
	 */
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	/**
	 * @param member_pw
	 * @uml.property  name="mEMBER_PW"
	 */
	public void setMEMBER_PW(String member_pw) {
		MEMBER_PW = member_pw;
	}
	/**
	 * @return
	 * @uml.property  name="mEMBER_NAME"
	 */
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	/**
	 * @param member_name
	 * @uml.property  name="mEMBER_NAME"
	 */
	public void setMEMBER_NAME(String member_name) {
		MEMBER_NAME = member_name;
	}
	/**
	 * @return
	 * @uml.property  name="mEMBER_AGE"
	 */
	public int getMEMBER_AGE() {
		return MEMBER_AGE;
	}
	/**
	 * @param member_age
	 * @uml.property  name="mEMBER_AGE"
	 */
	public void setMEMBER_AGE(int member_age) {
		MEMBER_AGE = member_age;
	}
	/**
	 * @return
	 * @uml.property  name="mEMBER_GENDER"
	 */
	public String getMEMBER_GENDER() {
		return MEMBER_GENDER;
	}
	/**
	 * @param member_gender
	 * @uml.property  name="mEMBER_GENDER"
	 */
	public void setMEMBER_GENDER(String member_gender) {
		MEMBER_GENDER = member_gender;
	}
	/**
	 * @return
	 * @uml.property  name="mEMBER_EMAIL"
	 */
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	/**
	 * @param member_email
	 * @uml.property  name="mEMBER_EMAIL"
	 */
	public void setMEMBER_EMAIL(String member_email) {
		MEMBER_EMAIL = member_email;
	}
}
