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

CREATE TABLE [dbo].[DEMO_BorrowBook](
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[fBookName] [varchar](256) NOT NULL,
	[fStartDate] [datetime] NOT NULL,
	[fEndDate] [datetime] NOT NULL,
	[fBorrower] [varchar](64) NOT NULL
) ON [PRIMARY]

--$clientIndex(DEMO_BorrowBook)

ALTER TABLE [dbo].[DEMO_BorrowBook] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_BorrowBook] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DEMO_Project](
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[fProjectCode] [varchar](32) NULL,
	[fProjectName] [varchar](64) NULL
) ON [PRIMARY]

--$clientIndex(DEMO_Project)
ALTER TABLE [dbo].[DEMO_Project] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Project] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DEMO_ProjectPlan](
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[fProjectID] [varchar](32) NULL,
	[fPlanName] [varchar](64) NULL,
	[fDescription] [text] NULL,
	[fCreator] [varchar](32) NULL,
	[fExecutor] [varchar](32) NULL,
	[fStartDate] [datetime] NULL,
	[fEndDate] [datetime] NULL,
	[fStatus] [varchar](32) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--$clientIndex(DEMO_ProjectPlan)

ALTER TABLE [dbo].[DEMO_ProjectPlan] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_ProjectPlan] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DEMO_Book](
	$clientDefine,
	[fBookID] [int] NOT NULL,
	[fBookName] [varchar](256) NOT NULL,
	[fPrice] [money] NULL,
	[fISBN] [varchar](64) NULL
) ON [PRIMARY]

--$clientIndex(DEMO_Book)

ALTER TABLE [dbo].[DEMO_Book] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Book] PRIMARY KEY  CLUSTERED 
	(
		[fBookID],
		$clientName
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DEMO_BookStore](
	$clientDefine,
	[fBookID] [int] NOT NULL,
	[fAmount] [int] NOT NULL
) ON [PRIMARY]

--$clientIndex(DEMO_BookStore)

ALTER TABLE [dbo].[DEMO_BookStore] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_BookStore] PRIMARY KEY  CLUSTERED 
	(
		[fBookID],
		$clientName
	)  ON [PRIMARY] 
GO



CREATE VIEW [dbo].[DEMO_BookView]
AS
SELECT     dbo.DEMO_Book.fBookID, dbo.DEMO_Book.fBookName, dbo.DEMO_Book.fPrice, dbo.DEMO_Book.fISBN, dbo.DEMO_BookStore.fAmount, $clientName(dbo.DEMO_Book, NULL) 
FROM         dbo.DEMO_Book LEFT OUTER JOIN
                      dbo.DEMO_BookStore ON dbo.DEMO_Book.fBookID = dbo.DEMO_BookStore.fBookID AND $clientFilter(dbo.DEMO_BookStore, dbo.DEMO_Book)
					  

GO


CREATE TABLE [dbo].[DEMO_Asset] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [int] NULL,
	[fCode] [varchar] (100)  NULL ,
	[fName] [varchar] (100)  NULL ,
	[fUpdateTime] [datetime] NULL ,
	[fUseStatus] [int] NULL,
	[fUseStatusName] [varchar] (100)  NULL ,
	[fScode] [varchar] (100)  NULL ,
	[fUnitID] [varchar] (100)  NULL ,
	[fAssetClassID] [varchar] (100)  NULL ,
	[fUnitName] [varchar] (100)  NULL ,
	[fAssetClassName] [varchar] (100)  NULL ,
	[fSpecType] [varchar] (100)  NULL ,
	[fDisUseTime] [datetime] NULL ,
	[fDescription] [varchar] (100)  NULL ,
	[fSName] [varchar] (100)  NULL ,
	[fSequence] [int] NULL,
	[fCreateOrg] [varchar] (100)  NULL ,
	[fCreatePerID] [varchar] (100)  NULL ,
	[fCreatePerName] [varchar] (100)  NULL ,
	[fCreateTime] [datetime] NULL ,
	[fCreateDeptID] [varchar] (100)  NULL ,
	[fCreateDeptName] [varchar] (100)  NULL ,
	[fUpdatePerName] [varchar] (100)  NULL ,
	[fUpdateDeptID] [varchar] (100)  NULL ,
	[fUpdateDeptName] [varchar] (100)  NULL ,
	[fUpdatePerID] [varchar] (100)  NULL ,
	[fCreateURL] [varchar] (100)  NULL ,
	[fAttachment] [varchar] (1024)  NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_Asset) 
 
