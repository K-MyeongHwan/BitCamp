package kr.or.bit.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class editMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String storename = "";
		String originalPath = "";
		String msg = "";
		String url = "";
		String icon = "";
		String encType = "UTF-8";
		String profile = "";
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
			originalPath = mr.getParameter("originalPath");
			if (mr.getFile("file") == null) {
				System.out.println("input=file 이 비어있습니다. value를 originalPath로 바꿉니다.");
				profile = originalPath;
			} else {
				File changeFile = mr.getFile("file");
				String changeFilePath = changeFile.getPath();
				profile = changeFilePath.substring(changeFilePath.lastIndexOf('\\') + 1, changeFilePath.length());
			}

			System.out.println("edit 상점이름 " + storename);
			System.out.println("edit 파일이름" + profile);
			System.out.println("edit 오리지널 파일이름 " + originalPath);
			
			SecondHandsDAO dao = new SecondHandsDAO();
			boolean result = dao.updateMemberProfile(profile, storename);

			if (result) {
				msg = "수정 성공";
				icon = "success";
				
			} else {
				msg = "수정 실패";
				icon = "error";
			}
		} catch (Exception e) {
			System.out.println("수정실패");
			System.out.println(e.getMessage());
		}
		
		url = "myshop.do?storename=" + storename;
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("icon", icon);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		
		forward.setPath("WEB-INF/views/redirect/redirect.jsp");

		return forward;
	}
}

