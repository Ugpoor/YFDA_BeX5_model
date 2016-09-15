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
	fID             VARCHAR2(100) not null,
	version 		INTEGER,
	fBookName 		VARCHAR2(256) not null,
	fStartDate 		Date not null,
	fEndDate		Date not null,
	fBorrower		VARCHAR2(64) not null
); 

alter table DEMO_BorrowBook
  add primary key ($clientName, fID);
  
create table DEMO_Project
(
	$clientDefine,
	fID             VARCHAR2(100) not null,
	version 		INTEGER,
	fProjectCode 	VARCHAR2(32),
	fProjectName 	VARCHAR2(64)
); 

alter table DEMO_Project
  add primary key ($clientName, fID);

create table DEMO_ProjectPlan
(
	$clientDefine,
	fID 			VARCHAR2(100) not null,
	version 		NUMBER,
	fProjectID 		VARCHAR2(32),
	fPlanName 		VARCHAR2(64),
	fDescription 	CLOB,
	fCreator 		VARCHAR2(32),
	fExecutor 		VARCHAR2(32),
	fStartDate 		DATE,
	fEndDate		DATE,
	fStatus 		VARCHAR2(32)
);

alter table DEMO_ProjectPlan
  add primary key ($clientName, fID);

create table DEMO_Book(
	$clientDefine,
	fBookID 		NUMBER not null,
	fBookName 		VARCHAR2(256) not null,
	fPrice 			DECIMAL(18,4),
	fISBN 			VARCHAR2(64)
);

alter table DEMO_Book
  add primary key ($clientName, fBookID);

create table DEMO_BookStore(
	$clientDefine,
	fBookID 		NUMBER not null,
	fAmount 		NUMBER not null
);

alter table DEMO_BookStore
  add primary key ($clientName, fBookID);

go
create view DEMO_BookView
as
select
	DEMO_Book.fBookID, DEMO_Book.fBookName, DEMO_Book.fPrice, DEMO_Book.fISBN, DEMO_BookStore.fAmount, $clientName(DEMO_Book, NULL) 
from DEMO_Book 
	left join DEMO_BookStore on DEMO_Book.fBookID = DEMO_BookStore.fBookID and $clientFilter(DEMO_BookStore, DEMO_Book);
	
create table DEMO_Asset
(
	$clientDefine,
  fID             VARCHAR2(100) not null,
  version         NUMBER,
  fCode           VARCHAR2(100),
  fName           VARCHAR2(100),
  fUpdateTime     DATE,
  fUseStatus      NUMBER,
  fUseStatusName  VARCHAR2(100),
  fScode          VARCHAR2(100),
  fUnitID         VARCHAR2(100),
  fAssetClassID   VARCHAR2(100),
  fUnitName       VARCHAR2(100),
  fAssetClassName VARCHAR2(100),
  fSpecType       VARCHAR2(100),
  fDisUseTime     DATE,
  fDescription    VARCHAR2(100),
  fSName          VARCHAR2(100),
  fSequence       NUMBER,
  fCreateOrg      VARCHAR2(100),
  fCreatePerID    VARCHAR2(100),
  fCreatePerName  VARCHAR2(100),
  fCreateTime     DATE,
  fCreateDeptID   VARCHAR2(100),
  fCreateDeptName VARCHAR2(100),
  fUpdatePerName  VARCHAR2(100),
  fUpdateDeptID   VARCHAR2(100),
  fUpdateDeptName VARCHAR2(100),
  fUpdatePerID    VARCHAR2(100),
  fCreateURL      VARCHAR2(100),
  fAttachment     VARCHAR2(1024)
);
 
alter table DEMO_Asset
  add primary key ($clientName, fID);
  

create table DEMO_Order
(
	$clientDefine,
  fID             VARCHAR2(100) not null,
  version         NUMBER,
  fOrderCode      VARCHAR2(100),
  fCustomerID     VARCHAR2(100),
  fEmploueeID     VARCHAR2(100),
  fRequiredDate   DATE,
  fShippedDate    DATE,
  fOrderDate      DATE,
  fReportID       VARCHAR2(100),
  fReporedDate    DATE,
  fAuditorID      VARCHAR2(100),
  fAuditorIsArgee VARCHAR2(100),
  fAuditor        CLOB,
  fAuditorDate    DATE,
  fExamineID      VARCHAR2(100),
  fExamine        CLOB,
  fExamineDate    DATE,
  fExamineIsArgee VARCHAR2(100),
  fEmploueeName   VARCHAR2(100),
  fCustomerName   VARCHAR2(100),
  fTolotalAmt     NUMBER,
  fExamineName    VARCHAR2(100),
  fAuditorName    VARCHAR2(100),
  fPicture        VARCHAR2(1024)
);

  
alter table DEMO_Order
  add primary key ($clientName, fID);  
  

