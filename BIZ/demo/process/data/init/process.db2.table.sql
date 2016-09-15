    DROP TABLE DEMO_Dynamic_Flows
    DROP TABLE DEMO_Dynamic_LeaveApply
create table DEMO_Dynamic_Flows
(
	$clientDefine,
	fID             VARCHAR(100) not null,
	version 		INTEGER,
	fProcess 		VARCHAR(512) not null,
	fProcessLabel	VARCHAR(1024) not null
); 

alter table DEMO_Dynamic_Flows
  add primary key ($clientName, fID);

create table DEMO_Dynamic_LeaveApply
(
	$clientDefine,
	fID             VARCHAR(100) not null,
	version 		INTEGER,
	fApplyDate		DATE,
	fDays			INTEGER,
	fReason			CLOB,
	fProcess 		VARCHAR(512),
	fProcessLabel	VARCHAR(1024),
	fApplyPerson	VARCHAR(64)
); 

alter table DEMO_Dynamic_LeaveApply
  add primary key ($clientName, fID);

