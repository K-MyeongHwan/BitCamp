package kr.or.bit.dao;




import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


//CRUD 함수 > ConnectionPool > 함수단위 연결 ,받환 
public class SecondHandsDAO {
	DataSource ds = null;

	public SecondHandsDAO() {
		Context context;
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 로그인체크 함수 -태희-
	public String getLoginOk(String email, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			String sql = "select storename from member where m_email=? and m_pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {// 참이면
				return rs.getString(1);
			} else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return null;
	}

	// 이메일 중복체크 - 태희
	public boolean getEmailCheck(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			String sql = "select * from member where m_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {// 참이면
				System.out.println("이미 존재하는 이메일");
				return false;
			} else {
				System.out.println("사용가능한 이메일");
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return true;
	}

	// storename 중복체크 - hyunjin
	public boolean getNameCheck(String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from member where storename=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);
			rs = pstmt.executeQuery();

			if (rs.next()) {// 참이면
				System.out.println("닉네임존재");
				return false;
			} else {
				System.out.println("닉네임존재X");
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 회원가입 insert 하기 - 명환

	   public int registerInsert(String email, String password, String name, String shopname, String phone) {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      int result = 0;
		      try {
		         conn = ds.getConnection();
		         String sql = "insert into member(storename, m_name, m_phone, m_email, m_pwd, m_profile) values(?,?,?,?,?,null)";
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, shopname);
		         pstmt.setString(2, name);
		         pstmt.setString(3, phone);
		         pstmt.setString(4, email);
		         pstmt.setString(5, password);

		         result = pstmt.executeUpdate();
		         System.out.println(result);

		      } catch (Exception e) {
		         System.out.println(e.getStackTrace());
		      } finally {
		         try {
		            conn.close();
		            pstmt.close();
		         } catch (Exception e2) {
		            System.out.println(e2.getStackTrace());
		         }
		      }

		      return result;
		   }