ALTER TABLE [dbo].[DEMO_Asset] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Asset] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO



CREATE TABLE [dbo].[DEMO_Custemor] (
	$clientDefine,
	[version] [numeric](38, 0) NULL ,
	[fCustomerName] [varchar] (100)  NULL ,
	[fCustomerLevel] [varchar] (100)  NULL ,
	[fID] [varchar] (100) not NULL ,
	[fCustomerCode] [varchar] (100)  NULL 
) ON [PRIMARY]
 
--$clientIndex(DEMO_Custemor)  
 
ALTER TABLE [dbo].[DEMO_Custemor] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Custemor] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO


create table DEMO_Order
(
  $clientDefine,
  [fID]             [varchar](100) not null,
  [version]         [int] NULL,
  [fOrderCode]      [varchar](100) NULL,
  [fCustomerID]     [varchar](100) NULL,
  [fEmploueeID]        [varchar](100) NULL,
  [fRequiredDate]   [datetime] NULL ,
  [fShippedDate]    [datetime] NULL ,
  [fOrderDate]      [datetime] NULL ,
  [fReportID]          [varchar](100) NULL,
  [fReporedDate]    [datetime] NULL ,
  [fAuditorID]         [varchar](100) NULL,
  [fAuditorIsArgee]    [varchar](100) NULL,
  [fAuditor]        [text] NULL,
  [fAuditorDate]    [datetime] NULL ,
  [fExamineID]         [varchar](100) NULL,
  [fExamine]        [text] NULL,
  [fExamineDate]    [datetime] NULL ,
  [fExamineIsArgee]    [varchar](100) NULL,
  [fEmploueeName]      [varchar](100) NULL,
  [fCustomerName]      [varchar](100) NULL,
  [fTolotalAmt]     [int] NULL,
  [fExamineName]       [varchar](100) NULL,
  [fAuditorName]       [varchar](100) NULL,
  [fPicture]        [varchar](1024)NULL
) ON [PRIMARY]

--$clientIndex(DEMO_Order)  
ALTER TABLE [dbo].[DEMO_Order] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Order] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO 



CREATE TABLE [dbo].[DEMO_OrderDetail] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [numeric](38, 0) NULL ,
	[fOrderID] [varchar] (100)  NULL ,
	[fUnitprice] [numeric](38, 0) NULL ,
	[fQuantity] [numeric](38, 0) NULL ,
	[fDisCount] [numeric](38, 0) NULL ,
	[fFactAmt] [numeric](38, 0) NULL ,
	[fProductCode] [varchar] (100)  NULL ,
	[fProductName] [varchar] (100)  NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_OrderDetail)  

ALTER TABLE [dbo].[DEMO_OrderDetail] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_OrderDetail] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


