drop table SA_Client;
drop table SA_AppVendor;
drop table SA_App;
drop table SA_ClientApp;

CREATE TABLE SA_Client (
	$clientDefine,
	sID 			nvarchar(32) NOT NULL ,
	sName 			nvarchar(64) NOT NULL ,
	sLongName 		nvarchar(128),
	sCode 			nvarchar(32) NOT NULL ,
	sIndustry 		nvarchar(32),
	sEmployeesSize 	int,
	sContact 		nvarchar(64),
	sEmail 			nvarchar(64),
	sPhone 			nvarchar(64),
	sFax  			nvarchar(64),
	sAddress 		nvarchar(255),
	sZip 			nvarchar(16),
	sDescription    ntext,
	sCreateTime		datetime,
	sCreatorID		nvarchar(32),
	sCreatorName	nvarchar(64),
	version 		int NOT NULL 
);

ALTER TABLE SA_Client ADD 
	 PRIMARY KEY  (sID); 
	 
CREATE TABLE SA_AppVendor (
	$clientDefine,
	sID 			nvarchar(32) NOT NULL ,
	sName 			nvarchar(64) NOT NULL ,
	sLongName 		nvarchar(128),
	sCode 			nvarchar(32) NOT NULL ,
	sIndustry 		nvarchar(32),
	sEmployeesSize 	int,
	sContact 		nvarchar(64),
	sEmail 			nvarchar(64),
	sPhone 			nvarchar(64),
	sFax  			nvarchar(64),
	sAddress 		nvarchar(255),
	sZip 			nvarchar(16),
	sDescription    ntext,
	sCreateTime		datetime,
	sCreatorID		nvarchar(32),
	sCreatorName	nvarchar(64),
	version 		int NOT NULL 
);

ALTER TABLE SA_AppVendor ADD 
	 PRIMARY KEY  (sID); 	 
	 
CREATE TABLE SA_App (
	$clientDefine,
	sID 			nvarchar(32) NOT NULL ,
	sName 			nvarchar(64) NOT NULL ,
	sCode 			nvarchar(32) NOT NULL ,
	sModel	 		nvarchar(128) NOT NULL,
	sDescription    ntext,
	sAppVersion		nvarchar(64),
	sVendorID		nvarchar(32),
	sVendorName		nvarchar(64),
	sValidState		int,
	sCreateTime		datetime,
	sCreatorID		nvarchar(32),
	sCreatorName	nvarchar(64),
	version 		int NOT NULL 
);

ALTER TABLE SA_App ADD 
	 PRIMARY KEY  (sID); 	 
	 
	 
CREATE TABLE SA_ClientApp (
	$clientDefine,
	sID 			nvarchar(32) NOT NULL ,
	sClientID		nvarchar(32),
	sClientName		nvarchar(64),
	sAppID			nvarchar(32),
	sAppName		nvarchar(64),
	sAppModel 		nvarchar(128) NOT NULL,
	sAppVersion		nvarchar(64),
	sVendorID		nvarchar(32),
	sVendorName		nvarchar(64),
	sRentStartTime	datetime NOT NULL,
	sRentEndTime	datetime,
	sRentDays		int,
	sRentNumber		int NOT NULL,
	sValidState		int,
	sCreateTime		datetime,
	sCreatorID		nvarchar(32),
	sCreatorName	nvarchar(64),
	version 		int NOT NULL 
);

ALTER TABLE SA_ClientApp ADD 
	 PRIMARY KEY  (sID); 	



DROP TABLE SA_OPCustomGroup

CREATE TABLE [dbo].[SA_OPCustomGroup] (
	$clientDefine,
	[sID] [nvarchar] (32) NOT NULL ,
	[version] [int] NOT NULL ,
	[sName] [nvarchar] (64) NOT NULL ,
	[sTypeID] [nvarchar] (32) NOT NULL ,
	[sTypeName] [nvarchar] (64) NOT NULL ,
	[sSequence] [int] NULL ,
	[sCreatorID] [nvarchar] (32) NULL ,
	[sCreatorName] [nvarchar] (64) NULL ,
	[sCreateTime] [datetime] NULL
) ON [PRIMARY]
 
--$clientIndex(SA_OPCustomGroup) 
 
ALTER TABLE [dbo].[SA_OPCustomGroup] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		$clientName,
		[sID]
	)  ON [PRIMARY] 


DROP TABLE SA_Runtime

	
CREATE TABLE [dbo].[SA_Runtime] (
	[sID] [nvarchar] (64)  NOT NULL ,
	[sString] [nvarchar] (128)  NULL ,
	[sString2] [nvarchar] (128)  NULL ,
	[sString3] [nvarchar] (128)  NULL ,
	[sInteger] [int] NULL ,
	[sInteger2] [int] NULL ,
	[sInteger3] [int] NULL ,
	[fNumeric] [numeric](15, 4) NULL ,
	[fNumeric2] [numeric](15, 4) NULL ,
	[fNumeric3] [numeric](15, 4) NULL ,
	[fDatetime] [datetime] NULL ,
	[fDatetime2] [datetime] NULL ,
	[fDatetime3] [datetime] NULL ,
	[sData] [ntext] NULL ,
	[sBData] [image] NULL
) ON [PRIMARY]

 
ALTER TABLE [dbo].[SA_Runtime] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[sID]
	)  ON [PRIMARY] 

	
DROP TABLE SA_QuickStart
	
CREATE TABLE [dbo].[SA_QuickStart] (
	$clientDefine,
  	[sID]       [nvarchar](32) NOT NULL,
  	[version]   [int] NULL,
  	[sLabel]    [nvarchar](1024) NULL,
  	[sIcon]     [nvarchar](1024) NULL,
  	[sURL]      [nvarchar](1024) NULL,
  	[sProcess]  [nvarchar](1024) NULL,
  	[sActivity] [nvarchar](1024) NULL,
  	[sPersonID] [nvarchar](32) NULL,
   	[sSequence] [int] NULL
) ON [PRIMARY]

--$clientIndex(SA_QuickStart) 

ALTER TABLE [dbo].[SA_QuickStart] ADD
	PRIMARY KEY CLUSTERED
	(
		[sID],
		$clientName
	) ON [PRIMARY]

DROP TABLE SA_PortalProfiles	
	
CREATE TABLE [dbo].[SA_PortalProfiles] (
	$clientDefine,
	[sID] [varchar] (100)  NOT NULL ,
	[version] [int] NULL ,
	[sName] [varchar] (100)  NULL ,
	[sPersonID] [varchar] (100)  NULL ,
	[sValue] [varchar] (4000)  NULL 
) ON [PRIMARY]

--$clientIndex(SA_PortalProfiles) 
 
ALTER TABLE [dbo].[SA_PortalProfiles] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY] 
	
DROP TABLE SA_Portal2Profiles
CREATE TABLE [dbo].[SA_Portal2Profiles](
	$clientDefine,
    [sID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[sPersonID] [varchar](100) NULL,
	[sFunctree] [ntext]  NULL,
	[sPortal] [ntext]  NULL,
	[sOther] [ntext]  NULL,
	[sPublishType] [varchar](100) NULL,
	[sThemeName] [varchar](100) NULL,
	[sThemeActivity] [varchar](100) NULL
) ON [PRIMARY]
 


ALTER TABLE [dbo].[SA_Portal2Profiles] ADD 
  PRIMARY KEY  CLUSTERED 
 (
  [sID, $clientName]
 )  ON [PRIMARY] 
 
--$clientIndex(SA_Portal2Profiles) 
 
DROP TABLE SA_Portal2ProfileManager
CREATE TABLE [dbo].[SA_Portal2ProfileManager](
	$clientDefine,
	[sID] [varchar](100) NOT NULL,
	[version] [int] NULL,
	[sThemeID] [varchar](100) NULL,
	[sOrgID] [varchar](100) NULL,
	[sPublishType] [varchar](100) NULL,
	[sThemeActivity] [varchar](100) NULL	
) ON [PRIMARY]


ALTER TABLE [dbo].[SA_Portal2ProfileManager] ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[sID, $clientName]
	)  ON [PRIMARY] 

--$clientIndex(SA_Portal2ProfileManager) 
DROP TABLE SA_Code	  

	
CREATE TABLE [dbo].[SA_Code] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sType] [nvarchar] (64)  NULL ,
	[sCode] [nvarchar] (64)  NOT NULL ,
	[sName] [nvarchar] (64)  NULL ,
	[sText] [nvarchar] (1024)  NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_Code)  
 
ALTER TABLE [dbo].[SA_Code] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]  

DROP TABLE SA_MessageParameter		
	
CREATE TABLE [dbo].[SA_MessageParameter] (
	$clientDefine,
	[sID] [nvarchar] (50)  NOT NULL ,
	[sChatNumber] [int] NULL ,
	[sSendNumber] [int] NULL ,
	[sFileSize] [int] NULL ,
	[sCanUse] [int] NULL ,
	[sOpmId] [nvarchar] (50)  NOT NULL ,
	[sOpmKind] [nvarchar] (50)  NOT NULL ,
	[sName] [nvarchar] (50)  NOT NULL ,
	[VERSION] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_MessageParameter)  


ALTER TABLE [dbo].[SA_MessageParameter] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]   
 
DROP TABLE SA_ChatPromission	
 
