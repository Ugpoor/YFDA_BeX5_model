    DROP TABLE DEMO_BorrowBook
    DROP TABLE DEMO_LeaveApply
    DROP TABLE DEMO_TABLE3
    DROP TABLE DEMO_TABLE2
    DROP TABLE DEMO_TABLE1
    DROP TABLE DEMO_SysWindow
    DROP TABLE DEMO_PubBase
    DROP TABLE DEMO_Product
    DROP TABLE DEMO_SendDoc
    DROP TABLE DEMO_OrderDetail
    DROP TABLE DEMO_Order
    DROP TABLE DEMO_Project
    DROP TABLE DEMO_ProjectPlan
    DROP TABLE DEMO_Book
    DROP TABLE DEMO_BookStore
    DROP VIEW DEMO_BookView
    DROP TABLE DEMO_Asset
    DROP TABLE DEMO_Custemor
    
create table DEMO_BorrowBook
(
	$clientDefine,
	fID             VARCHAR(100) not null,
	version 		INT,
	fBookName 		VARCHAR(256) not null,
	fStartDate 		DATETIME not null,
	fEndDate		DATETIME not null,
	fBorrower		VARCHAR(64) not null
); 

alter table DEMO_BorrowBook
  add primary key ($clientName, fID);
  
create table DEMO_Project
(
	$clientDefine,
	fID             VARCHAR(100) not null,
	version 		INT,
	fProjectCode 	VARCHAR(32),
	fProjectName 	VARCHAR(64)
); 

alter table DEMO_Project
  add primary key ($clientName, fID);

create table DEMO_ProjectPlan
(
	$clientDefine,
	fID 			VARCHAR(100) not null,
	version 		INT,
	fProjectID 		VARCHAR(32),
	fPlanName 		VARCHAR(64),
	fDescription 	TEXT,
	fCreator 		VARCHAR(32),
	fExecutor 		VARCHAR(32),
	fStartDate 		DATETIME,
	fEndDate		DATETIME,
	fStatus 		VARCHAR(32)
);

alter table DEMO_ProjectPlan
  add primary key ($clientName, fID);

create table DEMO_Book(
	$clientDefine,
	fBookID 		NUMERIC not null,
	fBookName 		VARCHAR(256) not null,
	fPrice 			DECIMAL(18,4),
	fISBN 			VARCHAR(64)
);

alter table DEMO_Book
  add primary key (fBookID);

create table DEMO_BookStore(
	$clientDefine,
	fBookID 		NUMERIC not null,
	fAmount 		NUMERIC not null
);

alter table DEMO_BookStore
  add primary key ($clientName, fBookID);

GO 
create view DEMO_BookView
as
select
	DEMO_Book.fBookID, DEMO_Book.fBookName, DEMO_Book.fPrice, DEMO_Book.fISBN, DEMO_BookStore.fAmount, $clientName(DEMO_Book, NULL) 
from DEMO_Book 
	left join DEMO_BookStore on DEMO_Book.fBookID = DEMO_BookStore.fBookID and $clientFilter(DEMO_BookStore, DEMO_Book);
	
create table DEMO_Asset
(
	$clientDefine,
  fID             VARCHAR(100) not null,
  version         INT,
  fCode           VARCHAR(100),
  fName           VARCHAR(100),
  fUpdateTime     DATETIME,
  fUseStatus      NUMERIC,
  fUseStatusName  VARCHAR(100),
  fScode          VARCHAR(100),
  fUnitID         VARCHAR(100),
  fAssetClassID   VARCHAR(100),
  fUnitName       VARCHAR(100),
  fAssetClassName VARCHAR(100),
  fSpecType       VARCHAR(100),
  fDisUseTime     DATETIME,
  fDescription    VARCHAR(100),
  fSName          VARCHAR(100),
  fSequence       NUMERIC,
  fCreateOrg      VARCHAR(100),
  fCreatePerID    VARCHAR(100),
  fCreatePerName  VARCHAR(100),
  fCreateTime     DATETIME,
  fCreateDeptID   VARCHAR(100),
  fCreateDeptName VARCHAR(100),
  fUpdatePerName  VARCHAR(100),
  fUpdateDeptID   VARCHAR(100),
  fUpdateDeptName VARCHAR(100),
  fUpdatePerID    VARCHAR(100),
  fCreateURL      VARCHAR(100),
  fAttachment     VARCHAR(1024)
);
 
alter table DEMO_Asset
  add primary key ($clientName, fID);
  

