drop table SA_Client;
drop table SA_AppVendor;
drop table SA_App;
drop table SA_ClientApp;

CREATE TABLE SA_Client (
	$clientDefine,
	sID 			VARCHAR2(32) NOT NULL ,
	sName 			VARCHAR2(64) NOT NULL ,
	sLongName 		VARCHAR2(128),
	sCode 			VARCHAR2(32) NOT NULL ,
	sIndustry 		VARCHAR2(32),
	sEmployeesSize 	INTEGER,
	sContact 		VARCHAR2(64),
	sEmail 			VARCHAR2(64),
	sPhone 			VARCHAR2(64),
	sFax  			VARCHAR2(64),
	sAddress 		VARCHAR2(255),
	sZip 			VARCHAR2(16),
	sDescription    CLOB,
	sCreateTime		Date,
	sCreatorID		VARCHAR2(32),
	sCreatorName	VARCHAR2(64),
	version 		INTEGER NOT NULL 
);



ALTER TABLE SA_Client ADD 
	 PRIMARY KEY  (sID); 
	 
CREATE TABLE SA_AppVendor (
	$clientDefine,
	sID 			VARCHAR2(32) NOT NULL ,
	sName 			VARCHAR2(64) NOT NULL ,
	sLongName 		VARCHAR2(128),
	sCode 			VARCHAR2(32) NOT NULL ,
	sIndustry 		VARCHAR2(32),
	sEmployeesSize 	INTEGER,
	sContact 		VARCHAR2(64),
	sEmail 			VARCHAR2(64),
	sPhone 			VARCHAR2(64),
	sFax  			VARCHAR2(64),
	sAddress 		VARCHAR2(255),
	sZip 			VARCHAR2(16),
	sDescription    CLOB,
	sCreateTime		Date,
	sCreatorID		VARCHAR2(32),
	sCreatorName	VARCHAR2(64),
	version 		INTEGER NOT NULL 
);



ALTER TABLE SA_AppVendor ADD 
	 PRIMARY KEY  (sID); 	 
	 
CREATE TABLE SA_App (
	$clientDefine,
	sID 			VARCHAR2(32) NOT NULL ,
	sName 			VARCHAR2(64) NOT NULL ,
	sCode 			VARCHAR2(32) NOT NULL ,
	sModel	 		VARCHAR2(128) NOT NULL,
	sDescription    CLOB,
	sAppVersion		VARCHAR2(64),
	sVendorID		VARCHAR2(32),
	sVendorName		VARCHAR2(64),
	sValidState		INTEGER,
	sCreateTime		Date,
	sCreatorID		VARCHAR2(32),
	sCreatorName	VARCHAR2(64),
	version 		INTEGER NOT NULL 
);



ALTER TABLE SA_App ADD 
	 PRIMARY KEY  (sID); 	 
	 
	 
CREATE TABLE SA_ClientApp (
	$clientDefine,
	sID 			VARCHAR2(32) NOT NULL ,
	sClientID		VARCHAR2(32),
	sClientName		VARCHAR2(64),
	sAppID			VARCHAR2(32),
	sAppName		VARCHAR2(64),
	sAppModel 		VARCHAR2(128) NOT NULL,
	sAppVersion		VARCHAR2(64),
	sVendorID		VARCHAR2(32),
	sVendorName		VARCHAR2(64),
	sRentStartTime	Date NOT NULL,
	sRentEndTime	Date,
	sRentDays		INTEGER,
	sRentNumber		INTEGER NOT NULL,
	sValidState		INTEGER,
	sCreateTime		Date,
	sCreatorID		VARCHAR2(32),
	sCreatorName	VARCHAR2(64),
	version 		INTEGER NOT NULL 
);


ALTER TABLE SA_ClientApp ADD 
	 PRIMARY KEY  (sID); 	




drop table SA_OPCustomGroup;
CREATE TABLE SA_OPCustomGroup (
	$clientDefine,
	sID VARCHAR2(32) NOT NULL ,
	version INTEGER NOT NULL ,
	sName VARCHAR2(64) NOT NULL ,
	sTypeID VARCHAR2(32) NOT NULL ,
	sTypeName VARCHAR2(64) NOT NULL ,
	sSequence INTEGER NULL ,
	sCreatorID VARCHAR2(32) NULL ,
	sCreatorName VARCHAR2(64) NULL ,
	sCreateTime DATE NULL
);

go

ALTER TABLE SA_OPCustomGroup ADD 
	 PRIMARY KEY  ($clientName, sID); 
	 
go	 
drop table SA_Runtime;
CREATE TABLE SA_Runtime (
	sID VARCHAR2(64)  NOT NULL ,
	sString VARCHAR2(128)  NULL ,
	sString2 VARCHAR2(128)  NULL ,
	sString3 VARCHAR2(128)  NULL ,
	sInteger INTEGER NULL ,
	sInteger2 INTEGER NULL ,
	sInteger3 INTEGER NULL ,
	fNumeric NUMBER NULL ,
	fNumeric2 NUMBER NULL ,
	fNumeric3 NUMBER NULL ,
	fDatetime TIMESTAMP NULL ,
	fDatetime2 TIMESTAMP NULL ,
	fDatetime3 TIMESTAMP NULL ,
	sData CLOB NULL ,
	sBData BLOB NULL
);
 
ALTER TABLE SA_Runtime ADD 
	 PRIMARY KEY  (sID);
	 
drop table SA_QuickStart;	 
create table SA_QuickStart
(
	$clientDefine,
  sID       VARCHAR2(32) not null,
  version   INTEGER,
  sLabel    VARCHAR2(1024),
  sIcon     VARCHAR2(1024),
  sURL      VARCHAR2(1024),
  sProcess  VARCHAR2(1024),
  sActivity VARCHAR2(1024),
  sPersonID VARCHAR2(32),
  sSequence INTEGER
);
alter table SA_QuickStart
  add primary key ($clientName, sID);
drop table SA_PortalProfiles;	 
create table SA_PortalProfiles
(
	$clientDefine,
  sID       VARCHAR2(100) not null,
  version   NUMBER,
  sName     VARCHAR2(100),
  sPersonID VARCHAR2(100),
  sValue    VARCHAR2(4000)
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
  sFunctree      CLOB,
  sPortal        CLOB,
  sOther         CLOB,
  sPublishType   VARCHAR2(100),
  sThemeName     VARCHAR2(100),
  sThemeActivity VARCHAR2(100)
);
alter table SA_Portal2Profiles
  add primary key ($clientName,sID);
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
  add primary key ($clientName,sID);
