set client_min_messages='ERROR';


drop table SA_Client;
drop table SA_AppVendor;
drop table SA_App;
drop table SA_ClientApp;

CREATE TABLE SA_Client (
	$clientDefine,
	sID 			VARCHAR(32) NOT NULL ,
	sName 			VARCHAR(64) NOT NULL ,
	sLongName 		VARCHAR(128),
	sCode 			VARCHAR(32) NOT NULL ,
	sIndustry 		VARCHAR(32),
	sEmployeesSize 	INTEGER,
	sContact 		VARCHAR(64),
	sEmail 			VARCHAR(64),
	sPhone 			VARCHAR(64),
	sFax  			VARCHAR(64),
	sAddress 		VARCHAR(255),
	sZip 			VARCHAR(16),
	sDescription    TEXT,
	sCreateTime		TIMESTAMP,
	sCreatorID		VARCHAR(32),
	sCreatorName	VARCHAR(64),
	version 		INTEGER NOT NULL 
);

ALTER TABLE SA_Client ADD 
	 PRIMARY KEY  (sID); 
	 
CREATE TABLE SA_AppVendor (
	$clientDefine,
	sID 			VARCHAR(32) NOT NULL ,
	sName 			VARCHAR(64) NOT NULL ,
	sLongName 		VARCHAR(128),
	sCode 			VARCHAR(32) NOT NULL ,
	sIndustry 		VARCHAR(32),
	sEmployeesSize 	INTEGER,
	sContact 		VARCHAR(64),
	sEmail 			VARCHAR(64),
	sPhone 			VARCHAR(64),
	sFax  			VARCHAR(64),
	sAddress 		VARCHAR(255),
	sZip 			VARCHAR(16),
	sDescription    TEXT,
	sCreateTime		TIMESTAMP,
	sCreatorID		VARCHAR(32),
	sCreatorName	VARCHAR(64),
	version 		INTEGER NOT NULL 
);

ALTER TABLE SA_AppVendor ADD 
	 PRIMARY KEY  (sID); 	 
	 
CREATE TABLE SA_App (
	$clientDefine,
	sID 			VARCHAR(32) NOT NULL ,
	sName 			VARCHAR(64) NOT NULL ,
	sCode 			VARCHAR(32) NOT NULL ,
	sModel	 		VARCHAR(128) NOT NULL,
	sDescription    TEXT,
	sAppVersion		VARCHAR(64),
	sVendorID		VARCHAR(32),
	sVendorName		VARCHAR(64),
	sValidState		INTEGER,
	sCreateTime		TIMESTAMP,
	sCreatorID		VARCHAR(32),
	sCreatorName	VARCHAR(64),
	version 		INTEGER NOT NULL 
);

ALTER TABLE SA_App ADD 
	 PRIMARY KEY  (sID); 	 
	 
	 
CREATE TABLE SA_ClientApp (
	$clientDefine,
	sID 			VARCHAR(32) NOT NULL ,
	sClientID		VARCHAR(32),
	sClientName		VARCHAR(64),
	sAppID			VARCHAR(32),
	sAppName		VARCHAR(64),
	sAppModel 		VARCHAR(128) NOT NULL,
	sAppVersion		VARCHAR(64),
	sVendorID		VARCHAR(32),
	sVendorName		VARCHAR(64),
	sRentStartTime	TIMESTAMP NOT NULL,
	sRentEndTime	TIMESTAMP,
	sRentDays		INTEGER,
	sRentNumber		INTEGER NOT NULL,
	sValidState		INTEGER,
	sCreateTime		TIMESTAMP,
	sCreatorID		VARCHAR(32),
	sCreatorName	VARCHAR(64),
	version 		INTEGER NOT NULL 
);

ALTER TABLE SA_ClientApp ADD 
	 PRIMARY KEY  (sID); 	




drop table SA_OPCustomGroup;
CREATE TABLE SA_OPCustomGroup (
	$clientDefine,
	sID VARCHAR(32) NOT NULL ,
	version INTEGER NOT NULL ,
	sName VARCHAR(64) NOT NULL ,
	sTypeID VARCHAR(32) NOT NULL ,
	sTypeName VARCHAR(64) NOT NULL ,
	sSequence INTEGER NULL ,
	sCreatorID VARCHAR(32) NULL ,
	sCreatorName VARCHAR(64) NULL ,
	sCreateTime TIMESTAMP NULL
);
 
ALTER TABLE SA_OPCustomGroup ADD 
	 PRIMARY KEY  ($clientName, sID); 
	 
drop table SA_Runtime;
CREATE TABLE SA_Runtime (
	sID VARCHAR(64)  NOT NULL ,
	sString VARCHAR(128)  NULL ,
	sString2 VARCHAR(128)  NULL ,
	sString3 VARCHAR(128)  NULL ,
	sInteger INTEGER NULL ,
	sInteger2 INTEGER NULL ,
	sInteger3 INTEGER NULL ,
	fNumeric NUMBER(38) NULL ,
	fNumeric2 NUMBER(38) NULL ,
	fNumeric3 NUMBER(38) NULL ,
	fDatetime TIMESTAMP NULL ,
	fDatetime2 TIMESTAMP NULL ,
	fDatetime3 TIMESTAMP NULL ,
	sData text NULL ,
	sBData BLOB NULL
);
 
ALTER TABLE SA_Runtime ADD 
	 PRIMARY KEY  (sID);
	 
drop table SA_QuickStart;	 
create table SA_QuickStart
(
	$clientDefine,
  sID       VARCHAR(32) not null,
  version   INTEGER,
  sLabel    VARCHAR(1024),
  sIcon     VARCHAR(1024),
  sURL      VARCHAR(1024),
  sProcess  VARCHAR(1024),
  sActivity VARCHAR(1024),
  sPersonID VARCHAR(32),
  sSequence INTEGER
);
alter table SA_QuickStart
  add primary key ($clientName, sID);

drop table SA_PortalProfiles;	   
create table SA_PortalProfiles
(
	$clientDefine,
  sID       VARCHAR(100) not null,
  version   NUMBER(38),
  sName     VARCHAR(100),
  sPersonID VARCHAR(100),
  sValue    VARCHAR(4000)
)
;
alter table SA_PortalProfiles
  add primary key ($clientName, sID);
drop table SA_Portal2Profiles;
  create table SA_Portal2Profiles
(
	$clientDefine,
  sID            VARCHAR2(100) not null,
  version        INTEGER,
  sPersonID      VARCHAR2(100),
  sFunctree      TEXT,
  sPortal        TEXT,
  sOther         TEXT,
  sPublishType   VARCHAR2(100),
  sThemeName     VARCHAR2(100),
  sThemeActivity VARCHAR2(100)
);
alter table SA_Portal2Profiles
  add primary key ($clientName, sID);
drop table SA_Portal2ProfileManager;
create table SA_Portal2ProfileManager
(
	$clientDefine,
  sID            VARCHAR2(100) not null,
  version        INTEGER,
  sThemeID       VARCHAR2(100),
  sOrgID         VARCHAR2(100),
  sPublishType   VARCHAR2(100),
  sThemeActivity VARCHAR2(100)
);
alter table SA_Portal2ProfileManager
  add primary key ($clientName, sID);
drop table SA_Code;
create table SA_Code
(
	$clientDefine,
  sID     VARCHAR(32) not null,
  sType   VARCHAR(64),
  sCode   VARCHAR(64) not null,
  sName   VARCHAR(64),
  sText   VARCHAR(1024),
  version INTEGER not null
);

alter table SA_Code
  add constraint PK_SA_CODE primary key ($clientName, sID);

drop table SA_KVSequence; 
create table SA_KVSequence
(
	$clientDefine,
  K VARCHAR(255) not null,
  V INTEGER not null
);
alter table SA_KVSequence
  add constraint PK_KVSEQUENCE primary key ($clientName, K);

