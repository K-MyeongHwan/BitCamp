<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- 게시판 디자인 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script>

let plenty = 0;
let some = 0;
let few = 0;
let empty = 0;
let none = 0;

$(function () {
		$.ajax(
				 {
					 type:"post",
					 url:"chartViewok.do",
					 dataType:"json", //POINT
					 success:function(data){
						 
						console.log("job : " + data[0].job); 
						console.log("sal : " + data[0].sal); 
						
						 var ctx = $('#myChart').get(0).getContext("2d");
			                var myChart = new Chart(ctx, {
			                    type: 'horizontalBar',//차트타입
			                    data: {
			                        labels: ["PRESIDEMT", "ANALYST", "MANAGER", "SALESMAN", "CLERK"], //차트에 들어갈 라벨명
			                        datasets: [{
			                            data: [Number(data[0].sal), Number(data[1].sal), Number(data[2].sal), Number(data[3].sal), Number(data[4].sal)],
			                            labels: ["PRESIDEMT", "ANALYST", "MANAGER", "SALESMAN", "CLERK"],
			                            backgroundColor: [
			                                'rgba(244,99,132,0.2)',
			                                'rgba(54,162,235,0.2)',
			                                'rgba(255,206,86,0.2)',
			                                'rgba(75,192,192,0.2)',
			                                'rgba(153,102,255,0.2)',
			                                'rgba(255,159,64,0.2)',
			                            ],
			                            hoverBorderWidth:[
			                                '5',
			                                '5',
			                                '5',
			                                '5',
			                                '5'

			                            ],
			                            hoverBackgroundColor:[
			                                'rgba(244,99,135)',
			                                'rgba(54,162,232)',
			                                'rgba(255,206,8)',
			                                'rgba(75,192,193)',
			                                'rgba(153,20.75)',
			                                'rgba(255,159,5)',
			                            ]

			                        }],
			                        
			                    },
			                    options: { //타이틀 속성 부여
			                                title: {
			                                    display: true,
			                                    text: "직업별 평균 급여",
			                                    position: 'top',
			                                    fontsize: 1000,
			                                    
			                                },
			                                
			                             /*    legend:{
	                                        	display:true,
	                                        	position: 'top',
	                                        	 labels: ["plenty", "some", "few", "empty", "none"],
	                                        	  //차트에 들어갈 라벨명
	                                        } */
	                                   
			                                
			                            }
			                });
						
						
						
						
					 },
					 error:function(request,status,error){
						    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						   }
						}); 
						
					

				 });//function(data) 끝
				 

   
</script>




</head>
<body>
	<jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include>
	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>
		<!-- /Header -->
		<c:set var="list" value="${requestScope.list}" />


		<h1>chartView.jsp</h1>
		
		 <div style="width: 85%">
        <canvas id="myChart"></canvas></div>
        
		<%-- <jsp:include page="/kchart.html"></jsp:include> --%>
		
	</div>



</body>
</html>
