    DROP TABLE DEMO_Dynamic_Flows
    DROP TABLE DEMO_Dynamic_LeaveApply

CREATE TABLE [dbo].[DEMO_Dynamic_Flows] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [int] NULL ,
	[fProcess] [varchar] (512)  NULL ,
	[fProcessLabel] [varchar] (1024)  NULL 
) ON [PRIMARY]

$clientIndex(DEMO_Dynamic_Flows)  

ALTER TABLE [dbo].[DEMO_Dynamic_Flows] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Dynamic_Flows] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  



CREATE TABLE [dbo].[DEMO_Dynamic_LeaveApply] (
	$clientDefine,
	[fID] [varchar] (100)  NOT NULL ,
	[version] [int] NULL ,
	[fApplyDate] [datetime] NULL ,
	[fDays] [int] NULL ,
	[fReason] [text] NULL ,
	[fProcess] [varchar] (512)  NULL ,
	[fProcessLabel] [varchar] (1024)  NULL ,
	[fApplyPerson] [varchar] (64)  NULL 
) ON [PRIMARY]

$clientIndex(DEMO_Dynamic_LeaveApply) 

ALTER TABLE [dbo].[DEMO_Dynamic_LeaveApply] WITH NOCHECK ADD 
	CONSTRAINT [PK_DEMO_Dynamic_LeaveApply] PRIMARY KEY  CLUSTERED 
	(
		[fID],
		$clientName
	)  ON [PRIMARY] 
GO  