create table DEMO_Order
(
	$clientDefine,
  fID             VARCHAR(100) not null,
  version         INT,
  fOrderCode      VARCHAR(100),
  fCustomerID     VARCHAR(100),
  fEmploueeID     VARCHAR(100),
  fRequiredDate   DATETIME,
  fShippedDate    DATETIME,
  fOrderDate      DATETIME,
  fReportID       VARCHAR(100),
  fReporedDate    DATETIME,
  fAuditorID      VARCHAR(100),
  fAuditorIsArgee VARCHAR(100),
  fAuditor        TEXT,
  fAuditorDate    DATETIME,
  fExamineID      VARCHAR(100),
  fExamine        TEXT,
  fExamineDate    DATETIME,
  fExamineIsArgee VARCHAR(100),
  fEmploueeName   VARCHAR(100),
  fCustomerName   VARCHAR(100),
  fTolotalAmt     NUMERIC,
  fExamineName    VARCHAR(100),
  fAuditorName    VARCHAR(100),
  fPicture        VARCHAR(1024)
);

  
alter table DEMO_Order
  add primary key ($clientName, fID);  
  

create table DEMO_OrderDetail
(
	$clientDefine,
  fID          VARCHAR(100) not null,
  version      INT,
  fOrderID     VARCHAR(100),
  fUnitprice   NUMERIC,
  fQuantity    NUMERIC,
  fDisCount    NUMERIC,
  fFactAmt     NUMERIC,
  fProductCode VARCHAR(100),
  fProductName VARCHAR(100)
);

alter table DEMO_OrderDetail
  add primary key ($clientName, fID);



create table DEMO_SendDoc
(
	$clientDefine,
  fID                   VARCHAR(100) not null,
  version               INT,
  fDocType              VARCHAR(100),
  fDocTypeName          VARCHAR(100),
  fTitle                VARCHAR(100),
  fKeyword              VARCHAR(100),
  fDocNumber            VARCHAR(100),
  fSourceDept           VARCHAR(100),
  fSourceNumber         VARCHAR(100),
  fDocExigenceLevel     VARCHAR(100),
  fDocExigenceLevelName VARCHAR(100),
  fDocKind              VARCHAR(100),
  fDocKindName          VARCHAR(100),
  fSendDirect           VARCHAR(100),
  fSendDirectName       VARCHAR(100),
  fDocSecretLevel       VARCHAR(100),
  fDocSecretLevelName   VARCHAR(100),
  fSecretYear           NUMERIC,
  fSecretMonth          NUMERIC,
  fIssueDate            DATETIME,
  fReceiveDate          DATETIME,
  fCopies               NUMERIC,
  fPages                NUMERIC,
  fMainDestDept         VARCHAR(100),
  fCopyDestDept         VARCHAR(100),
  fContent              TEXT,
  fSignOpinion          TEXT,
  fPlanOpinion          TEXT,
  fUndertakeResult      TEXT,
  fDraftPerName         VARCHAR(100),
  fDraftTime            DATETIME,
  fCheckPerName         VARCHAR(100),
  fRemark               TEXT,
  fCheckTime            DATETIME,
  fSignPerName          VARCHAR(100),
  fSignTime             DATETIME,
  fRegPerName           VARCHAR(100),
  fRegTime              DATETIME,
  fPlanPerName          VARCHAR(100),
  fPlanTime             DATETIME,
  fUndertakePerName     VARCHAR(100),
  fUndertakeTime        DATETIME,
  fAssistant            VARCHAR(100),
  fCreateDeptID         VARCHAR(100),
  fCreateDeptName       VARCHAR(100),
  fCreatePerID          VARCHAR(100),
  fCreatePerName        VARCHAR(100),
  fCreateURL            VARCHAR(256),
  fCreateURLName        VARCHAR(256),
  fUpdateDeptID         VARCHAR(100),
  fUpdateDeptName       VARCHAR(100),
  fUpdatePerID          VARCHAR(100),
  fUpdatePerName        VARCHAR(100),
  fUpdateTime           DATETIME,
  fCreateTime           DATETIME,
  fBizState             VARCHAR(100),
  fBizStateName         VARCHAR(100),
  fAttachment           VARCHAR(1024)
);

alter table DEMO_SendDoc
  add primary key ($clientName, fID);
  
  

create table DEMO_SysWindow
(
	$clientDefine,
  fID                 VARCHAR(100) not null,
  version             INT,
  fCode               VARCHAR(100),
  fName               VARCHAR(100),
  fSequence           NUMERIC,
  fStandBy            VARCHAR(100),
  fUpdatePerName      VARCHAR(100),
  fUpdateTime         DATETIME,
  fYYID               VARCHAR(100),
  fExecutorPersonID   VARCHAR(100),
  fExecutorPersonName VARCHAR(100),
  fExecutorDeptID     VARCHAR(100),
  fExecutorDeptName   VARCHAR(100)
);

alter table DEMO_SysWindow
  add primary key (fID);
  
  
 