drop table SA_OPAgent;   
create table SA_OPAgent
(
	$clientDefine,
  sID         VARCHAR(32) not null,
  sOrgFID     VARCHAR(2048) not null,
  sOrgFName   VARCHAR(2048) not null,
  sAgentID    VARCHAR(32) not null,
  sValidState     INTEGER,
  sStartTime  TIMESTAMP,
  sFinishTime TIMESTAMP,
  sProcess	  TEXT,
  sCreatorID  VARCHAR(32),
  sCreatorName VARCHAR(64),
  sCreateTime TIMESTAMP,
  sCanTranAgent INTEGER,
  version     INTEGER not null
);

alter table SA_OPAgent
  add constraint PK_OPAGENT primary key ($clientName, sID);
 
drop table SA_MessageParameter;    
create table SA_MessageParameter
(
	$clientDefine,
  sID         VARCHAR(50) not null,
  sChatNumber INTEGER,
  sSendNumber INTEGER,
  sFileSize   INTEGER,
  sCanUse     INTEGER,
  sOpmId      VARCHAR(50) not null,
  sOpmKind    VARCHAR(50) not null,
  sName       VARCHAR(50) not null,
  version     INTEGER not null
);
alter table SA_MessageParameter
  add constraint PK_MessageParameter primary key ($clientName, sID);
  
drop table SA_ChatPromission;      
create table SA_ChatPromission
(
	$clientDefine,
  sID             VARCHAR(50) not null,
  sOpmKind        VARCHAR(50) not null,
  sOpmId          VARCHAR(50) not null,
  sName           VARCHAR(50) not null,
  sOtherSideId    VARCHAR(50) not null,
  sOtherSideKind  VARCHAR(50) not null,
  sOtherSideName  VARCHAR(50) not null,
  sPromissionType INTEGER not null,
  sOtherSideUrl   VARCHAR(255),
  sOpmUrl         VARCHAR(255),
  version         INTEGER not null
);
alter table SA_ChatPromission
  add constraint PK_ChatPromission primary key ($clientName, sID);
create index IDX_CHATPROMISSION_OO_ID on SA_ChatPromission (sOpmId, sOtherSideId);
create index IDX_CHATPROMISSION_OO_URL on SA_ChatPromission (sOpmUrl, sOtherSideUrl);
create index IDX_CHATPROMISSION_OPMID on SA_ChatPromission (sOpmId);
create index IDX_CHATPROMISSION_OPMURL on SA_ChatPromission (sOpmUrl);
create index IDX_CHATPROMISSION_OTHRID on SA_ChatPromission (sOtherSideId);
create index IDX_CHATPROMISSION_OTHRURL on SA_ChatPromission (sOtherSideUrl);
create index IDX_CHATPROMISSION_PSNTYPE on SA_ChatPromission (sPromissionType);

drop table SA_OPAuthorize;      
create table SA_OPAuthorize
(
	$clientDefine,
  sID              VARCHAR(32) not null,
  sOrgID           VARCHAR(65) not null,
  sOrgName         VARCHAR(255),
  sOrgFID          VARCHAR(212) not null,
  sOrgFName        VARCHAR(255),
  sAuthorizeRoleID VARCHAR(32) not null,
  sDescription     VARCHAR(1024),
  sCreatorFID      VARCHAR(2048),
  sCreatorFName    VARCHAR(2048),
  sCreateTime      TIMESTAMP,
  version          INTEGER not null
);

alter table SA_OPAuthorize
  add constraint PK_OPAUTHORIZE primary key ($clientName, sID);

create index IDX_OPAUTH_ORGID on SA_OPAuthorize (sOrgID);
create index IDX_OPAUTH_ORGFID on SA_OPAuthorize (sOrgFID);
create index IDX_OPAUTH_ORGFNAME on SA_OPAuthorize (sOrgFName);
create index IDX_OPAUTH_ROLEID on SA_OPAuthorize (sAuthorizeRoleID);
create index IDX_OPAUTH_MAIN on SA_OPAuthorize (sAuthorizeRoleID, sOrgFID);

drop table SA_OPManagement;      
create table SA_OPManagement
(
	$clientDefine,
  sID             VARCHAR(32) not null,
  sOrgID          VARCHAR(65) not null,
  sOrgName        VARCHAR(255),
  sOrgFID         VARCHAR(255) not null,
  sOrgFName       VARCHAR(255),
  sManageOrgID    VARCHAR(65) not null,
  sManageOrgName  VARCHAR(255),
  sManageOrgFID   VARCHAR(255) not null,
  sManageOrgFName VARCHAR(255),
  sManageTypeID   VARCHAR(32) not null,
  sCreatorFID     VARCHAR(2048),
  sCreatorFName   VARCHAR(2048),
  sCreateTime     TIMESTAMP,
  version         INTEGER not null
);

alter table SA_OPManagement
  add constraint PK_OPMANAGEMENT primary key ($clientName, sID);

create index IDX_OPMNAGE_ORGID on SA_OPManagement (sOrgID);
create index IDX_OPMNAGE_ORGFID on SA_OPManagement (sOrgFID);
create index IDX_OPMNAGE_ORGFNAME on SA_OPManagement (sOrgFName);
create index IDX_OPMNAGE_MORGID on SA_OPManagement (sManageOrgID);
create index IDX_OPMNAGE_MORGFID on SA_OPManagement (sManageOrgFID);
create index IDX_OPMNAGE_MORGFNAME on SA_OPManagement (sManageOrgFName);
drop table SA_OPManageType;      
create table SA_OPManageType
(
	$clientDefine,
  sID                VARCHAR(32) not null,
  sName              VARCHAR(255),
  sCode              VARCHAR(32),
  sManageOrgKind     VARCHAR(64),
  sManageOrgKindName VARCHAR(255),
  sLeaderNumber      INTEGER,
  sIsSystem          INTEGER,
  version            INTEGER not null
);
alter table SA_OPManageType
  add constraint PK_OPMANAGETYPE primary key ($clientName, sID);

drop table SA_OPOrg;      
create table SA_OPOrg
(
	$clientDefine,
  sID          VARCHAR(39) not null,
  sName        VARCHAR(128) not null,
  sCode        VARCHAR(64) not null,
  sLongName    VARCHAR(255),
  sFName       VARCHAR(2048),
  sFCode       VARCHAR(255),
  sFID         VARCHAR(255) not null,
  sOrgKindID   VARCHAR(5) not null,
  sSequence    VARCHAR(128),
  sValidState  INTEGER,
  sParent      VARCHAR(19),
  sLevel       INTEGER,
  sPhone       VARCHAR(64),
  sFax         VARCHAR(64),
  sAddress     VARCHAR(255),
  sZip         VARCHAR(16),
  sDescription VARCHAR(1024),
  sPersonID    VARCHAR(19),
  sNodeKind    VARCHAR(32),
  sWxDeptID	   INTEGER,
  version      INTEGER not null
);
alter table SA_OPOrg
  add constraint PK_OPORG primary key ($clientName, sID);

create index IDX_OPORG_CODE on SA_OPOrg (sCode);
create index IDX_OPORG_FCODE on SA_OPOrg (sFCode);
create index IDX_OPORG_FID on SA_OPOrg (sFID);
create index IDX_OPORG_KV on SA_OPOrg (sValidState, sOrgKindID);
create index IDX_OPORG_PARENT on SA_OPOrg (sParent);
create index IDX_OPORG_PERSON on SA_OPOrg (sPersonID);
create index IDX_OPORG_SEQUENCE on SA_OPOrg (sSequence);
drop table SA_OPParentRole;      
create table SA_OPParentRole
(
	$clientDefine,
  sID         VARCHAR(32) not null,
  sRoleID     VARCHAR(32) not null,
  sParentRoleID VARCHAR(32) not null,
  version     INTEGER not null
);
alter table SA_OPParentRole
  add constraint PK_OPROLEROLE primary key ($clientName, sID);