drop table SA_Code;
create table SA_Code
(
	$clientDefine,
  sID     VARCHAR2(32) not null,
  sType   VARCHAR2(64),
  sCode   VARCHAR2(64) not null,
  sName   VARCHAR2(64),
  sText	  VARCHAR2(1024),
  version INTEGER not null
);

alter table SA_Code
  add constraint PK_SA_CODE primary key ($clientName, sID);

drop table SA_KVSequence;	   
create table SA_KVSequence
(
	$clientDefine,
  K VARCHAR2(255) not null,
  V INTEGER not null
);
alter table SA_KVSequence
  add constraint PK_KVSEQUENCE primary key ($clientName, K);
drop table SA_OPAgent;	   
create table SA_OPAgent
(
	$clientDefine,
  sID         VARCHAR2(32) not null,
  sOrgFID     VARCHAR2(2048) not null,
  sOrgFName   VARCHAR2(2048) not null,
  sAgentID    VARCHAR2(32) not null,
  sValidState     INTEGER,
  sStartTime  DATE,
  sFinishTime DATE,
  sProcess	  Clob,
  sCreatorID  VARCHAR2(32),
  sCreatorName VARCHAR2(64),
  sCreateTime DATE,
  sCanTranAgent INTEGER,
  version     INTEGER not null
);

alter table SA_OPAgent
  add constraint PK_OPAGENT primary key ($clientName, sID);
  
drop table SA_MessageParameter;	     
create table SA_MessageParameter
(
	$clientDefine,
  sID         VARCHAR2(50) not null,
  sChatNumber INTEGER,
  sSendNumber INTEGER,
  sFileSize   INTEGER,
  sCanUse     INTEGER,
  sOpmId      VARCHAR2(50) not null,
  sOpmKind    VARCHAR2(50) not null,
  sName       VARCHAR2(50) not null,
  version     INTEGER not null
);
alter table SA_MessageParameter
  add constraint PK_MessageParameter primary key ($clientName, sID);
  
drop table SA_ChatPromission;	       
create table SA_ChatPromission
(
	$clientDefine,
  sID             VARCHAR2(50) not null,
  sOpmKind        VARCHAR2(50) not null,
  sOpmId          VARCHAR2(50) not null,
  sName           VARCHAR2(50) not null,
  sOtherSideId    VARCHAR2(50) not null,
  sOtherSideKind  VARCHAR2(50) not null,
  sOtherSideName  VARCHAR2(50) not null,
  sPromissionType INTEGER not null,
  sOtherSideUrl   VARCHAR2(255),
  sOpmUrl         VARCHAR2(255),
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
  sID              VARCHAR2(32) not null,
  sOrgID           VARCHAR2(65) not null,
  sOrgName         VARCHAR2(255),
  sOrgFID          VARCHAR2(255) not null,
  sOrgFName        VARCHAR2(255),
  sAuthorizeRoleID VARCHAR2(32) not null,
  sDescription     VARCHAR2(1024),
  sCreatorFID      VARCHAR2(2048),
  sCreatorFName    VARCHAR2(2048),
  sCreateTime      DATE,
  version          INTEGER not null
);

alter table SA_OPAuthorize
  add constraint PK_OPAUTHORIZE primary key ($clientName, sID);

create index IDX_OPAUTH_ORGID on SA_OPAuthorize (sOrgID);
create index IDX_OPAUTH_ORGFID on SA_OPAuthorize (sOrgFID);
create index IDX_OPAUTH_ORGFNAME on SA_OPAuthorize (sOrgFName);
create index IDX_OPAUTH_ROLEID on SA_OPAuthorize (sAuthorizeRoleID);

