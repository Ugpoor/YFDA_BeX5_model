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
	version 		INTEGER,
	fBookName 		VARCHAR(256) not null,
	fStartDate 		TIMESTAMP not null,
	fEndDate		TIMESTAMP not null,
	fBorrower		VARCHAR(64) not null
); 

alter table DEMO_BorrowBook
  add primary key ($clientName, fID);
  
create table DEMO_Project
(
	$clientDefine,
	fID             VARCHAR(100) not null,
	version 		INTEGER,
	fProjectCode 	VARCHAR(32),
	fProjectName 	VARCHAR(64)
); 

alter table DEMO_Project
  add primary key ($clientName, fID);

create table DEMO_ProjectPlan
(
	$clientDefine,
	fID 			VARCHAR(100) not null,
	version 		INTEGER,
	fProjectID 		VARCHAR(32),
	fPlanName 		VARCHAR(64),
	fDescription 	CLOB,
	fCreator 		VARCHAR(32),
	fExecutor 		VARCHAR(32),
	fStartDate 		TIMESTAMP,
	fEndDate		TIMESTAMP,
	fStatus 		VARCHAR(32)
);

alter table DEMO_ProjectPlan
  add primary key ($clientName, fID);

create table DEMO_Book(
	$clientDefine,
	fBookID 		DOUBLE not null,
	fBookName 		VARCHAR(256) not null,
	fPrice 			DECIMAL(18,4),
	fISBN 			VARCHAR(64)
);

alter table DEMO_Book
  add primary key ($clientName, fBookID);

create table DEMO_BookStore(
	$clientDefine,
	fBookID 		DOUBLE not null,
	fAmount 		DOUBLE not null
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
  fID             VARCHAR(100) not null,
  version         INTEGER,
  fCode           VARCHAR(100),
  fName           VARCHAR(100),
  fUpdateTime     TIMESTAMP,
  fUseStatus      INTEGER,
  fUseStatusName  VARCHAR(100),
  fScode          VARCHAR(100),
  fUnitID         VARCHAR(100),
  fAssetClassID   VARCHAR(100),
  fUnitName       VARCHAR(100),
  fAssetClassName VARCHAR(100),
  fSpecType       VARCHAR(100),
  fDisUseTime     TIMESTAMP,
  fDescription    VARCHAR(100),
  fSName          VARCHAR(100),
  fSequence       INTEGER,
  fCreateOrg      VARCHAR(100),
  fCreatePerID    VARCHAR(100),
  fCreatePerName  VARCHAR(100),
  fCreateTime     TIMESTAMP,
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
  version         INTEGER,
  fOrderCode      VARCHAR(100),
  fCustomerID     VARCHAR(100),
  fEmploueeID     VARCHAR(100),
  fRequiredDate   TIMESTAMP,
  fShippedDate    TIMESTAMP,
  fOrderDate      TIMESTAMP,
  fReportID       VARCHAR(100),
  fReporedDate    TIMESTAMP,
  fAuditorID      VARCHAR(100),
  fAuditorIsArgee VARCHAR(100),
  fAuditor        CLOB,
  fAuditorDate    TIMESTAMP,
  fExamineID      VARCHAR(100),
  fExamine        CLOB,
  fExamineDate    TIMESTAMP,
  fExamineIsArgee VARCHAR(100),
  fEmploueeName   VARCHAR(100),
  fCustomerName   VARCHAR(100),
  fTolotalAmt     DOUBLE,
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
  version      INTEGER,
  fOrderID     VARCHAR(100),
  fUnitprice   DOUBLE,
  fQuantity    DOUBLE,
  fDisCount    DOUBLE,
  fFactAmt     DOUBLE,
  fProductCode VARCHAR(100),
  fProductName VARCHAR(100)
);

alter table DEMO_OrderDetail
  add primary key ($clientName, fID);