drop table SA_OPPermission;      
create table SA_OPPermission
(
	$clientDefine,
  sID               VARCHAR(32) not null,
  sPermissionRoleID VARCHAR(32) not null,
  sProcess          VARCHAR(255),
  sActivityFName    VARCHAR(1024),
  sActivity         VARCHAR(255),
  sActionsNames     TEXT,
  sActions         	TEXT,
  sSemanticDP       VARCHAR(2048),
  sPermissionKind   INTEGER,
  sDescription      VARCHAR(1024),
  sSequence         INTEGER,
  sValidState       INTEGER,
  version           INTEGER not null
);
alter table SA_OPPermission
  add constraint PK_OPPERMISSION primary key ($clientName, sID);

create index IDX_OPPERM_ACTIVITY on SA_OPPermission (sActivity);
create index IDX_OPPERM_PROCESS on SA_OPPermission (sProcess);
create index IDX_OPPERM_ROLEID on SA_OPPermission (sPermissionRoleID);

drop table SA_OPRole;      
create table SA_OPRole
(
	$clientDefine,
  sID          VARCHAR(32) not null,
  sName        VARCHAR(255),
  sCode        VARCHAR(32),
  sCatalog     VARCHAR(128),
  sRoleKind    VARCHAR(32),
  sParentRolesNames VARCHAR(512),
  sDescription VARCHAR(1024),
  sSequence    INTEGER,
  sValidState  INTEGER,
  version      INTEGER not null
);
alter table SA_OPRole
  add constraint PK_OPROLE primary key ($clientName, sID);
create index IDX_OPROLE_CODE on SA_OPRole (sCode);

drop table SA_OPRoleManagement;      
create table SA_OPRoleManagement
(
	$clientDefine,
  sID           VARCHAR(32) not null,
  sOrgID        VARCHAR(65) not null,
  sOrgName      VARCHAR(255),
  sOrgFID       VARCHAR(255) not null,
  sOrgFName     VARCHAR(255),
  sRoleID       VARCHAR(32) not null,
  sCreatorFID    VARCHAR(2048),
  sCreatorFName VARCHAR(2048),
  sCreateTime   TIMESTAMP,
  version       INTEGER not null
);
alter table SA_OPRoleManagement
  add constraint PK_OPROLEMANAGE primary key ($clientName, sID);

create index IDX_OPRMNAGE_ORGID on SA_OPRoleManagement (sOrgID);
create index IDX_OPRMNAGE_ORGFID on SA_OPRoleManagement (sOrgFID);
create index IDX_OPRMNAGE_ORGFNAME on SA_OPRoleManagement (sOrgFName);
create index IDX_OPRMNAGE_ROLEID on SA_OPRoleManagement (SROLEID);
drop table SA_TaskRelation;      
create table SA_TaskRelation
(
	$clientDefine,
  sTaskID1 VARCHAR(32) not null,
  sTaskID2 VARCHAR(32) not null,
  sKind    BYTEA
);
alter table SA_TaskRelation
  add constraint PK_TASKRELATION primary key ($clientName, sTaskID1, sTaskID2);

drop table SA_TaskRelation_SysBak;      
create table SA_TaskRelation_SysBak
(
	$clientDefine,
  sTaskID1 VARCHAR(32) not null,
  sTaskID2 VARCHAR(32) not null,
  sKind    BYTEA
);
alter table SA_TaskRelation_SysBak
  add constraint PK_TASKRELATION_SysBak primary key ($clientName, sTaskID1, sTaskID2);
  
  
drop table SA_TaskRelation_Histroy;      
create table SA_TaskRelation_Histroy
(
	$clientDefine,
  sTaskID1 VARCHAR(32) not null,
  sTaskID2 VARCHAR(32) not null,
  sKind    BYTEA
);
alter table SA_TaskRelation_Histroy
  add constraint PK_TASKRELATION_Histroy primary key ($clientName, sTaskID1, sTaskID2);
  
  drop table SA_TaskType;      
create table SA_TaskType
(
	$clientDefine,
  sID              VARCHAR(32) not null,
  sName            VARCHAR(128),
  sConcept         VARCHAR(128),
  sNewActivity     VARCHAR(1024),
  sExecuteActivity VARCHAR(1024),
  sKind            VARCHAR(32),
  version          INTEGER,
  sProcess         VARCHAR(1024),
  sActivity        VARCHAR(128)
);
alter table SA_TaskType
  add constraint PK_TASKTYPE primary key ($clientName, sID);


drop table SA_FilterPattern;      
create table SA_FilterPattern
(
	$clientDefine,
  sID       VARCHAR(36) not null,
  sPerson   VARCHAR(36) null,
  sProcess  VARCHAR(1024) not null,
  sActivity VARCHAR(128) not null,
  sInstance VARCHAR(128) not null,
  sName     VARCHAR(128) not null,
  sContent  TEXT,
  sOrderNum INTEGER not null,
  version   INTEGER,
  sOrgFID	VARCHAR(255) null,
  sOrgFName	VARCHAR(1024) null,
  sCreatorID	VARCHAR(32) null,
  sCreatorName	VARCHAR(64) null,
  sCreateTime	TIMESTAMP
);
 
alter table SA_FilterPattern
  add constraint PK_FILTERPATTERN primary key ($clientName, sID);
  
create index IDX_FILTERPATTERN_PERSON on SA_FilterPattern (sPerson);
create index IDX_FILTERPATTERN_ORGFID on SA_FilterPattern (sOrgFID);  
  
drop table SA_OPPerson;       
create table SA_OPPerson
(
	$clientDefine,
  sID             VARCHAR(19) not null,
  sName           VARCHAR(64) not null,
  sCode           VARCHAR(64) not null,
  sIDCard         VARCHAR(36),
  sNumb           INTEGER not null,
  sLoginName      VARCHAR(64),
  sPassword       VARCHAR(64),
  sPasswordTimeLimit       INTEGER,
  sPasswordModifyTime      TIMESTAMP,
  sMainOrgID      VARCHAR(19) not null,
  sSafeLevelID    VARCHAR(36),
  sSequence       INTEGER,
  sValidState     INTEGER,
  sDescription    VARCHAR(2048),
  sSex            VARCHAR(8),
  sBirthday       TIMESTAMP,
  sJoinDate       TIMESTAMP,
  sHomePlace      VARCHAR(64),
  sDegree         VARCHAR(16),
  sGraduateSchool VARCHAR(128),
  sSpeciality     VARCHAR(128),
  sSchoolLength   VARCHAR(16),
  sTitle          VARCHAR(64),
  sMarriage       VARCHAR(16),
  sCardNO         VARCHAR(36),
  sCardKind       VARCHAR(64),
  sFamilyAddress  VARCHAR(255),
  sZip            VARCHAR(16),
  sMsn            VARCHAR(64),
  sQQ             VARCHAR(36),
  sMail           VARCHAR(64),
  sMobilePhone    VARCHAR(36),
  sFamilyPhone    VARCHAR(36),
  sOfficePhone    VARCHAR(36),
  version         INTEGER,
  sPhoto          BLOB,
  sPhotoLastModified          TIMESTAMP,
  sCountry        VARCHAR(64),
  sProvince       VARCHAR(64),
  sCity           VARCHAR(64),
  SPOSITIONS      VARCHAR(64),
  SSCHOOL         VARCHAR(64),
  SSTUDY          VARCHAR(64),
  sEnglishName    VARCHAR(128)
);
 
alter table SA_OPPerson
  add constraint PK_OPPERSON primary key ($clientName, sID);