drop table SA_OPManagement;	       
create table SA_OPManagement
(
	$clientDefine,
  sID             VARCHAR2(32) not null,
  sOrgID          VARCHAR2(65) not null,
  sOrgName        VARCHAR2(255),
  sOrgFID         VARCHAR2(255) not null,
  sOrgFName       VARCHAR2(255),
  sManageOrgID    VARCHAR2(65) not null,
  sManageOrgName  VARCHAR2(255),
  sManageOrgFID   VARCHAR2(255) not null,
  sManageOrgFName VARCHAR2(255),
  sManageTypeID   VARCHAR2(32) not null,
  sCreatorFID     VARCHAR2(2048),
  sCreatorFName   VARCHAR2(2048),
  sCreateTime     DATE,
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
  sID                VARCHAR2(32) not null,
  sName              VARCHAR2(255),
  sCode              VARCHAR2(32),
  sManageOrgKind     VARCHAR2(64),
  sManageOrgKindName VARCHAR2(255),
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
  sID          VARCHAR2(39) not null,
  sName        VARCHAR2(128) not null,
  sCode        VARCHAR2(64) not null,
  sLongName    VARCHAR2(255),
  sFName       VARCHAR2(2048),
  sFCode       VARCHAR2(255),
  sFID         VARCHAR2(255) not null,
  sOrgKindID   VARCHAR2(5) not null,
  sSequence    VARCHAR2(128),
  sValidState  INTEGER,
  sParent      VARCHAR2(19),
  sLevel       INTEGER,
  sPhone       VARCHAR2(64),
  sFax         VARCHAR2(64),
  sAddress     VARCHAR2(255),
  sZip         VARCHAR2(16),
  sDescription VARCHAR2(1024),
  sPersonID    VARCHAR2(19),
  sNodeKind    VARCHAR2(32),
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

drop table SA_OPParentRole;	         
create table SA_OPParentRole
(
	$clientDefine,
  sID         VARCHAR2(32) not null,
  sRoleID     VARCHAR2(32) not null,
  sParentRoleID VARCHAR2(32) not null,
  version     INTEGER not null
);
alter table SA_OPParentRole
  add constraint PK_OPROLEROLE primary key ($clientName, sID);

drop table SA_OPPermission;	         
create table SA_OPPermission
(
	$clientDefine,
  sID               VARCHAR2(32) not null,
  sPermissionRoleID VARCHAR2(32) not null,
  sProcess          VARCHAR2(255),
  sActivityFName    VARCHAR2(1024),
  sActivity         VARCHAR2(255),
  sActionsNames     Clob,
  sActions         	Clob,
  sSemanticDP       VARCHAR2(2048),
  sPermissionKind   INTEGER,
  sDescription      VARCHAR2(1024),
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
  sID          VARCHAR2(32) not null,
  sName        VARCHAR2(255),
  sCode        VARCHAR2(32),
  sCatalog     VARCHAR2(128),
  sRoleKind    VARCHAR2(32),
  sParentRolesNames VARCHAR2(512),
  sDescription VARCHAR2(1024),
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
  sID           VARCHAR2(32) not null,
  sOrgID        VARCHAR2(65) not null,
  sOrgName      VARCHAR2(255),
  sOrgFID       VARCHAR2(255) not null,
  sOrgFName     VARCHAR2(255),
  sRoleID       VARCHAR2(32) not null,
  sCreatorFID    VARCHAR2(2048),
  sCreatorFName VARCHAR2(2048),
  sCreateTime   DATE,
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
  sTaskID1 VARCHAR2(32) not null,
  sTaskID2 VARCHAR2(32) not null,
  sKind    RAW(36)
);
alter table SA_TaskRelation
  add constraint PK_TASKRELATION primary key ($clientName, sTaskID1, sTaskID2);

drop table SA_TaskRelation_SysBak;	         
create table SA_TaskRelation_SysBak
(
	$clientDefine,
  sTaskID1 VARCHAR2(32) not null,
  sTaskID2 VARCHAR2(32) not null,
  sKind    RAW(36)
);
alter table SA_TaskRelation_SysBak
  add constraint PK_TASKRELATION_SysBak primary key ($clientName, sTaskID1, sTaskID2);
  
  
drop table SA_TaskRelation_Histroy;	         
create table SA_TaskRelation_Histroy
(
	$clientDefine,
  sTaskID1 VARCHAR2(32) not null,
  sTaskID2 VARCHAR2(32) not null,
  sKind    RAW(36)
);
alter table SA_TaskRelation_Histroy
  add constraint PK_TASKRELATION_Histroy primary key ($clientName, sTaskID1, sTaskID2);
  
  
  drop table SA_TaskType;	         
create table SA_TaskType
(
	$clientDefine,
  sID              VARCHAR2(32) not null,
  sName            VARCHAR2(128),
  sConcept         VARCHAR2(128),
  sNewActivity     VARCHAR2(1024),
  sExecuteActivity VARCHAR2(1024),
  sKind            VARCHAR2(32),
  version          INTEGER,
  sProcess         VARCHAR2(1024),
  sActivity        VARCHAR2(128)
);
alter table SA_TaskType
  add constraint PK_TASKTYPE primary key ($clientName, sID);


drop table SA_FilterPattern;	         
create table SA_FilterPattern
(
	$clientDefine,
  sID       VARCHAR2(36) not null,
  sPerson   VARCHAR2(36) null,
  sProcess  VARCHAR2(1024) not null,
  sActivity VARCHAR2(128) not null,
  sInstance VARCHAR2(128) not null,
  sName     VARCHAR2(128) not null,
  sContent  CLOB,
  sOrderNum INTEGER not null,
  version   INTEGER,
  sOrgFID	VARCHAR2(255) null,
  sOrgFName	VARCHAR2(1024) null,
  sCreatorID	VARCHAR2(32) null,
  sCreatorName	VARCHAR2(64) null,
  sCreateTime	DATE
);
 
alter table SA_FilterPattern
  add constraint PK_FILTERPATTERN primary key ($clientName, sID);
  
create index IDX_FILTERPATTERN_PERSON on SA_FilterPattern (sPerson);
create index IDX_FILTERPATTERN_ORGFID on SA_FilterPattern (sOrgFID);  
  
drop table SA_OPPerson;	         
create table SA_OPPerson
(
	$clientDefine,
  sID             VARCHAR2(19) not null,
  sName           VARCHAR2(64) not null,
  sCode           VARCHAR2(64) not null,
  sIDCard         VARCHAR2(36),
  sNumb           INTEGER not null,
  sLoginName      VARCHAR2(64),
  sPassword       VARCHAR2(64),
  sPasswordTimeLimit       INTEGER,
  sPasswordModifyTime      DATE,
  sMainOrgID      VARCHAR2(19) not null,
  sSafeLevelID    VARCHAR2(36),
  sSequence       INTEGER,
  sValidState     INTEGER,
  sDescription    VARCHAR2(2048),
  sSex            VARCHAR2(8),
  sBirthday       DATE,
  sJoinDate       DATE,
  sHomePlace      VARCHAR2(64),
  sDegree         VARCHAR2(16),
  sGraduateSchool VARCHAR2(128),
  sSpeciality     VARCHAR2(128),
  sSchoolLength   VARCHAR2(16),
  sTitle          VARCHAR2(64),
  sMarriage       VARCHAR2(16),
  sCardNO         VARCHAR2(36),
  sCardKind       VARCHAR2(64),
  sFamilyAddress  VARCHAR2(255),
  sZip            VARCHAR2(16),
  sMsn            VARCHAR2(64),
  sQQ             VARCHAR2(36),
  sMail           VARCHAR2(64),
  sMobilePhone    VARCHAR2(36),
  sFamilyPhone    VARCHAR2(36),
  sOfficePhone    VARCHAR2(36),
  version         INTEGER,
  sPhoto          BLOB,
  sPhotoLastModified          DATE,
  sCountry        VARCHAR2(64),
  sProvince       VARCHAR2(64),
  sCity           VARCHAR2(64),
  SPOSITIONS      VARCHAR2(64),
  SSCHOOL         VARCHAR2(64),
  SSTUDY          VARCHAR2(64),
  sEnglishName    VARCHAR2(128)
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
  sID         VARCHAR2(32) not null,
  sOperatorID VARCHAR2(32),
  sProcess    VARCHAR2(127),
  sProcessTemplateID2 VARCHAR(32)   ,  
  sActivity   VARCHAR2(32),
  sAction     VARCHAR2(32),
  sKind       VARCHAR2(16),
  sContent    CLOB,
  version     INTEGER
);

create index IDX_PC_INDEX on SA_ProcessControl (sProcess, sActivity, sOperatorID, sAction, sProcessTemplateID2);

alter table SA_ProcessControl
  add constraint PK_FLOWCONTROL primary key ($clientName, sID);

  drop table SA_RemindConfig;	         
create table SA_RemindConfig
(
	$clientDefine,
  sID             VARCHAR2(50) not null,
  sOverdueEnable  VARCHAR2(10),
  sPersonID       VARCHAR2(50) not null,
  sIntervalMinute INTEGER,
  sEnable         VARCHAR2(10),
  version         INTEGER not null
);
alter table SA_RemindConfig
  add constraint PK_REMINDCONFIG primary key ($clientName, sID);
  
  drop table SA_Reminder;	         
create table SA_Reminder
(
	$clientDefine,
  sRemindID    VARCHAR2(50) not null,
  sPersonID    VARCHAR2(100) not null,
  sPersonName  VARCHAR2(50) not null,
  sID          VARCHAR2(50) not null,
  version      INTEGER
);
alter table SA_Reminder
  add constraint PK_REMINDER primary key ($clientName, sID);
  
drop table SA_RemindActionParameter;	         
create table SA_RemindActionParameter
(
	$clientDefine,
  sID          VARCHAR2(50) not null,
  sRemindID    VARCHAR2(50) not null,
  sName        VARCHAR2(50) not null,
  sDataType    VARCHAR2(50),
  sValue       VARCHAR2(100) not null,
  version      INTEGER
);
alter table SA_RemindActionParameter
  add constraint PK_REMINDACTIONPARAMETER primary key ($clientName, sID);
  
  drop table SA_Remind;	         
create table SA_Remind
(
	$clientDefine,
  sID               VARCHAR2(50) not null,
  sName       		VARCHAR2(200) not null,
  sRemindStyle      VARCHAR2(50) not null,  
  sRemindStyleName  VARCHAR2(50),
  sTimes         	INTEGER,
  sActualStartTime  DATE not null,
  sActualFinishTime DATE,
  sLastTime      	DATE,
  sIntervalTime  	DATE,
  sProcess       	VARCHAR2(1024),
  sActivity      	VARCHAR2(1024),
  sAction    		VARCHAR2(100),
  sStatus         	VARCHAR2(30),
  sCreatorID    	VARCHAR2(50) not null,
  sCreatorName    	VARCHAR2(100) not null,
  sRemark   		VARCHAR2(500),
  sReturnable      	VARCHAR2(50),
  sReturnPattern 	VARCHAR2(500),
  sActionParam     	INTEGER,
  version        	INTEGER,
  sCondition     	VARCHAR2(500),
  sIntervalDay   	INTEGER,
  sIntervalHour  	INTEGER,
  sIntervalMin   	INTEGER,
  sType          	INTEGER,
  sDataModel      	VARCHAR2(50),
  sContent       	CLOB,
  sReminder       	CLOB
);
alter table SA_Remind
  add constraint PK_REMIND primary key ($clientName, sID);
  
  
drop table SA_Social;	                  
create table SA_Social
(
               	$clientDefine,
  sID             VARCHAR2(32) not null,
  sName           VARCHAR2(255),
  sTypeID         VARCHAR2(32),
  sTypeName       VARCHAR2(64),
  sProcess        VARCHAR2(1024),
  sActivity       VARCHAR2(128),
  sURL            CLOB,
  sData1          VARCHAR2(128),
  sData2          VARCHAR2(128),
  sData3          VARCHAR2(128),
  sData4          VARCHAR2(128),
  sCreatorID      VARCHAR2(32),
  sCreatorName    VARCHAR2(128),
  sCreatorFID     VARCHAR2(1024),
  sCreatorFName   VARCHAR2(1024),
  sPersonID    	  VARCHAR2(32),
  sPersonName     VARCHAR2(128),
  sOrgID    	  VARCHAR2(65),
  sOrgName  	  VARCHAR2(128),
  sOrgFID         VARCHAR2(1024),
  sOrgFName       VARCHAR2(1024),
  sValidState     INTEGER,
  sCreateTime     DATE,
  version         INTEGER,
  
  sESField01	VARCHAR2(128),
  sESField02	VARCHAR2(128),
  sESField03	VARCHAR2(128),
  sESField04	VARCHAR2(128),
  sESField05	VARCHAR2(128),
  sESField06	VARCHAR2(128),
  sESField07	VARCHAR2(128),
  sESField08	VARCHAR2(128),
  sENField11	NUMBER,
  sENField12	NUMBER,
  sENField13	NUMBER,
  sENField14	NUMBER,
  sEDField21	DATE,
  sEDField22	DATE,
  sEDField23	DATE,
  sEDField24	DATE,
  sETField31	CLOB,
  sETField32	CLOB,
  sETField33	CLOB,
  sETField34	CLOB,
  sEIField41	INTEGER,
  sEIField42	INTEGER,
  sEIField43	INTEGER,
  sEIField44	INTEGER,
  sEBField51	Blob,
  sEBField52	Blob,
  sEbField53	Blob,
  sEBField54	Blob,
  
  sGroupID         VARCHAR2(32),
  sGroupName       VARCHAR2(64),
  sMessageNumber   INTEGER,
  sActive   	   INTEGER  
);

alter table SA_Social
  add constraint PK_SOCIAL primary key ($clientName, sID);

create index IDX_SOCIAL_DATA on SA_Social (sData1);
create index IDX_SOCIAL_NAME on SA_Social (sName);
create index IDX_SOCIAL_CREATETIME on SA_Social (sCreateTime);
create index IDX_SOCIAL_TOD on SA_Social (sTypeID, sPersonID, sData1);
create index IDX_SOCIAL_TOC on SA_Social (sTypeID, sPersonID, sCreateTime);
  

  drop table SA_Task;	         
create table SA_Task
(
	$clientDefine,
  sID             VARCHAR2(32) not null,
  sCode           VARCHAR2(128),
  sParentID       VARCHAR2(32),
  sName           VARCHAR2(255),
  sContent        CLOB,
  sRemark         CLOB,
  sSummary        CLOB,
  sFlowID         VARCHAR2(32),
  sSourceID       VARCHAR2(32),
  sFrontID       VARCHAR2(32),
  sExecuteMode2   VARCHAR2(256),
  sExecuteMode    VARCHAR2(32),
  sPreemptMode    VARCHAR2(32),
  sCatalogID      VARCHAR2(32),
  sKindID         VARCHAR2(32),
  sTypeID         VARCHAR2(32),
  sTypeName       VARCHAR2(64),
  sImportanceID   VARCHAR2(32),
  sImportanceName VARCHAR2(64),
  sEmergencyID    VARCHAR2(32),
  sEmergencyName  VARCHAR2(64),
  sProcess        VARCHAR2(127),
  sActivity       VARCHAR2(128),
  sCURL           CLOB,
  sEURL           CLOB,
  sCreateTime     DATE,
  sDistributeTime DATE,
  sLastModifyTime DATE,
  sWarningTime    DATE,
  sLimitTime      DATE,
  sExpectStartTime     DATE,
  sExpectFinishTime    DATE,
  sActualStartTime     DATE,
  sActualFinishTime    DATE,
  sExecuteTime    DATE,
  sCreatorPersonID      VARCHAR2(32),
  sCreatorPersonName    VARCHAR2(128),
  sCreatorPosID         VARCHAR2(32),
  sCreatorPosName       VARCHAR2(128),
  sCreatorDeptID        VARCHAR2(32),
  sCreatorDeptName      VARCHAR2(128),
  sCreatorOgnID         VARCHAR2(32),
  sCreatorOgnName       VARCHAR2(128),
  sCreatorFID           VARCHAR2(212),
  sCreatorFName         VARCHAR2(1024),
  sExecutorPersonID      VARCHAR2(32),
  sExecutorPersonName    VARCHAR2(128),
  sExecutorPosID         VARCHAR2(32),
  sExecutorPosName       VARCHAR2(128),
  sExecutorDeptID        VARCHAR2(32),
  sExecutorDeptName      VARCHAR2(128),
  sExecutorOgnID         VARCHAR2(32),
  sExecutorOgnName       VARCHAR2(128),
  sExecutorFID           VARCHAR2(212),
  sExecutorFName         VARCHAR2(1024),
  sExecutorNames  CLOB,
  sActivityNames  CLOB,
  sResponsible    VARCHAR2(8),
  sCustomerID     VARCHAR2(64),
  SCustomerCode   VARCHAR2(64),
  sCustomerName   VARCHAR2(256),
  sProjectID      VARCHAR2(64),
  sProjectCode    VARCHAR2(64),
  sProjectName    VARCHAR2(256),
  sPlanID         VARCHAR2(64),
  sPlanCode       VARCHAR2(64),
  sPlanName       VARCHAR2(256),
  sData1          VARCHAR2(32),
  sData2          VARCHAR2(32),
  sData3          VARCHAR2(32),
  sData4          VARCHAR2(32),
  sFake           VARCHAR2(8),
  sActive         VARCHAR2(8),
  sStatusID       VARCHAR2(32),
  sStatusName     VARCHAR2(64),
  sAIID           VARCHAR2(32),
  sAIStatusID     VARCHAR2(256),
  sAIStatusName   VARCHAR2(256),
  sAIActive       VARCHAR2(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR2(64),
  sSequence       INTEGER,
  sLock           VARCHAR2(32),
  sHints          CLOB,
  sShortcut       CLOB,
  sRemindMode     VARCHAR2(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       CLOB,
  sProcessName    VARCHAR2(128),
  sActivityName   VARCHAR2(128),
  sProcessTemplateID   VARCHAR2(32),
  sProcessTemplateItemSequence   VARCHAR2(128),
  sTempPermissionID   VARCHAR2(32),
  sActivityInTemplate VARCHAR2(128)  ,
  sProcessTemplateID2 VARCHAR2(32)  ,  
  
  sESField01	VARCHAR2(128),
  sESField02	VARCHAR2(128),
  sESField03	VARCHAR2(128),
  sESField04	VARCHAR2(128),
  sESField05	VARCHAR2(128),
  sESField06	VARCHAR2(128),
  sESField07	VARCHAR2(128),
  sESField08	VARCHAR2(128),
  sENField11	NUMBER,
  sENField12	NUMBER,
  sENField13	NUMBER,
  sENField14	NUMBER,
  sEDField21	DATE,
  sEDField22	DATE,
  sEDField23	DATE,
  sEDField24	DATE,
  sETField31	Clob,
  sETField32	Clob,
  sETField33	Clob,
  sETField34	Clob,
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
create index IDX_TASK_PIK on SA_Task(sParentID,sID,  sKindID);
create index IDX_TASK_DATA_P on SA_Task (sData1, sData2, sData3, sData4, sProcess);


  drop table SA_Task_SysBak;	         
create table SA_Task_SysBak
(
	$clientDefine,
  sID             VARCHAR2(32) not null,
  sCode           VARCHAR2(128),
  sParentID       VARCHAR2(32),
  sName           VARCHAR2(255),
  sContent        CLOB,
  sRemark         CLOB,
  sSummary        CLOB,
  sFlowID         VARCHAR2(32),
  sSourceID       VARCHAR2(32),
  sFrontID       VARCHAR2(32),
  sExecuteMode2   VARCHAR2(256),
  sExecuteMode    VARCHAR2(32),
  sPreemptMode    VARCHAR2(32),
  sCatalogID      VARCHAR2(32),
  sKindID         VARCHAR2(32),
  sTypeID         VARCHAR2(32),
  sTypeName       VARCHAR2(64),
  sImportanceID   VARCHAR2(32),
  sImportanceName VARCHAR2(64),
  sEmergencyID    VARCHAR2(32),
  sEmergencyName  VARCHAR2(64),
  sProcess        VARCHAR2(127),
  sActivity       VARCHAR2(128),
  sCURL           CLOB,
  sEURL           CLOB,
  sCreateTime     DATE,
  sDistributeTime DATE,
  sLastModifyTime DATE,
  sWarningTime    DATE,
  sLimitTime      DATE,
  sExpectStartTime     DATE,
  sExpectFinishTime    DATE,
  sActualStartTime     DATE,
  sActualFinishTime    DATE,
  sExecuteTime    DATE,
  sCreatorPersonID      VARCHAR2(32),
  sCreatorPersonName    VARCHAR2(128),
  sCreatorPosID         VARCHAR2(32),
  sCreatorPosName       VARCHAR2(128),
  sCreatorDeptID        VARCHAR2(32),
  sCreatorDeptName      VARCHAR2(128),
  sCreatorOgnID         VARCHAR2(32),
  sCreatorOgnName       VARCHAR2(128),
  sCreatorFID           VARCHAR2(212),
  sCreatorFName         VARCHAR2(1024),
  sExecutorPersonID      VARCHAR2(32),
  sExecutorPersonName    VARCHAR2(128),
  sExecutorPosID         VARCHAR2(32),
  sExecutorPosName       VARCHAR2(128),
  sExecutorDeptID        VARCHAR2(32),
  sExecutorDeptName      VARCHAR2(128),
  sExecutorOgnID         VARCHAR2(32),
  sExecutorOgnName       VARCHAR2(128),
  sExecutorFID           VARCHAR2(212),
  sExecutorFName         VARCHAR2(1024),
  sExecutorNames  CLOB,
  sActivityNames  CLOB,
  sResponsible    VARCHAR2(8),
  sCustomerID     VARCHAR2(64),
  SCustomerCode   VARCHAR2(64),
  sCustomerName   VARCHAR2(256),
  sProjectID      VARCHAR2(64),
  sProjectCode    VARCHAR2(64),
  sProjectName    VARCHAR2(256),
  sPlanID         VARCHAR2(64),
  sPlanCode       VARCHAR2(64),
  sPlanName       VARCHAR2(256),
  sData1          VARCHAR2(32),
  sData2          VARCHAR2(32),
  sData3          VARCHAR2(32),
  sData4          VARCHAR2(32),
  sFake           VARCHAR2(8),
  sActive         VARCHAR2(8),
  sStatusID       VARCHAR2(32),
  sStatusName     VARCHAR2(64),
  sAIID           VARCHAR2(32),
  sAIStatusID     VARCHAR2(256),
  sAIStatusName   VARCHAR2(256),
  sAIActive       VARCHAR2(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR2(64),
  sSequence       INTEGER,
  sLock           VARCHAR2(32),
  sHints          CLOB,
  sShortcut       CLOB,
  sRemindMode     VARCHAR2(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       CLOB,
  sProcessName    VARCHAR2(128),
  sActivityName   VARCHAR2(128),
  sProcessTemplateID   VARCHAR2(32),
  sProcessTemplateItemSequence   VARCHAR2(128),
  sTempPermissionID   VARCHAR2(32),
  sActivityInTemplate VARCHAR2(128)  ,
  sProcessTemplateID2 VARCHAR2(32)  ,  
  
  sESField01	VARCHAR2(128),
  sESField02	VARCHAR2(128),
  sESField03	VARCHAR2(128),
  sESField04	VARCHAR2(128),
  sESField05	VARCHAR2(128),
  sESField06	VARCHAR2(128),
  sESField07	VARCHAR2(128),
  sESField08	VARCHAR2(128),
  sENField11	NUMBER,
  sENField12	NUMBER,
  sENField13	NUMBER,
  sENField14	NUMBER,
  sEDField21	DATE,
  sEDField22	DATE,
  sEDField23	DATE,
  sEDField24	DATE,
  sETField31	Clob,
  sETField32	Clob,
  sETField33	Clob,
  sETField34	Clob,
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
  sID             VARCHAR2(32) not null,
  sCode           VARCHAR2(128),
  sParentID       VARCHAR2(32),
  sName           VARCHAR2(255),
  sContent        CLOB,
  sRemark         CLOB,
  sSummary        CLOB,
  sFlowID         VARCHAR2(32),
  sSourceID       VARCHAR2(32),
  sFrontID       VARCHAR2(32),
  sExecuteMode2   VARCHAR2(256),
  sExecuteMode    VARCHAR2(32),
  sPreemptMode    VARCHAR2(32),
  sCatalogID      VARCHAR2(32),
  sKindID         VARCHAR2(32),
  sTypeID         VARCHAR2(32),
  sTypeName       VARCHAR2(64),
  sImportanceID   VARCHAR2(32),
  sImportanceName VARCHAR2(64),
  sEmergencyID    VARCHAR2(32),
  sEmergencyName  VARCHAR2(64),
  sProcess        VARCHAR2(127),
  sActivity       VARCHAR2(128),
  sCURL           CLOB,
  sEURL           CLOB,
  sCreateTime     DATE,
  sDistributeTime DATE,
  sLastModifyTime DATE,
  sWarningTime    DATE,
  sLimitTime      DATE,
  sExpectStartTime     DATE,
  sExpectFinishTime    DATE,
  sActualStartTime     DATE,
  sActualFinishTime    DATE,
  sExecuteTime    DATE,
  sCreatorPersonID      VARCHAR2(32),
  sCreatorPersonName    VARCHAR2(128),
  sCreatorPosID         VARCHAR2(32),
  sCreatorPosName       VARCHAR2(128),
  sCreatorDeptID        VARCHAR2(32),
  sCreatorDeptName      VARCHAR2(128),
  sCreatorOgnID         VARCHAR2(32),
  sCreatorOgnName       VARCHAR2(128),
  sCreatorFID           VARCHAR2(212),
  sCreatorFName         VARCHAR2(1024),
  sExecutorPersonID      VARCHAR2(32),
  sExecutorPersonName    VARCHAR2(128),
  sExecutorPosID         VARCHAR2(32),
  sExecutorPosName       VARCHAR2(128),
  sExecutorDeptID        VARCHAR2(32),
  sExecutorDeptName      VARCHAR2(128),
  sExecutorOgnID         VARCHAR2(32),
  sExecutorOgnName       VARCHAR2(128),
  sExecutorFID           VARCHAR2(212),
  sExecutorFName         VARCHAR2(1024),
  sExecutorNames  CLOB,
  sActivityNames  CLOB,
  sResponsible    VARCHAR2(8),
  sCustomerID     VARCHAR2(64),
  SCustomerCode   VARCHAR2(64),
  sCustomerName   VARCHAR2(256),
  sProjectID      VARCHAR2(64),
  sProjectCode    VARCHAR2(64),
  sProjectName    VARCHAR2(256),
  sPlanID         VARCHAR2(64),
  sPlanCode       VARCHAR2(64),
  sPlanName       VARCHAR2(256),
  sData1          VARCHAR2(32),
  sData2          VARCHAR2(32),
  sData3          VARCHAR2(32),
  sData4          VARCHAR2(32),
  sFake           VARCHAR2(8),
  sActive         VARCHAR2(8),
  sStatusID       VARCHAR2(32),
  sStatusName     VARCHAR2(64),
  sAIID           VARCHAR2(32),
  sAIStatusID     VARCHAR2(256),
  sAIStatusName   VARCHAR2(256),
  sAIActive       VARCHAR2(8),
  sWorkTime       INTEGER,
  sVersionNumber  VARCHAR2(64),
  sSequence       INTEGER,
  sLock           VARCHAR2(32),
  sHints          CLOB,
  sShortcut       CLOB,
  sRemindMode     VARCHAR2(32),
  version         INTEGER,
  sWithdraw       INTEGER,
  sVariable       CLOB,
  sProcessName    VARCHAR2(128),
  sActivityName   VARCHAR2(128),
  sProcessTemplateID   VARCHAR2(32),
  sProcessTemplateItemSequence   VARCHAR2(128),
  sTempPermissionID   VARCHAR2(32),
  sActivityInTemplate VARCHAR2(128)  ,
  sProcessTemplateID2 VARCHAR2(32)  ,  
  
  sESField01	VARCHAR2(128),
  sESField02	VARCHAR2(128),
  sESField03	VARCHAR2(128),
  sESField04	VARCHAR2(128),
  sESField05	VARCHAR2(128),
  sESField06	VARCHAR2(128),
  sESField07	VARCHAR2(128),
  sESField08	VARCHAR2(128),
  sENField11	NUMBER,
  sENField12	NUMBER,
  sENField13	NUMBER,
  sENField14	NUMBER,
  sEDField21	DATE,
  sEDField22	DATE,
  sEDField23	DATE,
  sEDField24	DATE,
  sETField31	Clob,
  sETField32	Clob,
  sETField33	Clob,
  sETField34	Clob,
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
create index IDX_TASKH_PIK on SA_Task_Histroy(sParentID,sID,  sKindID);
create index IDX_TASKH_DATA_P on SA_Task_Histroy (sData1, sData2, sData3, sData4, sProcess);

  
drop table SA_ProcessTemplate;	         
create table SA_ProcessTemplate
(
	$clientDefine,
  sID             VARCHAR2(32) not null,
  sTemplateID     VARCHAR2(32),
  sName           VARCHAR2(32),
  sKindID           VARCHAR2(32),
  sTypeID           VARCHAR2(32),
  sScopeID           VARCHAR2(32),
  sProcess           VARCHAR2(255),
  sProcessName           VARCHAR2(128),
  sActivity       	VARCHAR2(128),
  sActivityName       VARCHAR2(128),
  sCreatorFID           VARCHAR2(1024),
  sCreatorFName           VARCHAR2(1024),
  sCreatorName           VARCHAR2(128),
  sCreatorID           VARCHAR2(32),
  sContent        CLOB,
  sContent2        CLOB,
  sCreateTime     DATE,  
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
  sID              VARCHAR2(32) not null,
  sName     	   VARCHAR2(128),
  sDescription     CLOB,
  sOrgID           VARCHAR2(65) not null,
  sOrgName         VARCHAR2(128),
  sOrgFID          VARCHAR2(255) not null,
  sOrgFName        VARCHAR2(1024),
  sCreatorID       VARCHAR2(65) not null,
  sCreatorName     VARCHAR2(128),
  sCreatorFID      VARCHAR2(255) not null,
  sCreatorFName    VARCHAR2(1024),
  sCreateTime      DATE,
  sResourceID 	   VARCHAR2(255) not null,
  sTypeID 	   	   VARCHAR2(128),
  sTypeName 	   VARCHAR2(128),
  sProcess         VARCHAR2(255),
  sProcessName     VARCHAR2(128),
  sActivity        VARCHAR2(128),
  sActivityName    VARCHAR2(128),
  sAction          VARCHAR2(128),
  sActionName      VARCHAR2(128),
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
  sID                     VARCHAR2(32) not null,
  sProcessInstanceID      VARCHAR2(32),
  sProcess                VARCHAR2(1024),
  sProcessTemplateID2     VARCHAR2(32)   ,
  sPlace                  VARCHAR2(128),
  sFromActivityInstanceID VARCHAR2(32),
  sFromActivity           VARCHAR2(128),
  sToActivity             VARCHAR2(128),
  sToActivityInstanceID   VARCHAR2(32),
  sValue                  CLOB,
  sActive                 VARCHAR2(8),
  version                 INTEGER
);

alter table SA_TokenInstance
  add constraint PK_TOKEN primary key ($clientName, sID);

create index IDX_TI_PI on SA_TokenInstance (sProcessInstanceID);

drop table SA_TokenInstance_SysBak;	         
create table SA_TokenInstance_SysBak
(
	$clientDefine,
  sID                     VARCHAR2(32) not null,
  sProcessInstanceID      VARCHAR2(32),
  sProcess                VARCHAR2(1024),
  sProcessTemplateID2     VARCHAR2(32)   ,
  sPlace                  VARCHAR2(128),
  sFromActivityInstanceID VARCHAR2(32),
  sFromActivity           VARCHAR2(128),
  sToActivity             VARCHAR2(128),
  sToActivityInstanceID   VARCHAR2(32),
  sValue                  CLOB,
  sActive                 VARCHAR2(8),
  version                 INTEGER
);

alter table SA_TokenInstance_SysBak
  add constraint PK_TOKEN_SysBak primary key ($clientName, sID);


drop table SA_TokenInstance_Histroy;	         
create table SA_TokenInstance_Histroy
(
	$clientDefine,
  sID                     VARCHAR2(32) not null,
  sProcessInstanceID      VARCHAR2(32),
  sProcess                VARCHAR2(1024),
  sProcessTemplateID2     VARCHAR2(32)   ,
  sPlace                  VARCHAR2(128),
  sFromActivityInstanceID VARCHAR2(32),
  sFromActivity           VARCHAR2(128),
  sToActivity             VARCHAR2(128),
  sToActivityInstanceID   VARCHAR2(32),
  sValue                  CLOB,
  sActive                 VARCHAR2(8),
  version                 INTEGER
);

alter table SA_TokenInstance_Histroy
  add constraint PK_TOKEN_Histroy primary key ($clientName, sID);

create index IDX_TIH_PI on SA_TokenInstance_Histroy (sProcessInstanceID);

drop table SA_ThemeDefine;	         
create table SA_ThemeDefine
(
	$clientDefine,
  sID               VARCHAR2(100) not null,
  version           NUMBER,
  sThemeName        VARCHAR2(100),
  sThemeLayoutInfo  CLOB,
  sThemePublishType VARCHAR2(100),
  sThemeActivity    VARCHAR2(1024),
  sCreatorID        VARCHAR2(100)
);
 
alter table SA_ThemeDefine
  add primary key ($clientName, sID);
  
  
  drop table SA_ThemeManager;	         
create table SA_ThemeManager
(
	$clientDefine,
  sID            VARCHAR2(100) not null,
  version        NUMBER,
  sThemeID       VARCHAR2(100),
  sOrgID         VARCHAR2(100),
  sThemeActivity VARCHAR2(1024)
);
 
alter table SA_ThemeManager
  add primary key ($clientName, sID);
  
  drop table SA_Log;	         
create table SA_Log
(
	$clientDefine,
  sID              		VARCHAR2(32) not null,
  sTypeName 	   		VARCHAR2(128),
  sDescription     		Clob,
  sProcess         		VARCHAR2(255),
  sProcessName     		VARCHAR2(128),
  sActivity        		VARCHAR2(128),
  sActivityName    		VARCHAR2(128),
  sAction          		VARCHAR2(128),
  sDeviceType          		VARCHAR2(64),
  sOperatingSystem          		VARCHAR2(64),
  sActionName      		VARCHAR2(128),
  sParameters      		Clob,
  sResult	       		Clob,
  sStatusName      		VARCHAR2(32),
  sCreateTime 	   		DATE,
  sCreatorFID           VARCHAR2(255),
  sCreatorFName         VARCHAR2(1024),
  sCreatorPersonID      VARCHAR2(32),
  sCreatorPersonName    VARCHAR2(128),
  sCreatorPosID         VARCHAR2(32),
  sCreatorPosName       VARCHAR2(128),
  sCreatorDeptID        VARCHAR2(32),
  sCreatorDeptName      VARCHAR2(128),
  sCreatorOgnID         VARCHAR2(32),
  sCreatorOgnName       VARCHAR2(128),
  sIP			        VARCHAR2(32),
  sESField01			VARCHAR2(256),
  sESField02			VARCHAR2(256),
  sESField03			VARCHAR2(256),
  sESField04			VARCHAR2(256),
  sENField11			NUMBER,
  sENField12			NUMBER,
  sEDField21			DATE,
  sEDField22			DATE,
  sETField31			Clob,
  sETField32			Clob,
  sEIField41			INTEGER,
  sEIField42			INTEGER,
  sEBField51			Blob,
  sEBField52			Blob,
  version          		NUMBER
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
  sID             VARCHAR2(36) NOT NULL,
  sRootPath       VARCHAR2(2048),
  sRootName       VARCHAR2(512),
  sProcess    VARCHAR2(512),
  sActivity   VARCHAR2(128),
  sPersonFID      VARCHAR2(512),
  sSubPath        VARCHAR2(512),
  sAccess         INTEGER,
  version         NUMBER(10),
  sDeptName       VARCHAR2(64),
  sPersonName     VARCHAR2(64),
  sLimitSize      FLOAT,
  sShowChildren   VARCHAR2(36),
  sDefineItems    Clob,
  sDisplayName    VARCHAR2(512)
);
drop table SA_DocLog;	         
CREATE TABLE SA_DocLog
(
	$clientDefine,
  version       NUMBER(10),
  sPersonName   VARCHAR2(64),
  sAccessType   VARCHAR2(16),
  sDocID        VARCHAR2(64),
  sID           VARCHAR2(36) NOT NULL,
  sTime         DATE,
  sDeptName     VARCHAR2(64),
  sPersonFID       VARCHAR2(512),
  sDocVersionID NUMBER(10),
  sDocName      VARCHAR2(128),
  sSize         FLOAT
);
drop table SA_DocAuth;	         
CREATE TABLE SA_DocAuth
(
	$clientDefine,
  sID             VARCHAR2(36) NOT NULL,
  sDocPath        VARCHAR2(2048),
  sAuthorizerFID     VARCHAR2(512),
  sAuthorizerName VARCHAR2(64),
  sAuthorizerDeptName VARCHAR2(64),
  sAuthorizeeFID     VARCHAR2(512),
  sAuthorizeeName VARCHAR2(64),
  sGrantTime      DATE,
  sAccess         INTEGER,
  sScope          VARCHAR2(16),
  sAuthorizeeDeptName VARCHAR2(64),
  version         NUMBER(10)
);
drop table SA_DocLink;	         
CREATE TABLE SA_DocLink
(
	$clientDefine,
  sID           VARCHAR2(36) NOT NULL,
  sOwnerID       VARCHAR2(256),
  sDocID        VARCHAR2(36),
  version       NUMBER(10),
  sActivity VARCHAR2(128),
  sProcess  VARCHAR2(512)
);
drop table SA_DocNode;	         
CREATE TABLE SA_DocNode
(
	$clientDefine,
  sID               VARCHAR2(36) NOT NULL,
  sParentID         VARCHAR2(36),
  sDocName          VARCHAR2(128),
  sSequence         VARCHAR2(128),
  sSize             FLOAT,
  sKind             VARCHAR2(128),
  sDocPath          VARCHAR2(2048),
  sDocDisplayPath   CLOB,
  sCreatorFID       VARCHAR2(2048),
  sCreatorName      VARCHAR2(64),
  sCreatorDeptName  VARCHAR2(64),
  sCreateTime       DATE,
  sEditorFID        VARCHAR2(2048),
  sEditorName       VARCHAR2(64),
  sEditorDeptName   VARCHAR2(64),
  sLastWriterFID    VARCHAR2(2048),
  sLastWriterName   VARCHAR2(64),
  sLastWriterDeptName   VARCHAR2(64),
  sLastWriteTime    DATE,
  sFileID           VARCHAR2(128),
  sDescription      CLOB,
  sDocLiveVersionID INTEGER,
  version           NUMBER(10),
  sClassification   VARCHAR2(128),
  sKeywords         VARCHAR2(256),
  sDocSerialNumber  VARCHAR2(128),
  sFinishTime       DATE,
  sNameSpace        VARCHAR2(256),
  sCacheName        VARCHAR2(100),
  sRevisionCacheName        VARCHAR2(100),
  sFlag             INTEGER 
);
drop table SA_DocNameSpace;	         
CREATE TABLE SA_DocNameSpace
(
	$clientDefine,
  sID          VARCHAR2(128) NOT NULL,
  sDisplayName VARCHAR2(256),
  sHost        VARCHAR2(128),
  sPort        INTEGER,
  sUrl        VARCHAR2(128),
  version      INTEGER,
  sFlag        INTEGER,
  sAccessMode  VARCHAR2(64) 	
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
	sID VARCHAR2 (32) NOT NULL ,
	sPersonID VARCHAR2 (32) NOT NULL ,
	sTypeID VARCHAR2 (32) NOT NULL ,
	sTypeName VARCHAR2 (64) NOT NULL ,
	sAccountNumber VARCHAR2 (128) NOT NULL ,
	sProtocol VARCHAR2 (32) NOT NULL ,
	sValidState INTEGER,
	sIsDefault INTEGER,
	version INTEGER NOT NULL
);

ALTER TABLE SA_Terminal ADD 
	 PRIMARY KEY  ($clientName,sID); 
create index IDX_TERMINAL_PNS on SA_Terminal (sPersonID);	

drop table SA_ShortURL;
CREATE TABLE SA_ShortURL (
	sID VARCHAR2 (128) NOT NULL ,
	sLongURL VARCHAR2 (1024),
    sCreateTime     DATE,
	version INTEGER NOT NULL
);
ALTER TABLE SA_ShortURL ADD 
	 PRIMARY KEY  (sID);  