create table DEMO_Custemor
(
	$clientDefine,
  version        INT,
  fCustomerName  VARCHAR(100),
  fCustomerLevel VARCHAR(100),
  fID            VARCHAR(100),
  fCustomerCode  VARCHAR(100)
);


create table DEMO_Product
(
	$clientDefine,
  version      INT,
  fProductName VARCHAR(100),
  fPpercModel  VARCHAR(100),
  fUnitName    VARCHAR(100),
  fUnitprice   NUMERIC,
  fID          VARCHAR(100),
  fProductCode VARCHAR(100),
  fDisCount    NUMERIC
);



create table DEMO_PubBase
(
	$clientDefine,
  fID            VARCHAR(100) not null,
  version        INT,
  fCode          VARCHAR(100),
  fName          VARCHAR(100),
  fSequence      NUMERIC,
  fUpdatePerName VARCHAR(100),
  fUpdateTime    DATETIME,
  fUseStatusName VARCHAR(100),
  fUseStatus     NUMERIC,
  fScode         VARCHAR(100),
  fScodeName     VARCHAR(100),
  fParentID      VARCHAR(100),
  fChildren      VARCHAR(100),
  fLevel         VARCHAR(100),
  fDescription   VARCHAR(100),
  fCreateTime    DATETIME,
  fDisUseTime    DATETIME
);

alter table DEMO_PubBase
  add primary key ($clientName, fID);
  
create table DEMO_TABLE1
(
	$clientDefine,
  FID       VARCHAR(100) not null,
  VERSION   INT,
  FSTRING   VARCHAR(100),
  FINTEGER  INT,
  FFLOAT    DOUBLE(10,3),
  FDECIMAL  DECIMAL(18,4),
  FDATE     DATE,
  FDATETIME DATETIME,
  FTIME     TIME,
  FBLOB     LONGBLOB,
  FTEXT     TEXT,
  FCHILD    VARCHAR(100),
  FPARENT   VARCHAR(100),
  FKIND		VARCHAR(100),
  FLEVEL    VARCHAR(100),
  FPath     VARCHAR(1000),
  FSTRING0     VARCHAR(1000),
  FSTRING1     VARCHAR(1000)
);

alter table DEMO_TABLE1
  add primary key ($clientName, fID);

create table DEMO_TABLE2
(
	$clientDefine,
  FID       VARCHAR(100) not null,
  VERSION   INT,
  FSTRING   VARCHAR(100),
  FINTEGER  INT,
  FFLOAT    DOUBLE(10,3),
  FDECIMAL  DECIMAL(18,4),
  FDATE     DATE,
  FDATETIME DATETIME,
  FTIME     TIME,
  FBLOB     LONGBLOB,
  FTEXT     TEXT,
  FMASTER   VARCHAR(100),
  FPARENT   VARCHAR(100),
  FKIND		VARCHAR(100),
  FLEVEL    VARCHAR(100),
  FPath     VARCHAR(1000),
  FSTRING0     VARCHAR(1000),
  FSTRING1     VARCHAR(1000)  
);

alter table DEMO_TABLE2
  add primary key ($clientName, fID);

create table DEMO_TABLE3
(
	$clientDefine,
  FID       VARCHAR(100) not null,
  VERSION   NUMERIC,
  FSTRING   VARCHAR(100),
  FINTEGER  INT,
  FFLOAT    FLOAT(10,3),
  FDECIMAL  DECIMAL(18,4),
  FDATE     DATE,
  FDATETIME DATETIME,
  FTIME     TIME,
  FBLOB     LONGBLOB,
  FTEXT     TEXT,
  FMASTER   VARCHAR(100),
  FPARENT   VARCHAR(100),
  FKIND		VARCHAR(100),
  FLEVEL    VARCHAR(100),
  FPath     VARCHAR(1000),
  FSTRING0     VARCHAR(1000),
  FSTRING1     VARCHAR(1000)  
);

alter table DEMO_TABLE3
  add primary key ($clientName, fID);

create table DEMO_LEAVEAPPLY
(
	$clientDefine,
  FID                    VARCHAR(100) not null,
  VERSION                INT,
  FNO                    VARCHAR(32),
  FLEAVEREASON           VARCHAR(1024),
  FSTARTTIME             DATETIME,
  FENDTIME               DATETIME,
  FLEAVETYPEID           VARCHAR(32),
  FLEAVETYPENAME         VARCHAR(64),
  FCREATEDEPTID          VARCHAR(32),
  FCREATEDEPTNAME        VARCHAR(64),
  FCREATEPERID           VARCHAR(32),
  FCREATEPERNAME         VARCHAR(64),
  FCREATETIME            DATETIME
);
  
  alter table DEMO_LEAVEAPPLY
  add primary key ($clientName, FID);
