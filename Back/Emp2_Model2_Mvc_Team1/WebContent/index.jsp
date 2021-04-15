<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">3
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="./vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="./vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="./vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="./vendors/jqvmap/dist/jqvmap.min.css">

<link rel="stylesheet" href="./assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- 로그인 -->
<link rel="stylesheet" type="text/css" href="./custom/css/my-login.css">

</head>

<body>

	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include>

	<!-- /Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>
		<!-- /Header -->

		<div class="breadcrumbs">
		
			<c:choose>
			<c:when test="${id != null}">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Main</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">Main</li>
						</ol>
					</div>
				</div>
			</div>
				</c:when>
			<c:otherwise>
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Login</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">Login</li>
						</ol>
					</div>
				</div>
			</div>
			</c:otherwise>
							</c:choose>
			
		</div>

		<div class="content mt-3">
		
			<c:choose>
				<c:when test="${id == null}">
					<!-- JSTL ..로그인 했을때와 안했을때 보여지는 것..  -->
					<div class="my-login-page">
						<section class="h-100">
							<div class="container h-100">
								<div class="row justify-content-md-center h-100">
									<div class="card-wrapper">
										<div class="card fat">
											<div class="card-body">
<!-- 												<h4 class="card-title">Login</h4> -->
												<form action="login.do" method="POST"
													class="my-login-validation" novalidate="">
													<div class="form-group">
														<label for="email">ID</label> <input id="id" type="email"
															class="form-control" name="id" value="" required
															autofocus>
														<div class="invalid-feedback">Email is invalid</div>
													</div>

													<div class="form-group">
														<label for="password">Password </label> <input
															id="password" type="password" class="form-control"
															name="password" required data-eye>
														<div class="invalid-feedback">Password is required</div>
													</div>

													<!-- <div class="form-group">
											<div class="custom-checkbox custom-control">
												<input type="checkbox" name="remember" id="remember"
													class="custom-control-input"> <label for="remember"
													class="custom-control-label">Remember Me</label>
											</div>
										</div> -->

													<div class="form-group m-0">
														<button type="submit" class="btn btn-primary btn-block">
															Login</button>
													</div>
													<!-- <div class="mt-4 text-center">
														Don't have an account? <a href="register.html">Create
															One</a>
													</div> -->
												</form>
											</div>
										</div>
										<div class="footer">Copyright &copy; 2020 &mdash;Bit155 </div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</c:when>
				<c:otherwise>
				
					<!-- 로그인 됬을때 -->
					  <div class="col-sm-12">
                <div class="alert  alert-success alert-dismissible fade show" role="alert">
                    <span class="badge badge-pill badge-success">Success</span> You successfully read this important alert message.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>


			<!-- 첫번째 차트  -->
            <div class="col-sm-6 col-lg-3">
               <div class="card text-white bg-flat-color-1">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                          <!--   <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton1" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div> -->
                            <img src="./custom/images/user.svg" width="50px" height="50px"
									style="margin-top: 5px;">
                            
                            
                        </div>
                        <h4 class="mb-0">
                            <span class="count" id="chart1"></span>
                        </h4>
                        <p class="text-light">총 사원수</p>

                       <%--  <div class="chart-wrapper px-0" style="height:70px;" height="70">
                            <canvas id="widgetChart1"></canvas>
                        </div> --%>

                    </div>

                </div>
            </div>
            <!--/.col-->

		<!-- 두번째 차트  -->
             <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-2">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                           <!--  <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton2" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div> -->
                              <img src="./custom/images/money.svg" width="50px" height="50px"
									style="margin-top: 5px;">
                        </div>
                        <h4 class="mb-0">
                            <span class="count" id="chart2"></span>
                        </h4>
                        <p class="text-light">평균 연봉</p>
<%-- 
                        <div class="chart-wrapper px-0" style="height:70px;" height="70">
                            <canvas id="widgetChart2"></canvas>
                        </div> --%>

                    </div>
                </div>
            </div>
            <!--/.col-->


			<!-- 세번째 차트  -->
             <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-3">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                           <!--  <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton3" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div> -->
                                <img src="./custom/images/department.svg" width="50px" height="50px"
									style="margin-top: 5px;">
                        </div>
                        <h4 class="mb-0">
                            <span class="count" id="chart3"></span>
                        </h4>
                        <p class="text-light">부서 수</p>

                    </div>

                    <%-- <div class="chart-wrapper px-0" style="height:70px;" height="70">
                        <canvas id="widgetChart3"></canvas>
                    </div> --%>
                </div>
            </div>
            <!--/.col-->


			<!-- 네번째 차트  -->
            <div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-4">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                           <!--  <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton4" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton4">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div> -->
                                 <img src="./custom/images/job.svg" width="50px" height="50px"
									style="margin-top: 5px;">
                        </div>
                        <h4 class="mb-0">
                            <span class="count" id="chart4"></span>
                        </h4>
                        <p class="text-light">직업 종류 수</p>

                      <%--   <div class="chart-wrapper px-3" style="height:70px;" height="70">
                            <canvas id="widgetChart4"></canvas>
                        </div> --%>

                    </div>
                </div>
            </div>
		
		<div>
	
		</div>
		<c:set var="list" value="${requestScope.listChart}" />
		<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.job}</td>
						<td>${e.salAvg}</td>
					</tr>
				</c:forEach>
		
				</c:otherwise>
			</c:choose>
		</div>
		<!-- /content -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->
	
	
	<!-- 차트시작  -->
	




<script>
window.onload = function() {
	
	callAjax();
	
	function callAjax() {
		console.log("여긴오냐")
		$.ajax({
			url : "EmpChart.do", 
			type : 'POST',
			cache : false,
			dataType : 'json',
			success : function(data) {
				console.log("empTotal " + data[0].empTotal);
				console.log("empSalAvg " + data[0].empSalAvg);
				console.log("deptTotal " + data[0].deptTotal);
				console.log("empJobTotal " + data[0].empJobTotal);
				$('#chart1').text(data[0].empTotal);
				$('#chart2').text(data[0].empSalAvg);
				$('#chart3').text(data[0].deptTotal);
				$('#chart4').text(data[0].empJobTotal);
				
				 $('.count').each(function () {
				    	console.log("ss")
				       /* $(this).prop('Counter',0).animate({*/
				    	 $(this).prop('Counter',0).animate({
				            Counter: $(this).text()
				        }, {
				            duration: 3000,
				            easing: 'swing',
				            step: function (now) {
				                $(this).text(Math.ceil(now));
				            }
				        });
				    });
				
				
				

			},
			error : function(request, status, error) {
				 /* alert("code:"+request.status+"\n"+"error:"+error); */

			}
		})
	}
	 
}

</script>

 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script src="./vendors/jquery/dist/jquery.min.js"></script>
	<script src="./vendors/popper.js/dist/umd/popper.min.js"></script>
	<script src="./vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="./assets/js/main.js"></script>

	
	<script src="./assets/js/widgets.js"></script>
	
	<script src="./vendors/jqvmap/dist/jquery.vmap.min.js"></script>
	<script src="./vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<script src="./vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<!-- 로그인  -->
	<script src="./custom/js/my-login.js"></script>


	

</body>

</html>
