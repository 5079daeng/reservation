
프로젝트 명칭 : 호텔 객실 예약 사이트


개발 인원 : 1명

개발 언어 : Java 1.8


개발 환경 : Spring Tool Suite 3


데이터베이스 : MySQL


형상관리 툴 : GitHub




<h1>주요기능</h1> 


<h3>1. 회원 기능 </h3>
 
 
 * 회원 가입 / 로그인 / 로그아웃 
  
  

 *  문의 글 조회, 작성, 수정, 삭제 / 페이징 처리
  
  

 *  예약 가능 객실 조회 
  
  
 
 * 객실 예약  
  
  
 
 * 예약 기록 조회 
  
  

 *  회원 정보 조회 / 변경 
  
  

 *  kakao 지도로 호텔 위치 조회 및 길 찾기
  
  
<h3>2. 관리자 기능 </h3>



 * 예약 상태 변경 (취소, 예약 완료, 체크인 , 체크 아웃)



 * 문의 글 답변



 * 객실 등록 / 객실 정보 수정 (이미지 파일 포함) 



 * 회원 목록 조회





<h1>상세 내용</h1> 





<h3>1. 회원 가입/ 정보 수정 페이지</h3>



 * 유효성 검사


  아이디는  6~10자이며, 영문자와 숫자로 구성
  
  
  비밀번호는  8~16자 이며, 영문 , 숫자로 구성, 비밀번호 입력과 비밀번호 확인 과정
  
  

 * 중복 확인


  데이터베이스에 존재하는 아이디를 입력한 채 회원 가입 버튼을 누른 경우 "이미 사용 중인 아이디입니다."의 메시지를 보여주기
  
  
  모든 검사가 통과되었다면 로그인 페이지로 이동
  
  * 비밀번호 암호화 

BCryptPasswordEncoder를 사용하여 비밀번호를 암호화 함 


  
  

 * 주소 입력


  Daum 주소 Api 사용하여 입력
  
  
<h3>2. 문의 글 / 댓글</h3>


* 문의 글 작성/해당 글 수정 삭제는 회원만 가능 / 댓글은 master 아이디(관리자) 만 작성/수정/삭제 할 수 있게 함


* 문의 글 삭제 시 해당 댓글 데이터도 같이 삭제 ( 외래 키 CASCADE 설정 )


* 문의 글 리스트 조회 시 답변 여부 같이 확인 가능


<h3>3. 예약 가능 객실 조회 / 예약  </h3>


* 비회원이 검색하면 로그인/ 회원가입 알림창 



* 체크인/ 체크아웃 / 숙박인원을 입력받아 예약 데이터 테이블을 조회해 예약 가능한 객실 리스트 조회 


* 기본 객실 금액에 숙박일자 , 조식 옵션 계산하여 예약 금액 산출 


* 예약자는 예약 목록 조회 가능 


* 예약시 예약 데이터의 기본 상태는 예약 완료 


* 관리자는 예약상태 변경 가능 (취소 / 예약완료 / 체크인 / 체크아웃) 


<h3>4. 객실 추가 / 객실 정보 수정  </h3>


* 관리자는 객실 추가 및 등록된 객실의 정보 수정 가능 


















<h1> DB 설계</h1> 


![image](https://user-images.githubusercontent.com/94948667/231437975-67d037a2-7d22-49b5-9181-0ab886bdb4fc.png)