create table DEMO_SendDoc
(
	$clientDefine,
  [fID]                  [varchar] (100) not null,
  [version]               [int] NULL,
  [fDocType]             [varchar] (100)  NULL ,
  [fDocTypeName]         [varchar] (100)  NULL ,
  [fTitle]               [varchar] (100)  NULL ,
  [fKeyword]             [varchar] (100)  NULL ,
  [fDocNumber]           [varchar] (100)  NULL ,
  [fSourceDept]          [varchar] (100)  NULL ,
  [fSourceNumber]        [varchar] (100)  NULL ,
  [fDocExigenceLevel]    [varchar] (100)  NULL ,
  [fDocExigenceLevelName][varchar] (100)  NULL ,
  [fDocKind]             [varchar] (100)  NULL ,
  [fDocKindName]         [varchar] (100)  NULL ,
  [fSendDirect]          [varchar] (100)  NULL ,
  [fSendDirectName]      [varchar] (100)  NULL ,
  [fDocSecretLevel]      [varchar] (100)  NULL ,
  [fDocSecretLevelName]  [varchar] (100)  NULL ,
  [fSecretYear]           [int] NULL,
  [fSecretMonth]          [int] NULL,
  [fIssueDate]            [datetime] NULL ,
  [fReceiveDate]          [datetime] NULL ,
  [fCopies]               [int] NULL,
  [fPages]                [int] NULL,
  [fMainDestDept]        [varchar] (100)  NULL ,
  [fCopyDestDept]        [varchar] (100)  NULL ,
  [fContent]              [text] NULL,
  [fSignOpinion]          [text] NULL,
  [fPlanOpinion]          [text] NULL,
  [fUndertakeResult]      [text] NULL,
  [fDraftPerName]        [varchar] (100)  NULL ,
  [fDraftTime]            [datetime] NULL ,
  [fCheckPerName]        [varchar] (100)  NULL ,
  [fRemark]               [text] NULL,
  [fCheckTime]            [datetime] NULL ,
  [fSignPerName]         [varchar] (100)  NULL ,
  [fSignTime]             [datetime] NULL ,
  [fRegPerName]          [varchar] (100)  NULL ,
  [fRegTime]              [datetime] NULL ,
  [fPlanPerName]         [varchar] (100)  NULL ,
  [fPlanTime]             [datetime] NULL ,
  [fUndertakePerName]    [varchar] (100)  NULL ,
  [fUndertakeTime]        [datetime] NULL ,
  [fAssistant]           [varchar] (100)  NULL ,
  [fCreateDeptID]        [varchar] (100)  NULL ,
  [fCreateDeptName]      [varchar] (100)  NULL ,
  [fCreatePerID]         [varchar] (100)  NULL ,
  [fCreatePerName]       [varchar] (100)  NULL ,
  [fCreateURL]           [varchar] (256)  NULL ,
  [fCreateURLName]       [varchar] (256)  NULL ,
  [fUpdateDeptID]        [varchar] (100)  NULL ,
  [fUpdateDeptName]      [varchar] (100)  NULL ,
  [fUpdatePerID]         [varchar] (100)  NULL ,
  [fUpdatePerName]       [varchar] (100)  NULL ,
  [fUpdateTime]           [datetime] NULL ,
  [fCreateTime]           [datetime] NULL ,
  [fBizState]            [varchar] (100)  NULL ,
  [fBizStateName]        [varchar] (100)  NULL ,
  [fAttachment]          [varchar] (1024)  NULL , 
)ON [PRIMARY]

--$clientIndex(DEMO_SendDoc)  

ALTER TABLE [dbo].[DEMO_SendDoc] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_SendDoc] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_Product] (
	$clientDefine,
	[version] [numeric](38, 0) NULL ,
	[fProductName] [varchar] (100)  NULL ,
	[fPpercModel] [varchar] (100)  NULL ,
	[fUnitName] [varchar] (100)  NULL ,
	[fUnitprice] [numeric](38, 0) NULL ,
	[fID] [varchar] (100)  not NULL ,
	[fProductCode] [varchar] (100)  NULL ,
	[fDisCount] [numeric](38, 0) NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_Product)  

ALTER TABLE [dbo].[DEMO_Product] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Product] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_PubBase] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [numeric](38, 0) NULL ,
	[fCode] [varchar] (100)  NULL ,
	[fName] [varchar] (100)  NULL ,
	[fSequence] [numeric](38, 0) NULL ,
	[fUpdatePerName] [varchar] (100)  NULL ,
	[fUpdateTime] [datetime] NULL ,
	[fUseStatusName] [varchar] (100)  NULL ,
	[fUseStatus] [numeric](38, 0) NULL ,
	[fScode] [varchar] (100)  NULL ,
	[fScodeName] [varchar] (100)  NULL ,
	[fParentID] [varchar] (100)  NULL ,
	[fChildren] [varchar] (100)  NULL ,
	[fLevel] [varchar] (100)  NULL ,
	[fDescription] [varchar] (100)  NULL ,
	[fCreateTime] [datetime] NULL ,
	[fDisUseTime] [datetime] NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_PubBase)  