CREATE TABLE [dbo].[SA_ChatPromission] (
	$clientDefine,
	[sID] [nvarchar] (50)  NOT NULL ,
	[sOpmKind] [nvarchar] (50)  NOT NULL ,
	[sOpmId] [nvarchar] (50)  NOT NULL ,
	[sName] [nvarchar] (50)  NOT NULL ,
	[sOtherSideId] [nvarchar] (50)  NOT NULL ,
	[sOtherSideKind] [nvarchar] (50)  NOT NULL ,
	[sOtherSideName] [nvarchar] (50)  NOT NULL ,
	[sPromissionType] [int] NOT NULL ,
	[sOtherSideUrl] [nvarchar] (255)  NULL ,
	[sOpmUrl] [nvarchar] (255)  NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_ChatPromission)  

ALTER TABLE [dbo].[SA_ChatPromission] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]    

DROP TABLE SA_FilterPattern	
	
CREATE TABLE [dbo].[SA_FilterPattern] (
	$clientDefine,
	[sID] [nvarchar] (36)  NOT NULL ,
	[sPerson] [nvarchar] (36)  NULL ,
	[sProcess] [nvarchar] (1024)  NOT NULL ,
	[sActivity] [nvarchar] (128)  NOT NULL ,
	[sInstance] [nvarchar] (128)  NOT NULL ,
	[sName] [nvarchar] (128)  NOT NULL ,
	[sContent] [ntext]  NULL ,
	[sOrderNum] [decimal](38, 0) NOT NULL ,
	[version] [int] NULL ,
	[sOrgFID] [nvarchar] (255) NULL,
	[sOrgFName]	[nvarchar] (1024) NULL,
	[sCreatorID]	[nvarchar] (32) NULL,
	[sCreatorName]	[nvarchar] (64) NULL,
	[sCreateTime]	[datetime]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_FilterPattern)  
 
ALTER TABLE [dbo].[SA_FilterPattern] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]     


create index IDX_FILTERPATTERN_PERSON on SA_FilterPattern (sPerson)
create index IDX_FILTERPATTERN_ORGFID on SA_FilterPattern (sOrgFID)
  
DROP TABLE SA_KVSequence		
	
CREATE TABLE [dbo].[SA_KVSequence] (
	$clientDefine,
	[K] [nvarchar] (255)  NOT NULL ,
	[V] [int] NOT NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_KVSequence)  
 
ALTER TABLE [dbo].[SA_KVSequence] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[K],
		$clientName
	)  ON [PRIMARY]     
	
DROP TABLE SA_OPAgent	
	
CREATE TABLE [dbo].[SA_OPAgent] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sOrgFID] [nvarchar] (2048)  NOT NULL ,
	[sOrgFName] [nvarchar] (2048)  NOT NULL ,
	[sAgentID] [nvarchar] (32)  NOT NULL ,
	[sValidState] [int] NULL ,
	[sStartTime] [datetime] NULL ,
	[sFinishTime] [datetime] NULL ,
	[sProcess] [ntext] NULL ,
	[sCreatorID]  [nvarchar](32),
	[sCreatorName] [nvarchar](64),
	[sCreateTime] [datetime],
	[sCanTranAgent] [int],
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_OPAgent)  
 
ALTER TABLE [dbo].[SA_OPAgent] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]     

DROP TABLE SA_OPAuthorize		
	
CREATE TABLE [dbo].[SA_OPAuthorize] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sOrgID] [nvarchar] (65)  NOT NULL ,
	[sOrgName] [nvarchar] (255)  NULL ,
	[sOrgFID] [nvarchar] (212)  NOT NULL ,
	[sOrgFName] [nvarchar] (255)  NULL ,
	[sAuthorizeRoleID] [nvarchar] (32)  NOT NULL ,
	[sDescription] [nvarchar] (1024)  NULL ,
	[sCreatorFID] [nvarchar] (2048)  NULL ,
	[sCreatorFName] [nvarchar] (2048)  NULL ,
	[sCreateTime] [datetime] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_OPAuthorize)   
 
ALTER TABLE [dbo].[SA_OPAuthorize] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_OPAUTH_ORGID on SA_OPAuthorize (sOrgID)
create index IDX_OPAUTH_ORGFID on SA_OPAuthorize (sOrgFID)
create index IDX_OPAUTH_ORGFNAME on SA_OPAuthorize (sOrgFName)
create index IDX_OPAUTH_ROLEID on SA_OPAuthorize (sAuthorizeRoleID)
create index IDX_OPAUTH_MAIN on SA_OPAuthorize (sAuthorizeRoleID, sOrgFID)

DROP TABLE SA_OPManagement	
	
CREATE TABLE [dbo].[SA_OPManagement] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sOrgID] [nvarchar] (65)  NOT NULL ,
	[sOrgName] [nvarchar] (255)  NULL ,
	[sOrgFID] [nvarchar] (255)  NOT NULL ,
	[sOrgFName] [nvarchar] (255)  NULL ,
	[sManageOrgID] [nvarchar] (65)  NOT NULL ,
	[sManageOrgName] [nvarchar] (255)  NULL ,
	[sManageOrgFID] [nvarchar] (255)  NOT NULL ,
	[sManageOrgFName] [nvarchar] (255)  NULL ,
	[sManageTypeID] [nvarchar] (32)  NOT NULL ,
	[sCreatorFID] [nvarchar] (2048)  NULL ,
	[sCreatorFName] [nvarchar] (2048)  NULL ,
	[sCreateTime] [datetime] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_OPManagement)   
 
ALTER TABLE [dbo].[SA_OPManagement] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_OPMNAGE_ORGID on SA_OPManagement (sOrgID)
create index IDX_OPMNAGE_ORGFID on SA_OPManagement (sOrgFID)
create index IDX_OPMNAGE_ORGFNAME on SA_OPManagement (sOrgFName)
create index IDX_OPMNAGE_MORGID on SA_OPManagement (sManageOrgID)
create index IDX_OPMNAGE_MORGFID on SA_OPManagement (sManageOrgFID)
create index IDX_OPMNAGE_MORGFNAME on SA_OPManagement (sManageOrgFName)
	

DROP TABLE SA_OPManageType		
	
CREATE TABLE [dbo].[SA_OPManageType] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sName] [nvarchar] (255)  NULL ,
	[sCode] [nvarchar] (32)  NULL ,
	[sManageOrgKind] [nvarchar] (64)  NULL ,
	[sManageOrgKindName] [nvarchar] (255)  NULL ,
	[sLeaderNumber] [int] NULL ,
	[sIsSystem] [int] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_OPManageType)   
 
ALTER TABLE [dbo].[SA_OPManageType] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

DROP TABLE SA_OPOrg		
	
CREATE TABLE [dbo].[SA_OPOrg] (
	$clientDefine,
	[sID] [nvarchar] (39)  NOT NULL ,
	[sName] [nvarchar] (128)  NOT NULL ,
	[sCode] [nvarchar] (64)  NOT NULL ,
	[sLongName] [nvarchar] (255)  NULL ,
	[sFName] [nvarchar] (2048)  NULL ,
	[sFCode] [nvarchar] (255)  NULL ,
	[sFID] [nvarchar] (255)  NOT NULL ,
	[sOrgKindID] [nvarchar] (5)  NOT NULL ,
	[sSequence] [nvarchar] (128)  NULL ,
	[sValidState] [int] NULL ,
	[sParent] [nvarchar] (19)  NULL ,
	[sLevel] [int] NULL ,
	[sPhone] [nvarchar] (64)  NULL ,
	[sFax] [nvarchar] (64)  NULL ,
	[sAddress] [nvarchar] (255)  NULL ,
	[sZip] [nvarchar] (16)  NULL ,
	[sDescription] [nvarchar] (1024)  NULL ,
	[sPersonID] [nvarchar] (19)  NULL ,
	[sNodeKind] [nvarchar] (32)  NULL ,
	[sWxDeptID]	[int] ,
	[version] [int] NOT NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_OPOrg)    
 
ALTER TABLE [dbo].[SA_OPOrg] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_OPORG_CODE on SA_OPOrg (sCode) 
create index IDX_OPORG_FCODE on SA_OPOrg (sFCode) 
create index IDX_OPORG_FID on SA_OPOrg (sFID) 
create index IDX_OPORG_KV on SA_OPOrg (sValidState, sOrgKindID) 
create index IDX_OPORG_PARENT on SA_OPOrg (sParent)
create index IDX_OPORG_PERSON on SA_OPOrg (sPersonID)
create index IDX_OPORG_SEQUENCE on SA_OPOrg (sSequence)
DROP TABLE SA_OPParentRole	
	
CREATE TABLE [dbo].[SA_OPParentRole] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sRoleID] [nvarchar] (32)  NOT NULL ,
	[sParentRoleID] [nvarchar] (32)  NOT NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_OPParentRole)     
ALTER TABLE [dbo].[SA_OPParentRole] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
DROP TABLE SA_OPPermission		
	
CREATE TABLE [dbo].[SA_OPPermission] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sPermissionRoleID] [nvarchar] (32)  NOT NULL ,
	[sProcess] [nvarchar] (255)  NULL ,
	[sActivityFName] [nvarchar] (1024)  NULL ,
	[sActivity] [nvarchar] (255)  NULL ,
	[sActionsNames] [ntext]  NULL ,
	[sActions] [ntext] NULL ,
	[sSemanticDP] [nvarchar] (2048)  NULL ,
	[sPermissionKind] [int] NULL ,
	[sDescription] [nvarchar] (1024)  NULL ,
	[sSequence] [int] NULL ,
	[sValidState] [int] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_OPPermission)      
