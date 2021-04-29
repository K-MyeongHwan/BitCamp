package kr.or.bit.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ProductUploadAction implements Action {


   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

      SecondHandsDAO dao = new SecondHandsDAO();
      String storename = "";
      String imgs = "";
      String subj = "";
      String b_num = "";
      String addr = "";
      String price = "";
      String content = "";
      String filenames = "";
      String url = "";
      String icon = "";
      String msg = "";
      boolean b = false;

      String encType = "UTF-8";
      int maxFilesize = 5 * 1024 * 1024;
      String pathName = request.getServletContext().getRealPath("fileUpload");

      try {
         File f = new File(pathName);
         if (!f.exists()) {
            f.mkdirs();
         }

         MultipartRequest mr = new MultipartRequest(request, pathName, maxFilesize, encType,
               new DefaultFileRenamePolicy());

         storename = mr.getParameter("storename");
         subj = mr.getParameter("subj");
         b_num = mr.getParameter("bottom");
         addr = mr.getParameter("addr");
         price = mr.getParameter("price");
         content = mr.getParameter("content");
         filenames = mr.getParameter("filenames");

         System.out.println(storename);
         System.out.println(subj);
         System.out.println(b_num);
         System.out.println(addr);
         System.out.println(price);
         System.out.println(content);
         String[] filename = filenames.split(",");
         for (String s : filename) {
            System.out.println(s);
         }

         boolean result = dao.productUpload(storename, subj, b_num, addr, price, content);
         int p_num = dao.productQuery();
         System.out.println("서비스 p_num :" + p_num);

         for (int i = 0; i < filename.length; i++) {
            b = dao.productImgUpload(filename[i], p_num, i + 1);
            if (b) {
               System.out.println("이미지 insert 성공");

            } else {
               System.out.println("이미지 insert 실패");
            }
         }
         if (result && b) {
            // url = "/WEB-INF/views/manageshop/managemyproducts.jsp";
            url = "manageshop.manage";
            icon = "success";
            msg = "등록 성공!";
         } else {
            url = "mysell.do";
            icon = "error";
            msg = "등록 실패..";
         }

      } catch (Exception e) {
         System.out.println(e.getMessage());
      }

      request.setAttribute("url", url);
      request.setAttribute("icon", icon);
      request.setAttribute("msg", msg);
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("WEB-INF/views/redirect/redirect.jsp");

      return forward;
   }

}