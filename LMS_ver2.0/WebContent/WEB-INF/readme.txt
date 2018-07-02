0. 문서설명
- 기본적으로 일반적인 MVC와 BBS용 MVC가 구분되어있음
- 일반적(로그인시 ConMyMenu) 는 상위 하위에 bbs 패키지 있음

0-1 이름 규칙
- Con 으로시작 : 컨트롤러
- Dto 로 시작 : Bean
- Dao 로 시작 : Model ( DB 접속 )
- Conn 은 MyOracle : 메소드로 제공하는 형식으로 합시다 ( 싱글턴 아님 -- 제가 코드에는 지금 싱글턴 넣었는데 빼겠습니다. )

- 이후 네임
Bbs : 추상
Consult : 상담게시판 용
EmpNotice : 직원공지게시판 용
JobAf : 취업현황 용
JobInfo : 취업정보 용
LecAf : 강의후기 용
LecNotice : 강의공지게시판 용

Attend : 출석체크
LecInfo : 강의
LecRoom : 강의실
Score : 성적
Member : 계정

MyOracle : scott 계정접속 함 >>> 다들 scott 계정에다 스키마 만드세요~
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","scott","tiger");


0-2 프로젝트환경
- jq : WebContent/js/jquery-1.12.4.min.js
- 혹시나 해서 cos.jar ( 파일업로드시.. ), jstl-1.2.jar, standard-1.1.2.jar ,ojdbc14.jar
를 WEB-INF/lib 에 넣어둠


0-3 SQL 파일의 경우 drop이 별도로 없음 재설치시 확인


========================================
0-1 : Controller
0-1-1 : 비 bbs 시스템?
- ConIndex : 메인페이지
- ConLogin : 로그인 Ajax
- ConMyMenu : 나의메뉴 Ajax


0-1-2 : ConBbs
- 기본메서드
command() : 
	url 쿼리( 파라미터 ) 로 싣어 보낼걸로 [ mod=(add/mod/del/read/list ] 로 구성되며 저 파라미터값에 따라 아래 메소드들 활용
	인덱스(키값)은 idx 로 합시다!?
listRecord  : get방식으로 접근시 게시글 리스트 창
	게시글 목록보기
createRecord(req, resp) : 
	게시글 쓰기! - get 방식으로 접근시 게시글 생성창 / post방식으로 접근시 제출 ( DAO 와 연결 )
readRecord(req, resp) :
	게시글 보기 - get방식으로 접근시 게시글보여줌 / post 방식 제공하지 않음
updateRecord(req, resp) :
	게시글 수정 - get방식으로 접근시 게시글 수정창 / post 방식으로 접근시 제출
delRecord(req, resp) :
	게시글삭제 - post방식으로만 접근
searchRecord(req, resp) :
	게시글 검색 - 필요시 구현. list와 연관성 있겠쬬?

==========================================

0-2 Dto : DB갯수에 맞쳐서 다 만듬 칼럼이 픽스되면 규칙에 맞쳐서 넣읍시다!

=============================================

0-3 Dao : Dto와 마찬가지로 DB 갯수에 맞춰서 만듬
때에 따라서 Dao는 여러가지 메소들로 넣어서 sql 처리를 할거임.
예) 강의후기 작성 : 필요한 정보 - 강의명, 학생명,  

==================================================

