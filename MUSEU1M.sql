CREATE TABLE MU_EDU
(
    EDU_IDX         NUMBER CONSTRAINT EDU_IDX_PK PRIMARY KEY, 
     EDU_NAME        VARCHAR2(30)     NOT NULL UNIQUE,
     EDU_TITLE      VARCHAR2(30)    NOT NULL,
    EDU_CONTENTS    CLOB, 
      EDU_IMGNAME     VARCHAR2(100)    NOT NULL, 
    EDU_IMGLOCAL    VARCHAR2(50)     NOT NULL, 
  
    EDU_STATUS      VARCHAR2(20)     NOT NULL
   
);

CREATE SEQUENCE MU_EDU_SEQ NOCACHE; 

INSERT INTO MU_EDU(
EDU_IDX, EDU_NAME, EDU_TITLE, EDU_CONTENTS,EDU_IMGNAME, EDU_IMGLOCAL, EDU_STATUS
)
VALUES(MU_EDU_SEQ.NEXTVAL ,'전문인', 'pro','교육내용침팬지가르치기', 'edu01.png','admin/image/edu01.png', 'ED01')
;

INSERT INTO MU_EDU(
EDU_IDX, EDU_NAME, EDU_TITLE, EDU_CONTENTS,EDU_IMGNAME, EDU_IMGLOCAL, EDU_STATUS
)
VALUES(MU_EDU_SEQ.NEXTVAL ,'성인', 'Jesus','교육내용고릴라가르치기', 'edu02.png','admin/image/edu02.png', 'ED01')
;

INSERT INTO MU_EDU(
EDU_IDX, EDU_NAME, EDU_TITLE, EDU_CONTENTS,EDU_IMGNAME, EDU_IMGLOCAL, EDU_STATUS
)
VALUES(MU_EDU_SEQ.NEXTVAL ,'청소년-교사', 'child','교육내용나무늘보가르치기', 'edu03.png','admin/image/edu03.png', 'ED01')
;
commit;


--------------------------------------------------------------------------
--프라이머리
CREATE TABLE EDU_DETAIL
(
    EDU_DETIDX           NUMBER           NOT NULL,  --고유값
    EDU_TARGET           VARCHAR2(200)     , -- 어떤대상?
    EDU_IMPT_CONTENTS    VARCHAR2(500)    ,  -- 주요내용
    EDU_DETAILADDR       VARCHAR2(300)    NOT NULL, -- 교육장소 
    EDU_IDX              NUMBER           , -- edu foreign 키
    EDU_DETAILNAME       VARCHAR2(300)    , -- 교육이름
    EDU_PRICE            VARCHAR2(300)    ,  -- 가격
    EDU_DETAILTARGET       VARCHAR2(300)    NOT NULL, --상세 대상
    EDU_PERIOD_START     DATE             NOT NULL, --시작일
    EDU_PERIOD_END       DATE             NOT NULL, --종료일
	EDU_DETAILTIME      VARCHAR2(300)    NOT NULL, -- 몇시간?
    EDU_PHONE VARCHAR2(30) ,        --문의번호
    EDU_LEANIMGNAME     VARCHAR2(100)    , 
    EDU_LEANIMGLOCAL    VARCHAR2(50)    , 
    EDU_DETAILSTATUS       VARCHAR2(300)    NOT NULL, --상태

    CONSTRAINT EDU_DETAIL_PK PRIMARY KEY (EDU_DETIDX)
);

CREATE SEQUENCE EDU_DETAIL_SEQ NOCACHE; 

ALTER TABLE EDU_DETAIL
    ADD CONSTRAINT FK_EDU_DETAIL_EDU_IDX_MU_EDU_E FOREIGN KEY (EDU_IDX)
        REFERENCES MU_EDU (EDU_IDX);
        
        