create unique index IDX_OPPERSON_SCODE on SA_OPPerson ($clientName, sCode);
create index IDX_OPPERSON_VALID on SA_OPPerson (sValidState);
create index IDX_OPPERSON_LN_C_VS on SA_OPPerson (sLoginName, sCode, sValidState);  
create index IDX_OPPERSON_ORG on SA_OPPerson (sMainOrgID);  
drop table SA_ProcessControl;       
create table SA_ProcessControl
(
	$clientDefine,
  sID         VARCHAR(32) not null,
  sOperatorID VARCHAR(32),
  sProcess    VARCHAR(127),
  sProcessTemplateID2 VARCHAR(32)   ,
  sActivity   VARCHAR(32),
  sAction     VARCHAR(32),
  sKind       VARCHAR(16),
  sContent    TEXT,
  version     INTEGER
);

create index IDX_PC_INDEX on SA_ProcessControl (sProcess, sActivity, sOperatorID, sAction, sProcessTemplateID2);


alter table SA_ProcessControl
  add constraint PK_FLOWCONTROL primary key ($clientName, sID);
drop table SA_RemindConfig;       
create table SA_RemindConfig
(
	$clientDefine,
  sID             VARCHAR(50) not null,
  sOverdueEnable  VARCHAR(10),
  sPersonID       VARCHAR(50) not null,
  sIntervalMinute INTEGER,
  sEnable         VARCHAR(10),
  version         INTEGER not null
);
alter table SA_RemindConfig
  add constraint PK_REMINDCONFIG primary key ($clientName, sID);
  
 drop table SA_Reminder;        
create table SA_Reminder
(
	$clientDefine,
  sRemindID    VARCHAR(50) not null,
  sPersonID    VARCHAR(100) not null,
  sPersonName  VARCHAR(50) not null,
  sID          VARCHAR(50) not null,
  version      INTEGER
);
alter table SA_Reminder
  add constraint PK_REMINDER primary key ($clientName, sID);
  
drop table SA_RemindActionParameter;        
create table SA_RemindActionParameter
(
	$clientDefine,
  sID          VARCHAR(50) not null,
  sRemindID    VARCHAR(50) not null,
  sName        VARCHAR(50) not null,
  sDataType    VARCHAR(50),
  sValue       VARCHAR(100) not null,
  version      INTEGER
);
alter table SA_RemindActionParameter
  add constraint PK_REMINDACTIONPARAMETER primary key ($clientName, sID);
  
  drop table SA_Remind;        
create table SA_Remind
(
	$clientDefine,
  sID               VARCHAR(50) not null,
  sName       		VARCHAR(200) not null,
  sRemindStyle      VARCHAR(50) not null,  
  sRemindStyleName  VARCHAR(50),
  sTimes         	INTEGER,
  sActualStartTime  TIMESTAMP not null,
  sActualFinishTime TIMESTAMP,
  sLastTime      	TIMESTAMP,
  sIntervalTime  	TIMESTAMP,
  sProcess       	VARCHAR(1024),
  sActivity      	VARCHAR(1024),
  sAction    		VARCHAR(100),
  sStatus         	VARCHAR(30),
  sCreatorID    	VARCHAR(50) not null,
  sCreatorName    	VARCHAR(100) not null,
  sRemark   		VARCHAR(500),
  sReturnable      	VARCHAR(50),
  sReturnPattern 	VARCHAR(500),
  sActionParam     	INTEGER,
  version        	INTEGER,
  sCondition     	VARCHAR(500),
  sIntervalDay   	INTEGER,
  sIntervalHour  	INTEGER,
  sIntervalMin   	INTEGER,
  sType          	INTEGER,
  sDataModel      	VARCHAR(50),
  sContent       	TEXT,
  sReminder       	TEXT
);
alter table SA_Remind
  add constraint PK_REMIND primary key ($clientName, sID);


drop table SA_Social;	                  
create table SA_Social
(
               	$clientDefine,
  sID             VARCHAR(32) not null,
  sName           VARCHAR(255),
  sTypeID         VARCHAR(32),
  sTypeName       VARCHAR(64),
  sProcess        VARCHAR(1024),
  sActivity       VARCHAR(128),
  sURL            TEXT,
  sData1          VARCHAR(128),
  sData2          VARCHAR(128),
  sData3          VARCHAR(128),
  sData4          VARCHAR(128),
  sCreatorID      VARCHAR(32),
  sCreatorName    VARCHAR(128),
  sCreatorFID     VARCHAR(1024),
  sCreatorFName   VARCHAR(1024),
  sPersonID    	  VARCHAR(32),
  sPersonName     VARCHAR(128),
  sOrgID    	  VARCHAR(65),
  sOrgName  	  VARCHAR(128),
  sOrgFID         VARCHAR(1024),
  sOrgFName       VARCHAR(1024),
  sValidState     INTEGER,
  sCreateTime     TIMESTAMP,
  version         INTEGER,
  
  sESField01	VARCHAR(128),
  sESField02	VARCHAR(128),
  sESField03	VARCHAR(128),
  sESField04	VARCHAR(128),
  sESField05	VARCHAR(128),
  sESField06	VARCHAR(128),
  sESField07	VARCHAR(128),
  sESField08	VARCHAR(128),
  sENField11	NUMBER(38),
  sENField12	NUMBER(38),
  sENField13	NUMBER(38),
  sENField14	NUMBER(38),
  sEDField21	TIMESTAMP,
  sEDField22	TIMESTAMP,
  sEDField23	TIMESTAMP,
  sEDField24	TIMESTAMP,
  sETField31	TEXT,
  sETField32	TEXT,
  sETField33	TEXT,
  sETField34	TEXT,
  sEIField41	INTEGER,
  sEIField42	INTEGER,
  sEIField43	INTEGER,
  sEIField44	INTEGER,
  sEBField51	Blob,
  sEBField52	Blob,
  sEbField53	Blob,
  sEBField54	Blob,
  
  sGroupID         VARCHAR(32),
  sGroupName       VARCHAR(64),
  sMessageNumber   INTEGER,
  sActive   	   INTEGER  
);

create index IDX_SOCIAL_DATA on SA_Social (sData1);
create index IDX_SOCIAL_NAME on SA_Social (sName);
create index IDX_SOCIAL_CREATETIME on SA_Social (sCreateTime);
create index IDX_SOCIAL_TOD on SA_Social (sTypeID, sPersonID, sData1);
create index IDX_SOCIAL_TOC on SA_Social (sTypeID, sPersonID, sCreateTime);

alter table SA_Social
  add constraint PK_SA_SOCIAL	 primary key ($clientName,sID);
  drop table SA_Task;        
