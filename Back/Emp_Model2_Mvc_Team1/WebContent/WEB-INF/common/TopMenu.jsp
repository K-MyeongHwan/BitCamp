<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header" class="header">

	<div class="header-menu">

		  <div class="col-sm-7">
               <a id="menuToggle" class="menutoggle pull-left"><i
                  class="fa fa fa-tasks"></i></a>
            </div>


		<div class="col-sm-5">
			<div class="user-area dropdown float-right">

				<c:choose>
					<c:when test="${id == null}">
						
					</c:when>
					<c:otherwise>
					
					
					
					
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<!--  <img
							class="user-avatar rounded-circle" src="images/admin.jpg"
							alt="User Avatar"> -->
							<img class="user-avatar rounded-circle" src="./custom/images/admin.svg" width="30px" height="30px"
									alt="Admin Avatar" style="margin-top: 5px;">
						</a>

						<div class="user-menu dropdown-menu">
							<!-- <a class="nav-link" href="#"><i class="fa fa-user"></i> MyProfile</a> 
							<a class="nav-link" href="#"><i class="fa fa-user"></i>Notifications <span class="count">13</span></a>
							<a class="nav-link" href="#"><i class="fa fa-cog"></i> Settings</a>  -->
							<a class="nav-link" href="logout.do"><i
								class="fa fa-power-off"></i>Logout</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</div>

</header>