create table DEMO_OrderDetail
(
	$clientDefine,
  fID          VARCHAR2(100) not null,
  version      NUMBER,
  fOrderID     VARCHAR2(100),
  fUnitprice   NUMBER,
  fQuantity    NUMBER,
  fDisCount    NUMBER,
  fFactAmt     NUMBER,
  fProductCode VARCHAR2(100),
  fProductName VARCHAR2(100)
);

alter table DEMO_OrderDetail
  add primary key ($clientName, fID);



create table DEMO_SendDoc
(
	$clientDefine,
  fID                   VARCHAR2(100) not null,
  version               NUMBER,
  fDocType              VARCHAR2(100),
  fDocTypeName          VARCHAR2(100),
  fTitle                VARCHAR2(100),
  fKeyword              VARCHAR2(100),
  fDocNumber            VARCHAR2(100),
  fSourceDept           VARCHAR2(100),
  fSourceNumber         VARCHAR2(100),
  fDocExigenceLevel     VARCHAR2(100),
  fDocExigenceLevelName VARCHAR2(100),
  fDocKind              VARCHAR2(100),
  fDocKindName          VARCHAR2(100),
  fSendDirect           VARCHAR2(100),
  fSendDirectName       VARCHAR2(100),
  fDocSecretLevel       VARCHAR2(100),
  fDocSecretLevelName   VARCHAR2(100),
  fSecretYear           NUMBER,
  fSecretMonth          NUMBER,
  fIssueDate            DATE,
  fReceiveDate          DATE,
  fCopies               NUMBER,
  fPages                NUMBER,
  fMainDestDept         VARCHAR2(100),
  fCopyDestDept         VARCHAR2(100),
  fContent              CLOB,
  fSignOpinion          CLOB,
  fPlanOpinion          CLOB,
  fUndertakeResult      CLOB,
  fDraftPerName         VARCHAR2(100),
  fDraftTime            DATE,
  fCheckPerName         VARCHAR2(100),
  fRemark               CLOB,
  fCheckTime            DATE,
  fSignPerName          VARCHAR2(100),
  fSignTime             DATE,
  fRegPerName           VARCHAR2(100),
  fRegTime              DATE,
  fPlanPerName          VARCHAR2(100),
  fPlanTime             DATE,
  fUndertakePerName     VARCHAR2(100),
  fUndertakeTime        DATE,
  fAssistant            VARCHAR2(100),
  fCreateDeptID         VARCHAR2(100),
  fCreateDeptName       VARCHAR2(100),
  fCreatePerID          VARCHAR2(100),
  fCreatePerName        VARCHAR2(100),
  fCreateURL            VARCHAR2(256),
  fCreateURLName        VARCHAR2(256),
  fUpdateDeptID         VARCHAR2(100),
  fUpdateDeptName       VARCHAR2(100),
  fUpdatePerID          VARCHAR2(100),
  fUpdatePerName        VARCHAR2(100),
  fUpdateTime           DATE,
  fCreateTime           DATE,
  fBizState             VARCHAR2(100),
  fBizStateName         VARCHAR2(100),
  fAttachment           VARCHAR2(1024)
);

alter table DEMO_SendDoc
  add primary key ($clientName, fID);
  
  

create table DEMO_SysWindow
(
	$clientDefine,
  fID                 VARCHAR2(100) not null,
  version             NUMBER,
  fCode               VARCHAR2(100),
  fName               VARCHAR2(100),
  fSequence           NUMBER,
  fStandBy            VARCHAR2(100),
  fUpdatePerName      VARCHAR2(100),
  fUpdateTime         DATE,
  fYYID               VARCHAR2(100),
  fExecutorPersonID   VARCHAR2(100),
  fExecutorPersonName VARCHAR2(100),
  fExecutorDeptID     VARCHAR2(100),
  fExecutorDeptName   VARCHAR2(100)
);

alter table DEMO_SysWindow
  add primary key ($clientName, fID);
  
  
 
create table DEMO_Custemor
(
	$clientDefine,
  version        NUMBER,
  fCustomerName  VARCHAR2(100),
  fCustomerLevel VARCHAR2(100),
  fID            VARCHAR2(100),
  fCustomerCode  VARCHAR2(100)
);