ALTER TABLE [dbo].[SA_OPPermission] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
create index IDX_OPPERM_ACTIVITY on SA_OPPermission (sActivity) 
create index IDX_OPPERM_PROCESS on SA_OPPermission (sProcess) 
create index IDX_OPPERM_ROLEID on SA_OPPermission (sPermissionRoleID) 
	
DROP TABLE SA_OPPerson	
	
CREATE TABLE [dbo].[SA_OPPerson] (
	$clientDefine,
	[sID] [nvarchar] (19)  NOT NULL ,
	[sName] [nvarchar] (64)  NOT NULL ,
	[sCode] [nvarchar] (64)  NOT NULL ,
	[sIDCard] [nvarchar] (36) NULL,
	[sNumb] [int] NOT NULL ,
	[sLoginName] [nvarchar] (64)  NULL ,
	[sPassword] [nvarchar] (64)  NULL ,
	[sMainOrgID] [nvarchar] (19)  NOT NULL ,
	[sSafeLevelID] [nvarchar] (36)  NULL ,
	[sSequence] [int] NULL ,
	[sValidState] [int] NULL ,
	[sDescription] [nvarchar] (255)  NULL ,
	[sSex] [nvarchar] (8)  NULL ,
	[sBirthday] [datetime] NULL ,
	[sJoinDate] [datetime] NULL ,
	[sHomePlace] [nvarchar] (64)  NULL ,
	[sDegree] [nvarchar] (16)  NULL ,
	[sGraduateSchool] [nvarchar] (128)  NULL ,
	[sSpeciality] [nvarchar] (128)  NULL ,
	[sSchoolLength] [nvarchar] (16)  NULL ,
	[sTitle] [nvarchar] (64)  NULL ,
	[sMarriage] [nvarchar] (16)  NULL ,
	[sCardNO] [nvarchar] (36)  NULL ,
	[sCardKind] [nvarchar] (64)  NULL ,
	[sFamilyAddress] [nvarchar] (255)  NULL ,
	[sZip] [nvarchar] (16)  NULL ,
	[sMsn] [nvarchar] (64)  NULL ,
	[sQQ] [nvarchar] (36)  NULL ,
	[sMail] [nvarchar] (64)  NULL ,
	[sMobilePhone] [nvarchar] (36)  NULL ,
	[sFamilyPhone] [nvarchar] (36)  NULL ,
	[sOfficePhone] [nvarchar] (36)  NULL ,
	[version] [int] NULL ,
	[sPhoto] [image] NULL ,
	[sPhotoLastModified] [datetime] NULL,
	[sCountry] [nvarchar] (64)  NULL ,
	[sProvince] [nvarchar] (64)  NULL ,
	[sCity] [nvarchar] (64)  NULL ,
	[SPOSITIONS] [nvarchar] (64)  NULL ,
	[SSCHOOL] [nvarchar] (64)  NULL ,
	[SSTUDY] [nvarchar] (64)  NULL ,
	[sEnglishName] [nvarchar] (128)  NULL,
	[sPasswordTimeLimit] [int] NULL ,
	[sPasswordModifyTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_OPPerson)       
ALTER TABLE [dbo].[SA_OPPerson] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create unique index IDX_OPPERSON_SCODE on SA_OPPerson ($clientName, sCode)
create index IDX_OPPERSON_VALID on SA_OPPerson (sValidState) 
create index IDX_OPPERSON_LN_C_VS on SA_OPPerson (sLoginName, sCode, sValidState) 
create index IDX_OPPERSON_ORG on SA_OPPerson (sMainOrgID)
	
	
DROP TABLE SA_OPRole	
	
CREATE TABLE [dbo].[SA_OPRole] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sName] [nvarchar] (255)  NULL ,
	[sCode] [nvarchar] (32)  NULL ,
	[sCatalog] [nvarchar] (128)  NULL ,
	[sRoleKind] [nvarchar] (32)  NULL ,
	[sParentRolesNames] [nvarchar] (512)  NULL ,
	[sDescription] [nvarchar] (1024)  NULL ,
	[sSequence] [int] NULL ,
	[sValidState] [int] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_OPRole)        
ALTER TABLE [dbo].[SA_OPRole] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_OPROLE_CODE on SA_OPRole (sCode) 
	
DROP TABLE SA_OPRoleManagement
	
CREATE TABLE [dbo].[SA_OPRoleManagement] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sOrgID] [nvarchar] (65)  NOT NULL ,
	[sOrgName] [nvarchar] (255)  NULL ,
	[sOrgFID] [nvarchar] (255)  NOT NULL ,
	[sOrgFName] [nvarchar] (255)  NULL ,
	[sRoleID] [nvarchar] (32)  NOT NULL ,
	[sCreatorFID] [nvarchar] (2048)  NULL ,
	[sCreatorFName] [nvarchar] (2048)  NULL ,
	[sCreateTime] [datetime] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_OPRoleManagement)         
ALTER TABLE [dbo].[SA_OPRoleManagement] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_OPRMNAGE_ORGID on SA_OPRoleManagement (sOrgID)
create index IDX_OPRMNAGE_ORGFID on SA_OPRoleManagement (sOrgFID)
create index IDX_OPRMNAGE_ORGFNAME on SA_OPRoleManagement (sOrgFName)
create index IDX_OPRMNAGE_ROLEID on SA_OPRoleManagement (SROLEID)
	
    DROP TABLE SA_ProcessControl	
	
CREATE TABLE [dbo].[SA_ProcessControl] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sOperatorID] [nvarchar] (32)  NULL ,
	[sProcess] [nvarchar] (127)  NULL ,
	[sProcessTemplateID2] [nvarchar] (32)  NULL ,
	[sActivity] [nvarchar] (32)  NULL ,
	[sAction] [nvarchar] (32)  NULL ,
	[sKind] [nvarchar] (16)  NULL ,
	[sContent] [ntext]  NULL ,
	[version] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--$clientIndex(SA_ProcessControl)         

create index IDX_PC_INDEX on SA_ProcessControl (sProcess, sActivity, sOperatorID, sAction, sProcessTemplateID2)

 
ALTER TABLE [dbo].[SA_ProcessControl] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
	
    DROP TABLE SA_RemindConfig	
	
CREATE TABLE [dbo].[SA_RemindConfig] (
	$clientDefine,
	[sID] [nvarchar] (50)  NOT NULL ,
	[sOverdueEnable] [nvarchar] (10)  NULL ,
	[sPersonID] [nvarchar] (50)  NOT NULL ,
	[sIntervalMinute] [int] NULL ,
	[sEnable] [nvarchar] (10)  NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_RemindConfig)         

 
ALTER TABLE [dbo].[SA_RemindConfig] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

    DROP TABLE SA_Reminder		
	
CREATE TABLE [dbo].[SA_Reminder] (
	$clientDefine,
	[sRemindID] [nvarchar] (50)  NOT NULL ,
	[sPersonID] [nvarchar] (100)  NOT NULL ,
	[sPersonName] [nvarchar] (50)  NOT NULL ,
	[sID] [nvarchar] (50)  NOT NULL ,
	[version] [int] NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_Reminder)          
ALTER TABLE [dbo].[SA_Reminder] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
	
drop table SA_Social	                  
create table SA_Social
(
               	$clientDefine,
  sID             [nvarchar](32) NOT NULL,
  sName           [nvarchar](255) NULL,
  sTypeID         [nvarchar](32) NULL,
  sTypeName       [nvarchar](64) NULL,
  sProcess        [nvarchar](1024) NULL,
  sActivity       [nvarchar](128) NULL,
  sURL            [ntext]  NULL ,
  sData1          [nvarchar](128) NULL,
  sData2          [nvarchar](128) NULL,
  sData3          [nvarchar](128) NULL,
  sData4          [nvarchar](128) NULL,
  sCreatorID      [nvarchar](32) NULL,
  sCreatorName    [nvarchar](128) NULL,
  sCreatorFID     [nvarchar](1024) NULL,
  sCreatorFName   [nvarchar](1024) NULL,
  sPersonID    	  [nvarchar](32) NULL,
  sPersonName     [nvarchar](128) NULL,
  sOrgID    	  [nvarchar](65) NULL,
  sOrgName  	  [nvarchar](128) NULL,
  sOrgFID         [nvarchar](1024) NULL,
  sOrgFName       [nvarchar](1024) NULL,
  sValidState     [INTEGER] NULL ,
  sCreateTime     [datetime] NULL ,
  version         [INTEGER] NULL ,
  
  sESField01 [nvarchar] (128)  NULL,
  sESField02 [nvarchar] (128)  NULL,
  sESField03 [nvarchar] (128)  NULL,
  sESField04 [nvarchar] (128)  NULL,
  sESField05 [nvarchar] (128)  NULL,
  sESField06 [nvarchar] (128)  NULL,
  sESField07 [nvarchar] (128)  NULL,
  sESField08 [nvarchar] (128)  NULL,

  sENField11 [numeric] (22,10)  NULL,
  sENField12 [numeric] (22,10)  NULL,
  sENField13 [numeric] (22,10)  NULL,
  sENField14 [numeric] (22,10)  NULL,
	
  sEDField21 [datetime] NULL ,
  sEDField22 [datetime] NULL ,
  sEDField23 [datetime] NULL ,
  sEDField24 [datetime] NULL ,
	
  sETField31 [ntext] NULL ,
  sETField32 [ntext] NULL ,
  sETField33 [ntext] NULL ,
  sETField34 [ntext] NULL ,
  
  sEIField41 [INTEGER] NULL ,
  sEIField42 [INTEGER] NULL ,
  sEIField43 [INTEGER] NULL ,
  sEIField44 [INTEGER] NULL ,
  
  sEBField51 [image] NULL ,
  sEBField52 [image] NULL ,
  sEBField53 [image] NULL ,
  sEBField54 [image] NULL,
  
  sGroupID         [nvarchar](32) NULL,
  sGroupName       [nvarchar](64) NULL,
  sMessageNumber   [INTEGER] NULL ,
  sActive   	   [INTEGER] NULL
);