ALTER TABLE [dbo].[DEMO_PubBase] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_PubBase] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_SysWindow] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [numeric](38, 0) NULL ,
	[fCode] [varchar] (100)  NULL ,
	[fName] [varchar] (100)  NULL ,
	[fSequence] [numeric](38, 0) NULL ,
	[fStandBy] [varchar] (100)  NULL ,
	[fUpdatePerName] [varchar] (100)  NULL ,
	[fUpdateTime] [datetime] NULL ,
	[fYYID] [varchar] (100)  NULL ,
	[fExecutorPersonID] [varchar] (100)  NULL ,
	[fExecutorPersonName] [varchar] (100)  NULL ,
	[fExecutorDeptID] [varchar] (100)  NULL ,
	[fExecutorDeptName] [varchar] (100)  NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_SysWindow)  

ALTER TABLE [dbo].[DEMO_SysWindow] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_SysWindow] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_TABLE1]
(
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[fParent] [varchar](100) NULL,
	[version] [int] NULL,
	[fString] [varchar](100) NULL,
	[fInteger] [int] NULL,
	[fFloat] [float] NULL,
	[fDecimal] [decimal](18, 4) NULL,
	[fDate] [datetime] NULL,
	[fDateTime] [datetime] NULL,
	[fTime] [datetime] NULL,
	[fBlob] [image] NULL,
	[fText] [text] NULL,
	[fChild] [varchar](100) NULL,
	[fLevel] [varchar](100) NULL,
	[fKind] [varchar](100) NULL,
	[fPath] [varchar](1000) NULL,
	[fString0] [varchar](1000) NULL,
	[fString1] [varchar](1000) NULL
) ON [PRIMARY]

--$clientIndex(DEMO_TABLE1)  

ALTER TABLE [dbo].[DEMO_TABLE1] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_TABLE1] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_TABLE2]
(
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[fString] [varchar](100) NULL,
	[fInteger] [int] NULL,
	[fFloat] [float] NULL,
	[fDecimal] [decimal](18, 4) NULL,
	[fDate] [datetime] NULL,
	[fDateTime] [datetime] NULL,
	[fTime] [datetime] NULL,
	[fBlob] [image] NULL,
	[fText] [text] NULL,
	[fMaster] [varchar](100) NULL,
	[fParent] [varchar](100) NULL,
	[fLevel] [varchar](100) NULL,
	[fKind] [varchar](100) NULL,
	[fPath] [varchar](1000) NULL,
	[fString0] [varchar](1000) NULL,
	[fString1] [varchar](1000) NULL	
) ON [PRIMARY]

--$clientIndex(DEMO_TABLE2)  

ALTER TABLE [dbo].[DEMO_TABLE2] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_TABLE2] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


CREATE TABLE [dbo].[DEMO_TABLE3](
	$clientDefine,
	[fID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[fString] [varchar](100) NULL,
	[fInteger] [int] NULL,
	[fFloat] [float] NULL,
	[fDecimal] [decimal](18, 4) NULL,
	[fDate] [datetime] NULL,
	[fDateTime] [datetime] NULL,
	[fTime] [datetime] NULL,
	[fBlob] [image] NULL,
	[fText] [text] NULL,
	[fMaster] [varchar](100) NULL,
	[fParent] [varchar](100) NULL,
	[fLevel] [varchar](100) NULL,
	[fKind] [varchar](100) NULL,
	[fPath] [varchar](1000) NULL,
	[fString0] [varchar](1000) NULL,
	[fString1] [varchar](1000) NULL	
) ON [PRIMARY]

--$clientIndex(DEMO_TABLE3)  

ALTER TABLE [dbo].[DEMO_TABLE3] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_TABLE3] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO 



CREATE TABLE [dbo].[DEMO_LeaveApply] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [int] NULL ,
	[fNO] [varchar] (32)  NULL ,
	[fLeaveReason] [varchar] (1024)  NULL ,
	[fStartTime] [datetime] NULL ,
	[fEndTime] [datetime] NULL ,
	[fLeaveTypeID] [varchar] (32)  NULL ,
	[fLeaveTypeName] [varchar] (64)  NULL ,
	[fCreateDeptID] [varchar] (32)  NULL ,
	[fCreateDeptName] [varchar] (64)  NULL ,
	[fCreatePerID] [varchar] (32)  NULL ,
	[fCreatePerName] [varchar] (64)  NULL ,
	[fCreateTime] [datetime] NULL 
) ON [PRIMARY]

--$clientIndex(DEMO_LeaveApply)  

ALTER TABLE [dbo].[DEMO_LeaveApply] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_LeaveApply] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  



