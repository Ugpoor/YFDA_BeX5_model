    DROP TABLE DEMO_Dynamic_Flows
    DROP TABLE DEMO_Dynamic_LeaveApply
create table DEMO_Dynamic_Flows
(
	$clientDefine,
	fID             VARCHAR2(100) not null,
	version 		NUMBER,
	fProcess 		VARCHAR2(512) not null,
	fProcessLabel	VARCHAR2(1024) not null
); 

alter table DEMO_Dynamic_Flows
  add primary key ($clientName, fID);

create table DEMO_Dynamic_LeaveApply
(
	$clientDefine,
	fID             VARCHAR2(100) not null,
	version 		NUMBER,
	fApplyDate		DATE,
	fDays			NUMBER,
	fReason			CLOB,
	fProcess 		VARCHAR2(512),
	fProcessLabel	VARCHAR2(1024),
	fApplyPerson	VARCHAR2(64)
); 

alter table DEMO_Dynamic_LeaveApply
  add primary key ($clientName, fID);