ALTER TABLE [dbo].[SA_Social] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]   

create index IDX_SOCIAL_DATA on SA_Social (sData1);
create index IDX_SOCIAL_NAME on SA_Social (sName);
create index IDX_SOCIAL_CREATETIME on SA_Social (sCreateTime);
create index IDX_SOCIAL_TOD on SA_Social (sTypeID, sPersonID, sData1);
create index IDX_SOCIAL_TOC on SA_Social (sTypeID, sPersonID, sCreateTime);
	
	
    DROP TABLE SA_Task	
	
CREATE TABLE [dbo].[SA_Task] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sCode] [nvarchar] (128)  NULL ,
	[sParentID] [nvarchar] (32)  NULL ,
	[sName] [nvarchar] (255)  NULL ,
	[sContent] [ntext]  NULL ,
	[sRemark] [ntext]  NULL ,
	[sSummary] [ntext]  NULL ,
	[sFlowID] [nvarchar] (32)  NULL ,
	[sSourceID] [nvarchar] (32)  NULL ,
	[sFrontID] [nvarchar] (32)  NULL ,
	[sExecuteMode2] [nvarchar] (256)  NULL ,
	[sExecuteMode] [nvarchar] (32)  NULL ,
	[sPreemptMode] [nvarchar] (32)  NULL ,
	[sCatalogID] [nvarchar] (32)  NULL ,
	[sKindID] [nvarchar] (32)  NULL ,
	[sTypeID] [nvarchar] (32)  NULL ,
	[sTypeName] [nvarchar] (64)  NULL ,
	[sImportanceID] [nvarchar] (32)  NULL ,
	[sImportanceName] [nvarchar] (64)  NULL ,
	[sEmergencyID] [nvarchar] (32)  NULL ,
	[sEmergencyName] [nvarchar] (64)  NULL ,
	[sProcess] [nvarchar] (127)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sCURL] [ntext]  NULL ,
	[sEURL] [ntext]  NULL ,
	[sCreateTime] [datetime] NULL ,
	[sDistributeTime] [datetime] NULL ,
	[sLastModifyTime] [datetime] NULL ,
	[sWarningTime] [datetime] NULL ,
	[sLimitTime] [datetime] NULL ,
	[sExpectStartTime] [datetime] NULL ,
	[sExpectFinishTime] [datetime] NULL ,
	[sActualStartTime] [datetime] NULL ,
	[sActualFinishTime] [datetime] NULL ,
	[sExecuteTime] [datetime] NULL ,
	[sCreatorPersonID] [nvarchar] (32)  NULL ,
	[sCreatorPersonName] [nvarchar] (128)  NULL ,
	[sCreatorPosID] [nvarchar] (32)  NULL ,
	[sCreatorPosName] [nvarchar] (128)  NULL ,
	[sCreatorDeptID] [nvarchar] (32)  NULL ,
	[sCreatorDeptName] [nvarchar] (128)  NULL ,
	[sCreatorOgnID] [nvarchar] (32)  NULL ,
	[sCreatorOgnName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (212)  NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sExecutorPersonID] [nvarchar] (32)  NULL ,
	[sExecutorPersonName] [nvarchar] (128)  NULL ,
	[sExecutorPosID] [nvarchar] (32)  NULL ,
	[sExecutorPosName] [nvarchar] (128)  NULL ,
	[sExecutorDeptID] [nvarchar] (32)  NULL ,
	[sExecutorDeptName] [nvarchar] (128)  NULL ,
	[sExecutorOgnID] [nvarchar] (32)  NULL ,
	[sExecutorOgnName] [nvarchar] (128)  NULL ,
	[sExecutorFID] [nvarchar] (212)  NULL ,
	[sExecutorFName] [nvarchar] (1024)  NULL ,
	[sExecutorNames] [ntext]  NULL ,
	[sActivityNames] [ntext]  NULL ,
	[sResponsible] [nvarchar] (8)  NULL ,
	[sCustomerID] [nvarchar] (64)  NULL ,
	[sCustomerCode] [nvarchar] (64)  NULL ,
	[sCustomerName] [nvarchar] (256)  NULL ,
	[sProjectID] [nvarchar] (64)  NULL ,
	[sProjectCode] [nvarchar] (64)  NULL ,
	[sProjectName] [nvarchar] (256)  NULL ,
	[sPlanID] [nvarchar] (64)  NULL ,
	[sPlanCode] [nvarchar] (64)  NULL ,
	[sPlanName] [nvarchar] (256)  NULL ,
	[sData1] [nvarchar] (32)  NULL ,
	[sData2] [nvarchar] (32)  NULL ,
	[sData3] [nvarchar] (32)  NULL ,
	[sData4] [nvarchar] (32)  NULL ,
	[sFake] [nvarchar] (8)  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[sStatusID] [nvarchar] (32)  NULL ,
	[sStatusName] [nvarchar] (64)  NULL ,
	[sAIID] [nvarchar] (32)  NULL ,
	[sAIStatusID] [nvarchar] (256)  NULL ,
	[sAIStatusName] [nvarchar] (256)  NULL ,
	[sAIActive] [nvarchar] (8)  NULL ,
	[sWorkTime] [int] NULL ,
	[sVersionNumber] [nvarchar] (50)  NULL ,
	[sSequence] [int] NULL ,
	[sLock] [nvarchar] (32)  NULL ,
	[sHints] [ntext]  NULL ,
	[sShortcut] [ntext]  NULL ,
	[sRemindMode] [nvarchar] (32)  NULL ,
	[version] [int] NULL ,
	[sVariable] [ntext]  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sProcessTemplateID] [nvarchar] (32)  NULL ,
	[sProcessTemplateItemSequence] [nvarchar] (128)  NULL ,
	[sTempPermissionID] [nvarchar] (32)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL,
	[sWithdraw] [int] NULL ,
	[sActivityInTemplate] [nvarchar] (128)  NULL,
	[sProcessTemplateID2] [nvarchar] (32)  NULL,

	[sESField01] [nvarchar] (128)  NULL,
	[sESField02] [nvarchar] (128)  NULL,
	[sESField03] [nvarchar] (128)  NULL,
	[sESField04] [nvarchar] (128)  NULL,
	[sESField05] [nvarchar] (128)  NULL,
	[sESField06] [nvarchar] (128)  NULL,
	[sESField07] [nvarchar] (128)  NULL,
	[sESField08] [nvarchar] (128)  NULL,

	[sENField11] [numeric] (22,10)  NULL,
	[sENField12] [numeric] (22,10)  NULL,
	[sENField13] [numeric] (22,10)  NULL,
	[sENField14] [numeric] (22,10)  NULL,
	
	[sEDField21] [datetime] NULL ,
	[sEDField22] [datetime] NULL ,
	[sEDField23] [datetime] NULL ,
	[sEDField24] [datetime] NULL ,
	
	[sETField31] [ntext] NULL ,
	[sETField32] [ntext] NULL ,
	[sETField33] [ntext] NULL ,
	[sETField34] [ntext] NULL ,
  
	[sEIField41] [INTEGER] NULL ,
	[sEIField42] [INTEGER] NULL ,
	[sEIField43] [INTEGER] NULL ,
	[sEIField44] [INTEGER] NULL ,
  
	[sEBField51] [image] NULL ,
	[sEBField52] [image] NULL ,
	[sEBField53] [image] NULL ,
	[sEBField54] [image] NULL 
	
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_Task)           
ALTER TABLE [dbo].[SA_Task] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      


--create index IDX_TASK_KST_STATUS_EF on SA_Task (sStatusID, sExecutorFID)
--create index IDX_TASK_KST_CFID_CT on SA_Task (sCreatorFID, sKindID, sStatusID, sTypeID, sCreateTime)
--create index IDX_TASK_KST_EFID_CT on SA_Task (sKindID, sStatusID, sTypeID, sExecutorFID, sCreateTime)
--create index IDX_TASK_PARENT_ID on SA_Task (sID, sParentID) 
--create index IDX_TASK_CREATETIME on SA_Task (sCreateTime) 
--create index IDX_TASK_CFID on SA_Task (sCreatorFID) 
--create index IDX_TASK_EFID on SA_Task (sExecutorFID) 
--create index IDX_TASK_SFLOWID on SA_Task (sFlowID)
--create index IDX_TASK_SPARENTID on SA_Task (sParentID)
--create index IDX_TASK_SPTID on SA_Task (sProcessTemplateID)
--create index IDX_TASK_SPTID2 on SA_Task (sProcessTemplateID2)
--create index IDX_TASK_SACTIVITYINPT on SA_Task (sActivityInTemplate)
--create index IDX_TASK_CPERSONID on SA_Task (sCreatorPersonID) 
--create index IDX_TASK_EPERSONID on SA_Task (sExecutorPersonID) 
--create index IDX_TASK_NAME on SA_Task (sName) 
--create index IDX_TASK_DATA on SA_Task (sData1) 
create index IDX_TASK_SFLOWID on SA_Task(sFlowID)
create index IDX_TASK_CREATETIME on SA_Task(sCreateTime)
--create index IDX_TASK_WAIT on SA_TASK (sStatusID, sKindID, sExecutorFID,  sCreateTime,  sTypeID);
--create index IDX_TASK_SUB on SA_Task (sCreatorFID, sCreateTime, sKindID, sTypeID, sStatusID); 
create index IDX_TASK_WAIT on SA_Task(sExecutorFID, sStatusID)
create index IDX_TASK_SUB on SA_Task(sCreatorFID,  sStatusID)
create index IDX_TASK_SUB2 on SA_Task(sCreatorPersonID,  sStatusID)
create index IDX_TASK_PIK on SA_Task(sParentID,sID,  sKindID)
create index IDX_TASK_DATA_P on SA_Task (sData1, sData2, sData3, sData4, sProcess)


    DROP TABLE SA_Task_SysBak	
	
