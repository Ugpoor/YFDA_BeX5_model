    DROP TABLE ASYNCSERVERS
    DROP TABLE ACLS
    DROP TABLE ACL_ACCESSDETAIL
    DROP TABLE ACL_ENTRIES
    DROP TABLE ACL_OBJECTS
    DROP TABLE BRANCHES
    DROP TABLE BRANCH_SEQUENCE
    DROP TABLE COLLECTIONS
    DROP TABLE COLLECTION_SEQUENCE
    DROP TABLE COLLECTION_SUBSCRIPTIONS
    DROP TABLE COMMENTS
    DROP TABLE COMMENT_SEQUENCE
    DROP TABLE CUSTOMFIELDS
    DROP TABLE DAISY_NAMESPACES
    DROP TABLE DAISY_SYSTEM
    DROP TABLE DOCTYPES_FIELDTYPES
    DROP TABLE DOCTYPE_CONTENTMODEL
    DROP TABLE DOCUMENTS
    DROP TABLE DOCUMENTTYPE_SEQUENCE
    DROP TABLE DOCUMENT_COLLECTIONS
    DROP TABLE DOCUMENT_SEQUENCE
    DROP TABLE DOCUMENT_SUBSCRIPTIONS
    DROP TABLE DOCUMENT_TASKS
    DROP TABLE DOCUMENT_TYPES
    DROP TABLE DOCUMENT_VARIANTS
    DROP TABLE DOCUMENT_VERSIONS
    DROP TABLE EMAILNTFY_SUBSCRIPTIONS
    DROP TABLE EMAIL_QUEUE
    DROP TABLE EVENTS
    DROP TABLE EXTRACTED_LINKS
    DROP TABLE FIELDTYPE_SEQUENCE
    DROP TABLE FIELD_TYPES
    DROP TABLE EVENT_SEQUENCE
    DROP TABLE HIERQUERYSELLIST
    DROP TABLE HIERQUERYSELLIST_FIELDS
    DROP TABLE LANGUAGES
    DROP TABLE LANGUAGE_SEQUENCE
    DROP TABLE LINKQUERYSELLIST
    DROP TABLE LINKS
    DROP TABLE LOCALIZEDSTRING_SEQUENCE
    DROP TABLE LOCALIZED_STRINGS
    DROP TABLE LOCKS
    DROP TABLE NAMESPACE_SEQUENCE
    DROP TABLE PARENTLINKEDSELLIST
    DROP TABLE PARTS
    DROP TABLE PARTTYPE_SEQUENCE
    DROP TABLE PART_TYPES
    DROP TABLE QUERYSELLIST
    DROP TABLE ROLES
    DROP TABLE ROLE_SEQUENCE
    DROP TABLE SELECTIONLIST_DATA
    DROP TABLE SUMMARIES
    DROP TABLE TASK_DOC_DETAILS
    DROP TABLE TASK_SEQUENCE
    DROP TABLE THEFIELDS
    DROP TABLE USERS
    DROP TABLE USER_ROLES
    DROP TABLE USER_SEQUENCE
    DROP TABLE WFPOOL_SEQUENCE
    DROP TABLE WF_POOLS
    DROP TABLE WF_POOL_MEMBERS
	DROP TABLE ACTIVEMQ_ACKS
	DROP TABLE ACTIVEMQ_MSGS
	DROP TABLE ACTIVEMQ_LOCK
	
--文档服务器系统表初始化

create table [dbo].[ACTIVEMQ_ACKS] (
	CONTAINER                       varchar(110)                     not null  ,
	CLIENT_ID                       varchar(110)                     not null  ,
	SUB_NAME                        varchar(110)                     not null  ,
	SELECTOR                        varchar(110)                         null  ,
	LAST_ACKED_ID                   int                              not null  , 
	PRIMARY KEY CLUSTERED ([CONTAINER], [CLIENT_ID], [SUB_NAME])
)
create table [dbo].[ACTIVEMQ_LOCK] (
	ID                              bigint                           not null  ,
	TIME                            bigint                           not null  ,
	BROKER_NAME                     varchar(110)                     not null  ,
	PRIMARY KEY CLUSTERED ( [ID] ) 	
)
create table [dbo].[ACTIVEMQ_MSGS] (
	ID                              int                              not null  ,
	CONTAINER                       varchar(110)                     not null  ,
	MSGID_PROD                      varchar(250)                     not null  ,
	MSGID_SEQ                       int                              not null  ,
	EXPIRATION                      bigint                           not null  ,
	MSG                             image                            not null ,  
	PRIMARY KEY CLUSTERED ( [ID] )   
)

CREATE TABLE [dbo].[ASYNCSERVERS] (
	[SERVERTYPE] [varchar] (50)  NOT NULL ,
	[IPADDRESS] [varchar] (50)  NOT NULL ,
	[SERVERNAME] [varchar] (200)  NOT NULL ,
	[SERVERPATH] [varchar] (500)  NOT NULL ,
	[SERVERURL] [varchar] (200)  NULL ,
	[LASTSYNCTIME] [bigint] NULL 
) 


CREATE TABLE [dbo].[ACLS] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (255)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[ACL_ACCESSDETAIL] (
	[ACL_ID] [float] NULL ,
	[ACL_OBJECT_ID] [float] NULL ,
	[ACL_ENTRY_ID] [float] NULL ,
	[ACL_PERMISSION] [varchar] (1)  NULL ,
	[AD_TYPE] [varchar] (20)  NULL ,
	[AD_DATA] [varchar] (255)  NULL 
) 


