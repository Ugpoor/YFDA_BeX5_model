SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Records
-- ----------------------------
insert into `ASYNCSERVERS` (`SERVERTYPE`, `IPADDRESS`, `SERVERNAME`, `SERVERPATH`, `SERVERURL`)
values ('master', 'ipAddress', 'serverName', 'serverPath', 'serverUrl');
INSERT INTO `branches` VALUES ('1', 'main', null, '2010-02-06 17:21:44', '1', '1');
INSERT INTO `daisy_system` VALUES ('schema_version', '2.3');
INSERT INTO `language_sequence` VALUES ('1');
INSERT INTO `languages` VALUES ('1', 'default', null, '2010-02-06 17:21:44', '1', '1');
INSERT INTO `role_sequence` VALUES ('100');
INSERT INTO `roles` VALUES ('1', 'Administrator', null, '2010-02-06 17:21:44', '1', '1');
INSERT INTO `roles` VALUES ('2', 'User', null, '2010-02-06 17:21:44', '1', '1');
INSERT INTO `user_roles` VALUES ('1', '1');
INSERT INTO `user_roles` VALUES ('2', '1');
INSERT INTO `user_roles` VALUES ('3', '1');
INSERT INTO `user_roles` VALUES ('4', '1');
INSERT INTO `user_roles` VALUES ('3', '2');
INSERT INTO `user_sequence` VALUES ('100');
INSERT INTO `users` VALUES ('1', '$system', 'does_not_matter', '1', null, null, null, '1', '1', null, 'daisy', '2010-02-06 17:21:44', '1', '1');
INSERT INTO `users` VALUES ('2', 'internal', 'd7acf61ee6e5a519c74bc01deb8db56153683268', '1', null, null, null, '1', '1', null, 'daisy', '2010-02-06 17:21:44', '1', '1');
INSERT INTO `users` VALUES ('3', 'doc', 'f7f029ecb98abe979074a3ab45b74dbd9af02d42', '2', null, null, null, '1', '1', null, 'daisy', '2010-02-06 17:21:44', '1', '1');
INSERT INTO `users` VALUES ('4', 'workflow', 'b7709cde4e56da33ea6a7c6e958432e6e5251134', '1', null, null, null, '1', '1', null, 'daisy', '2010-02-06 17:21:44', '1', '1');
INSERT INTO `branch_sequence` VALUES ('1');