CREATE TABLE [dbo].[SA_Task_SysBak] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sCode] [nvarchar] (128)  NULL ,
	[sParentID] [nvarchar] (32)  NULL ,
	[sName] [nvarchar] (255)  NULL ,
	[sContent] [ntext]  NULL ,
	[sRemark] [ntext]  NULL ,
	[sSummary] [ntext]  NULL ,
	[sFlowID] [nvarchar] (32)  NULL ,
	[sSourceID] [nvarchar] (32)  NULL ,
	[sFrontID] [nvarchar] (32)  NULL ,
	[sExecuteMode2] [nvarchar] (256)  NULL ,
	[sExecuteMode] [nvarchar] (32)  NULL ,
	[sPreemptMode] [nvarchar] (32)  NULL ,
	[sCatalogID] [nvarchar] (32)  NULL ,
	[sKindID] [nvarchar] (32)  NULL ,
	[sTypeID] [nvarchar] (32)  NULL ,
	[sTypeName] [nvarchar] (64)  NULL ,
	[sImportanceID] [nvarchar] (32)  NULL ,
	[sImportanceName] [nvarchar] (64)  NULL ,
	[sEmergencyID] [nvarchar] (32)  NULL ,
	[sEmergencyName] [nvarchar] (64)  NULL ,
	[sProcess] [nvarchar] (127)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sCURL] [ntext]  NULL ,
	[sEURL] [ntext]  NULL ,
	[sCreateTime] [datetime] NULL ,
	[sDistributeTime] [datetime] NULL ,
	[sLastModifyTime] [datetime] NULL ,
	[sWarningTime] [datetime] NULL ,
	[sLimitTime] [datetime] NULL ,
	[sExpectStartTime] [datetime] NULL ,
	[sExpectFinishTime] [datetime] NULL ,
	[sActualStartTime] [datetime] NULL ,
	[sActualFinishTime] [datetime] NULL ,
	[sExecuteTime] [datetime] NULL ,
	[sCreatorPersonID] [nvarchar] (32)  NULL ,
	[sCreatorPersonName] [nvarchar] (128)  NULL ,
	[sCreatorPosID] [nvarchar] (32)  NULL ,
	[sCreatorPosName] [nvarchar] (128)  NULL ,
	[sCreatorDeptID] [nvarchar] (32)  NULL ,
	[sCreatorDeptName] [nvarchar] (128)  NULL ,
	[sCreatorOgnID] [nvarchar] (32)  NULL ,
	[sCreatorOgnName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (212)  NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sExecutorPersonID] [nvarchar] (32)  NULL ,
	[sExecutorPersonName] [nvarchar] (128)  NULL ,
	[sExecutorPosID] [nvarchar] (32)  NULL ,
	[sExecutorPosName] [nvarchar] (128)  NULL ,
	[sExecutorDeptID] [nvarchar] (32)  NULL ,
	[sExecutorDeptName] [nvarchar] (128)  NULL ,
	[sExecutorOgnID] [nvarchar] (32)  NULL ,
	[sExecutorOgnName] [nvarchar] (128)  NULL ,
	[sExecutorFID] [nvarchar] (212)  NULL ,
	[sExecutorFName] [nvarchar] (1024)  NULL ,
	[sExecutorNames] [ntext]  NULL ,
	[sActivityNames] [ntext]  NULL ,
	[sResponsible] [nvarchar] (8)  NULL ,
	[sCustomerID] [nvarchar] (64)  NULL ,
	[sCustomerCode] [nvarchar] (64)  NULL ,
	[sCustomerName] [nvarchar] (256)  NULL ,
	[sProjectID] [nvarchar] (64)  NULL ,
	[sProjectCode] [nvarchar] (64)  NULL ,
	[sProjectName] [nvarchar] (256)  NULL ,
	[sPlanID] [nvarchar] (64)  NULL ,
	[sPlanCode] [nvarchar] (64)  NULL ,
	[sPlanName] [nvarchar] (256)  NULL ,
	[sData1] [nvarchar] (32)  NULL ,
	[sData2] [nvarchar] (32)  NULL ,
	[sData3] [nvarchar] (32)  NULL ,
	[sData4] [nvarchar] (32)  NULL ,
	[sFake] [nvarchar] (8)  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[sStatusID] [nvarchar] (32)  NULL ,
	[sStatusName] [nvarchar] (64)  NULL ,
	[sAIID] [nvarchar] (32)  NULL ,
	[sAIStatusID] [nvarchar] (256)  NULL ,
	[sAIStatusName] [nvarchar] (256)  NULL ,
	[sAIActive] [nvarchar] (8)  NULL ,
	[sWorkTime] [int] NULL ,
	[sVersionNumber] [nvarchar] (50)  NULL ,
	[sSequence] [int] NULL ,
	[sLock] [nvarchar] (32)  NULL ,
	[sHints] [ntext]  NULL ,
	[sShortcut] [ntext]  NULL ,
	[sRemindMode] [nvarchar] (32)  NULL ,
	[version] [int] NULL ,
	[sVariable] [ntext]  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sProcessTemplateID] [nvarchar] (32)  NULL ,
	[sProcessTemplateItemSequence] [nvarchar] (128)  NULL ,
	[sTempPermissionID] [nvarchar] (32)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL,
	[sWithdraw] [int] NULL ,
	[sActivityInTemplate] [nvarchar] (128)  NULL,
	[sProcessTemplateID2] [nvarchar] (32)  NULL,

	[sESField01] [nvarchar] (128)  NULL,
	[sESField02] [nvarchar] (128)  NULL,
	[sESField03] [nvarchar] (128)  NULL,
	[sESField04] [nvarchar] (128)  NULL,
	[sESField05] [nvarchar] (128)  NULL,
	[sESField06] [nvarchar] (128)  NULL,
	[sESField07] [nvarchar] (128)  NULL,
	[sESField08] [nvarchar] (128)  NULL,

	[sENField11] [numeric] (22,10)  NULL,
	[sENField12] [numeric] (22,10)  NULL,
	[sENField13] [numeric] (22,10)  NULL,
	[sENField14] [numeric] (22,10)  NULL,
	
	[sEDField21] [datetime] NULL ,
	[sEDField22] [datetime] NULL ,
	[sEDField23] [datetime] NULL ,
	[sEDField24] [datetime] NULL ,
	
	[sETField31] [ntext] NULL ,
	[sETField32] [ntext] NULL ,
	[sETField33] [ntext] NULL ,
	[sETField34] [ntext] NULL ,
  
	[sEIField41] [INTEGER] NULL ,
	[sEIField42] [INTEGER] NULL ,
	[sEIField43] [INTEGER] NULL ,
	[sEIField44] [INTEGER] NULL ,
  
	[sEBField51] [image] NULL ,
	[sEBField52] [image] NULL ,
	[sEBField53] [image] NULL ,
	[sEBField54] [image] NULL 
	
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_Task_SysBak)           
ALTER TABLE [dbo].[SA_Task_SysBak] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      


    DROP TABLE SA_Task_Histroy	
	