CREATE TABLE [dbo].[ACL_ENTRIES] (
	[ACL_ID] [float] NOT NULL ,
	[ACL_OBJECT_ID] [float] NOT NULL ,
	[ID] [float] NOT NULL ,
	[SUBJECT_USER_ID] [float] NULL ,
	[SUBJECT_ROLE_ID] [float] NULL ,
	[SUBJECT_TYPE] [varchar] (1)  NULL ,
	[PERM_READ] [varchar] (1)  NULL ,
	[PERM_WRITE] [varchar] (1)  NULL ,
	[PERM_PUBLISH] [varchar] (1)  NULL ,
	[PERM_DELETE] [varchar] (1)  NULL ,
	[READ_DETAIL] [varchar] (1)  NULL ,
	[WRITE_DETAIL] [varchar] (1)  NULL 
) 


CREATE TABLE [dbo].[ACL_OBJECTS] (
	[ACL_ID] [float] NOT NULL ,
	[ID] [float] NOT NULL ,
	[OBJECTSPEC] [text]  NULL 
) 


CREATE TABLE [dbo].[BRANCHES] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[DESCRIPTION] [varchar] (255)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[BRANCH_SEQUENCE] (
	[MAXID] [float] NULL 
) 

CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDBRANCH_SEQUENCE] ON [dbo].[BRANCH_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[COLLECTIONS] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[COLLECTION_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDCOLLECTION_SEQUENCE] ON [dbo].[BRANCH_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[COLLECTION_SUBSCRIPTIONS] (
	[USER_ID] [float] NOT NULL ,
	[COLLECTION_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL 
) 


CREATE TABLE [dbo].[COMMENTS] (
	[ID] [float] NOT NULL ,
	[DOC_ID] [float] NULL ,
	[NS_ID] [float] NULL ,
	[BRANCH_ID] [float] NULL ,
	[LANG_ID] [float] NULL ,
	[CREATED_BY] [float] NULL ,
	[CREATED_ON] [datetime] NULL ,
	[VISIBILITY] [varchar] (1)  NULL ,
	[COMMENT_TEXT] [text]  NULL 
) 


CREATE TABLE [dbo].[COMMENT_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDCOMMENT_SEQUENCE] ON [dbo].[COMMENT_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[CUSTOMFIELDS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[NAME] [varchar] (255)  NOT NULL ,
	[VALUE] [varchar] (2048)  NULL 
) 


CREATE TABLE [dbo].[DAISY_NAMESPACES] (
	[ID] [float] NOT NULL ,
	[NAME_] [varchar] (200)  NULL ,
	[FINGERPRINT] [varchar] (255)  NULL ,
	[REGISTERED_BY] [float] NULL ,
	[REGISTERED_ON] [datetime] NULL 
) 


CREATE TABLE [dbo].[DAISY_SYSTEM] (
	[PROPNAME] [varchar] (100)  NOT NULL ,
	[PROPVALUE] [varchar] (255)  NULL 
) 


CREATE TABLE [dbo].[DOCTYPES_FIELDTYPES] (
	[DOCTYPE_ID] [float] NOT NULL ,
	[FIELD_ID] [float] NOT NULL ,
	[REQUIRED] [varchar] (1)  NULL ,
	[EDITABLE] [varchar] (1)  NULL ,
	[SEQUENCENR] [float] NULL 
) 


CREATE TABLE [dbo].[DOCTYPE_CONTENTMODEL] (
	[DOCTYPE_ID] [float] NOT NULL ,
	[PART_ID] [float] NOT NULL ,
	[REQUIRED] [varchar] (1)  NULL ,
	[EDITABLE] [varchar] (1)  NULL ,
	[SEQUENCENR] [float] NULL 
) 


CREATE TABLE [dbo].[DOCUMENTS] (
	[ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[ID_SEARCH] [varchar] (50)  NULL ,
	[CREATED] [datetime] NULL ,
	[OWNER] [float] NULL ,
	[PRIVATE] [varchar] (1)  NULL ,
	[REFERENCE_LANG_ID] [float] NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[DOCUMENTTYPE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDDOCUMENTTYPE_SEQUENCE] ON [dbo].[DOCUMENTTYPE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[DOCUMENT_COLLECTIONS] (
	[DOCUMENT_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[COLLECTION_ID] [float] NOT NULL 
) 


CREATE TABLE [dbo].[DOCUMENT_SEQUENCE] (
	[MAXID] [float] NULL ,
	[NS_ID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDDOCUMENT_SEQUENCE] ON [dbo].[DOCUMENT_SEQUENCE]([MAXID],[NS_ID])

CREATE TABLE [dbo].[DOCUMENT_SUBSCRIPTIONS] (
	[USER_ID] [float] NOT NULL ,
	[DOC_ID] [varchar] (255)  NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL 
) 


CREATE TABLE [dbo].[DOCUMENT_TASKS] (
	[ID] [float] NOT NULL ,
	[ACTION_TYPE] [varchar] (100)  NULL ,
	[OWNER] [float] NULL ,
	[STARTED_AT] [datetime] NULL ,
	[FINISHED_AT] [datetime] NULL ,
	[STATE] [varchar] (1)  NULL ,
	[PROGRESS] [varchar] (255)  NULL ,
	[DESCRIPTION] [text]  NULL ,
	[ACTION_PARAMETERS] [text]  NULL ,
	[DETAILS] [text]  NULL 
) 


CREATE TABLE [dbo].[DOCUMENT_TYPES] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[LABEL_ID] [float] NULL ,
	[DESCRIPTION_ID] [float] NULL ,
	[DEPRECATED] [varchar] (1)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[DOCUMENT_VARIANTS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[LINK_SEARCH] [varchar] (100)  NULL ,
	[VARIANT_SEARCH] [varchar] (100)  NULL ,
	[DOCTYPE_ID] [float] NULL ,
	[RETIRED] [varchar] (1)  NULL ,
	[LASTVERSION_ID] [float] NULL ,
	[LIVEVERSION_ID] [float] NULL ,
	[LAST_MAJOR_CHANGE_VERSION_ID] [float] NULL ,
	[LIVE_MAJOR_CHANGE_VERSION_ID] [float] NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL ,
	[CREATED_FROM_BRANCH_ID] [float] NULL ,
	[CREATED_FROM_LANG_ID] [float] NULL ,
	[CREATED_FROM_VERSION_ID] [float] NULL 
) 


CREATE TABLE [dbo].[DOCUMENT_VERSIONS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (255)  NULL ,
	[CREATED_ON] [datetime] NULL ,
	[CREATED_BY] [float] NULL ,
	[STATE] [varchar] (1)  NULL ,
	[SYNCED_WITH_LANG_ID] [float] NULL ,
	[SYNCED_WITH_VERSION_ID] [float] NULL ,
	[SYNCED_WITH_SEARCH] [varchar] (100)  NULL ,
	[CHANGE_TYPE] [varchar] (1)  NULL ,
	[CHANGE_COMMENT] [text]  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[TOTAL_SIZE_OF_PARTS] [float] NULL 
) 


CREATE TABLE [dbo].[EMAILNTFY_SUBSCRIPTIONS] (
	[USER_ID] [float] NOT NULL ,
	[DOCUMENT_EVENTS] [varchar] (1)  NULL ,
	[SCHEMA_EVENTS] [varchar] (1)  NULL ,
	[USER_EVENTS] [varchar] (1)  NULL ,
	[COLLECTION_EVENTS] [varchar] (1)  NULL ,
	[ACL_EVENTS] [varchar] (1)  NULL ,
	[COMMENT_EVENTS] [varchar] (1)  NULL ,
	[LOCALE] [varchar] (20)  NULL 
) 


CREATE TABLE [dbo].[EMAIL_QUEUE] (
	[FROM_ADDRESS] [varchar] (255)  NULL ,
	[TO_ADDRESS] [varchar] (255)  NULL ,
	[SUBJECT] [varchar] (255)  NULL ,
	[MESSAGE] [text]  NULL ,
	[RETRY_COUNT] [float] NULL ,
	[LAST_TRY_TIME] [datetime] NULL ,
	[CREATED] [datetime] NULL ,
	[ID] [float] NOT NULL ,
	[ERROR] [varchar] (255)  NULL 
) 


CREATE TABLE [dbo].[EVENTS] (
	[SEQNR] [float] NOT NULL ,
	[MESSAGE_TYPE] [varchar] (50)  NULL ,
	[MESSAGE] [text]  NULL 
) 


CREATE TABLE [dbo].[EVENT_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDEVENT_SEQUENCE] ON [dbo].[EVENT_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[EXTRACTED_LINKS] (
	[SOURCE_DOC_ID] [float] NULL ,
	[SOURCE_NS_ID] [float] NULL ,
	[SOURCE_BRANCH_ID] [float] NULL ,
	[SOURCE_LANG_ID] [float] NULL ,
	[SOURCE_PARTTYPE_ID] [float] NULL ,
	[TARGET_DOC_ID] [float] NULL ,
	[TARGET_NS_ID] [float] NULL ,
	[TARGET_BRANCH_ID] [float] NULL ,
	[TARGET_LANG_ID] [float] NULL ,
	[TARGET_VERSION_ID] [float] NULL ,
	[LINKTYPE] [varchar] (1)  NULL ,
	[IN_LAST_VERSION] [varchar] (1)  NULL ,
	[IN_LIVE_VERSION] [varchar] (1)  NULL 
) 


CREATE TABLE [dbo].[FIELDTYPE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDFIELDTYPE_SEQUENCE] ON [dbo].[FIELDTYPE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[FIELD_TYPES] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[LABEL_ID] [float] NULL ,
	[DESCRIPTION_ID] [float] NULL ,
	[SIZE] [float] NULL ,
	[VALUETYPE] [float] NULL ,
	[DEPRECATED] [varchar] (1)  NULL ,
	[ACL_ALLOWED] [varchar] (1)  NULL ,
	[MULTIVALUE] [varchar] (1)  NULL ,
	[HIERARCHICAL] [varchar] (1)  NULL ,
	[SELECTIONLIST_TYPE] [varchar] (1)  NULL ,
	[SELECTLIST_FREE_ENTRY] [varchar] (1)  NULL ,
	[SELECTLIST_LOAD_ASYNC] [varchar] (1)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[HIERQUERYSELLIST] (
	[FIELDTYPE_ID] [float] NULL ,
	[WHERECLAUSE] [text]  NULL ,
	[FILTERVARIANTS] [varchar] (1)  NULL 
) 


CREATE TABLE [dbo].[HIERQUERYSELLIST_FIELDS] (
	[FIELDTYPE_ID] [float] NULL ,
	[SEQUENCENR] [float] NULL ,
	[FIELDNAME] [varchar] (50)  NULL 
) 


CREATE TABLE [dbo].[LANGUAGES] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[DESCRIPTION] [varchar] (255)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[LANGUAGE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDLANGUAGE_SEQUENCE] ON [dbo].[LANGUAGE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[LINKQUERYSELLIST] (
	[FIELDTYPE_ID] [float] NULL ,
	[WHERECLAUSE] [text]  NULL ,
	[FILTERVARIANTS] [varchar] (1)  NULL 
) 


CREATE TABLE [dbo].[LINKS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[VERSION_ID] [float] NOT NULL ,
	[ID] [float] NOT NULL ,
	[TITLE] [text]  NULL ,
	[TARGET] [text]  NULL 
) 


CREATE TABLE [dbo].[LOCALIZEDSTRING_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDLOCALIZEDSTRING_SEQUENCE] ON [dbo].[LOCALIZEDSTRING_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[LOCALIZED_STRINGS] (
	[ID] [float] NOT NULL ,
	[LOCALE] [varchar] (20)  NOT NULL ,
	[VALUE] [varchar] (255)  NULL 
) 


CREATE TABLE [dbo].[LOCKS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[USER_ID] [float] NULL ,
	[LOCKTYPE] [varchar] (1)  NULL ,
	[TIME_ACQUIRED] [datetime] NULL ,
	[DURATION] [float] NULL ,
	[TIME_EXPIRES] [datetime] NULL 
) 


CREATE TABLE [dbo].[NAMESPACE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDNAMESPACE_SEQUENCE] ON [dbo].[NAMESPACE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[PARENTLINKEDSELLIST] (
	[FIELDTYPE_ID] [float] NULL ,
	[WHERECLAUSE] [text]  NULL ,
	[FILTERVARIANTS] [varchar] (1)  NULL ,
	[LINKFIELD] [varchar] (50)  NULL 
) 


CREATE TABLE [dbo].[PARTS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[VERSION_ID] [float] NOT NULL ,
	[PARTTYPE_ID] [float] NOT NULL ,
	[BLOB_ID] [varchar] (255)  NULL ,
	[MIMETYPE] [varchar] (255)  NULL ,
	[FILENAME] [varchar] (255)  NULL ,
	[BLOB_SIZE] [float] NULL ,
	[CHANGED_IN_VERSION] [float] NULL 
) 


CREATE TABLE [dbo].[PARTTYPE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDPARTTYPE_SEQUENCE] ON [dbo].[PARTTYPE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[PART_TYPES] (
	[PART_ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[LABEL_ID] [float] NULL ,
	[DESCRIPTION_ID] [float] NULL ,
	[MIMETYPE] [varchar] (100)  NULL ,
	[DAISY_HTML] [varchar] (1)  NULL ,
	[LINKEXTRACTOR] [varchar] (50)  NULL ,
	[DEPRECATED] [varchar] (1)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[QUERYSELLIST] (
	[FIELDTYPE_ID] [float] NULL ,
	[QUERY] [text]  NULL ,
	[FILTERVARIANTS] [varchar] (1)  NULL ,
	[SORT_ORDER] [varchar] (1)  NULL 
) 


CREATE TABLE [dbo].[ROLES] (
	[ID] [float] NOT NULL ,
	[NAME] [varchar] (50)  NULL ,
	[DESCRIPTION] [varchar] (100)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[ROLE_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDROLE_SEQUENCE] ON [dbo].[ROLE_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[SELECTIONLIST_DATA] (
	[FIELDTYPE_ID] [float] NULL ,
	[SEQUENCENR] [float] NULL ,
	[DEPTH] [float] NULL ,
	[STRINGVALUE] [varchar] (255)  NULL ,
	[DATEVALUE] [datetime] NULL ,
	[DATETIMEVALUE] [datetime] NULL ,
	[INTEGERVALUE] [float] NULL ,
	[FLOATVALUE] [float] NULL ,
	[DECIMALVALUE] [float] NULL ,
	[BOOLEANVALUE] [varchar] (1)  NULL ,
	[LINK_DOCID] [float] NULL ,
	[LINK_NSID] [float] NULL ,
	[LINK_BRANCHID] [float] NULL ,
	[LINK_LANGID] [float] NULL ,
	[LABEL_ID] [float] NULL 
) 


CREATE TABLE [dbo].[SUMMARIES] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[SUMMARY] [text]  NULL 
) 


CREATE TABLE [dbo].[TASK_DOC_DETAILS] (
	[TASK_ID] [float] NOT NULL ,
	[DOC_ID] [varchar] (255)  NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[SEQNR] [float] NULL ,
	[STATE] [varchar] (1)  NULL ,
	[DETAILS] [text]  NULL 
) 


CREATE TABLE [dbo].[TASK_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDTASK_SEQUENCE] ON [dbo].[TASK_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[THEFIELDS] (
	[DOC_ID] [float] NOT NULL ,
	[NS_ID] [float] NOT NULL ,
	[BRANCH_ID] [float] NOT NULL ,
	[LANG_ID] [float] NOT NULL ,
	[VERSION_ID] [float] NOT NULL ,
	[FIELDTYPE_ID] [float] NOT NULL ,
	[VALUE_SEQ] [float] NOT NULL ,
	[HIER_SEQ] [float] NOT NULL ,
	[VALUE_COUNT] [float] NULL ,
	[HIER_COUNT] [float] NULL ,
	[STRINGVALUE] [varchar] (255)  NULL ,
	[DATEVALUE] [datetime] NULL ,
	[DATETIMEVALUE] [datetime] NULL ,
	[INTEGERVALUE] [float] NULL ,
	[FLOATVALUE] [float] NULL ,
	[DECIMALVALUE] [float] NULL ,
	[BOOLEANVALUE] [varchar] (1)  NULL ,
	[LINK_DOCID] [float] NULL ,
	[LINK_NSID] [float] NULL ,
	[LINK_SEARCHDOCID] [varchar] (50)  NULL ,
	[LINK_BRANCHID] [float] NULL ,
	[LINK_SEARCHBRANCHID] [float] NULL ,
	[LINK_LANGID] [float] NULL ,
	[LINK_SEARCHLANGID] [float] NULL ,
	[LINK_SEARCH] [varchar] (100)  NULL 
) 


CREATE TABLE [dbo].[USERS] (
	[ID] [float] NOT NULL ,
	[LOGIN] [varchar] (50)  NULL ,
	[PASSWORD] [varchar] (50)  NULL ,
	[DEFAULT_ROLE] [float] NULL ,
	[FIRST_NAME] [varchar] (50)  NULL ,
	[LAST_NAME] [varchar] (50)  NULL ,
	[EMAIL] [varchar] (100)  NULL ,
	[UPDATEABLE_BY_USER] [varchar] (1)  NULL ,
	[CONFIRMED] [varchar] (1)  NULL ,
	[CONFIRMKEY] [varchar] (50)  NULL ,
	[AUTH_SCHEME] [varchar] (50)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[USER_ROLES] (
	[USER_ID] [float] NOT NULL ,
	[ROLE_ID] [float] NOT NULL 
) 


CREATE TABLE [dbo].[USER_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDUSER_SEQUENCE] ON [dbo].[USER_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[WFPOOL_SEQUENCE] (
	[MAXID] [float] NULL 
) 
CREATE  UNIQUE NONCLUSTERED INDEX [IDX_NS_IDWFPOOL_SEQUENCE] ON [dbo].[WFPOOL_SEQUENCE]([MAXID])

CREATE TABLE [dbo].[WF_POOLS] (
	[ID] [float] NOT NULL ,
	[NAME_] [varchar] (100)  NULL ,
	[DESCRIPTION] [varchar] (255)  NULL ,
	[LAST_MODIFIED] [datetime] NULL ,
	[LAST_MODIFIER] [float] NULL ,
	[UPDATECOUNT] [float] NULL 
) 


CREATE TABLE [dbo].[WF_POOL_MEMBERS] (
	[POOL_ID] [float] NOT NULL ,
	[USER_ID] [float] NOT NULL ,
	[ADDED] [datetime] NULL ,
	[ADDER] [float] NULL 
) 


ALTER TABLE [dbo].[ACLS] ADD 
	CONSTRAINT [PK_ACLS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[ACL_ENTRIES] ADD 
	CONSTRAINT [PK_ACL_ENTRIES] PRIMARY KEY  CLUSTERED 
	(
		[ACL_ID],
		[ACL_OBJECT_ID],
		[ID]
	)   


ALTER TABLE [dbo].[ACL_OBJECTS] ADD 
	CONSTRAINT [PK_ACL_OBJECTS] PRIMARY KEY  CLUSTERED 
	(
		[ACL_ID],
		[ID]
	)   


ALTER TABLE [dbo].[BRANCHES] ADD 
	CONSTRAINT [PK_BRANCHES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[COLLECTIONS] ADD 
	CONSTRAINT [PK_COLLECTIONS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[COLLECTION_SUBSCRIPTIONS] ADD 
	CONSTRAINT [PK_COLLECTION_SUBSCRIPTIONS] PRIMARY KEY  CLUSTERED 
	(
		[USER_ID],
		[COLLECTION_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[COMMENTS] ADD 
	CONSTRAINT [PK_COMMENTS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[CUSTOMFIELDS] ADD 
	CONSTRAINT [PK_CUSTOMFIELDS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[NAME]
	)   


ALTER TABLE [dbo].[DAISY_NAMESPACES] ADD 
	CONSTRAINT [PK_DAISY_NAMESPACES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[DAISY_SYSTEM] ADD 
	CONSTRAINT [PK_DAISY_SYSTEM] PRIMARY KEY  CLUSTERED 
	(
		[PROPNAME]
	)   


ALTER TABLE [dbo].[DOCTYPES_FIELDTYPES] ADD 
	CONSTRAINT [PK_DOCTYPES_FIELDTYPES] PRIMARY KEY  CLUSTERED 
	(
		[DOCTYPE_ID],
		[FIELD_ID]
	)   


ALTER TABLE [dbo].[DOCTYPE_CONTENTMODEL] ADD 
	CONSTRAINT [PK_DOCTYPE_CONTENTMODEL] PRIMARY KEY  CLUSTERED 
	(
		[DOCTYPE_ID],
		[PART_ID]
	)   


ALTER TABLE [dbo].[DOCUMENTS] ADD 
	CONSTRAINT [PK_DOCUMENTS] PRIMARY KEY  CLUSTERED 
	(
		[ID],
		[NS_ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_COLLECTIONS] ADD 
	CONSTRAINT [PK_DOCUMENT_COLLECTIONS] PRIMARY KEY  CLUSTERED 
	(
		[DOCUMENT_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[COLLECTION_ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_SUBSCRIPTIONS] ADD 
	CONSTRAINT [PK_DOCUMENT_SUBSCRIPTIONS] PRIMARY KEY  CLUSTERED 
	(
		[USER_ID],
		[DOC_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_TASKS] ADD 
	CONSTRAINT [PK_DOCUMENT_TASKS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_TYPES] ADD 
	CONSTRAINT [PK_DOCUMENT_TYPES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_VARIANTS] ADD 
	CONSTRAINT [PK_DOCUMENT_VARIANTS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[DOCUMENT_VERSIONS] ADD 
	CONSTRAINT [PK_DOCUMENT_VERSIONS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[ID]
	)   


ALTER TABLE [dbo].[EMAILNTFY_SUBSCRIPTIONS] ADD 
	CONSTRAINT [PK_EMAILNTFY_SUBSCRIPTIONS] PRIMARY KEY  CLUSTERED 
	(
		[USER_ID]
	)   


ALTER TABLE [dbo].[EMAIL_QUEUE] ADD 
	CONSTRAINT [PK_EMAIL_QUEUE] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[EVENTS] ADD 
	CONSTRAINT [PK_EVENTS] PRIMARY KEY  CLUSTERED 
	(
		[SEQNR]
	)   


ALTER TABLE [dbo].[FIELD_TYPES] ADD 
	CONSTRAINT [PK_FIELD_TYPES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[LANGUAGES] ADD 
	CONSTRAINT [PK_LANGUAGES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[LINKS] ADD 
	CONSTRAINT [PK_LINKS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[VERSION_ID],
		[ID]
	)   


ALTER TABLE [dbo].[LOCALIZED_STRINGS] ADD 
	CONSTRAINT [PK_LOCALIZED_STRINGS] PRIMARY KEY  CLUSTERED 
	(
		[ID],
		[LOCALE]
	)   


ALTER TABLE [dbo].[LOCKS] ADD 
	CONSTRAINT [PK_LOCKS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[PARTS] ADD 
	CONSTRAINT [PK_PARTS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[VERSION_ID],
		[PARTTYPE_ID]
	)   


ALTER TABLE [dbo].[PART_TYPES] ADD 
	CONSTRAINT [PK_PART_TYPES] PRIMARY KEY  CLUSTERED 
	(
		[PART_ID]
	)   


ALTER TABLE [dbo].[ROLES] ADD 
	CONSTRAINT [PK_ROLES] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[SUMMARIES] ADD 
	CONSTRAINT [PK_SUMMARIES] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[TASK_DOC_DETAILS] ADD 
	CONSTRAINT [PK_TASK_DOC_DETAILS] PRIMARY KEY  CLUSTERED 
	(
		[TASK_ID],
		[DOC_ID],
		[BRANCH_ID],
		[LANG_ID]
	)   


ALTER TABLE [dbo].[THEFIELDS] ADD 
	CONSTRAINT [PK_THEFIELDS] PRIMARY KEY  CLUSTERED 
	(
		[DOC_ID],
		[NS_ID],
		[BRANCH_ID],
		[LANG_ID],
		[VERSION_ID],
		[FIELDTYPE_ID],
		[VALUE_SEQ],
		[HIER_SEQ]
	)   


ALTER TABLE [dbo].[USERS] ADD 
	CONSTRAINT [PK_USERS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[USER_ROLES] ADD 
	CONSTRAINT [PK_USER_ROLES] PRIMARY KEY  CLUSTERED 
	(
		[USER_ID],
		[ROLE_ID]
	)   


ALTER TABLE [dbo].[WF_POOLS] ADD 
	CONSTRAINT [PK_WF_POOLS] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)   


ALTER TABLE [dbo].[WF_POOL_MEMBERS] ADD 
	CONSTRAINT [PK_WF_POOL_MEMBERS] PRIMARY KEY  CLUSTERED 
	(
		[POOL_ID],
		[USER_ID]
	)   

 CREATE NONCLUSTERED INDEX [ACTIVEMQ_MSGS_MIDX] on [dbo].[ACTIVEMQ_MSGS]([MSGID_PROD], [MSGID_SEQ])

 CREATE NONCLUSTERED INDEX [ACTIVEMQ_MSGS_CIDX] on [dbo].[ACTIVEMQ_MSGS]([CONTAINER])

 CREATE NONCLUSTERED INDEX [ACTIVEMQ_MSGS_EIDX] on [dbo].[ACTIVEMQ_MSGS]([EXPIRATION])
	
 CREATE  INDEX [IDX_LAST_MODIFIERACLS] ON [dbo].[ACLS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_ACL_ACCESSDETAIL_I_1ACL_AC] ON [dbo].[ACL_ACCESSDETAIL]([ACL_ID], [ACL_OBJECT_ID], [ACL_ENTRY_ID]) 


 CREATE  INDEX [IDX_ACL_ENTRIES_I_1ACL_ENTRIES] ON [dbo].[ACL_ENTRIES]([SUBJECT_USER_ID]) 


 CREATE  INDEX [IDX_ACL_ENTRIES_I_2ACL_ENTRIES] ON [dbo].[ACL_ENTRIES]([SUBJECT_ROLE_ID]) 


 CREATE  INDEX [IDX_BRANCHES_I_1BRANCHES] ON [dbo].[BRANCHES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMEBRANCHES] ON [dbo].[BRANCHES]([NAME]) 


 CREATE  INDEX [IDX_LAST_MODIFIERCOLLECTIONS] ON [dbo].[COLLECTIONS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMECOLLECTIONS] ON [dbo].[COLLECTIONS]([NAME]) 


 CREATE  INDEX [IDX_COLLECTION_SUBSCRIPTIONS_I] ON [dbo].[COLLECTION_SUBSCRIPTIONS]([COLLECTION_ID]) 


 CREATE  INDEX [IDX_COMMENTS_I_1COMMENTS] ON [dbo].[COMMENTS]([DOC_ID]) 


 CREATE  INDEX [IDX_COMMENTS_I_2COMMENTS] ON [dbo].[COMMENTS]([CREATED_BY]) 


 CREATE  INDEX [IDX_FINGERPRINTDAISY_NAMESPACE] ON [dbo].[DAISY_NAMESPACES]([FINGERPRINT]) 


 CREATE  INDEX [IDX_NAME_DAISY_NAMESPACES] ON [dbo].[DAISY_NAMESPACES]([NAME_]) 


 CREATE  INDEX [IDX_REGISTERED_BYDAISY_NAMESPA] ON [dbo].[DAISY_NAMESPACES]([REGISTERED_BY]) 


 CREATE  INDEX [IDX_DOCTYPES_FIELDTYPES_I_1DOC] ON [dbo].[DOCTYPES_FIELDTYPES]([FIELD_ID]) 


 CREATE  INDEX [IDX_DOCTYPE_CONTENTMODEL_I_1DO] ON [dbo].[DOCTYPE_CONTENTMODEL]([PART_ID]) 


 CREATE  INDEX [IDX_DOCUMENTS_I_1DOCUMENTS] ON [dbo].[DOCUMENTS]([ID_SEARCH]) 


 CREATE  INDEX [IDX_DOCUMENTS_I_2DOCUMENTS] ON [dbo].[DOCUMENTS]([OWNER]) 


 CREATE  INDEX [IDX_DOCUMENTS_I_3DOCUMENTS] ON [dbo].[DOCUMENTS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NS_IDDOCUMENTS] ON [dbo].[DOCUMENTS]([NS_ID]) 


 CREATE  INDEX [IDX_REFERENCE_LANG_IDDOCUMENTS] ON [dbo].[DOCUMENTS]([REFERENCE_LANG_ID]) 


 CREATE  INDEX [IDX_COLLECTION_IDDOCUMENT_COLL] ON [dbo].[DOCUMENT_COLLECTIONS]([COLLECTION_ID]) 
 

 CREATE  INDEX [IDX_DOCUMENT_SUBSCRIPTIONS_I_1] ON [dbo].[DOCUMENT_SUBSCRIPTIONS]([DOC_ID]) 


 CREATE  INDEX [IDX_DOCUMENT_TASKS_I_1DOCUMENT] ON [dbo].[DOCUMENT_TASKS]([STARTED_AT]) 


 CREATE  INDEX [IDX_DOCUMENT_TASKS_I_2DOCUMENT] ON [dbo].[DOCUMENT_TASKS]([OWNER]) 


 CREATE  INDEX [IDX_DOCUMENT_TASKS_I_3DOCUMENT] ON [dbo].[DOCUMENT_TASKS]([STATE]) 


 CREATE  INDEX [IDX_LAST_MODIFIERDOCUMENT_TYPE] ON [dbo].[DOCUMENT_TYPES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMEDOCUMENT_TYPES] ON [dbo].[DOCUMENT_TYPES]([NAME]) 


 CREATE  INDEX [IDX_DOCUMENT_VARIANTS_I_1DOCUM] ON [dbo].[DOCUMENT_VARIANTS]([DOCTYPE_ID]) 


 CREATE  INDEX [IDX_DOCUMENT_VARIANTS_I_2DOCUM] ON [dbo].[DOCUMENT_VARIANTS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_DOCUMENT_VARIANTS_I_3DOCUM] ON [dbo].[DOCUMENT_VARIANTS]([BRANCH_ID]) 


 CREATE  INDEX [IDX_DOCUMENT_VARIANTS_I_4DOCUM] ON [dbo].[DOCUMENT_VARIANTS]([LANG_ID]) 


 CREATE  INDEX [IDX_DOCUMENT_VARIANTS_I_5DOCUM] ON [dbo].[DOCUMENT_VARIANTS]([LINK_SEARCH]) 


 CREATE  INDEX [IDX_VARIANT_SEARCHDOCUMENT_VAR] ON [dbo].[DOCUMENT_VARIANTS]([VARIANT_SEARCH]) 


 CREATE  INDEX [IDX_CREATED_BYDOCUMENT_VERSION] ON [dbo].[DOCUMENT_VERSIONS]([CREATED_BY]) 


 CREATE  INDEX [IDX_LAST_MODIFIERDOCUMENT_VERS] ON [dbo].[DOCUMENT_VERSIONS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_EXTRACTED_LINKS_I_1EXTRACT] ON [dbo].[EXTRACTED_LINKS]([SOURCE_DOC_ID], [SOURCE_NS_ID]) 


 CREATE  INDEX [IDX_EXTRACTED_LINKS_I_2EXTRACT] ON [dbo].[EXTRACTED_LINKS]([TARGET_DOC_ID], [TARGET_NS_ID]) 


 CREATE  INDEX [IDX_TARGET_NS_IDEXTRACTED_LINK] ON [dbo].[EXTRACTED_LINKS]([TARGET_NS_ID]) 


 CREATE  INDEX [IDX_LAST_MODIFIERFIELD_TYPES] ON [dbo].[FIELD_TYPES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMEFIELD_TYPES] ON [dbo].[FIELD_TYPES]([NAME]) 


 CREATE  INDEX [IDX_FIELDTYPE_IDHIERQUERYSELLI] ON [dbo].[HIERQUERYSELLIST]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_LANGUAGES_I_1LANGUAGES] ON [dbo].[LANGUAGES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMELANGUAGES] ON [dbo].[LANGUAGES]([NAME]) 


 CREATE  INDEX [IDX_FIELDTYPE_IDLINKQUERYSELLI] ON [dbo].[LINKQUERYSELLIST]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_LOCKS_I_1LOCKS] ON [dbo].[LOCKS]([USER_ID]) 


 CREATE  INDEX [IDX_FIELDTYPE_IDPARENTLINKEDSE] ON [dbo].[PARENTLINKEDSELLIST]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_PARTS_I_1PARTS] ON [dbo].[PARTS]([PARTTYPE_ID]) 


 CREATE  INDEX [IDX_PARTS_I_2PARTS] ON [dbo].[PARTS]([BLOB_ID]) 


 CREATE  INDEX [IDX_LAST_MODIFIERPART_TYPES] ON [dbo].[PART_TYPES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMEPART_TYPES] ON [dbo].[PART_TYPES]([NAME]) 


 CREATE  INDEX [IDX_FIELDTYPE_IDQUERYSELLIST] ON [dbo].[QUERYSELLIST]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_LAST_MODIFIERROLES] ON [dbo].[ROLES]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_NAMEROLES] ON [dbo].[ROLES]([NAME]) 


 CREATE  INDEX [IDX_FIELDTYPE_IDSELECTIONLIST_] ON [dbo].[SELECTIONLIST_DATA]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_LINK_NSIDSELECTIONLIST_DAT] ON [dbo].[SELECTIONLIST_DATA]([LINK_NSID]) 


 CREATE  INDEX [IDX_LINK_NSIDTHEFIELDS] ON [dbo].[THEFIELDS]([LINK_NSID]) 


 CREATE  INDEX [IDX_THEFIELDS_I_10THEFIELDS] ON [dbo].[THEFIELDS]([LINK_SEARCHLANGID]) 


 CREATE  INDEX [IDX_THEFIELDS_I_11THEFIELDS] ON [dbo].[THEFIELDS]([LINK_SEARCH]) 


 CREATE  INDEX [IDX_THEFIELDS_I_12THEFIELDS] ON [dbo].[THEFIELDS]([FIELDTYPE_ID]) 


 CREATE  INDEX [IDX_THEFIELDS_I_1THEFIELDS] ON [dbo].[THEFIELDS]([STRINGVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_2THEFIELDS] ON [dbo].[THEFIELDS]([DATEVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_3THEFIELDS] ON [dbo].[THEFIELDS]([DATETIMEVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_4THEFIELDS] ON [dbo].[THEFIELDS]([INTEGERVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_5THEFIELDS] ON [dbo].[THEFIELDS]([FLOATVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_6THEFIELDS] ON [dbo].[THEFIELDS]([DECIMALVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_7THEFIELDS] ON [dbo].[THEFIELDS]([BOOLEANVALUE]) 


 CREATE  INDEX [IDX_THEFIELDS_I_8THEFIELDS] ON [dbo].[THEFIELDS]([LINK_SEARCHDOCID]) 


 CREATE  INDEX [IDX_THEFIELDS_I_9THEFIELDS] ON [dbo].[THEFIELDS]([LINK_SEARCHBRANCHID]) 


 CREATE  INDEX [IDX_LAST_MODIFIERUSERS] ON [dbo].[USERS]([LAST_MODIFIER]) 


 CREATE  INDEX [IDX_LOGINUSERS] ON [dbo].[USERS]([LOGIN]) 


 CREATE  INDEX [IDX_ROLE_IDUSER_ROLES] ON [dbo].[USER_ROLES]([ROLE_ID]) 


 CREATE  INDEX [IDX_NAME_WF_POOLS] ON [dbo].[WF_POOLS]([NAME_]) 


 CREATE  INDEX [IDX_WF_POOL_MEMBERS_I_1WF_POOL] ON [dbo].[WF_POOL_MEMBERS]([USER_ID]) 