create table SA_Task
(
	$clientDefine,
  sID             VARCHAR(32) not null,
  sCode           VARCHAR(128),
  sParentID       VARCHAR(32),
  sName           VARCHAR(255),
  sContent        TEXT,
  sRemark         TEXT,
  sSummary        TEXT,
  sFlowID         VARCHAR(32),
  sSourceID       VARCHAR(32),
  sFrontID        VARCHAR(32),
  sExecuteMode2   VARCHAR(256),
  sExecuteMode    VARCHAR(32),
  sPreemptMode    VARCHAR(32),
  sCatalogID      VARCHAR(32),
  sKindID         VARCHAR(32),
  sTypeID         VARCHAR(32),
  sTypeName       VARCHAR(64),
  sImportanceID   VARCHAR(32),
  sImportanceName VARCHAR(64),
  sEmergencyID    VARCHAR(32),
  sEmergencyName  VARCHAR(64),
  sProcess        VARCHAR(127),
  sActivity       VARCHAR(128),
  sCURL           TEXT,
  sEURL           TEXT,
  sCreateTime     TIMESTAMP,
  sDistributeTime TIMESTAMP,
  sLastModifyTime TIMESTAMP,
  sWarningTime    TIMESTAMP,
  sLimitTime      TIMESTAMP,
  sExpectStartTime     TIMESTAMP,
  sExpectFinishTime    TIMESTAMP,
  sActualStartTime     TIMESTAMP,
  sActualFinishTime    TIMESTAMP,
  sExecuteTime         TIMESTAMP,
  sCreatorPersonID     VARCHAR(32),
  sCreatorPersonName   VARCHAR(128),
  sCreatorPosID        VARCHAR(32),
  sCreatorPosName      VARCHAR(128),
  sCreatorDeptID       VARCHAR(32),
  sCreatorDeptName     VARCHAR(128),
  sCreatorOgnID        VARCHAR(32),
  sCreatorOgnName      VARCHAR(128),
  sCreatorFID          VARCHAR(212),
  sCreatorFName        VARCHAR(1024),
  sExecutorPersonID    VARCHAR(32),
  sExecutorPersonName  VARCHAR(128),
  sExecutorPosID       VARCHAR(32),
  sExecutorPosName     VARCHAR(128),
  sExecutorDeptID      VARCHAR(32),
  sExecutorDeptName    VARCHAR(128),
  sExecutorOgnID       VARCHAR(32),
  sExecutorOgnName     VARCHAR(128),
  sExecutorFID         VARCHAR(212),
  sExecutorFName       VARCHAR(1024),
  sExecutorNames  TEXT,
  sActivityNames  TEXT,
  sResponsible    VARCHAR(8),
  sCustomerID     VARCHAR(64),
  SCustomerCode   VARCHAR(64),
  sCustomerName   VARCHAR(128),
  sProjectID      VARCHAR(64),
  sProjectCode    VARCHAR(64),
  sProjectName    VARCHAR(128),
  sPlanID         VARCHAR(64),
  sPlanCode       VARCHAR(64),
  sPlanName       VARCHAR(128),
  sData1          VARCHAR(32),
  sData2          VARCHAR(32),
  sData3          VARCHAR(32),
  sData4          VARCHAR(32),
  sFake           VARCHAR(8),
  sActive         VARCHAR(8),
  sStatusID       VARCHAR(32),
  sStatusName     VARCHAR(64),
  sAIID           VARCHAR(32),
  sAIStatusID     VARCHAR(256),
  sAIStatusName   VARCHAR(256),
  sAIActive       VARCHAR(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR(64),
  sSequence       INTEGER,
  sLock           VARCHAR(32),
  sHints          TEXT,
  sShortcut       TEXT,
  sRemindMode     VARCHAR(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       TEXT,
  sProcessName    VARCHAR(128),
  sActivityName   VARCHAR(128),
  sProcessTemplateID   VARCHAR(32),
  sProcessTemplateItemSequence   VARCHAR(128),
  sTempPermissionID   VARCHAR(32),
  sActivityInTemplate VARCHAR(128)  ,
  sProcessTemplateID2 VARCHAR(32)  ,  
  sESField01	VARCHAR(128),
  sESField02	VARCHAR(128),
  sESField03	VARCHAR(128),
  sESField04	VARCHAR(128),
  sESField05	VARCHAR(128),
  sESField06	VARCHAR(128),
  sESField07	VARCHAR(128),
  sESField08	VARCHAR(128),
  sENField11	NUMBER(38),
  sENField12	NUMBER(38),
  sENField13	NUMBER(38),
  sENField14	NUMBER(38),
  sEDField21	TIMESTAMP,
  sEDField22	TIMESTAMP,
  sEDField23	TIMESTAMP,
  sEDField24	TIMESTAMP,
  sETField31	TEXT,
  sETField32	TEXT,
  sETField33	TEXT,
  sETField34	TEXT,
  sEIField41	INTEGER,
  sEIField42	INTEGER,
  sEIField43	INTEGER,
  sEIField44	INTEGER,
  sEBField51	Blob,
  sEBField52	Blob,
  sEbField53	Blob,
  sEBField54	Blob
);


alter table SA_Task
  add constraint PK_TASK primary key ($clientName, sID);

create index IDX_TASK_SFLOWID on SA_Task(sFlowID);
create index IDX_TASK_CREATETIME on SA_Task(sCreateTime);
create index IDX_TASK_WAIT on SA_Task(sExecutorFID, sStatusID);
create index IDX_TASK_SUB on SA_Task(sCreatorFID,  sStatusID);
create index IDX_TASK_SUB2 on SA_Task(sCreatorPersonID,  sStatusID);
create index IDX_TASK_DATA_P on SA_Task (sData1, sData2, sData3, sData4, sProcess);
create index IDX_TASK_PIK on SA_Task(sParentID,sID,  sKindID);


  drop table SA_Task_SysBak;        
create table SA_Task_SysBak
(
	$clientDefine,
  sID             VARCHAR(32) not null,
  sCode           VARCHAR(128),
  sParentID       VARCHAR(32),
  sName           VARCHAR(255),
  sContent        TEXT,
  sRemark         TEXT,
  sSummary        TEXT,
  sFlowID         VARCHAR(32),
  sSourceID       VARCHAR(32),
  sFrontID        VARCHAR(32),
  sExecuteMode2   VARCHAR(256),
  sExecuteMode    VARCHAR(32),
  sPreemptMode    VARCHAR(32),
  sCatalogID      VARCHAR(32),
  sKindID         VARCHAR(32),
  sTypeID         VARCHAR(32),
  sTypeName       VARCHAR(64),
  sImportanceID   VARCHAR(32),
  sImportanceName VARCHAR(64),
  sEmergencyID    VARCHAR(32),
  sEmergencyName  VARCHAR(64),
  sProcess        VARCHAR(127),
  sActivity       VARCHAR(128),
  sCURL           TEXT,
  sEURL           TEXT,
  sCreateTime     TIMESTAMP,
  sDistributeTime TIMESTAMP,
  sLastModifyTime TIMESTAMP,
  sWarningTime    TIMESTAMP,
  sLimitTime      TIMESTAMP,
  sExpectStartTime     TIMESTAMP,
  sExpectFinishTime    TIMESTAMP,
  sActualStartTime     TIMESTAMP,
  sActualFinishTime    TIMESTAMP,
  sExecuteTime         TIMESTAMP,
  sCreatorPersonID     VARCHAR(32),
  sCreatorPersonName   VARCHAR(128),
  sCreatorPosID        VARCHAR(32),
  sCreatorPosName      VARCHAR(128),
  sCreatorDeptID       VARCHAR(32),
  sCreatorDeptName     VARCHAR(128),
  sCreatorOgnID        VARCHAR(32),
  sCreatorOgnName      VARCHAR(128),
  sCreatorFID          VARCHAR(212),
  sCreatorFName        VARCHAR(1024),
  sExecutorPersonID    VARCHAR(32),
  sExecutorPersonName  VARCHAR(128),
  sExecutorPosID       VARCHAR(32),
  sExecutorPosName     VARCHAR(128),
  sExecutorDeptID      VARCHAR(32),
  sExecutorDeptName    VARCHAR(128),
  sExecutorOgnID       VARCHAR(32),
  sExecutorOgnName     VARCHAR(128),
  sExecutorFID         VARCHAR(212),
  sExecutorFName       VARCHAR(1024),
  sExecutorNames  TEXT,
  sActivityNames  TEXT,
  sResponsible    VARCHAR(8),
  sCustomerID     VARCHAR(64),
  SCustomerCode   VARCHAR(64),
  sCustomerName   VARCHAR(128),
  sProjectID      VARCHAR(64),
  sProjectCode    VARCHAR(64),
  sProjectName    VARCHAR(128),
  sPlanID         VARCHAR(64),
  sPlanCode       VARCHAR(64),
  sPlanName       VARCHAR(128),
  sData1          VARCHAR(32),
  sData2          VARCHAR(32),
  sData3          VARCHAR(32),
  sData4          VARCHAR(32),
  sFake           VARCHAR(8),
  sActive         VARCHAR(8),
  sStatusID       VARCHAR(32),
  sStatusName     VARCHAR(64),
  sAIID           VARCHAR(32),
  sAIStatusID     VARCHAR(256),
  sAIStatusName   VARCHAR(256),
  sAIActive       VARCHAR(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR(64),
  sSequence       INTEGER,
  sLock           VARCHAR(32),
  sHints          TEXT,
  sShortcut       TEXT,
  sRemindMode     VARCHAR(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       TEXT,
  sProcessName    VARCHAR(128),
  sActivityName   VARCHAR(128),
  sProcessTemplateID   VARCHAR(32),
  sProcessTemplateItemSequence   VARCHAR(128),
  sTempPermissionID   VARCHAR(32),
  sActivityInTemplate VARCHAR(128)  ,
  sProcessTemplateID2 VARCHAR(32)  ,  
  sESField01	VARCHAR(128),
  sESField02	VARCHAR(128),
  sESField03	VARCHAR(128),
  sESField04	VARCHAR(128),
  sESField05	VARCHAR(128),
  sESField06	VARCHAR(128),
  sESField07	VARCHAR(128),
  sESField08	VARCHAR(128),
  sENField11	NUMBER(38),
  sENField12	NUMBER(38),
  sENField13	NUMBER(38),
  sENField14	NUMBER(38),
  sEDField21	TIMESTAMP,
  sEDField22	TIMESTAMP,
  sEDField23	TIMESTAMP,
  sEDField24	TIMESTAMP,
  sETField31	TEXT,
  sETField32	TEXT,
  sETField33	TEXT,
  sETField34	TEXT,
  sEIField41	INTEGER,
  sEIField42	INTEGER,
  sEIField43	INTEGER,
  sEIField44	INTEGER,
  sEBField51	Blob,
  sEBField52	Blob,
  sEbField53	Blob,
  sEBField54	Blob
);


alter table SA_Task_SysBak
  add constraint PK_TASK_SysBak primary key ($clientName, sID);

  drop table SA_Task_Histroy;        
create table SA_Task_Histroy
(
	$clientDefine,
  sID             VARCHAR(32) not null,
  sCode           VARCHAR(128),
  sParentID       VARCHAR(32),
  sName           VARCHAR(255),
  sContent        TEXT,
  sRemark         TEXT,
  sSummary        TEXT,
  sFlowID         VARCHAR(32),
  sSourceID       VARCHAR(32),
  sFrontID        VARCHAR(32),
  sExecuteMode2   VARCHAR(256),
  sExecuteMode    VARCHAR(32),
  sPreemptMode    VARCHAR(32),
  sCatalogID      VARCHAR(32),
  sKindID         VARCHAR(32),
  sTypeID         VARCHAR(32),
  sTypeName       VARCHAR(64),
  sImportanceID   VARCHAR(32),
  sImportanceName VARCHAR(64),
  sEmergencyID    VARCHAR(32),
  sEmergencyName  VARCHAR(64),
  sProcess        VARCHAR(127),
  sActivity       VARCHAR(128),
  sCURL           TEXT,
  sEURL           TEXT,
  sCreateTime     TIMESTAMP,
  sDistributeTime TIMESTAMP,
  sLastModifyTime TIMESTAMP,
  sWarningTime    TIMESTAMP,
  sLimitTime      TIMESTAMP,
  sExpectStartTime     TIMESTAMP,
  sExpectFinishTime    TIMESTAMP,
  sActualStartTime     TIMESTAMP,
  sActualFinishTime    TIMESTAMP,
  sExecuteTime         TIMESTAMP,
  sCreatorPersonID     VARCHAR(32),
  sCreatorPersonName   VARCHAR(128),
  sCreatorPosID        VARCHAR(32),
  sCreatorPosName      VARCHAR(128),
  sCreatorDeptID       VARCHAR(32),
  sCreatorDeptName     VARCHAR(128),
  sCreatorOgnID        VARCHAR(32),
  sCreatorOgnName      VARCHAR(128),
  sCreatorFID          VARCHAR(212),
  sCreatorFName        VARCHAR(1024),
  sExecutorPersonID    VARCHAR(32),
  sExecutorPersonName  VARCHAR(128),
  sExecutorPosID       VARCHAR(32),
  sExecutorPosName     VARCHAR(128),
  sExecutorDeptID      VARCHAR(32),
  sExecutorDeptName    VARCHAR(128),
  sExecutorOgnID       VARCHAR(32),
  sExecutorOgnName     VARCHAR(128),
  sExecutorFID         VARCHAR(212),
  sExecutorFName       VARCHAR(1024),
  sExecutorNames  TEXT,
  sActivityNames  TEXT,
  sResponsible    VARCHAR(8),
  sCustomerID     VARCHAR(64),
  SCustomerCode   VARCHAR(64),
  sCustomerName   VARCHAR(128),
  sProjectID      VARCHAR(64),
  sProjectCode    VARCHAR(64),
  sProjectName    VARCHAR(128),
  sPlanID         VARCHAR(64),
  sPlanCode       VARCHAR(64),
  sPlanName       VARCHAR(128),
  sData1          VARCHAR(32),
  sData2          VARCHAR(32),
  sData3          VARCHAR(32),
  sData4          VARCHAR(32),
  sFake           VARCHAR(8),
  sActive         VARCHAR(8),
  sStatusID       VARCHAR(32),
  sStatusName     VARCHAR(64),
  sAIID           VARCHAR(32),
  sAIStatusID     VARCHAR(256),
  sAIStatusName   VARCHAR(256),
  sAIActive       VARCHAR(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR(64),
  sSequence       INTEGER,
  sLock           VARCHAR(32),
  sHints          TEXT,
  sShortcut       TEXT,
  sRemindMode     VARCHAR(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       TEXT,
  sProcessName    VARCHAR(128),
  sActivityName   VARCHAR(128),
  sProcessTemplateID   VARCHAR(32),
  sProcessTemplateItemSequence   VARCHAR(128),
  sTempPermissionID   VARCHAR(32),
  sActivityInTemplate VARCHAR(128)  ,
  sProcessTemplateID2 VARCHAR(32)  ,  
  sESField01	VARCHAR(128),
  sESField02	VARCHAR(128),
  sESField03	VARCHAR(128),
  sESField04	VARCHAR(128),
  sESField05	VARCHAR(128),
  sESField06	VARCHAR(128),
  sESField07	VARCHAR(128),
  sESField08	VARCHAR(128),
  sENField11	NUMBER(38),
  sENField12	NUMBER(38),
  sENField13	NUMBER(38),
  sENField14	NUMBER(38),
  sEDField21	TIMESTAMP,
  sEDField22	TIMESTAMP,
  sEDField23	TIMESTAMP,
  sEDField24	TIMESTAMP,
  sETField31	TEXT,
  sETField32	TEXT,
  sETField33	TEXT,
  sETField34	TEXT,
  sEIField41	INTEGER,
  sEIField42	INTEGER,
  sEIField43	INTEGER,
  sEIField44	INTEGER,
  sEBField51	Blob,
  sEBField52	Blob,
  sEbField53	Blob,
  sEBField54	Blob
);


alter table SA_Task_Histroy
  add constraint PK_TASK_Histroy primary key ($clientName, sID);

create index IDX_TASKH_SFLOWID on SA_Task_Histroy(sFlowID);
create index IDX_TASKH_CREATETIME on SA_Task_Histroy(sCreateTime);
create index IDX_TASKH_WAIT on SA_Task_Histroy(sExecutorFID, sStatusID);
create index IDX_TASKH_SUB on SA_Task_Histroy(sCreatorFID,  sStatusID);
create index IDX_TASKH_SUB2 on SA_Task_Histroy(sCreatorPersonID,  sStatusID);
create index IDX_TASKH_DATA_P on SA_Task_Histroy (sData1, sData2, sData3, sData4, sProcess);
create index IDX_TASKH_PIK on SA_Task_Histroy(sParentID,sID,  sKindID);

 
drop table SA_ProcessTemplate;        
create table SA_ProcessTemplate
(
	$clientDefine,
  sID             VARCHAR(32) not null,
  sTemplateID     VARCHAR(32),
  sName           VARCHAR(32),
  sKindID           VARCHAR(32),
  sTypeID           VARCHAR(32),
  sScopeID           VARCHAR(32),
  sProcess           VARCHAR(255),
  sProcessName           VARCHAR(128),
  sActivity       	VARCHAR(128),
  sActivityName       VARCHAR(128),
  sCreatorFID           VARCHAR(1024),
  sCreatorFName           VARCHAR(1024),
  sCreatorName           VARCHAR(128),
  sCreatorID           VARCHAR(32),
  sContent        TEXT,
  sContent2        TEXT,
  sCreateTime     TIMESTAMP,  
  sValidState   INTEGER,
  version         INTEGER
);  

alter table SA_ProcessTemplate
  add constraint PK_SA_PROCESSTEMPLATE	 primary key ($clientName, sID);

create index IDX_SA_PT_ALL on SA_ProcessTemplate (sTypeID, sKindID, sName, sProcessName); 
create index IDX_SA_PT_PROCESS on SA_ProcessTemplate (sProcess); 
create index IDX_SA_PT_CREATETIME on SA_ProcessTemplate (sCreateTime);  

  drop table SA_ResourceControl;        
create table SA_ResourceControl
(
	$clientDefine,
  sID              VARCHAR(32) not null,
  sName     	   VARCHAR(128),
  sDescription     TEXT,
  sOrgID           VARCHAR(65) not null,
  sOrgName         VARCHAR(128),
  sOrgFID          VARCHAR(255) not null,
  sOrgFName        VARCHAR(1024),
  sCreatorID       VARCHAR(65) not null,
  sCreatorName     VARCHAR(128),
  sCreatorFID      VARCHAR(255) not null,
  sCreatorFName    VARCHAR(1024),
  sCreateTime      TIMESTAMP,
  sResourceID 	   VARCHAR(255) not null,
  sTypeID 	   	   VARCHAR(128),
  sTypeName 	   VARCHAR(128),
  sProcess         VARCHAR(255),
  sProcessName     VARCHAR(128),
  sActivity        VARCHAR(128),
  sActivityName    VARCHAR(128),
  sAction          VARCHAR(128),
  sActionName      VARCHAR(128),
  version          INTEGER not null
);

alter table SA_ResourceControl
  add constraint PK_RESOURCECONTROL primary key ($clientName, sID);
create index IDX_RC_ORGFID on SA_ResourceControl (sOrgFID);
create index IDX_RC_ORGID on SA_ResourceControl (sOrgID);
create index IDX_RC_CID on SA_ResourceControl (sCreatorID);
create index IDX_RC_CFID on SA_ResourceControl (sCreatorFID);
create index IDX_RC_CTIME on SA_ResourceControl (sCreateTime);
create index IDX_RC_RID on SA_ResourceControl (sResourceID);
create index IDX_RC_P on SA_ResourceControl (sProcess);
create index IDX_RC_AY on SA_ResourceControl (sActivity);
create index IDX_RC_AN on SA_ResourceControl (sAction);



drop table SA_TokenInstance;        
create table SA_TokenInstance
(
	$clientDefine,
  sID                     VARCHAR(32) not null,
  sProcessInstanceID      VARCHAR(32),
  sProcess                VARCHAR(1024),
  sProcessTemplateID2     VARCHAR(32)   ,
  sPlace                  VARCHAR(128),
  sFromActivityInstanceID VARCHAR(32),
  sFromActivity           VARCHAR(128),
  sToActivity             VARCHAR(128),
  sToActivityInstanceID   VARCHAR(32),
  sValue                  TEXT,
  sActive                 VARCHAR(8),
  version                 INTEGER
);

alter table SA_TokenInstance
  add constraint PK_TOKEN primary key ($clientName, sID);

create index IDX_TI_PI on SA_TokenInstance (sProcessInstanceID);

drop table SA_TokenInstance_SysBak;        
create table SA_TokenInstance_SysBak
(
	$clientDefine,
  sID                     VARCHAR(32) not null,
  sProcessInstanceID      VARCHAR(32),
  sProcess                VARCHAR(1024),
  sProcessTemplateID2     VARCHAR(32)   ,
  sPlace                  VARCHAR(128),
  sFromActivityInstanceID VARCHAR(32),
  sFromActivity           VARCHAR(128),
  sToActivity             VARCHAR(128),
  sToActivityInstanceID   VARCHAR(32),
  sValue                  TEXT,
  sActive                 VARCHAR(8),
  version                 INTEGER
);

alter table SA_TokenInstance_SysBak
  add constraint PK_TOKEN_SysBak primary key ($clientName, sID);

drop table SA_TokenInstance_Histroy;        
create table SA_TokenInstance_Histroy
(
	$clientDefine,
  sID                     VARCHAR(32) not null,
  sProcessInstanceID      VARCHAR(32),
  sProcess                VARCHAR(1024),
  sProcessTemplateID2     VARCHAR(32)   ,
  sPlace                  VARCHAR(128),
  sFromActivityInstanceID VARCHAR(32),
  sFromActivity           VARCHAR(128),
  sToActivity             VARCHAR(128),
  sToActivityInstanceID   VARCHAR(32),
  sValue                  TEXT,
  sActive                 VARCHAR(8),
  version                 INTEGER
);

alter table SA_TokenInstance_Histroy
  add constraint PK_TOKEN_Histroy primary key ($clientName, sID);

create index IDX_TIH_PI on SA_TokenInstance_Histroy (sProcessInstanceID);


drop table SA_ThemeDefine;        
create table SA_ThemeDefine
(
	$clientDefine,
  sID               VARCHAR(100) not null,
  version           NUMBER(38),
  sThemeName        VARCHAR(100),
  sThemeLayoutInfo  TEXT,
  sThemePublishType VARCHAR(100),
  sThemeActivity    VARCHAR(1024),
  sCreatorID        VARCHAR(100)
);
 
alter table SA_ThemeDefine
  add primary key ($clientName, sID);
  
  
  drop table SA_ThemeManager;        
create table SA_ThemeManager
(
	$clientDefine,
  sID            VARCHAR(100) not null,
  version        NUMBER(38),
  sThemeID       VARCHAR(100),
  sOrgID         VARCHAR(100),
  sThemeActivity VARCHAR(1024)
);
 
alter table SA_ThemeManager
  add primary key ($clientName, sID);
  
  drop table SA_Log;        
create table SA_Log
(
	$clientDefine,
  sID              		VARCHAR(32) not null,
  sTypeName 	   		VARCHAR(128),
  sDescription     		TEXT,
  sProcess         		VARCHAR(255),
  sProcessName     		VARCHAR(128),
  sActivity        		VARCHAR(128),
  sActivityName    		VARCHAR(128),
  sAction          		VARCHAR(128),
  sDeviceType      		VARCHAR(64),
  sOperatingSystem 		VARCHAR(64),
  sActionName      		VARCHAR(128),
  sParameters      		TEXT,
  sResult	       		TEXT,
  sStatusName      		VARCHAR(32),
  sCreateTime 	   		TIMESTAMP,
  sCreatorFID           VARCHAR(255),
  sCreatorFName         VARCHAR(1024),
  sCreatorPersonID      VARCHAR(32),
  sCreatorPersonName    VARCHAR(128),
  sCreatorPosID         VARCHAR(32),
  sCreatorPosName       VARCHAR(128),
  sCreatorDeptID        VARCHAR(32),
  sCreatorDeptName      VARCHAR(128),
  sCreatorOgnID         VARCHAR(32),
  sCreatorOgnName       VARCHAR(128),
  sIP			        VARCHAR(32),
  sESField01			VARCHAR(256),
  sESField02			VARCHAR(256),
  sESField03			VARCHAR(256),
  sESField04			VARCHAR(256),
  sENField11			NUMBER(38),
  sENField12			NUMBER(38),
  sEDField21			TIMESTAMP,
  sEDField22			TIMESTAMP,
  sETField31			TEXT,
  sETField32			TEXT,
  sEIField41			INTEGER,
  sEIField42			INTEGER,
  sEBField51			Blob,
  sEBField52			Blob,
  version          		NUMBER(38)
);
 
alter table SA_Log
  add primary key ($clientName, sID);

create index IDX_LOG_PROCESS on SA_Log (sProcess);
create index IDX_LOG_ACTIVITY on SA_Log (sActivity);
create index IDX_LOG_ACTION on SA_Log (sAction);
create index IDX_LOG_CT on SA_Log (sCreateTime);
create index IDX_LOG_CFID on SA_Log (sCreatorFID);

drop table SA_DocLinkDefine;        
CREATE TABLE SA_DocLinkDefine
(
	$clientDefine,
  sID             VARCHAR(36) NOT NULL,
  sRootPath       VARCHAR(2048),
  sRootName       VARCHAR(512),
  sProcess    VARCHAR(512),
  sActivity   VARCHAR(128),
  sPersonFID      VARCHAR(512),
  sSubPath        VARCHAR(512),
  sAccess         INTEGER,
  version         NUMBER(10),
  sDeptName       VARCHAR(64),
  sPersonName     VARCHAR(64),
  sLimitSize      FLOAT,
  sShowChildren   VARCHAR(36),
  sDefineItems    TEXT,
  sDisplayName    VARCHAR(512)
);
drop table SA_DocLog;        
CREATE TABLE SA_DocLog
(
	$clientDefine,
  version       NUMBER(10),
  sPersonName   VARCHAR(64),
  sAccessType   VARCHAR(16),
  sDocID        VARCHAR(64),
  sID           VARCHAR(36) NOT NULL,
  sTime         TIMESTAMP,
  sDeptName     VARCHAR(64),
  sPersonFID       VARCHAR(512),
  sDocVersionID NUMBER(10),
  sDocName      VARCHAR(128),
  sSize         FLOAT
);
drop table SA_DocAuth;        
CREATE TABLE SA_DocAuth
(
	$clientDefine,
  sID             VARCHAR(36) NOT NULL,
  sDocPath        VARCHAR(2048),
  sAuthorizerFID     VARCHAR(512),
  sAuthorizerName VARCHAR(64),
  sAuthorizerDeptName VARCHAR(64),
  sAuthorizeeFID     VARCHAR(512),
  sAuthorizeeName VARCHAR(64),
  sGrantTime      TIMESTAMP,
  sAccess         INTEGER,
  sScope          VARCHAR(16),
  sAuthorizeeDeptName VARCHAR(64),
  version         NUMBER(10)
);
drop table SA_DocLink;        
CREATE TABLE SA_DocLink
(
	$clientDefine,
  sID           VARCHAR(36) NOT NULL,
  sOwnerID       VARCHAR(256),
  sDocID        VARCHAR(36),
  version       NUMBER(10),
  sActivity VARCHAR(128),
  sProcess  VARCHAR(512)
);
drop table SA_DocNode;        
CREATE TABLE SA_DocNode
(
	$clientDefine,
  sID               VARCHAR(36) NOT NULL,
  sParentID         VARCHAR(36),
  sDocName          VARCHAR(128),
  sSequence         VARCHAR(128),
  sSize             FLOAT,
  sKind             VARCHAR(128),
  sDocPath          VARCHAR(2048),
  sDocDisplayPath   TEXT,
  sCreatorFID       VARCHAR(2048),
  sCreatorName      VARCHAR(64),
  sCreatorDeptName  VARCHAR(64),
  sCreateTime       TIMESTAMP,
  sEditorFID        VARCHAR(2048),
  sEditorName       VARCHAR(64),
  sEditorDeptName   VARCHAR(64),
  sLastWriterFID    VARCHAR(2048),
  sLastWriterName   VARCHAR(64),
  sLastWriterDeptName   VARCHAR(64),
  sLastWriteTime    TIMESTAMP,
  sFileID           VARCHAR(128),
  sDescription      TEXT,
  sDocLiveVersionID INTEGER,
  version           NUMBER(10),
  sClassification   VARCHAR(128),
  sKeywords         VARCHAR(256),
  sDocSerialNumber  VARCHAR(128),
  sFinishTime       TIMESTAMP,
  sNameSpace        VARCHAR(256),
  sCacheName        VARCHAR(100),
  sRevisionCacheName        VARCHAR(100),
  sFlag             INTEGER 
);
drop table SA_DocNameSpace;        
CREATE TABLE SA_DocNameSpace
(
	$clientDefine,
  sID          VARCHAR(128) NOT NULL,
  sDisplayName VARCHAR(256),
  sHost        VARCHAR(128),
  sPort        INTEGER,
  sUrl        VARCHAR(128),
  version      INTEGER,
  sFlag        INTEGER,
  sAccessMode  VARCHAR(64) 	
);


ALTER TABLE SA_DocLinkDefine
  ADD CONSTRAINT PK_DOCLINKDEFINE PRIMARY KEY ($clientName, sID);

ALTER TABLE SA_DocLog
  ADD CONSTRAINT PK_ACCESSRECORD PRIMARY KEY ($clientName, sID);
  
ALTER TABLE SA_DocAuth
  ADD CONSTRAINT PK_DOCAUTH PRIMARY KEY ($clientName, sID);

ALTER TABLE SA_DocLink
  ADD CONSTRAINT PK_DOCLINK PRIMARY KEY ($clientName, sID);

ALTER TABLE SA_DocNode
  ADD CONSTRAINT PK_DOCNODE PRIMARY KEY ($clientName, sID);
  
ALTER TABLE SA_DocNameSpace
  ADD CONSTRAINT PK_NAMESPACE PRIMARY KEY ($clientName, sID);
drop table SA_Terminal;
CREATE TABLE SA_Terminal (
	$clientDefine,
	sID VARCHAR (32) NOT NULL ,
	sPersonID VARCHAR (32) NOT NULL ,
	sTypeID VARCHAR (32) NOT NULL ,
	sTypeName VARCHAR (64) NOT NULL ,
	sAccountNumber VARCHAR (128) NOT NULL ,
	sProtocol VARCHAR (32) NOT NULL ,
	sValidState INTEGER,
	sIsDefault INTEGER,
	version INTEGER NOT NULL
);

ALTER TABLE SA_Terminal ADD 
	 PRIMARY KEY  ($clientName,sID); 

create index IDX_TERMINAL_PNS on SA_Terminal (sPersonID);	 
drop table SA_ShortURL;
CREATE TABLE SA_ShortURL (
	sID VARCHAR (128) NOT NULL ,
	sLongURL VARCHAR (1024),
    sCreateTime     TIMESTAMP,
	version INTEGER NOT NULL
);
ALTER TABLE SA_ShortURL ADD 
	 PRIMARY KEY  (sID); 
	 
set client_min_messages='NOTICE';