	//메인에 뿌려줄 상품 리스트 뽑기 -태희-
	public JSONArray getProductList() { 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs=null;
	      JSONArray arr = new JSONArray();
	      
	      System.out.println("리스트 함수 실행");
	      
	      try {
	         conn=ds.getConnection();
	         
	         //String sql = "select * from member";
	         
	         String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time, p.p_num, p.storename "
	               +"from product p left join product_img pi "
	               +"on p.p_num=pi.p_num "
	               +"where pi.pimg_num=1 and p.p_status=1";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         rs= pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	       	 
	            JSONObject obj = new JSONObject();
	            obj.put("pimg_name",rs.getString("pimg_name"));
	            obj.put("p_subj",rs.getString("p_subj"));
	            obj.put("p_price",rs.getInt("p_price"));
	            obj.put("p_num",rs.getInt("p_num"));
	            obj.put("storename",rs.getString("storename"));
	            //시간 자르려고 substring 사용
	            obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
	            arr.add(obj);
	            
	         } 
	         System.out.println(arr);
	         
	      
	         
	      } catch (SQLException e) {
	         // TODO: handle exception
	         System.out.println("SQLException" + e.getMessage());
	      }catch(Exception e3) {
	         System.out.println(e3.getMessage());
	      }
	      finally {
	         try {
	            rs.close();
	            pstmt.close();
	            conn.close();//반환하기
	         } catch (Exception e2) {
	            System.out.println(e2.getMessage());
	         }
	      }
	      return arr;
	   }
	
	   //내 상품 리스트 뽑기 가희
	   public JSONArray getMyProductList(String storename) { 
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs=null;
	         JSONArray arr = new JSONArray();
	         try {
	            conn=ds.getConnection();
	            
	            //sql 바꾸고
	            String sql =  "select p.p_num, pi.pimg_name, p.p_subj, p.p_price, p.p_wr_time, p.storename "
	            		 +"from product p left join product_img pi "
	            		 +"on p.p_num=pi.p_num "
	            		 +"where pi.pimg_num=1 and p.storename=?";
	            
	            pstmt = conn.prepareStatement(sql);
	            //물음표 지정시켜주고
	            pstmt.setString(1, storename);
	            
	            rs= pstmt.executeQuery();
	            
	            //쿼리 결과값 뽑기
	            while(rs.next()) {
	               JSONObject obj = new JSONObject();
	               obj.put("pimg_name",rs.getString("pimg_name"));
	               obj.put("storename",rs.getString("storename"));
	               obj.put("p_subj",rs.getString("p_subj"));
	               obj.put("p_price",rs.getInt("p_price"));
	               obj.put("p_num",rs.getInt("p_num"));
	               //시간 자르려고 substring 사용
	               obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
	               
	               System.out.println(obj);
	               //상품하나씩 배열에 넣는다.
	               arr.add(obj);
	            } 
	            //여기까지
	            System.out.println(arr); 
	         } catch (SQLException e) {
	            // TODO: handle exception
	        	 e.printStackTrace();
	         }catch(Exception e3) {
	        	 e3.printStackTrace();
	         }
	         finally {
	            try {
	               rs.close();
	               pstmt.close();
	               conn.close();//반환하기
	            } catch (Exception e2) {
	            	e2.printStackTrace();
	            }
	         }
	         //내 상품들이 들어가있는 배열.
	         //상품들의 개수는 배열크기를 통해 알수 있다.
	         System.out.println("arr list = " + arr.size());
	         return arr;
	      }
	   
	   
	// 찜 리스트 출력
		public JSONArray getMyLikeList(String storename) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			JSONArray arr = new JSONArray();
			try {
				conn = ds.getConnection();

				String sql = "select p.p_num, pi.pimg_name, p.p_subj, p.p_price, p.p_wr_time " + "from product p join "
						+ "(select p_num, storename from likelist where storename=?) ll " + "on p.p_num = ll.p_num "
						+ "join product_img pi " + "on ll.p_num=pi.p_num and pimg_num=1";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, storename);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd");

					JSONObject obj = new JSONObject();
					obj.put("pimg_name", rs.getString("pimg_name"));
					obj.put("p_subj", rs.getString("p_subj"));
					obj.put("p_price", rs.getInt("p_price"));
					obj.put("p_num", rs.getInt("p_num"));
					// 시간 자르려고 substring 사용
					obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));

					System.out.println(obj);
					// 상품하나씩 배열에 넣는다.
					arr.add(obj);
				}
				System.out.println(arr);
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (Exception e3) {
				e3.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();// 반환하기
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			// 내 상품들이 들어가있는 배열.
			// 상품들의 개수는 배열크기를 통해 알수 있다.
			System.out.println("arr list = " + arr.size());
			return arr;
		}

		//내상점의 리뷰 리스트 출력 - 태희 - 
		   public JSONArray getMyReviewList(String storename) { 
			   // [리뷰 작성자], [프로필사진], [별점] , [구매 상품 제목(링크) ] , [ 글 내용 ], [후기 사진] [날짜]
		         Connection conn = null;
		         PreparedStatement pstmt = null;
		         ResultSet rs=null;
		         JSONArray arr = new JSONArray();
		         try {
		            conn=ds.getConnection();
		            
		            //String sql = "select * from member";
		            
			            String sql =  "select r.rv_num, r.p_num, r.storename as writer, p.storename as seller, m.m_profile, p.p_subj, r.rv_star, r.rv_content, ri.rimg_name, r.rv_date "
			            		+"from review r join member m " 
			            		+"on r.storename = m.storename "
		                        +"join product p "
		                        +"on r.p_num = p.p_num "
		                        +"join review_img ri "
		                        +"on r.rv_num = ri.rv_num "
			            		+"where p.storename = ?"
		                        +"order by rv_num desc";
		            
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, storename);
		            
		            rs= pstmt.executeQuery();	            
		            while(rs.next()) {

		               
		               JSONObject obj = new JSONObject();
		               obj.put("rv_num", rs.getInt("rv_num"));
		               obj.put("p_num", rs.getInt("p_num"));
		               obj.put("writer", rs.getString("writer"));
		               obj.put("seller", rs.getString("seller"));
		               obj.put("m_profile", rs.getString("m_profile"));
		               obj.put("p_subj", rs.getString("p_subj"));
		               obj.put("rv_star", rs.getInt("rv_star"));
		               obj.put("rv_content", rs.getString("rv_content"));
		               obj.put("rimg_name", rs.getString("rimg_name"));
		               //시간 자르려고 substring 사용
		               obj.put("rv_date",  rs.getString("rv_date").substring(0, 11));
		               
		               System.out.println(obj);
		               //상품하나씩 배열에 넣는다.
		               arr.add(obj);
		            } 
		            System.out.println(arr); 
		         } catch (SQLException e) {
		            // TODO: handle exception
		        	 e.printStackTrace();
		         }catch(Exception e3) {
		        	 e3.printStackTrace();
		         }
		         finally {
		            try {
		               rs.close();
		               pstmt.close();
		               conn.close();//반환하기
		            } catch (Exception e2) {
		            	e2.printStackTrace();
		            }
		         }
		         //내 상품들이 들어가있는 배열.
		         //상품들의 개수는 배열크기를 통해 알수 있다.
		         return arr;
		      }
		 //내상점의 리뷰 리스트 출력 -태희-
		   public int deleteMyReview(String rv_num) { 
			   // [리뷰 작성자], [프로필사진], [별점] , [구매 상품 제목(링크) ] , [ 글 내용 ], [후기 사진] [날짜]
		         Connection conn = null;
		         PreparedStatement pstmt = null;
		         int rs=0;
		         try {
		            conn=ds.getConnection();
		            
		            //String sql = "select * from member";
		            
		            String sql = "delete from review where rv_num=?";
		            
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, rv_num);
		            
		            rs= pstmt.executeUpdate();	            
		            
		         } catch (SQLException e) {
		            // TODO: handle exception
		        	 e.printStackTrace();
		         }catch(Exception e3) {
		        	 e3.printStackTrace();
		         }
		         finally {
		            try {
		               pstmt.close();
		               conn.close();//반환하기
		            } catch (Exception e2) {
		            	e2.printStackTrace();
		            }
		         }
		         //내 상품들이 들어가있는 배열.
		         //상품들의 개수는 배열크기를 통해 알수 있다.
		         return rs;
		      }
		   
		   //리뷰 내역있는지 체크 -태희-
		   public JSONArray getReviewCheck(String storename) { 
			   // [구매번호], [상품번호], [상품사진], [상품 제목], [가격], [구매자], [판매자], [구매날짜], []
		         Connection conn = null;
		         PreparedStatement pstmt = null;
		         ResultSet rs=null;
		         JSONArray arr = new JSONArray();
		         try {
		            conn=ds.getConnection();
		            
		            //String sql = "select * from member";
		            
			            String sql =  "select buy_num from review where storename=?";
		            
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, storename);
		            
		            rs= pstmt.executeQuery();	            
		            while(rs.next()) {
		            	JSONObject obj = new JSONObject();
		            	obj.put("buy_num", rs.getInt("buy_num"));
		            	arr.add(obj);
		            } 
		            System.out.println(arr); 
		         } catch (SQLException e) {
		            // TODO: handle exception
		        	 e.printStackTrace();
		         }catch(Exception e3) {
		        	 e3.printStackTrace();
		         }
		         finally {
		            try {
		               rs.close();
		               pstmt.close();
		               conn.close();//반환하기
		            } catch (Exception e2) {
		            	e2.printStackTrace();
		            }
		         }
		         //내 상품들이 들어가있는 배열.
		         //상품들의 개수는 배열크기를 통해 알수 있다.
		         return arr;
		      }
	   
	   //구매내역 뽑기 -태희-
	   public JSONArray getBuyList(String storename) { 
		   // [구매번호], [상품번호], [상품사진], [상품 제목], [가격], [구매자], [판매자], [구매날짜], []
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs=null;
	         JSONArray arr = new JSONArray();
	         try {
	            conn=ds.getConnection();
	            
	            //String sql = "select * from member";
	            
		            String sql =  "select b.buy_num, b.p_num,pi.pimg_name, p.p_subj,"
		            		+"nvl(p.p_price,0) as p_price, b.storename_buyer, b.storename_seller, b.buy_date "
		            		+"from buylist b left join product p "
		            		+"on b.p_num = p.p_num "
            				+"join product_img pi "
		            		+"on p.p_num= pi.p_num "
            				+"where pi.pimg_num=1 and b.storename_buyer=? "
            				+"order by b.buy_num desc";
	            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, storename);
	            
	            rs= pstmt.executeQuery();	            
	            while(rs.next()) {
	               JSONObject obj = new JSONObject();
	               obj.put("buy_num", rs.getInt("buy_num"));
	               obj.put("p_num", rs.getInt("p_num"));
	               obj.put("pimg_name", rs.getString("pimg_name")); // 이미지 이름
	               obj.put("p_subj", rs.getString("p_subj")); // 상품 제목
	               obj.put("p_price", rs.getInt("p_price")); // 상품 가격
	               obj.put("storename_buyer", rs.getString("storename_buyer")); // 구매자
	               obj.put("storename_seller", rs.getString("storename_seller"));// 판매자
	               //시간 자르려고 substring 사용
	               obj.put("buy_date",  rs.getString("buy_date").substring(0, 11));// 구매날짜
	               
	               System.out.println(obj);
	               //상품하나씩 배열에 넣는다.
	               arr.add(obj);
	            } 
	            System.out.println(arr); 
	         } catch (SQLException e) {
	            // TODO: handle exception
	        	 e.printStackTrace();
	         }catch(Exception e3) {
	        	 e3.printStackTrace();
	         }
	         finally {
	            try {
	               rs.close();
	               pstmt.close();
	               conn.close();//반환하기
	            } catch (Exception e2) {
	            	e2.printStackTrace();
	            }
	         }
	         //내 상품들이 들어가있는 배열.
	         //상품들의 개수는 배열크기를 통해 알수 있다.
	         return arr;
	      }
	   //판매내역 뽑기 -태희-
	   public JSONArray getSellList(String storename) { 
		   // [구매번호], [상품번호], [상품사진], [상품 제목], [가격], [구매자], [판매자], [구매날짜], []
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs=null;
	         JSONArray arr = new JSONArray();
	         try {
	            conn=ds.getConnection();
	            
	            //String sql = "select * from member";
	            
		            String sql =  "select s.sell_num, s.p_num,pi.pimg_name, p.p_subj, nvl(p.p_price,0) as p_price, "
		            		+"s.storename_buyer, s.storename_seller, s.sell_date "
		            		+"from selllist s left join product p "
		            		+"on s.p_num = p.p_num "
		            		+"join product_img pi "
		            		+"on p.p_num= pi.p_num "
		            		+"where pi.pimg_num=1 and s.storename_seller=? "
		            		+"order by s.sell_num desc";
	            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, storename);
	            
	            rs= pstmt.executeQuery();	            
	            while(rs.next()) {
	               JSONObject obj = new JSONObject();
	               obj.put("sell_num", rs.getInt("sell_num"));
	               obj.put("p_num", rs.getInt("p_num"));
	               obj.put("pimg_name", rs.getString("pimg_name")); // 이미지 이름
	               obj.put("p_subj", rs.getString("p_subj")); // 상품 제목
	               obj.put("p_price", rs.getInt("p_price")); // 상품 가격
	               obj.put("storename_buyer", rs.getString("storename_buyer")); // 구매자
	               obj.put("storename_seller", rs.getString("storename_seller"));// 판매자
	               //시간 자르려고 substring 사용
	               obj.put("sell_date",  rs.getString("sell_date").substring(0, 11));// 구매날짜
	               
	               System.out.println(obj);
	               //상품하나씩 배열에 넣는다.
	               arr.add(obj);
	            } 
	            System.out.println(arr); 
	         } catch (SQLException e) {
	            // TODO: handle exception
	        	 e.printStackTrace();
	         }catch(Exception e3) {
	        	 e3.printStackTrace();
	         }
	         finally {
	            try {
	               rs.close();
	               pstmt.close();
	               conn.close();//반환하기
	            } catch (Exception e2) {
	            	e2.printStackTrace();
	            }
	         }
	         //내 상품들이 들어가있는 배열.
	         //상품들의 개수는 배열크기를 통해 알수 있다.
	         return arr;
	      }
	   
	   //리뷰작성 INSERT -태희-
	   public int insertReview(int buy_num, int p_num, String rv_content, int rv_star,  String storename_buyer, String rimg_name, int rimg_size) {
		     Connection conn = null;
	         PreparedStatement pstmt = null;
	         int rs_review=0;
	         int rs_rimg=0;
	         try {
				conn=ds.getConnection();
				conn.setAutoCommit(false);
				
				//String sql = "select * from member";
				
				String in_review = "insert into review(rv_num, buy_num, p_num, rv_content, rv_star,storename) "
				+ "values (rv_num_seq.nextval,?,?,?,?,?)";
				String in_rimg= "insert into review_img(rimg_num, rimg_name, rimg_size, rv_num, buy_num) "
						+"values (rimg_num_seq.nextval,?,?,rv_num_seq.currval,?)";
				    
				    pstmt = conn.prepareStatement(in_review);
				    
				    
				    pstmt.setInt(1, buy_num);
				    pstmt.setInt(2, p_num);
				    pstmt.setString(3, rv_content);
				    pstmt.setInt(4, rv_star);
				    pstmt.setString(5, storename_buyer);
				    rs_review=pstmt.executeUpdate();
				    
				    if(rs_review>0) {
				    pstmt.close();
				    
				    pstmt = conn.prepareStatement(in_rimg);
				    pstmt.setString(1, rimg_name);
				    pstmt.setInt(2, rimg_size);
				    pstmt.setInt(3, buy_num);
				    
				    
				    rs_rimg= pstmt.executeUpdate();	  
				    }
				    
				    if(rs_rimg>0) {
				    	conn.commit();
				    }
				    
				   return rs_rimg;
				    
				    
	         } catch (SQLException e) {
	            // TODO: handle exception
	        	 e.printStackTrace();
	         }catch(Exception e3) {
	        	 e3.printStackTrace();
	         }
	         finally {
	            try {
	               pstmt.close();
	               conn.close();//반환하기
	            } catch (Exception e2) {
	            	e2.printStackTrace();
	            }
	         }
	         //내 상품들이 들어가있는 배열.
	         //상품들의 개수는 배열크기를 통해 알수 있다.
	         return 0;
	     
	   }
	   /*
	// 페이지 이동시 카테고리 유지시켜주는 함수 -가희-
	public JSONObject setCategory(int p_num) {

		JSONObject obj = new JSONObject();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		try {
			conn = ds.getConnection();
			String sql = "select b.b_num, m.m_num, t.t_num  from category_top t inner join category_middle m "
					+ "on t.t_num = m.t_num left outer join "
					+ "category_bottom b on b.m_num = m.m_num left outer join " + "product p on p.b_num = b.b_num "
					+ "where p.p_num =" + p_num;

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				obj.put("b_num", rs.getInt("b_num"));
				obj.put("m_num", rs.getInt("m_num"));
				obj.put("t_num", rs.getInt("t_num"));

				System.out.println("제이슨 객체 : " + obj);

			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return obj;
	}
	*/
	 //최신순 가격순 정렬 -가희-
	public JSONArray getProductListByOrder(String keyword) { 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs=null;
	      JSONArray arr = new JSONArray();
	      
	      System.out.println("리스트 함수 실행");
	      
	      try {
	         conn=ds.getConnection();
	         
	         //String sql = "select * from member";
	         
	         String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time, p.p_num, p.storename "
	               +"from product p left join product_img pi "
	               +"on p.p_num=pi.p_num "
	               +"where pi.pimg_num=1 and p.p_status=1 ";
	         
	         if(keyword.equals("p.p_price")) {
	        	 System.out.println("가격순");
	        	 
	        	 sql += "order by "+keyword;
	        	 
	         } else {
	        	 System.out.println("최신순");
	        	 sql += "order by "+keyword+" desc";
	         }
	              
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         rs= pstmt.executeQuery();
	         System.out.println("쿼리문 : "+ sql);
	         while(rs.next()) {
	        	       	 
	            JSONObject obj = new JSONObject();
	            obj.put("pimg_name",rs.getString("pimg_name"));
	            obj.put("p_subj",rs.getString("p_subj"));
	            obj.put("p_price",rs.getInt("p_price"));
	            obj.put("p_num",rs.getInt("p_num"));
	            obj.put("storename",rs.getString("storename"));
	            //시간 자르려고 substring 사용
	            obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
	            arr.add(obj);
	            
	         } 
	         System.out.println(arr);
	         
	      
	         
	      } catch (SQLException e) {
	         // TODO: handle exception
	         System.out.println("SQLException" + e.getMessage());
	      }catch(Exception e3) {
	         System.out.println(e3.getMessage());
	      }
	      finally {
	         try {
	            rs.close();
	            pstmt.close();
	            conn.close();//반환하기
	         } catch (Exception e2) {
	            System.out.println(e2.getMessage());
	         }
	      }
	      return arr;
	   }

	// 검색하는 함수 (가희)
	public JSONArray searchProduct(String keyword) {
		System.out.println("k : " + keyword);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		try {
			conn = ds.getConnection();

			String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time,p.p_num, p.storename, p.p_status"
					+ "	from product p left join product_img pi  on p.p_num=pi.p_num"
					+ " where (p.p_status=1 and pi.pimg_num=1) and (p.p_subj Like '%"+keyword+"%' or p.p_content Like '%"+keyword+"%')";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				obj.put("pimg_name", rs.getString("pimg_name"));
				obj.put("p_subj", rs.getString("p_subj"));
				obj.put("p_price", rs.getInt("p_price"));
				obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
				obj.put("p_num", rs.getInt("p_num"));
				obj.put("storename", rs.getString("storename"));

				System.out.println("제이슨 객체 : " + obj);

				arr.add(obj);
			}
			System.out.println("배열 : " + arr);

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	//검색 후 최신순 정렬(가희)
			public JSONArray ProductOderByTime(String keyword){
				System.out.println("k : " + keyword);
				 Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs=null;
			      JSONArray arr = new JSONArray();
			      
			      
			      try {
			         conn=ds.getConnection();
			         String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time,p.p_num, p.storename, p.p_status"
			         		+ "	from product p left join product_img pi  on p.p_num=pi.p_num"
			         		+ " where (p.p_status=1 and pi.pimg_num=1) and (p.p_subj Like '%"+keyword+"%' or p.p_content Like '%"+keyword+"%') "
			               +"order by p.p_wr_time desc";
			         pstmt = conn.prepareStatement(sql);
			         
			         rs = pstmt.executeQuery();
			         
			         while(rs.next()) {
			        	 
			            JSONObject obj = new JSONObject();
			            
			            obj.put("pimg_name",rs.getString("pimg_name"));
			            obj.put("p_subj",rs.getString("p_subj"));
			            obj.put("p_price",rs.getInt("p_price"));
			            obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
			            obj.put("p_num",rs.getInt("p_num"));
			            obj.put("storename",rs.getString("storename"));
			            
			            System.out.println("제이슨 객체 : "+obj);
			            
			            arr.add(obj);
			         } 

			         
			      
			         
			      } catch (SQLException e) {
			         // TODO: handle exception
			         System.out.println(e.getMessage());
			      }catch(Exception e3) {
			         System.out.println(e3.getMessage());
			      }
			      finally {
			         try {
			            rs.close();
			            pstmt.close();
			            conn.close();//반환하기
			         } catch (Exception e2) {
			            System.out.println(e2.getMessage());
			         }
			      }
			      return arr;
			}

			//검색 후 가격순 정렬 가희
			public JSONArray ProductOderByPrice(String keyword){
				System.out.println("k : " + keyword);
				 Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs=null;
			      JSONArray arr = new JSONArray();
			      
			      
			      try {
			         conn=ds.getConnection();
			         String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time,p.p_num, p.storename, p.p_status"
				         		+ "	from product p left join product_img pi  on p.p_num=pi.p_num"
				         		+ " where (p.p_status=1 and pi.pimg_num=1) and (p.p_subj Like '%"+keyword+"%' or p.p_content Like '%"+keyword+"%') "
				               +"order by p.p_price";
			         pstmt = conn.prepareStatement(sql);
			         
			         rs = pstmt.executeQuery();
			         
			         while(rs.next()) {
			        	 
			            JSONObject obj = new JSONObject();
			            
			            obj.put("pimg_name",rs.getString("pimg_name"));
			            obj.put("p_subj",rs.getString("p_subj"));
			            obj.put("p_price",rs.getInt("p_price"));
			            obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
			            obj.put("p_num",rs.getInt("p_num"));
			            obj.put("storename",rs.getString("storename"));
			            
			            System.out.println("제이슨 객체 : "+obj);
			            
			            arr.add(obj);
			         } 
			         System.out.println("배열 : " +arr);

			         
			      
			         
			      } catch (SQLException e) {
			         // TODO: handle exception
			         System.out.println(e.getMessage());
			      }catch(Exception e3) {
			         System.out.println(e3.getMessage());
			      }
			      finally {
			         try {
			            rs.close();
			            pstmt.close();
			            conn.close();//반환하기
			         } catch (Exception e2) {
			            System.out.println(e2.getMessage());
			         }
			      }
			      return arr;
			}

	// storename의 프로필사진 파일이름을 넘겨준다. -태희-
	public String MyShopProfile(String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			// 프로필사진파일 이름 얻기
			String sql = "select m_profile " + "from member " + "where storename=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getString("m_profile");
			}

			// 상품 전체개수 얻기
//		         sql="select count(*)as cnt "
//		         		+ "from product "
//		         		+ "group by storename having storename=?";
//		         pstmt = conn.prepareStatement(sql);
//		         pstmt.setString(1, (String)obj.get("storename"));
//		         
//		         
//		         rs=pstmt.executeQuery();
//		         
//		         if(rs.next()) {
//		        	 obj.put("p_count", rs.getString("cnt"));
//		         }
//
//		         System.out.println(obj.toString());

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	// 카테고리 목록 불러오기(대)
	public JSONArray getCategory() {

		System.out.println("대 불러오기");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		try {
			conn = ds.getConnection();
			String sql = "select t_num, t_name " + "from category_top " + "order by t_num";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				obj.put("t_num", rs.getString("t_num"));
				obj.put("t_name", rs.getString("t_name"));
				/*
				 * System.out.println("제이슨 객체 : "+obj);
				 */
				arr.add(obj);
			}
			/*
			 * System.out.println("배열 : " +arr);
			 */

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	// 카테고리 목록 불러오기(중소) -가희-
	public JSONArray getCategory(String c_number) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		try {

			int c_num = Integer.parseInt(c_number);
			conn = ds.getConnection();

			String sql = "";

			// 중분류
			if (c_num % 100 == 0) {

				sql += "select m_num, m_name " + "from category_middle " + "where t_num=" + c_num + "order by m_num";
				// 소분류
			} else {

				sql += "select b_num, b_name " + "from category_bottom " + "where m_num=" + c_num + "order by b_num";

			}

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				if (c_num % 100 == 0) {

					obj.put("m_num", rs.getString("m_num"));
					obj.put("m_name", rs.getString("m_name"));

				} else {

					System.out.println("소분류 else문을 타나요?");
					obj.put("b_num", rs.getString("b_num"));
					obj.put("b_name", rs.getString("b_name"));
				}

				System.out.println("제이슨 객체 : " + obj);

				arr.add(obj);
			}
			System.out.println("배열 : " + arr);

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	// 카페고리에 맞는 상품 불러오기 -가희-
	public JSONArray getSelectedProduct(String index) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		System.out.println("카테고리로 불러오기 함수 실행");

		try {
			conn = ds.getConnection();
			int c_num = Integer.parseInt(index);
			// String sql = "select * from member";

			String sql = "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time, p.p_num, p.storename "
					+ "from product p left join product_img pi " + "on p.p_num=pi.p_num " + "where (p.p_status=1 and pi.pimg_num=1) and p.b_num=" + c_num;

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			System.out.println("re next : " + rs.next());

			while (rs.next()) {

				JSONObject obj = new JSONObject();
				obj.put("pimg_name", rs.getString("pimg_name"));
				obj.put("p_subj", rs.getString("p_subj"));
				obj.put("p_price", rs.getInt("p_price"));
				obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
				obj.put("p_num", rs.getInt("p_num"));
				obj.put("storename", rs.getString("storename"));

				System.out.println(obj);
				arr.add(obj);

			}
			System.out.println(arr);

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException" + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	//카페고리에 맞는 상품 불러와서 정렬하기 -가희
	public JSONArray C_ProductOder(String keyword, String type) { 
		
		  
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs=null;
	      JSONArray arr = new JSONArray();
	      
	      System.out.println("카테고리로 불러오고 정렬하는 함수 실행");
	      
	      try {
	         conn=ds.getConnection();
	         int c_num = Integer.parseInt(keyword);
	         //String sql = "select * from member";
	         String sql = "";
	         
	         if(type.equals("time")) {
	        	 sql += "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time, p.p_num, p.storename "
			               +"from product p left join product_img pi "
			               +"on p.p_num=pi.p_num "
			               +"where (p.p_status=1 and pi.pimg_num=1) and"
			               + " p.b_num=" + c_num
			               +"order by p.p_wr_time desc";
	         }else {
	        	 sql += "select pi.pimg_name, p.p_subj,p.p_price, p.p_wr_time, p.p_num, p.storename "
			               +"from product p left join product_img pi "
			               +"on p.p_num=pi.p_num "
			               +"where (p.p_status=1 and pi.pimg_num=1) and p.b_num=" + c_num
			               +"order by p.p_price";
	         }
	         
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         rs= pstmt.executeQuery();
	         System.out.println("re next : "+rs.next());
	         
	         while(rs.next()) {
	        	 
	        	 
	            JSONObject obj = new JSONObject();
	            obj.put("pimg_name",rs.getString("pimg_name"));
	            obj.put("p_subj",rs.getString("p_subj"));
	            obj.put("p_price",rs.getInt("p_price"));
	            obj.put("p_wr_time", rs.getString("p_wr_time").substring(0, 11));
	            obj.put("p_num",rs.getInt("p_num"));
	            obj.put("storename",rs.getString("storename"));
	            System.out.println(obj);
	            arr.add(obj);

	         } 
	         System.out.println(arr);
	         
	      
	         
	      } catch (SQLException e) {
	         // TODO: handle exception
	         System.out.println("SQLException" + e.getMessage());
	      }catch(Exception e3) {
	         System.out.println(e3.getMessage());
	      }
	      finally {
	         try {
	            rs.close();
	            pstmt.close();
	            conn.close();//반환하기
	         } catch (Exception e2) {
	            System.out.println(e2.getMessage());
	         }
	      }
	      return arr;
	   }


	// 메인에서 선택한 상품번호에 해당하는 상품의 내용 가져오는 함수(가희)
	// 여기서 가져온 정보들을 상품상세페이지에 적당히 뿌려준다
	public JSONObject showProductDetail(int p_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		JSONObject obj = new JSONObject();
		System.out.println("상품 상세페이지 함수 실행");

		try {
			conn = ds.getConnection();

			String sql = "select pi.pimg_name, p.p_subj, p.p_price, p.p_wr_time, p.p_content, p.storename, p.p_num, p.p_addr, p.p_dcharge"
					+ " from product p left join product_img pi " + "on p.p_num=pi.p_num "
					+ "where p.p_num=? and pi.pimg_num=1";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				obj.put("pimg_name", rs.getString("pimg_name"));
				obj.put("p_addr", rs.getString("p_addr"));
				obj.put("p_subj", rs.getString("p_subj"));
				obj.put("p_price", rs.getInt("p_price"));
				obj.put("p_wr_time", rs.getString("p_wr_time"));
				obj.put("p_content", rs.getString("p_content"));
				obj.put("storename", rs.getString("storename"));
				obj.put("p_num", rs.getInt("p_num"));
				obj.put("p_dcharge", rs.getInt("p_dcharge"));

				System.out.println("obj : " + obj);

			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException" + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return obj;
	}

	// 상점 정보 구역에 들어갈 상점 프로필, 상품 갯수, 최근 상품 정보 구하기 위한 쿼리문
	// 회원, 상품, 상품 이미지 세 개의 테이블 조인 - 가희 -
	public JSONArray showShopInfo(String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();
		System.out.println("상품 상세페이지 함수 실행");

		try {
			conn = ds.getConnection();

			String sql = "select m.m_profile, p.p_price, pi.pimg_name, p.p_num, p.storename, m.m_phone from product p inner join "
					+ "product_img pi on p.p_num = pi.p_num left outer join " + "member m on p.storename = m.storename "
					+ "where p.storename=? " + "and ROWNUM <= 2 " + "order by p.p_wr_time desc";

			System.out.println(storename);
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				obj.put("pimg_name", rs.getString("pimg_name"));
				obj.put("p_price", rs.getInt("p_price"));
				obj.put("storename", rs.getString("storename"));
				obj.put("m_profile", rs.getString("m_profile"));
				// 연락하기 때문에 넣어주는 전화번호
				// 근데 타입 에러가 뜬다
				// obj.put("m_phone", Long.toString(rs.getLong("m_phone")));
				obj.put("m_phone", rs.getString("m_phone").trim());

				System.out.println("obj : " + obj);

				arr.add(obj);

			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	// 상품 상세에 들어갈 문의(replay) 불러오는 함수 가희
	public JSONArray getReplayList(int p_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		JSONArray arr = new JSONArray();

		System.out.println(p_num);

		System.out.println("상품 문의 불러오기");

		try {
			conn = ds.getConnection();

			String sql = "select rp_num, p_num, rp_content, rp_date, storename from reply where p_num=?"
					+ " order by rp_num desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				obj.put("rp_num", rs.getInt("rp_num"));
				obj.put("p_num", rs.getInt("p_num"));
				obj.put("rp_content", rs.getString("rp_content"));
				obj.put("rp_date", rs.getString("rp_date"));
				obj.put("storename", rs.getString("storename"));

				System.out.println("obj : " + obj);

				arr.add(obj);

			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	// 상점이름 불러오기 -영훈-
	public void getProductName() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println("상점이름 불러오기");

		try {
			conn = ds.getConnection();
			String sql = "select storename from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

	}

	// 찜하기 함수 -가희-

	public String setLike(String islike, String liker, String p_num) {

		String result = "false";
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		System.out.println("찜하기 함수 실행");

		int p_number = Integer.parseInt(p_num);

		try {
			conn = ds.getConnection();

			// 찜하기 누른 것
			if (islike.equals("true")) {

				sql += "insert into likelist(storename, p_num) values (?,?)";
				result = "true";

				// 찜하기 취소
			} else {
				sql += "delete from likelist where storename=? and p_num=?";

				// islike = "false";
			}
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, liker);
			pstmt.setInt(2, p_number);

			int rs = pstmt.executeUpdate();

			if (rs > 0) {
				System.out.println("찜 수정이 실행되었습니다.");
			} else {
				System.out.println("찜 수정이 실패했습니다.");
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println("Exception : " + e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return result;
	}

	// 상품상세 페이지 이동했을 때 현재 유저가 찜한 상품인지 확인하는 함수 -가희-
	public boolean ChekLike(String currentuser, int p_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println(currentuser);
		System.out.println("상품 상세페이지에 접속한 유저의 정보 불러오기");

		try {
			conn = ds.getConnection();

			String sql = "select p_num from likelist where storename=? and p_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, currentuser);
			pstmt.setInt(2, p_num);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 이 상품의 찜 수 구하기 가희
	public Integer getLikeCounts(int p_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println(p_num);

		System.out.println("찜 개수 불러오기");

		try {
			conn = ds.getConnection();

			String sql = "select storename from likelist where p_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			ArrayList<String> likers = new ArrayList<>();

			while (rs.next()) {

				likers.add(rs.getString("storename"));
				System.out.println("liker의 수 : " + likers.size());

			}

			return likers.size();

		} catch (SQLException e) {
			// TODO: handle exception

			System.out.println("SQLException : " + e.getMessage());

		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return 0;
	}

	// 상품상세페이지에서 상품문의 작성 함수 -가희-
	public Boolean writeReply(int p_num, String storename, String rp_content) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "insert into reply(p_num, storename, rp_content, rp_num) values(?,?,?,rp_num_seq.nextval)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setString(2, storename);
			pstmt.setString(3, rp_content);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 댓글 삭제 함수 가희
	public Boolean deleteReply(int p_num, String storename, int rp_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "delete from reply where storename=? and rp_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);
			pstmt.setInt(2, rp_num);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 댓글 수정 함수 가희
	public Boolean editReply(String rp_content, int rp_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "update reply set rp_content=? where rp_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rp_content);
			pstmt.setInt(2, rp_num);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 구매하면 구매상태 바꿔주는 함수
	public boolean changeStatus(int p_num) {

		Connection conn = null;

	      PreparedStatement pstmt = null;
	      
	      try {
	         conn=ds.getConnection();				     
	         	
         	    String sql = "update product set p_status=0 where p_num=?";


         	   pstmt = conn.prepareStatement(sql);
         	   pstmt.setInt(1, p_num);
         	   
		         
		       int result = pstmt.executeUpdate();   
		       
		       if(result > 0) {
		    	   return true;
		       }
	         
	      } catch (SQLException e) {
	         // TODO: handle exception
	         System.out.println("SQLException : " + e.getMessage());
	      }catch(Exception e3) {
	         System.out.println(e3.getMessage());
	      }
	      finally {
	         try {

	            pstmt.close();
	            conn.close();//반환하기
	         } catch (Exception e2) {
	            System.out.println(e2.getMessage());
	         }
	      }
	      return false;
	}

	// 구매내역 insert함수 가희
	public boolean buy(int p_num, String buyer, String seller) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "insert into buylist(buy_num, p_num, storename_buyer,storename_seller,buy_date) "
					+ "values(buy_num_seq.nextval,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setString(2, buyer);
			pstmt.setString(3, seller);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 판매내역 insert 함수 가희
	public boolean sell(int p_num, String buyer, String seller) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();

			String sql = "insert into selllist(sell_num, p_num, storename_buyer,storename_seller,sell_date) "
					+ "values(buy_num_seq.nextval,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			pstmt.setString(2, buyer);
			pstmt.setString(3, seller);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : " + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {

				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return false;
	}

	// 상품 관리에서 내 상품 전체 목록 불러오는 함수 -가희-
	public JSONArray getmyproductslist(String storename) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		try {
			conn = ds.getConnection();

			String sql = "select p.p_num, pi.pimg_name, p.p_subj, p.p_price, p.p_wr_time, p.p_status, p.p_ed_time "
					+ "from product p left join product_img pi " + "on p.p_num=pi.p_num "
					+ "where pi.pimg_num=1 and p.storename=?"
					+ "order by p.p_wr_time desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				JSONObject obj = new JSONObject();

				obj.put("pimg_name", rs.getString("pimg_name").trim());
				obj.put("p_subj", rs.getString("p_subj"));
				obj.put("p_num", rs.getInt("p_num"));
				obj.put("p_price", rs.getInt("p_price"));
				obj.put("p_wr_time", rs.getString("p_wr_time"));
				obj.put("p_ed_time", rs.getString("p_ed_time"));
				obj.put("p_status", rs.getString("p_status"));

				System.out.println(obj);
				// 상품하나씩 배열에 넣는다.
				arr.add(obj);
			}

			System.out.println(arr);

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		} catch (Exception e3) {
			e3.printStackTrace();

		} finally {

			try {
				// rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return arr;
	}
	
	//내 상품 관리에서 정렬
	/*
	 * public JSONArray getmyproductslistByOrder(String storename, String keyword) {
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * JSONArray arr = new JSONArray();
	 * 
	 * try { conn = ds.getConnection();
	 * 
	 * String sql =
	 * "select p.p_num, pi.pimg_name, p.p_subj, p.p_price, p.p_wr_time, p.p_status, p.p_ed_time "
	 * + "from product p left join product_img pi " + "on p.p_num=pi.p_num " +
	 * "where pi.pimg_num=1 and p.storename=? ";
	 * 
	 * if(keyword.equals("time")) {
	 * 
	 * sql += "order by p.p_wr_time desc";
	 * 
	 * } else {
	 * 
	 * sql += "order by p.p_price";
	 * 
	 * }
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, storename);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * JSONObject obj = new JSONObject();
	 * 
	 * obj.put("pimg_name", rs.getString("pimg_name").trim()); obj.put("p_subj",
	 * rs.getString("p_subj")); obj.put("p_num", rs.getInt("p_num"));
	 * obj.put("p_price", rs.getInt("p_price")); obj.put("p_wr_time",
	 * rs.getString("p_wr_time")); obj.put("p_ed_time", rs.getString("p_ed_time"));
	 * obj.put("p_status", rs.getString("p_status"));
	 * 
	 * System.out.println(obj); // 상품하나씩 배열에 넣는다. arr.add(obj); }
	 * 
	 * System.out.println(arr);
	 * 
	 * } catch (SQLException e) { // TODO: handle exception e.printStackTrace();
	 * 
	 * } catch (Exception e3) { e3.printStackTrace();
	 * 
	 * } finally {
	 * 
	 * try { // rs.close(); pstmt.close(); conn.close();// 반환하기 } catch (Exception
	 * e2) { e2.printStackTrace(); } }
	 * 
	 * return arr; }
	 */
	
	

	// 상점프로필사진 UPDATE -명환-
	public boolean updateMemberProfile(String profile, String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			String sql = "update member set m_profile = ? where storename = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, profile);
			pstmt.setString(2, storename);

			int row = pstmt.executeUpdate();

			if (row > 0) {
				System.out.println("업뎃성공");
				return true;
			} else {
				System.out.println("업뎃실패");
				return false;
			}
		} catch (Exception e) {
			System.out.println("업뎃실패함");
			System.out.println(e.getMessage());
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e2) {
				System.out.println(e2.getStackTrace());
			}
		}
		return false;
	}

	// 상품 등록 (상품테이블 insert)-영훈-
	public boolean productUpload(String storename, String subj, String b_num, String addr, String price,
			String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("상품 등록 함수 실행");

		try {
			conn = ds.getConnection();

			// String sql = "select * from member";
			String sql = "";

			sql += "insert into product(p_num, b_num, storename, p_addr, p_subj, p_dcharge, p_price, p_content, p_ed_time, p_status) values(p_num_seq.nextval,?, ?, ?,?,0,?,?,null,1)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.setString(2, storename);
			pstmt.setString(3, addr);
			pstmt.setString(4, subj);
			pstmt.setString(5, price);
			pstmt.setString(6, content);

			System.out.println("insert : " + sql);
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("반영된 행 있음");
				return true;
			} else {
				System.out.println("반영된 행 없음");

			}

		}

		catch (Exception e) {
			System.out.println(e.getMessage());

		} finally {
			try {
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return false;
	}

	// 상품 등록 쿼리문 -가희 영훈-
	public int productQuery() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int p_number = 0;
		System.out.println("상품 등록 쿼리문");

		try {
			conn = ds.getConnection();

			// String sql = "select * from member";
			String sql = "";

			sql += "select p_num from (select p_num from product order by p_num desc) where rownum =1";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			System.out.println("select문" + sql);

			while (rs.next()) {
				p_number = rs.getInt("p_num");
				System.out.println("p_number" + p_number);

			}
			System.out.println(sql);

		}

		catch (Exception e) {
			System.out.println(e.getMessage());

		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return p_number;
	}

	// 상품등록 이미지 -태희-
	public boolean productImgUpload(String image_name, int p_num, int pimg_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("상품 등록 이미지 함수 실행");

		try {
			conn = ds.getConnection();

			// String sql = "select * from member";
			String sql = "";

			sql += "insert into product_img(pimg_num, pimg_name, pimg_size, p_num) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pimg_num);
			pstmt.setString(2, image_name);
			pstmt.setInt(3, 100);
			pstmt.setInt(4, p_num);

			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("반영된 행 있음");
				return true;
			} else {
				System.out.println("반영된 행 없음");

			}

		}

		catch (Exception e) {
			System.out.println(e.getMessage());

		} finally {
			try {
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return false;
	}

	// 상점 프로필 가져오기 -명환-
	public String getStoreProfile(String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String profile = "";
		try {
			conn = ds.getConnection();
			String sql = "select m_profile from member where storename = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("결과있음");
				profile = rs.getString("m_profile");
			} else {
				System.out.println("결과없음");
				return null;
			}

		} catch (Exception e) {
			System.out.println(e.getStackTrace());
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				System.out.println(e2.getStackTrace());
			}
		}
		return profile;
	}

	// 차트리스트 가져오기 -태희-
	public JSONArray getmyshopchartlist(String storename) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		JSONArray arr = new JSONArray();

		try {
			conn = ds.getConnection();

			// sql 바꾸고
			String sql = "select l.p_num, l.mycount from (select p_num, count(*) as mycount from likelist group by p_num) l "
					+ "join" + "(select p_num from product where storename = ? ) p" + "on l.p_num = p.p_num"
					+ "order by l.mycount desc";
			// 푸시를 위한 주석
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storename);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JSONObject obj = new JSONObject();

				obj.put("p_num", rs.getInt("p_num"));
				obj.put("likecount", rs.getInt("mycount"));

				arr.add(obj);
			}

			// 여기까지
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}

	// 상품 상세페이지에서 상품 이미지 불러오는 함수 -가희-
	public ArrayList<String> getImagelist(int p_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println("상품 이미지 목록 불러오기 쿼리문");
		ArrayList<String> imgs = new ArrayList();
		try {
			conn = ds.getConnection();

			// String sql = "select * from member";
			String sql = "";

			sql += "select pimg_name from product_img where p_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);

			rs = pstmt.executeQuery();

			System.out.println("select문" + sql);

			while (rs.next()) {

				String pimg_name = rs.getString("pimg_name");

				imgs.add(pimg_name);
				System.out.println("pimg_name" + pimg_name);

			}
			System.out.println(sql);

		}

		catch (Exception e) {
			System.out.println(e.getMessage());

		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return imgs;
	}
	
	// 파일 수정하기 위한 정보들 넘기기 가희
	
	public JSONArray editInfo(int p_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();

		System.out.println("카테고리로 불러오기 함수 실행");

		try {
			conn = ds.getConnection();
			

			String sql = "select pi.pimg_name, p.p_subj, p.p_addr, p.p_price, p.p_content, b.b_num, m.m_num, t.t_num  from product_img pi left join product p "
					+ "on pi.p_num=p.p_num left join category_bottom b"
				    +" on p.b_num=b.b_num left join category_middle m"
				    +" on b.m_num=m.m_num left join category_top t"
				    +" on m.t_num=t.t_num"
				    +" where p.p_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("pimg_name",rs.getString("pimg_name"));
				obj.put("p_subj",rs.getString("p_subj"));
				obj.put("p_addr",rs.getString("p_addr"));
				obj.put("p_content",rs.getString("p_content"));
				obj.put("p_price",rs.getInt("p_price"));
				obj.put("p_num",p_num);
				obj.put("b_num",rs.getInt("b_num"));
				obj.put("m_num",rs.getInt("m_num"));
				obj.put("t_num",rs.getInt("t_num"));
				
				System.out.println("기존상품 정보 : "+obj);
				arr.add(obj);
			}
		System.out.println("기존상품 배열 : " + arr);

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException" + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return arr;
	}
	
	/*
	public JSONObject editInfo(int p_num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		
		System.out.println("카테고리로 불러오기 함수 실행");

		try {
			conn = ds.getConnection();
			

			String sql = "select pi.pimg_name, p.p_subj, p.p_addr, p.p_price, p.p_content, b.b_num, m.m_num, t.t_num  from product_img pi left join product p "
					+ "on pi.p_num=p.p_num left join category_bottom b"
				    +" on p.b_num=b.b_num left join category_middle m"
				    +" on b.m_num=m.m_num left join category_top t"
				    +" on m.t_num=t.t_num"
				    +" where p.p_num=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				obj.put("pimg_name",rs.getString("pimg_name"));
				obj.put("p_subj",rs.getString("p_subj"));
				obj.put("p_addr",rs.getString("p_addr"));
				obj.put("p_content",rs.getString("p_content"));
				obj.put("p_price",rs.getInt("p_price"));
				obj.put("p_num",p_num);
				obj.put("b_num",rs.getInt("b_num"));
				obj.put("m_num",rs.getInt("m_num"));
				obj.put("t_num",rs.getInt("t_num"));
				
				System.out.println("기존상품 정보 : "+obj);
			}
		

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException" + e.getMessage());
		} catch (Exception e3) {
			System.out.println(e3.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();// 반환하기

			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}

		return obj;
	}
	
	*/
	////////////////////////////////////////////////////////////////////
	//상품 수정
	///////////////////////////////////////////////////////////////////
	// 상품 수정 -가희-
		public boolean productEdit(String p_num, String storename, String subj, String b_num, String addr, String price,
				String content) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			System.out.println("상품 수정 함수 실행");

			try {
				conn = ds.getConnection();

				// String sql = "select * from member";
				String sql = "";
				
				sql += "Update product set b_num="+b_num+", storename='"+storename+"', p_addr='"+addr+"', "
						+"p_subj='"+subj+"', p_price="+price+", p_content='"+content+"', p_ed_time=sysdate where p_num="+p_num;
				
				
				//sql += "Update product Set b_num=?, storename=?, p_addr=?, p_subj=?,p_price=?, p_content=?, p_ed_time=sysdate where p_num=?";
				
				pstmt = conn.prepareStatement(sql);
				//pstmt.setString(1, b_num);
				//pstmt.setString(2, storename);
				//pstmt.setString(3, addr);
				//pstmt.setString(4, subj);
				//pstmt.setString(5, price);
				//pstmt.setString(6, content);
				//pstmt.setString(7, p_num);

				System.out.println("update : " + sql);

				int result = pstmt.executeUpdate();

				if (result > 0) {
					System.out.println("반영된 행 있음");
					return true;
				} else {
					System.out.println("반영된 행 없음");

				}

			}

			catch (Exception e) {
				System.out.println("오류 : " + e.getMessage());

			} finally {
				try {
					pstmt.close();
					conn.close();// 반환하기

				} catch (Exception e2) {
					System.out.println("오류2 : " + e2.getMessage());
				}
			}

			return false;
		}

}