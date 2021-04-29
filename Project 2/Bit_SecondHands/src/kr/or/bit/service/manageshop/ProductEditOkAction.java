package kr.or.bit.service.manageshop;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ProductEditOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		SecondHandsDAO dao = new SecondHandsDAO();
		  String p_num = "";
	      String storename = "";
	      String imgs = "";
	      String subj = "";
	      String b_num = "";
	      String addr = "";
	      String price = "";
	      String content = "";
	     // String filenames = "";
	      String url = "";
	      String icon = "";
	      String msg = "";
	      boolean b = false;

			/*
			 * String encType = "UTF-8"; int maxFilesize = 5 * 1024 * 1024; String pathName
			 * = request.getServletContext().getRealPath("fileUpload");
			 * 
			 * try { File f = new File(pathName); if (!f.exists()) { f.mkdirs(); }
			 * 
			 * MultipartRequest mr = new MultipartRequest(request, pathName, maxFilesize,
			 * encType, new DefaultFileRenamePolicy());
			 */
	         
	         p_num = request.getParameter("p_num");
	         storename = request.getParameter("storename");
	         subj = request.getParameter("subj");
	         b_num = request.getParameter("bottom");
	         addr = request.getParameter("addr");
	         price = request.getParameter("price");
	         content = request.getParameter("content");
	         
	         //filenames = mr.getParameter("filenames");

	         System.out.println(storename);
	         System.out.println(subj);
	         System.out.println(b_num);
	         System.out.println(addr);
	         System.out.println(price);
	         System.out.println(content);
				/*
				 * String[] filename = filenames.split(",");
				 * 
				 * for (int i = 0; i < filename.length; i++) { System.out.println("이미지 : " +
				 * filename[i]); }
				 */
	         
	         // 상품 수정하고
	         boolean result = dao.productEdit(p_num, storename, subj, b_num, addr, price, content);
	         //int p_number = Integer.parseInt(p_num);
	         //해당상품 이미지 삭제 하고
	         //boolean dresult = dao.deleteProductImg(p_number);


	        
	         System.out.println("서비스 p_num :" + p_num);
	         
				/*
				 * for (int i = 0; i < filename.length; i++) { //이미지 다시 등록한다 //b =
				 * dao.productImgUpload(filename[i], p_number, i + 1); if (b) {
				 * System.out.println("이미지 update 성공");
				 * 
				 * } else { System.out.println("이미지 update 실패"); } }
				 */
	         if (result) {
	            // url = "/WEB-INF/views/manageshop/managemyproducts.jsp";
	            url = "manageshop.manage";
	            icon = "success";
	            msg = "수정 성공!";
	         } else {
	            url = "manageshop.manage";
	            icon = "error";
	            msg = "수정 실패..";
	         }

				/*
				 * } catch (Exception e) { System.out.println(e.getMessage()); }finally {
				 * 
				 * }
				 */

	      request.setAttribute("url", url);
	      request.setAttribute("icon", icon);
	      request.setAttribute("msg", msg);
	      ActionForward forward = new ActionForward();
	      forward.setRedirect(false);
	      forward.setPath("WEB-INF/views/redirect/redirect.jsp");

	      return forward;
	}
}