create table DEMO_Product
(
	$clientDefine,
  version      NUMBER,
  fProductName VARCHAR2(100),
  fPpercModel  VARCHAR2(100),
  fUnitName    VARCHAR2(100),
  fUnitprice   NUMBER,
  fID          VARCHAR2(100),
  fProductCode VARCHAR2(100),
  fDisCount    NUMBER
);



create table DEMO_PubBase
(
	$clientDefine,
  fID            VARCHAR2(100) not null,
  version        NUMBER,
  fCode          VARCHAR2(100),
  fName          VARCHAR2(100),
  fSequence      NUMBER,
  fUpdatePerName VARCHAR2(100),
  fUpdateTime    DATE,
  fUseStatusName VARCHAR2(100),
  fUseStatus     NUMBER,
  fScode         VARCHAR2(100),
  fScodeName     VARCHAR2(100),
  fParentID      VARCHAR2(100),
  fChildren      VARCHAR2(100),
  fLevel         VARCHAR2(100),
  fDescription   VARCHAR2(100),
  fCreateTime    DATE,
  fDisUseTime    DATE
);

alter table DEMO_PubBase
  add primary key ($clientName, fID);
  
create table DEMO_TABLE1
(
	$clientDefine,
  FID       VARCHAR2(100) not null,
  VERSION   NUMBER,
  FSTRING   VARCHAR2(100),
  FINTEGER  NUMBER,
  FFLOAT    NUMBER,
  FDECIMAL  NUMBER,
  FDATE     DATE,
  FDATETIME DATE,
  FTIME     DATE,
  FBLOB     BLOB,
  FTEXT     CLOB,
  FCHILD    VARCHAR2(100),
  FPARENT   VARCHAR2(100),
  FKIND		VARCHAR2(100),
  FLEVEL    VARCHAR2(100),
  FPath     VARCHAR2(1000),
  FSTRING0     VARCHAR2(1000),
  FSTRING1     VARCHAR2(1000)
);

alter table DEMO_TABLE1
  add primary key ($clientName, fID);

create table DEMO_TABLE2
(
	$clientDefine,
  FID       VARCHAR2(100) not null,
  VERSION   NUMBER,
  FSTRING   VARCHAR2(100),
  FINTEGER  NUMBER,
  FFLOAT    NUMBER,
  FDECIMAL  NUMBER,
  FDATE     DATE,
  FDATETIME DATE,
  FTIME     DATE,
  FBLOB     BLOB,
  FTEXT     CLOB,
  FMASTER   VARCHAR2(100),
  FPARENT   VARCHAR2(100),
  FKIND		VARCHAR2(100),
  FLEVEL    VARCHAR2(100),
  FPath     VARCHAR2(1000),
  FSTRING0     VARCHAR2(1000),
  FSTRING1     VARCHAR2(1000)  
);

alter table DEMO_TABLE2
  add primary key ($clientName, fID);

create table DEMO_TABLE3
(
	$clientDefine,
  FID       VARCHAR2(100) not null,
  VERSION   NUMBER,
  FSTRING   VARCHAR2(100),
  FINTEGER  NUMBER,
  FFLOAT    NUMBER,
  FDECIMAL  NUMBER,
  FDATE     DATE,
  FDATETIME DATE,
  FTIME     DATE,
  FBLOB     BLOB,
  FTEXT     CLOB,
  FMASTER   VARCHAR2(100),
  FPARENT   VARCHAR2(100),
  FKIND		VARCHAR2(100),
  FLEVEL    VARCHAR2(100),
  FPath     VARCHAR2(1000),
  FSTRING0     VARCHAR2(1000),
  FSTRING1     VARCHAR2(1000)  
);

alter table DEMO_TABLE3
  add primary key ($clientName, fID);

create table DEMO_LEAVEAPPLY
(
	$clientDefine,
  FID                    VARCHAR2(100) not null,
  VERSION                NUMBER,
  FNO                    VARCHAR2(32),
  FLEAVEREASON           VARCHAR2(1024),
  FSTARTTIME             DATE,
  FENDTIME               DATE,
  FLEAVETYPEID           VARCHAR2(32),
  FLEAVETYPENAME         VARCHAR2(64),
  FCREATEDEPTID          VARCHAR2(32),
  FCREATEDEPTNAME        VARCHAR2(64),
  FCREATEPERID           VARCHAR2(32),
  FCREATEPERNAME         VARCHAR2(64),
  FCREATETIME            DATE
);
  
  alter table DEMO_LEAVEAPPLY
  add primary key ($clientName, FID);