CREATE TABLE [dbo].[SA_Task_Histroy] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sCode] [nvarchar] (128)  NULL ,
	[sParentID] [nvarchar] (32)  NULL ,
	[sName] [nvarchar] (255)  NULL ,
	[sContent] [ntext]  NULL ,
	[sRemark] [ntext]  NULL ,
	[sSummary] [ntext]  NULL ,
	[sFlowID] [nvarchar] (32)  NULL ,
	[sSourceID] [nvarchar] (32)  NULL ,
	[sFrontID] [nvarchar] (32)  NULL ,
	[sExecuteMode2] [nvarchar] (256)  NULL ,
	[sExecuteMode] [nvarchar] (32)  NULL ,
	[sPreemptMode] [nvarchar] (32)  NULL ,
	[sCatalogID] [nvarchar] (32)  NULL ,
	[sKindID] [nvarchar] (32)  NULL ,
	[sTypeID] [nvarchar] (32)  NULL ,
	[sTypeName] [nvarchar] (64)  NULL ,
	[sImportanceID] [nvarchar] (32)  NULL ,
	[sImportanceName] [nvarchar] (64)  NULL ,
	[sEmergencyID] [nvarchar] (32)  NULL ,
	[sEmergencyName] [nvarchar] (64)  NULL ,
	[sProcess] [nvarchar] (127)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sCURL] [ntext]  NULL ,
	[sEURL] [ntext]  NULL ,
	[sCreateTime] [datetime] NULL ,
	[sDistributeTime] [datetime] NULL ,
	[sLastModifyTime] [datetime] NULL ,
	[sWarningTime] [datetime] NULL ,
	[sLimitTime] [datetime] NULL ,
	[sExpectStartTime] [datetime] NULL ,
	[sExpectFinishTime] [datetime] NULL ,
	[sActualStartTime] [datetime] NULL ,
	[sActualFinishTime] [datetime] NULL ,
	[sExecuteTime] [datetime] NULL ,
	[sCreatorPersonID] [nvarchar] (32)  NULL ,
	[sCreatorPersonName] [nvarchar] (128)  NULL ,
	[sCreatorPosID] [nvarchar] (32)  NULL ,
	[sCreatorPosName] [nvarchar] (128)  NULL ,
	[sCreatorDeptID] [nvarchar] (32)  NULL ,
	[sCreatorDeptName] [nvarchar] (128)  NULL ,
	[sCreatorOgnID] [nvarchar] (32)  NULL ,
	[sCreatorOgnName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (212)  NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sExecutorPersonID] [nvarchar] (32)  NULL ,
	[sExecutorPersonName] [nvarchar] (128)  NULL ,
	[sExecutorPosID] [nvarchar] (32)  NULL ,
	[sExecutorPosName] [nvarchar] (128)  NULL ,
	[sExecutorDeptID] [nvarchar] (32)  NULL ,
	[sExecutorDeptName] [nvarchar] (128)  NULL ,
	[sExecutorOgnID] [nvarchar] (32)  NULL ,
	[sExecutorOgnName] [nvarchar] (128)  NULL ,
	[sExecutorFID] [nvarchar] (212)  NULL ,
	[sExecutorFName] [nvarchar] (1024)  NULL ,
	[sExecutorNames] [ntext]  NULL ,
	[sActivityNames] [ntext]  NULL ,
	[sResponsible] [nvarchar] (8)  NULL ,
	[sCustomerID] [nvarchar] (64)  NULL ,
	[sCustomerCode] [nvarchar] (64)  NULL ,
	[sCustomerName] [nvarchar] (256)  NULL ,
	[sProjectID] [nvarchar] (64)  NULL ,
	[sProjectCode] [nvarchar] (64)  NULL ,
	[sProjectName] [nvarchar] (256)  NULL ,
	[sPlanID] [nvarchar] (64)  NULL ,
	[sPlanCode] [nvarchar] (64)  NULL ,
	[sPlanName] [nvarchar] (256)  NULL ,
	[sData1] [nvarchar] (32)  NULL ,
	[sData2] [nvarchar] (32)  NULL ,
	[sData3] [nvarchar] (32)  NULL ,
	[sData4] [nvarchar] (32)  NULL ,
	[sFake] [nvarchar] (8)  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[sStatusID] [nvarchar] (32)  NULL ,
	[sStatusName] [nvarchar] (64)  NULL ,
	[sAIID] [nvarchar] (32)  NULL ,
	[sAIStatusID] [nvarchar] (256)  NULL ,
	[sAIStatusName] [nvarchar] (256)  NULL ,
	[sAIActive] [nvarchar] (8)  NULL ,
	[sWorkTime] [int] NULL ,
	[sVersionNumber] [nvarchar] (50)  NULL ,
	[sSequence] [int] NULL ,
	[sLock] [nvarchar] (32)  NULL ,
	[sHints] [ntext]  NULL ,
	[sShortcut] [ntext]  NULL ,
	[sRemindMode] [nvarchar] (32)  NULL ,
	[version] [int] NULL ,
	[sVariable] [ntext]  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sProcessTemplateID] [nvarchar] (32)  NULL ,
	[sProcessTemplateItemSequence] [nvarchar] (128)  NULL ,
	[sTempPermissionID] [nvarchar] (32)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL,
	[sWithdraw] [int] NULL ,
	[sActivityInTemplate] [nvarchar] (128)  NULL,
	[sProcessTemplateID2] [nvarchar] (32)  NULL,

	[sESField01] [nvarchar] (128)  NULL,
	[sESField02] [nvarchar] (128)  NULL,
	[sESField03] [nvarchar] (128)  NULL,
	[sESField04] [nvarchar] (128)  NULL,
	[sESField05] [nvarchar] (128)  NULL,
	[sESField06] [nvarchar] (128)  NULL,
	[sESField07] [nvarchar] (128)  NULL,
	[sESField08] [nvarchar] (128)  NULL,

	[sENField11] [numeric] (22,10)  NULL,
	[sENField12] [numeric] (22,10)  NULL,
	[sENField13] [numeric] (22,10)  NULL,
	[sENField14] [numeric] (22,10)  NULL,
	
	[sEDField21] [datetime] NULL ,
	[sEDField22] [datetime] NULL ,
	[sEDField23] [datetime] NULL ,
	[sEDField24] [datetime] NULL ,
	
	[sETField31] [ntext] NULL ,
	[sETField32] [ntext] NULL ,
	[sETField33] [ntext] NULL ,
	[sETField34] [ntext] NULL ,
  
	[sEIField41] [INTEGER] NULL ,
	[sEIField42] [INTEGER] NULL ,
	[sEIField43] [INTEGER] NULL ,
	[sEIField44] [INTEGER] NULL ,
  
	[sEBField51] [image] NULL ,
	[sEBField52] [image] NULL ,
	[sEBField53] [image] NULL ,
	[sEBField54] [image] NULL 
	
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_Task_Histroy)           
ALTER TABLE [dbo].[SA_Task_Histroy] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      


create index IDX_TASKH_SFLOWID on SA_Task_Histroy(sFlowID)
create index IDX_TASKH_CREATETIME on SA_Task_Histroy(sCreateTime)
create index IDX_TASKH_WAIT on SA_Task_Histroy(sExecutorFID, sStatusID)
create index IDX_TASKH_SUB on SA_Task_Histroy(sCreatorFID,  sStatusID)
create index IDX_TASKH_SUB2 on SA_Task_Histroy(sCreatorPersonID,  sStatusID)
create index IDX_TASKH_PIK on SA_Task_Histroy(sParentID,sID,  sKindID)
create index IDX_TASKH_DATA_P on SA_Task_Histroy (sData1, sData2, sData3, sData4, sProcess)


	
    DROP TABLE SA_ProcessTemplate		
	
CREATE TABLE [dbo].[SA_ProcessTemplate] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sTemplateID] [nvarchar] (32),
	[sName] [nvarchar] (32)  NULL ,
	[sKindID] [nvarchar] (32)  NULL ,
	[sTypeID] [nvarchar] (32)  NULL ,
	[sScopeID] [nvarchar] (32)  NULL ,
	[sProcess] [nvarchar] (255)  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (1024)  NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sCreatorID] [nvarchar] (32)  NULL ,
	[sCreatorName] [nvarchar] (128)  NULL ,
	[sCreateTime] [datetime] NULL ,
	[sContent] [ntext]  NULL ,
	[sContent2] [ntext]  NULL ,
	[sValidState] [int]  NULL ,
	[version] [int] NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_ProcessTemplate)            
ALTER TABLE [dbo].[SA_ProcessTemplate] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
create index IDX_SA_PT_ALL on SA_ProcessTemplate (sTypeID, sKindID, sName, sProcessName) 
create index IDX_SA_PT_PROCESS on SA_ProcessTemplate (sProcess) 
create index IDX_SA_PT_CREATETIME on SA_ProcessTemplate (sCreateTime) 

	
    DROP TABLE SA_ResourceControl		
	
CREATE TABLE [dbo].[SA_ResourceControl] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sName] [nvarchar] (128),
	[sOrgID] [nvarchar] (65)  NOT NULL ,
	[sOrgName] [nvarchar] (128)  NULL ,
	[sOrgFID] [nvarchar] (255)  NOT NULL ,
	[sOrgFName] [nvarchar] (1024)  NULL ,
	[sResourceID] [nvarchar] (255)  NOT NULL ,
	[sTypeID] [nvarchar] (128),
	[sTypeName] [nvarchar] (128),
	[sDescription] [ntext]  NULL ,
	[sCreatorID] [nvarchar] (65)  NOT NULL ,
	[sCreatorName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (255)  NOT NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sCreateTime] [datetime] NULL ,
	[sProcess] [nvarchar] (255)  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL ,
	[sAction] [nvarchar] (128)  NULL ,
	[sActionName] [nvarchar] (128)  NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY]

--$clientIndex(SA_ResourceControl)            
 
ALTER TABLE [dbo].[SA_ResourceControl] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]  	
	
create index IDX_RC_ORGFID on SA_ResourceControl (sOrgFID)
create index IDX_RC_ORGID on SA_ResourceControl (sOrgID)
create index IDX_RC_CID on SA_ResourceControl (sCreatorID)
create index IDX_RC_CFID on SA_ResourceControl (sCreatorFID)
create index IDX_RC_CTIME on SA_ResourceControl (sCreateTime)
create index IDX_RC_RID on SA_ResourceControl (sResourceID)
create index IDX_RC_P on SA_ResourceControl (sProcess)
create index IDX_RC_AY on SA_ResourceControl (sActivity)
create index IDX_RC_AN on SA_ResourceControl (sAction)
	
    DROP TABLE SA_TaskRelation		

CREATE TABLE [dbo].[SA_TaskRelation] (
	$clientDefine,
	[sTaskID1] [nvarchar] (32)  NOT NULL ,
	[sTaskID2] [nvarchar] (32)  NOT NULL ,
	[sKind] [varbinary] (36) NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_TaskRelation)             
