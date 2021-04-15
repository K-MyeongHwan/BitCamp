
--TABLE 설계 (비인증형 일반 게시판)
CREATE TABLE jspboard(
  idx NUMBER constraint pk_jspboard_idx PRIMARY KEY , -- 글번호 (DB : 오라클(sequence 객체) , Ms-sql, Mysql(테이블 종속 자동증가)
  writer VARCHAR2(30) NOT NULL , --글쓴이 (회원전용: 로그인한 ID , 별칭     비회원용: 입력값 )
  pwd VARCHAR2(20) NOT NULL , --회원전용(x)  , 비회원전용(0 : 수정 ,삭제 )
  subject VARCHAR2(50) NOT NULL, --글제목
  content VARCHAR2(100) NOT NULL, --글내용
  writedate DATE DEFAULT SYSDATE, -- 작성일
  readnum NUMBER DEFAULT 0 , --글조회 (insert default 0)
  filename VARCHAR2(200),  --파일명 (test.txt)
  filesize NUMBER ,        --파일크기(byte)
  homepage VARCHAR2(50) ,
  email VARCHAR2(100) --필수 입력 사항 (not null) null값을 허용
)

SELECT * FROM jspboard;

--TABLE 설계 (비인증형 답변(계층형)  게시판)
CREATE TABLE jspboard(
  idx NUMBER PRIMARY KEY , -- 글번호 (DB : 오라클(sequence 객체) , Ms-sql, Mysql(테이블 종속 자동증가)
  writer VARCHAR2(30) NOT NULL , --글쓴이 (회원전용: 로그인한 ID , 별칭     비회원용: 입력값 )
  pwd VARCHAR2(20) NOT NULL , --회원전용(x)  , 비회원전용(0 : 수정 ,삭제 )
  subject VARCHAR2(50) NOT NULL, --글제목
  content VARCHAR2(100) NOT NULL, --글내용
  writedate DATE DEFAULT SYSDATE, -- 작성일
  readnum NUMBER DEFAULT 0 , --글조회 (insert default 0)
  filename VARCHAR2(200),  --파일명 (test.txt)
  filesize NUMBER ,              --파일크기(byte)
  homepage VARCHAR2(50) ,
  email VARCHAR2(100), --필수 입력 사항 (not null) null값을 허용
  --답변형 게시판 구축
  refer   NUMBER DEFAULT 0 , -- 답변형 게시판 (참조글 or 글의 그룹번호)
  depth   NUMBER DEFAULT 0,  -- 답변형 게시판(depth(글의 깊이 , 들여쓰기)
  step    NUMBER DEFAULT 0   -- 답변형 게시판 (글의 정렬 순서 : 답글정렬순서)
);

   
    

--순번 처리 (oracle)
CREATE SEQUENCE jspboard_idx
START WITH 1
INCREMENT BY 1
NOCACHE;


--덧글(꼬리말) 을 위한 테이블 생성
--누구의 덧글인지를 판단 ....
CREATE TABLE reply(
  no NUMBER PRIMARY KEY ,
  writer VARCHAR2(30),
  userid VARCHAR2(30),
  pwd VARCHAR2(30),
  content VARCHAR2(100),
  writedate DATE DEFAULT SYSDATE ,
  idx_fk  REFERENCES jspboard(idx)
);

CREATE SEQUENCE reply_no
START WITH 1
INCREMENT BY 1
NOCACHE;


SELECT * FROM board  ORDER BY idx DESC ;
SELECT * FROM mutiboard ORDER BY refer DESC , step ASC