INSERT INTO EDU_DETAIL(
EDU_DETIDX,
EDU_TARGET,
EDU_IMPT_CONTENTS,
EDU_DETAILADDR,
EDU_IDX,
EDU_DETAILNAME,
EDU_PRICE,
EDU_DETAILTARGET,
EDU_PERIOD_START,
EDU_PERIOD_END,
EDU_DETAILTIME,
EDU_PHONE,
EDU_LEANIMGNAME,
EDU_LEANIMGLOCAL,
EDU_DETAILSTATUS
)
VALUES(EDU_DETAIL_SEQ.NEXTVAL ,'예비 전문인 연수프로그램' ,'대학 및 대학원생 - 전공자 등 예비 전문인 대상 미술관련 진로 탐색을 위한 교육프로그램',
'201', 1,'2021년 <미술관 전문직 연수프로그램> 참가 안내', 
'30000','대학 및 대학원생, 전공자', '2021-02-08','2021-08-08', '6','02-000-0000','lean01',
'admin/image/lean01.png',
'EDUDT01');
commit;

INSERT INTO EDU_DETAIL(
EDU_DETIDX,
EDU_TARGET,
EDU_IMPT_CONTENTS,
EDU_DETAILADDR,
EDU_IDX,
EDU_DETAILNAME,
EDU_PRICE,
EDU_DETAILTARGET,
EDU_PERIOD_START,
EDU_PERIOD_END,
EDU_DETAILTIME,
EDU_PHONE,
EDU_LEANIMGNAME,
EDU_LEANIMGLOCAL,
EDU_DETAILSTATUS
)
VALUES(EDU_DETAIL_SEQ.NEXTVAL ,'zzzzzzzzzzzz' ,'fffffffffffffffffffff',
'201', 2,'qqqqqqqqqqq', 
'60000','eeeeeeeeeee', '2021-02-08','2021-08-08', '6','02-000-0000' ,'lean02',
'admin/image/lean02.png','EDUDT01');
commit;

INSERT INTO EDU_DETAIL(
EDU_DETIDX,
EDU_TARGET,
EDU_IMPT_CONTENTS,
EDU_DETAILADDR,
EDU_IDX,
EDU_DETAILNAME,
EDU_PRICE,
EDU_DETAILTARGET,
EDU_PERIOD_START,
EDU_PERIOD_END,
EDU_DETAILTIME,
EDU_PHONE,
EDU_LEANIMGNAME,
EDU_LEANIMGLOCAL,
EDU_DETAILSTATUS
)
VALUES(EDU_DETAIL_SEQ.NEXTVAL ,'edasdgsgawe' ,'rqwerqwefsdasfs',
'301', 1,'fasdfsafas', 
'sadfas','fasdfas', '2021-02-08','2021-08-08', '6','02-000-0000','lean03',
'admin/image/lean03.png' ,'EDUDT01');
commit;

CREATE TABLE MU_LEARN_DOC
(
    DOC_IDX             NUMBER CONSTRAINT DOC_IDX_PK PRIMARY KEY, 
    DOC_TEXT            VARCHAR2(500),
    DOC_FILENAME        VARCHAR2(100)    NOT NULL, 
    DOC_FILELOCAL       VARCHAR2(500)     NOT NULL, 
    EDU_DETIDX          NUMBER,
    EDU_IDX         NUMBER,
    DOC_STATUS          VARCHAR2(20)     NOT NULL,
    FOREIGN KEY (EDU_IDX) REFERENCES MU_EDU(EDU_IDX),
    FOREIGN KEY (EDU_DETIDX) REFERENCES EDU_DETAIL(EDU_DETIDX)
);

CREATE SEQUENCE MU_LDOC_SEQ NOCACHE;  

     
SELECT E.EDU_IDX, E.EDU_NAME, D.EDU_DETIDX, D.EDU_IMPT_CONTENTS
FROM MU_EDU E, EDU_DETAIL D
WHERE E.EDU_IDX = D.EDU_IDX;
commit;