ALTER TABLE [dbo].[SA_TaskRelation] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sTaskID1],[sTaskID2]
	)  ON [PRIMARY]      

    DROP TABLE SA_TaskRelation_SysBak		

CREATE TABLE [dbo].[SA_TaskRelation_SysBak] (
	$clientDefine,
	[sTaskID1] [nvarchar] (32)  NOT NULL ,
	[sTaskID2] [nvarchar] (32)  NOT NULL ,
	[sKind] [varbinary] (36) NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_TaskRelation_SysBak)             
ALTER TABLE [dbo].[SA_TaskRelation_SysBak] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sTaskID1],[sTaskID2]
	)  ON [PRIMARY]      
	
	
    DROP TABLE SA_TaskRelation_Histroy		

CREATE TABLE [dbo].[SA_TaskRelation_Histroy] (
	$clientDefine,
	[sTaskID1] [nvarchar] (32)  NOT NULL ,
	[sTaskID2] [nvarchar] (32)  NOT NULL ,
	[sKind] [varbinary] (36) NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_TaskRelation_Histroy)             
ALTER TABLE [dbo].[SA_TaskRelation_Histroy] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sTaskID1],[sTaskID2]
	)  ON [PRIMARY]      

	
    DROP TABLE SA_TaskType		
CREATE TABLE [dbo].[SA_TaskType] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sName] [nvarchar] (128)  NULL ,
	[sConcept] [nvarchar] (128)  NULL ,
	[sNewActivity] [nvarchar] (1024)  NULL ,
	[sExecuteActivity] [nvarchar] (1024)  NULL ,
	[sKind] [nvarchar] (32)  NULL ,
	[version] [int] NULL ,
	[sProcess] [nvarchar] (1024)  NULL ,
	[sActivity] [nvarchar] (128)  NULL 
) ON [PRIMARY]
 
--$clientIndex(SA_TaskType)              
ALTER TABLE [dbo].[SA_TaskType] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
    DROP TABLE SA_RemindActionParameter		
CREATE TABLE [dbo].[SA_RemindActionParameter] (
	$clientDefine,
	[sID] [nvarchar] (50)  NOT NULL ,
	[sRemindID] [nvarchar] (50)  NOT NULL ,
	[sName] [nvarchar] (50)  NOT NULL ,
	[sDataType] [nvarchar] (50)  NULL ,
	[sValue] [nvarchar] (100)  NOT NULL ,
	[version] [int] NULL 
) ON [PRIMARY]
 
 
--$clientIndex(SA_RemindActionParameter)               
ALTER TABLE [dbo].[SA_RemindActionParameter] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
    DROP TABLE SA_Remind		
CREATE TABLE [dbo].[SA_Remind] (
	$clientDefine,
	[sID] [nvarchar] (50)  NOT NULL ,
	[sName] [nvarchar] (200)  NOT NULL ,
	[sRemindStyle] [nvarchar] (50)  NOT NULL ,
	[sRemindStyleName] [nvarchar] (50)  NULL ,
	[sTimes] [int] NULL ,
	[sActualStartTime] [datetime] NOT NULL ,
	[sActualFinishTime] [datetime] NULL ,
	[sLastTime] [datetime] NULL ,
	[sIntervalTime] [datetime] NULL ,
	[sProcess] [nvarchar] (1024)  NULL ,
	[sActivity] [nvarchar] (1024)  NULL ,
	[sAction] [nvarchar] (100)  NULL ,
	[sStatus] [nvarchar] (30)  NULL ,
	[sCreatorID] [nvarchar] (50)  NOT NULL ,
	[sCreatorName] [nvarchar] (100)  NOT NULL ,
	[sRemark] [nvarchar] (500)  NULL ,
	[sReturnable] [nvarchar] (50)  NULL ,
	[sReturnPattern] [nvarchar] (500)  NULL ,
	[sActionParam] [int] NULL ,
	[version] [int] NULL ,
	[sCondition] [nvarchar] (500)  NULL ,
	[sIntervalDay] [int] NULL ,
	[sIntervalHour] [int] NULL ,
	[sIntervalMin] [int] NULL ,
	[sType] [int] NULL ,
	[sDataModel] [nvarchar] (50)  NULL ,
	[sContent] [ntext]  NULL ,
	[sReminder] [ntext]  NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_Remind)                
ALTER TABLE [dbo].[SA_Remind] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      
	
	
    DROP TABLE SA_TokenInstance	
	
CREATE TABLE [dbo].[SA_TokenInstance] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sProcessInstanceID] [nvarchar] (32)  NULL ,
	[sProcess] [nvarchar] (1024)  NULL ,
	[sProcessTemplateID2] [nvarchar] (32)  NULL ,
	[sPlace] [nvarchar] (128)  NULL ,
	[sFromActivityInstanceID] [nvarchar] (32)  NULL ,
	[sFromActivity] [nvarchar] (128)  NULL ,
	[sToActivity] [nvarchar] (128)  NULL ,
	[sToActivityInstanceID] [nvarchar] (32)  NULL ,
	[sValue] [ntext]  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[version] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_TokenInstance)                 
ALTER TABLE [dbo].[SA_TokenInstance] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_TI_PI on SA_TokenInstance (sProcessInstanceID)


    DROP TABLE SA_TokenInstance_SysBak	
	
CREATE TABLE [dbo].[SA_TokenInstance_SysBak] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sProcessInstanceID] [nvarchar] (32)  NULL ,
	[sProcess] [nvarchar] (1024)  NULL ,
	[sProcessTemplateID2] [nvarchar] (32)  NULL ,
	[sPlace] [nvarchar] (128)  NULL ,
	[sFromActivityInstanceID] [nvarchar] (32)  NULL ,
	[sFromActivity] [nvarchar] (128)  NULL ,
	[sToActivity] [nvarchar] (128)  NULL ,
	[sToActivityInstanceID] [nvarchar] (32)  NULL ,
	[sValue] [ntext]  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[version] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_TokenInstance_SysBak)                 
ALTER TABLE [dbo].[SA_TokenInstance_SysBak] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

    DROP TABLE SA_TokenInstance_Histroy	
	
CREATE TABLE [dbo].[SA_TokenInstance_Histroy] (
	$clientDefine,
	[sID] [nvarchar] (32)  NOT NULL ,
	[sProcessInstanceID] [nvarchar] (32)  NULL ,
	[sProcess] [nvarchar] (1024)  NULL ,
	[sProcessTemplateID2] [nvarchar] (32)  NULL ,
	[sPlace] [nvarchar] (128)  NULL ,
	[sFromActivityInstanceID] [nvarchar] (32)  NULL ,
	[sFromActivity] [nvarchar] (128)  NULL ,
	[sToActivity] [nvarchar] (128)  NULL ,
	[sToActivityInstanceID] [nvarchar] (32)  NULL ,
	[sValue] [ntext]  NULL ,
	[sActive] [nvarchar] (8)  NULL ,
	[version] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
 
--$clientIndex(SA_TokenInstance_Histroy)                 
ALTER TABLE [dbo].[SA_TokenInstance_Histroy] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]      

create index IDX_TIH_PI on SA_TokenInstance_Histroy (sProcessInstanceID)


    DROP TABLE SA_ThemeDefine	

create table [dbo].[SA_ThemeDefine]
(
	$clientDefine,
  [sID]               [nvarchar](36) not null,
  [version]           [int] NULL ,
  [sThemeName]        [nvarchar](100) NULL ,
  [sThemeLayoutInfo]  [ntext]  NULL ,
  [sThemePublishType] [nvarchar](100) NULL ,
  [sThemeActivity]    [nvarchar](1024) NULL ,
  [sCreatorID]        [nvarchar](100) NULL 
)ON [PRIMARY]
 
--$clientIndex(SA_ThemeDefine)                  
ALTER TABLE [dbo].[SA_ThemeDefine] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]       
   
    DROP TABLE SA_ThemeManager	
   
create table [dbo].[SA_ThemeManager]
(
	$clientDefine,
  [sID]            [nvarchar] (36)  NOT NULL ,
  [version]        [int] NULL ,
  [sThemeID]       [nvarchar](100) NULL ,
  [sOrgID]         [nvarchar](100) NULL ,
  [sThemeActivity] [nvarchar](1024) NULL 
)ON [PRIMARY]
 
--$clientIndex(SA_ThemeManager)                   
ALTER TABLE [dbo].[SA_ThemeManager] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY]       
  
create index IDX_CHATPROMISSION_OPM_OTHER_ID on SA_ChatPromission (sOpmId, sOtherSideId)
create index IDX_CHATPROMISSION_OPMID on SA_ChatPromission (sOpmId)
create index IDX_CHATPROMISSION_OPMURL on SA_ChatPromission (sOpmUrl)
create index IDX_CHATPROMISSION_OTHERSIDEID on SA_ChatPromission (sOtherSideId)
create index IDX_CHATPROMISSION_OTHERSIDEURL on SA_ChatPromission (sOtherSideUrl)
create index IDX_CHATPROMISSION_PROMISSIONTYPE on SA_ChatPromission (sPromissionType)

    DROP TABLE SA_Log	