create table DEMO_SendDoc
(
	$clientDefine,
  fID                   VARCHAR(100) not null,
  version               INTEGER,
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
  fSecretYear           DOUBLE,
  fSecretMonth          DOUBLE,
  fIssueDate            TIMESTAMP,
  fReceiveDate          TIMESTAMP,
  fCopies               DOUBLE,
  fPages                DOUBLE,
  fMainDestDept         VARCHAR(100),
  fCopyDestDept         VARCHAR(100),
  fContent              CLOB,
  fSignOpinion          CLOB,
  fPlanOpinion          CLOB,
  fUndertakeResult      CLOB,
  fDraftPerName         VARCHAR(100),
  fDraftTime            TIMESTAMP,
  fCheckPerName         VARCHAR(100),
  fRemark               CLOB,
  fCheckTime            TIMESTAMP,
  fSignPerName          VARCHAR(100),
  fSignTime             TIMESTAMP,
  fRegPerName           VARCHAR(100),
  fRegTime              TIMESTAMP,
  fPlanPerName          VARCHAR(100),
  fPlanTime             TIMESTAMP,
  fUndertakePerName     VARCHAR(100),
  fUndertakeTime        TIMESTAMP,
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
  fUpdateTime           TIMESTAMP,
  fCreateTime           TIMESTAMP,
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
  version             INTEGER,
  fCode               VARCHAR(100),
  fName               VARCHAR(100),
  fSequence           INTEGER,
  fStandBy            VARCHAR(100),
  fUpdatePerName      VARCHAR(100),
  fUpdateTime         TIMESTAMP,
  fYYID               VARCHAR(100),
  fExecutorPersonID   VARCHAR(100),
  fExecutorPersonName VARCHAR(100),
  fExecutorDeptID     VARCHAR(100),
  fExecutorDeptName   VARCHAR(100)
);

alter table DEMO_SysWindow
  add primary key ($clientName, fID);
  
  
 
create table DEMO_Custemor
(
	$clientDefine,
  version        INTEGER,
  fCustomerName  VARCHAR(100),
  fCustomerLevel VARCHAR(100),
  fID            VARCHAR(100),
  fCustomerCode  VARCHAR(100)
);


create table DEMO_Product
(
	$clientDefine,
  version      INTEGER,
  fProductName VARCHAR(100),
  fPpercModel  VARCHAR(100),
  fUnitName    VARCHAR(100),
  fUnitprice   DOUBLE,
  fID          VARCHAR(100),
  fProductCode VARCHAR(100),
  fDisCount    DOUBLE
);



create table DEMO_PubBase
(
	$clientDefine,
  fID            VARCHAR(100) not null,
  version        INTEGER,
  fCode          VARCHAR(100),
  fName          VARCHAR(100),
  fSequence      INTEGER,
  fUpdatePerName VARCHAR(100),
  fUpdateTime    TIMESTAMP,
  fUseStatusName VARCHAR(100),
  fUseStatus     INTEGER,
  fScode         VARCHAR(100),
  fScodeName     VARCHAR(100),
  fParentID      VARCHAR(100),
  fChildren      VARCHAR(100),
  fLevel         VARCHAR(100),
  fDescription   VARCHAR(100),
  fCreateTime    TIMESTAMP,
  fDisUseTime    TIMESTAMP
);

alter table DEMO_PubBase
  add primary key ($clientName, fID);
  
create table DEMO_TABLE1
(
	$clientDefine,
  FID       VARCHAR(100) not null,
  VERSION   INTEGER,
  FSTRING   VARCHAR(100),
  FINTEGER  INTEGER,
  FFLOAT    FLOAT,
  FDECIMAL  DECIMAL,
  FDATE     DATE,
  FDATETIME TIMESTAMP,
  FTIME     TIME,
  FBLOB     BLOB,
  FTEXT     CLOB,
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
  VERSION   INTEGER,
  FSTRING   VARCHAR(100),
  FINTEGER  INTEGER,
  FFLOAT    FLOAT,
  FDECIMAL  DECIMAL,
  FDATE     DATE,
  FDATETIME TIMESTAMP,
  FTIME     TIME,
  FBLOB     BLOB,
  FTEXT     CLOB,
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
  VERSION   INTEGER,
  FSTRING   VARCHAR(100),
  FINTEGER  INTEGER,
  FFLOAT    FLOAT,
  FDECIMAL  DECIMAL,
  FDATE     DATE,
  FDATETIME TIMESTAMP,
  FTIME     TIME,
  FBLOB     BLOB,
  FTEXT     CLOB,
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
  VERSION                INTEGER,
  FNO                    VARCHAR(32),
  FLEAVEREASON           VARCHAR(1024),
  FSTARTTIME             TIMESTAMP,
  FENDTIME               TIMESTAMP,
  FLEAVETYPEID           VARCHAR(32),
  FLEAVETYPENAME         VARCHAR(64),
  FCREATEDEPTID          VARCHAR(32),
  FCREATEDEPTNAME        VARCHAR(64),
  FCREATEPERID           VARCHAR(32),
  FCREATEPERNAME         VARCHAR(64),
  FCREATETIME            TIMESTAMP
);
  
  alter table DEMO_LEAVEAPPLY
  add primary key ($clientName, FID);