SELECT *
FROM MU_EDU E, EDU_DETAIL L, MU_LEARN_DOC D
WHERE E.EDU_IDX = L.EDU_IDX and D.EDU_IDX = E.EDU_IDX;

SELECT DOC_TEXT,d.*
FROM MU_LEARN_DOC D, MU_EDU E, EDU_DETAIL L
WHERE D.EDU_IDX = E.EDU_IDX and D.EDU_IDX = L.EDU_IDX;

SELECT 
    D.doc_idx,
	D.doc_text,
	D.doc_filename,
	D.doc_filelocal,
	D.doc_status,
	L.edu_period_start,
	L.edu_period_end,
	L.edu_impt_contents,
	D.edu_detidx,
	D.edu_idx,
	E.edu_name
FROM MU_EDU E, EDU_DETAIL L, MU_LEARN_DOC D
WHERE E.EDU_IDX = L.EDU_IDX and D.EDU_IDX = E.EDU_IDX
;

SELECT 
    D.doc_idx,
	D.doc_text,
	D.doc_filename,
	D.doc_filelocal,
	D.doc_status,
	L.edu_period_start,
	L.edu_period_end,
	L.edu_impt_contents,
	D.edu_detidx,
	D.edu_idx,
	E.edu_name
FROM MU_EDU E, EDU_DETAIL L, MU_LEARN_DOC D
WHERE D.edu_detidx = L.edu_detidx and D.EDU_IDX = E.EDU_IDX
;
  SELECT 		*
		                FROM 		MU_EDU
						WHERE		(EDU_IDX  LIKE '%' || null || '%')
		                ORDER BY 	EDU_IDX DESC;
		SELECT 	NN.*
		FROM    (
		        SELECT ROWNUM RN, N.*
		        FROM    (
		                SELECT 		*
		                FROM 		MU_EDU
						WHERE		(EDU_IDX  LIKE '%' || null || '%')
		                ORDER BY 	EDU_IDX DESC
		                ) N
        		) NN
		WHERE RN BETWEEN 1 AND 5
;
SELECT 	NN.*
FROM    (
SELECT ROWNUM RN, N.*
	FROM (SELECT 
	    D.doc_idx,
		D.doc_text,
		D.doc_filename,
		D.doc_filelocal,
		D.doc_status,
		L.edu_period_start,
		L.edu_period_end,
		L.edu_impt_contents,
		D.edu_detidx,
		D.edu_idx,
		E.edu_name
	FROM MU_EDU E, EDU_DETAIL L, MU_LEARN_DOC D
	WHERE D.edu_detidx = L.edu_detidx and D.EDU_IDX = E.EDU_IDX and d.doc_status = 'LD01'
    ORDER BY D.DOC_IDX DESC
		                ) N
        		) NN
		WHERE RN BETWEEN 1 AND 5
    ;	
    
		SELECT 	COUNT(DOC_IDX)
		FROM 	MU_LEARN_DOC
		WHERE 	DOC_STATUS = 'LD01';
commit;

		SELECT 	NN.*
		FROM    (
		        SELECT ROWNUM RN, N.*
		        FROM    (
		                SELECT 		*
		                FROM 		EDU_DETAIL
		                WHERE 		EDU_DETAILSTATUS = 'EDUDT01'
		                ORDER BY 	EDU_DETIDX DESC
		                ) N
        		) NN
		WHERE 	RN BETWEEN 1 AND 5;
        
        		SELECT 	COUNT(EDU_DETIDX)
		FROM 	EDU_DETAIL
		WHERE 	
				         ((EDU_TARGET LIKE '%' || '청' || '%') OR
		                 (EDU_IMPT_CONTENTS LIKE '%' || '청' || '%') OR
		                 (EDU_DETAILNAME LIKE '%' || '청' || '%') OR
		                 (EDU_DETAILTARGET LIKE '%' || '청' || '%'))
		                  AND 	EDU_DETAILSTATUS = 'EDUDT01';