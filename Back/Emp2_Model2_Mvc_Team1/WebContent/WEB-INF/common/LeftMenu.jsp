<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">

		<div class="navbar-header">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#main-menu" aria-controls="main-menu"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="./"><img src="images/thumbs.svg"
				alt="Logo" style="margin-right:20px;">Admin</a>
			<!-- <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a> -->
		</div>

		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<c:set var="userid" value="${sessionScope.userid}" />
			<c:choose>
				<c:when test="${id != null}">
					<ul class="nav navbar-nav">
						<li class="active"><a href="Main.do"> <i
								class="menu-icon fa fa-dashboard"></i>메인
						</a></li>
						<!-- <h3 class="menu-title">UI elements</h3>/.menu-title -->
						<li class="menu-item"><a href="EmpTable.do"><i
								class="menu-icon fa fa-laptop"></i>회원관리</a></li>
						<li class="menu-item"><a href="dataTable.do"><i
								class="menu-icon fa fa-laptop"></i>dataTable</a></li>
						<li class="menu-item"><a href="HieEmpTable.do"><i
								class="menu-icon fa fa-laptop"></i>계층형 게시판</a></li>
						<li class="menu-item"><a href="ajaxPaging.do"><i
								class="menu-icon fa fa-laptop"></i>ajax 페이징 게시판</a></li>
						<li class="menu-item-has-children dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
								class="menu-icon fa fa-laptop"></i>차트
						</a>
							<ul class="sub-menu children dropdown-menu">
								<li><i class="fa fa-puzzle-piece"></i><a
									href="chartView.do">차트1</a></li>
							</ul></li>
					</ul>
				</c:when>
				<c:otherwise>
				<ul class="nav navbar-nav">
						<li class="active"><a href="Main.do"> <i
								class="menu-icon fa fa-dashboard"></i>로그인을 해주세요.
						</a></li>
						
					</ul>
				
				</c:otherwise>
			</c:choose>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>