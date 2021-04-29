<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- j쿼리 cdn -->
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>


$(function() {    //화면 다 뜨면 시작

		console.log("함수실행");

		getcategorytop();
});


function getcategorytop(){
	
	console.log("카테고리 대");
	
	$.ajax(
			{
		
				url:"GetCategoryOk.ajax",
				type:"get",
				dataType:"json",

				success:function(responsedata){
					
					console.log("이제 대분류카테고리를 뿌려준다");
					console.log(responsedata);
				
					$("#top").append("<option id='defualt'>대분류</option>");
					
					$.each(responsedata,function(index,obj){
						
						$("#top").append(
        					"<option id='category_t"+obj.t_num+"' value="+obj.t_num+">"
        					+obj.t_name + "</option>"	
        				);
						
					}); 					
					
				},
				error:function(xhr){
					console.log(xhr);
				}
				
		}
	);
	
	
}



function getcategorymiddle(){
	
		
	console.log("카테고리 중");
	
	let index = $("#top option:selected").val();
	console.log(index);
	
	$.ajax(
			{
		
				url:"GetCategoryMBOk.ajax",
				type:"get",
				dataType:"json",
				data:{ c_number : index},
				success:function(responsedata){
					
					console.log("이제 중분류카테고리를 뿌려준다");
					console.log(responsedata);
					
					$("#middle").empty();
					$("#middle").append("<option id='defualt'>중분류</option>");
				        					
					$.each(responsedata,function(index,obj){
						
						$("#middle").append(
        						"<option id='category_n"+obj.n_num+"' value="+obj.m_num+">"+obj.m_name + "</option>"	
        				);
					
					});
				
					
				},
				error:function(xhr){
					console.log(xhr);
				}
				
		}
	);
	
	
}
	
	
function getcategorybottom(){

	console.log("카테고리 소");
	
	let index = $("#middle option:selected").val();
	console.log(index);
	
	$.ajax(
			{
		
				url:"GetCategoryMBOk.ajax",
				type:"get",
				dataType:"json",
				data:{ c_number : index},
				success:function(responsedata){
					
					
					
					console.log("이제 소분류카테고리를 뿌려준다");
					console.log(responsedata);
					
					$("#bottom").empty();
					$("#bottom").append("<option id='defualt'>소분류</option>");
				        					
					$.each(responsedata,function(index,obj){
						
						$("#bottom").append(
        						"<option id='category_n"+obj.b_num+"' value="+obj.b_num+">"+obj.b_name + "</option>"	
        				);
					
					});
									
					
				},
				error:function(xhr){
					console.log(xhr);
				}
				
		}
	);
	
	
}

//소분류 정하면 맞는 상품 불러오기
function getselectedproduct(){
	
	console.log("카테고리 검색 실행");
	
	$("#defaultorder").css("display","none");
	$("#categoryorder").css("display","flex");
	
	let t_val = $("#top option:selected").val();
	let m_val = $("#middle option:selected").val();
	let b_val = $("#bottom option:selected").val();
	
	
	
	$("#bodywrap").empty();
	
	
	$("#test").append(
			"<p>"+ $("#bottom option:selected").text() +"</p>"		
		);
	
	
	$("#bodywrap").append(
	"<div id='content'><div id='ordermenu'><p>오늘의 추천 </p><ul id='defaultorder'>"+
"<li><input type='button' value='최신순' onclick='orderbytime()' id='timebtn' class='unclickedbtn'></li>"+
"<li><input type='button' value='가격순' onclick='orderbyprice()' id='pricebtn' class='unclickedbtn'></li></ul>"+

"<ul id='categoryorder'>"+
"<li><input type='button' value='최신순' onclick='c_orderbytime()' id='timebtn' class='unclickedbtn'></li>"+
"<li><input type='button' value='가격순' onclick='c_orderbyprice()' id='pricebtn' class='unclickedbtn'></li>"+
"</ul></div><ul class='productlist'></ul>");
	
	console.log("분류에 맞는 상품을 불러옵니다");
	let index = $("#bottom option:selected").val();
	console.log(index);
	
	$("#defaultorder").css("display","none");
	$("#categoryorder").css("display","flex");
	
	$.ajax(
			{
		
				url:"GetSelectedProductOk.ajax",
				type:"get",
				dataType:"json",
				data:{ c_number : index},
				success:function(responsedata){
					
					console.log("이제 소분류카테고리를 뿌려준다 여긴 다른페이지");
					console.log(responsedata);
					
					$(".productlist").empty();
					
					getlist(responsedata);
				
					
				},
				error:function(xhr){
					console.log(xhr);
				}
				
		}
	);
	


}
//카테고리별 최신순 정렬
function c_orderbytime(){
	
	$("#timebtn").addClass("clickedbtn");
	$("#timebtn").removeClass("unclickedbtn");
	
	$("#pricebtn").removeClass("clickedbtn");
	$("#pricebtn").addClass("unclickedbtn");
	
	console.log("최신순정렬");
	
	$.ajax(
			
			{	
				url:"C_ProductOrderOk.ajax",
				type:"post",
				dataType:"json",
				data: { keyword : $("#bottom option:selected").val(),
						type: "time"},
				success:function(responsedata){
					console.log(responsedata);
						$(".productlist").empty();
					       					
						getlist(responsedata);
						
					
				},
				error:function(xhr){
					console.log(xhr);
				}
			}
			
		);
	
}

//카테고리별 가격순 정렬
function c_orderbyprice(){
	
	$("#pricebtn").addClass("clickedbtn");
	$("#pricebtn").removeClass("unclickedbtn");
	
	$("#timebtn").removeClass("clickedbtn");
	$("#timebtn").addClass("unclickedbtn"); 
	
	console.log("가격순정렬");
	
	$.ajax(
			
			{	
				url:"C_ProductOrderOk.ajax",
				type:"post",
				dataType:"json",
				data: { keyword :$("#bottom option:selected").val(),
					type:"price"},
				success:function(responsedata){
					console.log(responsedata);
						$(".productlist").empty();
					       					
						getlist(responsedata);       						
					
				},
				error:function(xhr){
					console.log(xhr);
				}
			}
			
		);
	
}


   
</script>

<div class="nav-item">
            <div class="container">
                <div class="nav-depart">

                        <div id="selectionarea">

                        <select id="top" onchange="getcategorymiddle()" class="c_selection" name="top">
							
                        </select>
                        
                        <select id="middle" onchange="getcategorybottom()" class="c_selection" name="middle">
							<option>중분류</option>
                        </select>
                        
                        <select id="bottom" onchange="getselectedproduct()" class="c_selection" name="bottom">
							<option>소분류</option>
                        </select>
                        </div>

                </div>
               

                <div id="mobile-menu-wrap"></div>
            </div>
        </div>