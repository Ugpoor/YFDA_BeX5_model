--文档服务器系统表初始化
set client_min_messages='ERROR';

insert into ASYNCSERVERS (SERVERTYPE, IPADDRESS, SERVERNAME, SERVERPATH, SERVERURL)
values ('master', 'ipAddress', 'serverName', 'serverPath', 'serverUrl');


insert into BRANCHES (ID, NAME, DESCRIPTION, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (1, 'main', null, to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);


insert into BRANCH_SEQUENCE (MAXID)
values (1);


insert into DAISY_SYSTEM (PROPNAME, PROPVALUE)
values ('schema_version', '2.3');


insert into LANGUAGES (ID, NAME, DESCRIPTION, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (1, 'default', null, to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);


insert into LANGUAGE_SEQUENCE (MAXID)
values (1);


insert into ROLES (ID, NAME, DESCRIPTION, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (1, 'Administrator', null, to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into ROLES (ID, NAME, DESCRIPTION, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (2, 'User', null, to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);


insert into ROLE_SEQUENCE (MAXID)
values (100);


insert into USERS (ID, LOGIN, PASSWORD, DEFAULT_ROLE, FIRST_NAME, LAST_NAME, EMAIL, UPDATEABLE_BY_USER, CONFIRMED, CONFIRMKEY, AUTH_SCHEME, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (1, '$system', 'does_not_matter', 1, null, null, null, '1', '1', null, 'daisy', to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into USERS (ID, LOGIN, PASSWORD, DEFAULT_ROLE, FIRST_NAME, LAST_NAME, EMAIL, UPDATEABLE_BY_USER, CONFIRMED, CONFIRMKEY, AUTH_SCHEME, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (2, 'internal', 'd7acf61ee6e5a519c74bc01deb8db56153683268', 1, null, null, null, '1', '1', null, 'daisy', to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into USERS (ID, LOGIN, PASSWORD, DEFAULT_ROLE, FIRST_NAME, LAST_NAME, EMAIL, UPDATEABLE_BY_USER, CONFIRMED, CONFIRMKEY, AUTH_SCHEME, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (3, 'doc', 'f7f029ecb98abe979074a3ab45b74dbd9af02d42', 2, null, null, null, '1', '1', null, 'daisy', to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into USERS (ID, LOGIN, PASSWORD, DEFAULT_ROLE, FIRST_NAME, LAST_NAME, EMAIL, UPDATEABLE_BY_USER, CONFIRMED, CONFIRMKEY, AUTH_SCHEME, LAST_MODIFIED, LAST_MODIFIER, UPDATECOUNT)
values (4, 'workflow', 'b7709cde4e56da33ea6a7c6e958432e6e5251134', 1, null, null, null, '1', '1', null, 'daisy', to_date('06-02-2010 17:21:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);


insert into USER_ROLES (USER_ID, ROLE_ID)
values (1, 1);
insert into USER_ROLES (USER_ID, ROLE_ID)
values (2, 1);
insert into USER_ROLES (USER_ID, ROLE_ID)
values (3, 1);
insert into USER_ROLES (USER_ID, ROLE_ID)
values (3, 2);
insert into USER_ROLES (USER_ID, ROLE_ID)
values (4, 1);


insert into USER_SEQUENCE (MAXID)
values (100);



set client_min_messages='NOTICE';