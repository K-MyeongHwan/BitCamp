<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<div id="header">
            <div class="title">
                <a href="/WebServlet_92_Board_Model2_Mvc/">DEMO WEBSITE</a>
            </div>
            <div class="links">
                <a href="#"><%= request.getContextPath() %></a>
                <a href="#">추후등록</a>
                <a href="#">추후로그아웃</a>

            </div>
        </div>        
        <div id="menu">
            <div>
                <ul>
                	<!-- a : 페이지 이동을 처리하는 마크업 -->
                    <li><a href="<%= request.getContextPath() %>/board/board_list.jsp">BOARD LIST</a></li>
					<li><a href="<%= request.getContextPath() %>/board/board_write.jsp">BOARD WRITE</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
                </ul>
            </div>
        </div>
        <div style="text-align:right;margin-top:1px;
        	border:solid 1px;padding:5px">
        	[ TOTAL : 명 ]
        	[ CURRENT : 명 ]
        </div>
        
        
        
        
        
        
        
        
        
        
        
        