package kr.or.bit.ajax;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/PhoneCheckOk.ajax")
public class PhoneCheckOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PhoneCheckOk() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		 String random = request.getParameter("random"); 
		 String phoneNm = request.getParameter("phoneNm"); 
		//메시지 보내지면 안돼애 ㅠㅠ
		/*
		 * String random = request.getParameter("random"); String phoneNm =
		 * request.getParameter("phoneNm"); System.out.println(random);
		 * System.out.println(phoneNm);
		 * 
		 * String msg = "당신의 인증번호는 " + random + " 입니다.";
		 * 
		 * String api_key = "NCSQVZHUUXWP6BSJ"; String api_secret =
		 * "8IHVRGHGUYX2FIE7VWIGXBCHYXHSOQAR"; Message coolsms = new Message(api_key,
		 * api_secret);
		 * 
		 * // 4 params(to, from, type, text) are mandatory. must be filled
		 * HashMap<String, String> params = new HashMap<String, String>();
		 * params.put("to", phoneNm); params.put("from", "01023953883");
		 * params.put("type", "SMS"); params.put("text", msg); params.put("app_version",
		 * "test app 1.2"); // application name and version
		 * 
		 * try { JSONObject obj = (JSONObject) coolsms.send(params);
		 * System.out.println(obj.toString()); } catch (CoolsmsException e) {
		 * System.out.println(e.getMessage()); System.out.println(e.getCode()); }
		 */
		
		System.out.println(random);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		doProcess(request, response);
	}

}