create table [dbo].[SA_Log]
(
	$clientDefine,
	[sID]            	[nvarchar] (32)  NOT NULL ,
	[sTypeName]       [nvarchar](128) NULL ,
	[sDescription]    [ntext] NULL ,
	[sCreateTime] [datetime] NULL ,
	[sProcess] [nvarchar] (255)  NULL ,
	[sProcessName] [nvarchar] (128)  NULL ,
	[sActivity] [nvarchar] (128)  NULL ,
	[sActivityName] [nvarchar] (128)  NULL ,
	[sAction] [nvarchar] (128)  NULL ,
	[sDeviceType] [nvarchar] (32)  NULL ,
	[sOperatingSystem] [nvarchar] (32)  NULL ,
	[sActionName] [nvarchar] (128)  NULL ,
	[sParameters]    [ntext] NULL ,
	[sResult]    [ntext] NULL ,
	[sStatusName] [nvarchar] (32)  NULL ,
	[sCreatorPersonID] [nvarchar] (32)  NULL ,
	[sCreatorPersonName] [nvarchar] (128)  NULL ,
	[sCreatorPosID] [nvarchar] (32)  NULL ,
	[sCreatorPosName] [nvarchar] (128)  NULL ,
	[sCreatorDeptID] [nvarchar] (32)  NULL ,
	[sCreatorDeptName] [nvarchar] (128)  NULL ,
	[sCreatorOgnID] [nvarchar] (32)  NULL ,
	[sCreatorOgnName] [nvarchar] (128)  NULL ,
	[sCreatorFID] [nvarchar] (255)  NULL ,
	[sCreatorFName] [nvarchar] (1024)  NULL ,
	[sIP] [nvarchar] (32)  NULL ,
	[sESField01] [nvarchar] (256)  NULL,
	[sESField02] [nvarchar] (256)  NULL,
	[sESField03] [nvarchar] (256)  NULL,
	[sESField04] [nvarchar] (256)  NULL,

	[sENField11] [numeric] (22,10)  NULL,
	[sENField12] [numeric] (22,10)  NULL,
	
	[sEDField21] [datetime] NULL ,
	[sEDField22] [datetime] NULL ,
	
	[sETField31] [ntext] NULL ,
	[sETField32] [ntext] NULL ,
  
	[sEIField41] [INTEGER] NULL ,
	[sEIField42] [INTEGER] NULL ,
  
	[sEBField51] [image] NULL ,
	[sEBField52] [image] NULL ,
	[version]        	[int] NULL 
)ON [PRIMARY]

--$clientIndex(SA_Log)                   
 
ALTER TABLE [dbo].[SA_Log] ADD 
	PRIMARY KEY  CLUSTERED 
	(
		[sID],
		$clientName
	)  ON [PRIMARY] 
	
create index IDX_LOG_PROCESS on SA_Log (sProcess)
create index IDX_LOG_ACTIVITY on SA_Log (sActivity)
create index IDX_LOG_ACTION on SA_Log (sAction)
create index IDX_LOG_CFID on SA_Log (sCreatorFID)
create index IDX_LOG_CT on SA_Log (sCreateTime)

    DROP TABLE SA_DocLog	

CREATE TABLE [dbo].[SA_DocLog](
	$clientDefine,
	[version] [int] NULL,
	[sPersonName] [varchar](64) NULL,
	[sAccessType] [varchar](16) NULL,
	[sDocID] [varchar](64) NULL,
	[sID] [varchar](36) NOT NULL,
	[sTime] [datetime] NULL,
	[sDeptName] [varchar](64) NULL,
	[sPersonFID] [varchar](512) NULL,
	[sDocVersionID] [int] NULL,
   	[sDocName] [varchar](128) NULL,
	[sSize] [float] NULL,
 CONSTRAINT [PK_ACCESSRECORD] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY]

--$clientIndex(SA_DocLog)                    
 
    DROP TABLE SA_DocAuth	 
 
CREATE TABLE [dbo].[SA_DocAuth](
	$clientDefine,
	[sID] [varchar](36) NOT NULL,
	[sDocPath] [varchar](2048) NULL,
	[sAuthorizerFID] [varchar](512) NULL,
	[sAuthorizerName] [varchar](64) NULL,
	[sAuthorizerDeptName] [varchar](64) NULL,
	[sAuthorizeeFID] [varchar](512) NULL,
	[sAuthorizeeName] [varchar](64) NULL,
	[sGrantTime] [datetime] NULL,
	[sAccess] [int] NULL,
	[sScope] [varchar](16) NULL,
	[sAuthorizeeDeptName] [varchar](64) NULL,
	[version] [int] NULL,
 CONSTRAINT [PK_DOCAUTH] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY]

--$clientIndex(SA_DocAuth)                    

    DROP TABLE SA_DocLink	  
 
CREATE TABLE [dbo].[SA_DocLink](
	$clientDefine,
	[sID] [varchar](36) NOT NULL,
	[sOwnerID] [varchar](256) NULL,
	[sDocID] [varchar](36) NULL,
	[version] [int] NULL,
	[sActivity] [varchar](128) NULL,
	[sProcess] [varchar](512) NULL,
 CONSTRAINT [PK_DOCLINK] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY]

--$clientIndex(SA_DocLink)                     
 
    DROP TABLE SA_DocLinkDefine	 
 
CREATE TABLE [dbo].[SA_DocLinkDefine](
	$clientDefine,
	[sID] [varchar](36) NOT NULL,
	[sRootPath] [varchar](2048) NULL,
	[sRootName] [varchar](512) NULL,
	[sProcess] [varchar](512) NULL,
	[sActivity] [varchar](128) NULL,
	[sPersonFID] [varchar](512) NULL,
	[sDeptName] [varchar](64) NULL,
	[sPersonName] [varchar](64) NULL,
	[sLimitSize] [float] NULL,
	[sSubPath] [varchar](512) NULL,
	[sAccess] [int] NULL,
   	[sShowChildren] [varchar](36) NULL, 
	[sDefineItems] [ntext]  NULL ,
	[sDisplayName] [varchar](512) NULL,
	[version] [int] NULL,
 CONSTRAINT [PK_DOCLINKDEFINE] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY]

--$clientIndex(SA_DocLinkDefine)                      

 
    DROP TABLE SA_DocNode	 

CREATE TABLE [dbo].[SA_DocNode](
	$clientDefine,
	[sID] [varchar](36) NOT NULL,
	[sParentID] [varchar](36) NULL,
	[sDocName] [varchar](128) NULL,
	[sSequence] [varchar](128) NULL,
	[sSize] [float] NULL,
	[sKind] [varchar](128) NULL,
	[sDocPath] [varchar](2048) NULL,
	[sDocDisplayPath] [text] NULL,
	[sCreatorFID] [varchar](2048) NULL,
	[sCreatorName] [varchar](64) NULL,
	[sCreatorDeptName] [varchar](64) NULL,
	[sCreateTime] [datetime] NULL,
	[sEditorFID] [varchar](2048) NULL,
	[sEditorName] [varchar](64) NULL,
	[sEditorDeptName] [varchar](64) NULL,
	[sLastWriterFID] [varchar](2048) NULL,
	[sLastWriterName] [varchar](64) NULL,
	[sLastWriterDeptName] [varchar](64) NULL,
	[sLastWriteTime] [datetime] NULL,
	[sFileID] [varchar](128) NULL,
	[sDescription] [text] NULL,
	[sDocLiveVersionID] [int] NULL,
	[version] [int] NULL,
	[sFinishTime] [datetime] NULL,
	[sClassification] [varchar](128) NULL,
	[sKeywords] [varchar](256) NULL,
	[sDocSerialNumber] [varchar](128) NULL,
    [sNameSpace] [varchar](256) NULL,
	[sCacheName] [varchar](100) NULL,
    [sRevisionCacheName ] [varchar](100) NULL,
    [sFlag] [int] NULL, 
 CONSTRAINT [PK_DOCNODE] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--$clientIndex(SA_DocNode)                      

    DROP TABLE SA_DocNameSpace	

CREATE TABLE [dbo].[SA_DocNameSpace](
	$clientDefine,
	[sID] [varchar](128)  NOT NULL,
	[sDisplayName] [varchar](256)  NULL,
	[sHost] [varchar](128)  NULL,
	[sPort] [int] NULL,
	[sUrl] [varchar](128)  NULL,
	[version] [int] NULL,
	[sFlag] [int] NULL,
	[sAccessMode] [varchar](64),
 CONSTRAINT [PK_NAMESPACE] PRIMARY KEY CLUSTERED 
(
	[sID] ASC,
	$clientName
)
) ON [PRIMARY]

--$clientIndex(SA_DocNameSpace)    
                  
  DROP TABLE SA_Terminal
CREATE TABLE SA_Terminal (
	$clientDefine,
	sID nvarchar (32) NOT NULL ,
	sPersonID nvarchar (32) NOT NULL ,
	sTypeID nvarchar (32) NOT NULL ,
	sTypeName nvarchar (64) NOT NULL ,
	sAccountNumber nvarchar (128) NOT NULL ,
	sProtocol nvarchar (32) NOT NULL ,
	sValidState int,
	sIsDefault int,
	version int NOT NULL
)

ALTER TABLE SA_Terminal ADD 
	 PRIMARY KEY  (sID, 	$clientName)
create index IDX_TERMINAL_PNS on SA_Terminal (sPersonID)
--$clientIndex(SA_Terminal) 	

  DROP TABLE SA_ShortURL
CREATE TABLE SA_ShortURL (
	sID nvarchar (128) NOT NULL ,
	sLongURL nvarchar (1024),
    sCreateTime     datetime,
	version int NOT NULL
)
ALTER TABLE SA_ShortURL ADD 
	 PRIMARY KEY  (sID)
