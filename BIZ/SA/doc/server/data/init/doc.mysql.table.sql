SET FOREIGN_KEY_CHECKS=0;

DROP TABLE `branches`
DROP TABLE `asyncservers`
DROP TABLE `acl_accessdetail`
DROP TABLE `acl_entries`
DROP TABLE `acl_objects`
DROP TABLE `acls`
DROP TABLE `branch_sequence`
DROP TABLE `collection_sequence`
DROP TABLE `collection_subscriptions`
DROP TABLE `collections`
DROP TABLE `comment_sequence`
DROP TABLE `comments`
DROP TABLE `customfields`
DROP TABLE `daisy_namespaces`
DROP TABLE `daisy_system`
DROP TABLE `doctype_contentmodel`
DROP TABLE `doctypes_fieldtypes`
DROP TABLE `document_collections`
DROP TABLE `event_sequence`
DROP TABLE `document_sequence`
DROP TABLE `document_subscriptions`
DROP TABLE `document_tasks`
DROP TABLE `document_types`
DROP TABLE `document_variants`
DROP TABLE `document_versions`
DROP TABLE `documents`
DROP TABLE `documenttype_sequence`
DROP TABLE `email_queue`
DROP TABLE `emailntfy_subscriptions`
DROP TABLE `events`
DROP TABLE `extracted_links`
DROP TABLE `field_types`
DROP TABLE `fieldtype_sequence`
DROP TABLE `hierquerysellist`
DROP TABLE `hierquerysellist_fields`
DROP TABLE `language_sequence`
DROP TABLE `languages`
DROP TABLE `linkquerysellist`
DROP TABLE `links`
DROP TABLE `localized_strings`
DROP TABLE `localizedstring_sequence`
DROP TABLE `locks`
DROP TABLE `namespace_sequence`
DROP TABLE `parentlinkedsellist`
DROP TABLE `part_types`
DROP TABLE `parts`
DROP TABLE `parttype_sequence`
DROP TABLE `querysellist`
DROP TABLE `role_sequence`
DROP TABLE `roles`
DROP TABLE `selectionlist_data`
DROP TABLE `summaries`
DROP TABLE `task_doc_details`
DROP TABLE `task_sequence`
DROP TABLE `thefields`
DROP TABLE `user_roles`
DROP TABLE `user_sequence`
DROP TABLE `users`
DROP TABLE `wf_pool_members`
DROP TABLE `wf_pools`
DROP TABLE `wfpool_sequence`
-- ----------------------------
-- Table structure for `asyncservers`
-- ----------------------------
CREATE TABLE `asyncservers` (
  `SERVERTYPE` varchar(50) NOT NULL,
  `IPADDRESS` varchar(50) NOT NULL,
  `SERVERNAME` varchar(200) NOT NULL,
  `SERVERPATH` varchar(500) NOT NULL,
  `SERVERURL` varchar(200) default NULL,
  `LASTSYNCTIME` bigint(20) default NULL
);

-- ----------------------------
-- Table structure for `acl_accessdetail`
-- ----------------------------
CREATE TABLE `acl_accessdetail` (
  `acl_id` bigint(20) NOT NULL,
  `acl_object_id` bigint(20) NOT NULL,
  `acl_entry_id` bigint(20) NOT NULL,
  `acl_permission` char(1) NOT NULL,
  `ad_type` varchar(20) NOT NULL,
  `ad_data` varchar(255) default NULL,
  KEY `acl_accessdetail_I_1` (`acl_id`,`acl_object_id`,`acl_entry_id`)
);

-- ----------------------------
-- Records of acl_accessdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_entries`
-- ----------------------------
CREATE TABLE `acl_entries` (
  `acl_id` bigint(20) NOT NULL,
  `acl_object_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `subject_user_id` bigint(20) default NULL,
  `subject_role_id` bigint(20) default NULL,
  `subject_type` char(1) NOT NULL,
  `perm_read` char(1) NOT NULL,
  `perm_write` char(1) NOT NULL,
  `perm_publish` char(1) NOT NULL,
  `perm_delete` char(1) NOT NULL,
  `read_detail` char(1) NOT NULL,
  `write_detail` char(1) NOT NULL,
  PRIMARY KEY  (`acl_id`,`acl_object_id`,`id`),
  KEY `acl_entries_I_1` (`subject_user_id`),
  KEY `acl_entries_I_2` (`subject_role_id`),
  CONSTRAINT `acl_entries_ibfk_1` FOREIGN KEY (`subject_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `acl_entries_ibfk_2` FOREIGN KEY (`subject_role_id`) REFERENCES `roles` (`id`)
) ;

-- ----------------------------
-- Records of acl_entries
-- ----------------------------

-- ----------------------------
-- Table structure for `acl_objects`
-- ----------------------------
CREATE TABLE `acl_objects` (
  `acl_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `objectspec` longtext NOT NULL,
  PRIMARY KEY  (`acl_id`,`id`)
) ;

-- ----------------------------
-- Records of acl_objects
-- ----------------------------

-- ----------------------------
-- Table structure for `acls`
-- ----------------------------
CREATE TABLE `acls` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `acls_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of acls
-- ----------------------------

-- ----------------------------
-- Table structure for `branch_sequence`
-- ----------------------------
CREATE TABLE `branch_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of branch_sequence
-- ----------------------------


-- ----------------------------
-- Table structure for `branches`
-- ----------------------------
CREATE TABLE `branches` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `branches_I_1` (`last_modifier`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Table structure for `collection_sequence`
-- ----------------------------
CREATE TABLE `collection_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of collection_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `collection_subscriptions`
-- ----------------------------
CREATE TABLE `collection_subscriptions` (
  `user_id` bigint(20) NOT NULL,
  `collection_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`collection_id`,`branch_id`,`lang_id`),
  KEY `collection_subscriptions_I_1` (`collection_id`),
  CONSTRAINT `collection_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `emailntfy_subscriptions` (`user_id`)
) ;

-- ----------------------------
-- Records of collection_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `collections`
-- ----------------------------
CREATE TABLE `collections` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of collections
-- ----------------------------

-- ----------------------------
-- Table structure for `comment_sequence`
-- ----------------------------
CREATE TABLE `comment_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of comment_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_on` datetime NOT NULL,
  `visibility` char(1) NOT NULL,
  `comment_text` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `comments_I_1` (`doc_id`),
  KEY `comments_I_2` (`created_by`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `customfields`
-- ----------------------------
CREATE TABLE `customfields` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`,`name`)
) ;

-- ----------------------------
-- Records of customfields
-- ----------------------------

-- ----------------------------
-- Table structure for `daisy_namespaces`
-- ----------------------------
CREATE TABLE `daisy_namespaces` (
  `id` bigint(20) NOT NULL,
  `name_` varchar(200) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `registered_by` bigint(20) NOT NULL,
  `registered_on` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name_` (`name_`),
  UNIQUE KEY `fingerprint` (`fingerprint`),
  KEY `registered_by` (`registered_by`),
  CONSTRAINT `daisy_namespaces_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of daisy_namespaces
-- ----------------------------

-- ----------------------------
-- Table structure for `daisy_system`
-- ----------------------------
CREATE TABLE `daisy_system` (
  `propname` varchar(100) NOT NULL,
  `propvalue` varchar(255) NOT NULL,
  PRIMARY KEY  (`propname`)
) ;

-- ----------------------------
-- Table structure for `doctype_contentmodel`
-- ----------------------------
CREATE TABLE `doctype_contentmodel` (
  `doctype_id` bigint(20) NOT NULL,
  `part_id` bigint(20) NOT NULL,
  `required` char(1) NOT NULL,
  `editable` char(1) NOT NULL,
  `sequencenr` int(11) NOT NULL,
  PRIMARY KEY  (`doctype_id`,`part_id`),
  KEY `doctype_contentmodel_I_1` (`part_id`),
  CONSTRAINT `doctype_contentmodel_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part_types` (`part_id`)
) ;

-- ----------------------------
-- Records of doctype_contentmodel
-- ----------------------------

-- ----------------------------
-- Table structure for `doctypes_fieldtypes`
-- ----------------------------
CREATE TABLE `doctypes_fieldtypes` (
  `doctype_id` bigint(20) NOT NULL,
  `field_id` bigint(20) NOT NULL,
  `required` char(1) NOT NULL,
  `editable` char(1) NOT NULL,
  `sequencenr` int(11) NOT NULL,
  PRIMARY KEY  (`doctype_id`,`field_id`),
  KEY `doctypes_fieldtypes_I_1` (`field_id`),
  CONSTRAINT `doctypes_fieldtypes_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `field_types` (`id`)
) ;

-- ----------------------------
-- Records of doctypes_fieldtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `document_collections`
-- ----------------------------
CREATE TABLE `document_collections` (
  `document_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `collection_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`document_id`,`ns_id`,`branch_id`,`lang_id`,`collection_id`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `document_collections_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ;

-- ----------------------------
-- Records of document_collections
-- ----------------------------

-- ----------------------------
-- Table structure for `document_sequence`
-- ----------------------------
CREATE TABLE `document_sequence` (
  `maxid` bigint(20) default NULL,
  `ns_id` bigint(20) default NULL,
  UNIQUE KEY `ns_id` (`ns_id`),
  CONSTRAINT `document_sequence_ibfk_1` FOREIGN KEY (`ns_id`) REFERENCES `daisy_namespaces` (`id`)
) ;

-- ----------------------------
-- Records of document_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `document_subscriptions`
-- ----------------------------
CREATE TABLE `document_subscriptions` (
  `user_id` bigint(20) NOT NULL,
  `doc_id` varchar(255) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`doc_id`,`branch_id`,`lang_id`),
  KEY `document_subscriptions_I_1` (`doc_id`),
  CONSTRAINT `document_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `emailntfy_subscriptions` (`user_id`)
) ;

-- ----------------------------
-- Records of document_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `document_tasks`
-- ----------------------------
CREATE TABLE `document_tasks` (
  `id` bigint(20) NOT NULL,
  `action_type` varchar(100) NOT NULL,
  `owner` bigint(20) NOT NULL,
  `started_at` datetime NOT NULL,
  `finished_at` datetime default NULL,
  `state` varchar(1) NOT NULL,
  `progress` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `action_parameters` longtext NOT NULL,
  `details` longtext,
  PRIMARY KEY  (`id`),
  KEY `document_tasks_I_1` (`started_at`),
  KEY `document_tasks_I_2` (`owner`),
  KEY `document_tasks_I_3` (`state`)
) ;

-- ----------------------------
-- Records of document_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for `document_types`
-- ----------------------------
CREATE TABLE `document_types` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  `description_id` bigint(20) NOT NULL,
  `deprecated` char(1) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `document_types_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of document_types
-- ----------------------------

-- ----------------------------
-- Table structure for `document_variants`
-- ----------------------------
CREATE TABLE `document_variants` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `link_search` varchar(100) NOT NULL,
  `variant_search` varchar(100) NOT NULL,
  `doctype_id` bigint(20) NOT NULL,
  `retired` char(1) NOT NULL,
  `lastversion_id` bigint(20) NOT NULL,
  `liveversion_id` bigint(20) default NULL,
  `last_major_change_version_id` bigint(20) default NULL,
  `live_major_change_version_id` bigint(20) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  `created_from_branch_id` bigint(20) default NULL,
  `created_from_lang_id` bigint(20) default NULL,
  `created_from_version_id` bigint(20) default NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`),
  KEY `document_variants_I_1` (`doctype_id`),
  KEY `document_variants_I_2` (`last_modifier`),
  KEY `document_variants_I_3` (`branch_id`),
  KEY `document_variants_I_4` (`lang_id`),
  KEY `document_variants_I_5` (`link_search`),
  KEY `variant_search` (`variant_search`),
  CONSTRAINT `document_variants_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`),
  CONSTRAINT `document_variants_ibfk_2` FOREIGN KEY (`doctype_id`) REFERENCES `document_types` (`id`),
  CONSTRAINT `document_variants_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `document_variants_ibfk_4` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`)
) ;

-- ----------------------------
-- Records of document_variants
-- ----------------------------

-- ----------------------------
-- Table structure for `document_versions`
-- ----------------------------
CREATE TABLE `document_versions` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `state` char(1) NOT NULL,
  `synced_with_lang_id` bigint(20) default NULL,
  `synced_with_version_id` bigint(20) default NULL,
  `synced_with_search` varchar(100) default NULL,
  `change_type` char(1) NOT NULL,
  `change_comment` longtext,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `total_size_of_parts` bigint(20) NOT NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`,`id`),
  KEY `last_modifier` (`last_modifier`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `document_versions_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`),
  CONSTRAINT `document_versions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of document_versions
-- ----------------------------

-- ----------------------------
-- Table structure for `documents`
-- ----------------------------
CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `id_search` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `owner` bigint(20) NOT NULL,
  `private` char(1) NOT NULL,
  `reference_lang_id` bigint(20) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`,`ns_id`),
  KEY `ns_id` (`ns_id`),
  KEY `reference_lang_id` (`reference_lang_id`),
  KEY `documents_I_1` (`id_search`),
  KEY `documents_I_2` (`owner`),
  KEY `documents_I_3` (`last_modifier`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`),
  CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `documents_ibfk_3` FOREIGN KEY (`ns_id`) REFERENCES `daisy_namespaces` (`id`),
  CONSTRAINT `documents_ibfk_4` FOREIGN KEY (`reference_lang_id`) REFERENCES `languages` (`id`)
) ;

-- ----------------------------
-- Records of documents
-- ----------------------------

-- ----------------------------
-- Table structure for `documenttype_sequence`
-- ----------------------------
CREATE TABLE `documenttype_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of documenttype_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `email_queue`
-- ----------------------------
CREATE TABLE `email_queue` (
  `from_address` varchar(255) default NULL,
  `to_address` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `retry_count` smallint(6) NOT NULL,
  `last_try_time` datetime default NULL,
  `created` datetime NOT NULL,
  `id` bigint(20) NOT NULL auto_increment,
  `error` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ;

-- ----------------------------
-- Records of email_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `emailntfy_subscriptions`
-- ----------------------------
CREATE TABLE `emailntfy_subscriptions` (
  `user_id` bigint(20) NOT NULL,
  `document_events` char(1) NOT NULL,
  `schema_events` char(1) NOT NULL,
  `user_events` char(1) NOT NULL,
  `collection_events` char(1) NOT NULL,
  `acl_events` char(1) NOT NULL,
  `comment_events` char(1) NOT NULL,
  `locale` varchar(20) default NULL,
  PRIMARY KEY  (`user_id`)
) ;

-- ----------------------------
-- Records of emailntfy_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for `event_sequence`
-- ----------------------------
CREATE TABLE `event_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of event_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
CREATE TABLE `events` (
  `seqnr` bigint(20) NOT NULL,
  `message_type` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`seqnr`)
) ;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for `extracted_links`
-- ----------------------------
CREATE TABLE `extracted_links` (
  `source_doc_id` bigint(20) NOT NULL,
  `source_ns_id` bigint(20) NOT NULL,
  `source_branch_id` bigint(20) NOT NULL,
  `source_lang_id` bigint(20) NOT NULL,
  `source_parttype_id` bigint(20) NOT NULL,
  `target_doc_id` bigint(20) NOT NULL,
  `target_ns_id` bigint(20) NOT NULL,
  `target_branch_id` bigint(20) NOT NULL,
  `target_lang_id` bigint(20) NOT NULL,
  `target_version_id` bigint(20) NOT NULL,
  `linktype` char(1) NOT NULL,
  `in_last_version` char(1) NOT NULL,
  `in_live_version` char(1) NOT NULL,
  KEY `target_ns_id` (`target_ns_id`),
  KEY `extracted_links_I_1` (`source_doc_id`,`source_ns_id`),
  KEY `extracted_links_I_2` (`target_doc_id`,`target_ns_id`),
  CONSTRAINT `extracted_links_ibfk_1` FOREIGN KEY (`target_ns_id`) REFERENCES `daisy_namespaces` (`id`)
) ;

-- ----------------------------
-- Records of extracted_links
-- ----------------------------

-- ----------------------------
-- Table structure for `field_types`
-- ----------------------------
CREATE TABLE `field_types` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  `description_id` bigint(20) NOT NULL,
  `size` int(11) NOT NULL,
  `valuetype` smallint(6) NOT NULL,
  `deprecated` char(1) NOT NULL,
  `acl_allowed` char(1) NOT NULL,
  `multivalue` char(1) NOT NULL,
  `hierarchical` char(1) NOT NULL,
  `selectionlist_type` char(1) NOT NULL,
  `selectlist_free_entry` char(1) NOT NULL,
  `selectlist_load_async` char(1) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `field_types_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of field_types
-- ----------------------------

-- ----------------------------
-- Table structure for `fieldtype_sequence`
-- ----------------------------
CREATE TABLE `fieldtype_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of fieldtype_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `hierquerysellist`
-- ----------------------------
CREATE TABLE `hierquerysellist` (
  `fieldtype_id` bigint(20) NOT NULL,
  `whereclause` longtext NOT NULL,
  `filtervariants` char(1) NOT NULL,
  UNIQUE KEY `fieldtype_id` (`fieldtype_id`),
  CONSTRAINT `hierquerysellist_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`)
) ;

-- ----------------------------
-- Records of hierquerysellist
-- ----------------------------

-- ----------------------------
-- Table structure for `hierquerysellist_fields`
-- ----------------------------
CREATE TABLE `hierquerysellist_fields` (
  `fieldtype_id` bigint(20) NOT NULL,
  `sequencenr` smallint(6) NOT NULL,
  `fieldname` varchar(50) NOT NULL,
  UNIQUE KEY `fieldtype_id` (`fieldtype_id`,`sequencenr`),
  CONSTRAINT `hierquerysellist_fields_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `hierquerysellist` (`fieldtype_id`)
) ;

-- ----------------------------
-- Records of hierquerysellist_fields
-- ----------------------------

-- ----------------------------
-- Table structure for `language_sequence`
-- ----------------------------
CREATE TABLE `language_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Table structure for `languages`
-- ----------------------------
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `languages_I_1` (`last_modifier`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Table structure for `linkquerysellist`
-- ----------------------------
CREATE TABLE `linkquerysellist` (
  `fieldtype_id` bigint(20) NOT NULL,
  `whereclause` longtext NOT NULL,
  `filtervariants` char(1) NOT NULL,
  UNIQUE KEY `fieldtype_id` (`fieldtype_id`),
  CONSTRAINT `linkquerysellist_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`)
) ;

-- ----------------------------
-- Records of linkquerysellist
-- ----------------------------

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
CREATE TABLE `links` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `target` longtext NOT NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`,`version_id`,`id`)
) ;

-- ----------------------------
-- Records of links
-- ----------------------------

-- ----------------------------
-- Table structure for `localized_strings`
-- ----------------------------
CREATE TABLE `localized_strings` (
  `id` bigint(20) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`,`locale`)
) ;

-- ----------------------------
-- Records of localized_strings
-- ----------------------------

-- ----------------------------
-- Table structure for `localizedstring_sequence`
-- ----------------------------
CREATE TABLE `localizedstring_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of localizedstring_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `locks`
-- ----------------------------
CREATE TABLE `locks` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `locktype` char(1) NOT NULL,
  `time_acquired` datetime NOT NULL,
  `duration` bigint(20) NOT NULL,
  `time_expires` datetime default NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`),
  KEY `locks_I_1` (`user_id`),
  CONSTRAINT `locks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of locks
-- ----------------------------

-- ----------------------------
-- Table structure for `namespace_sequence`
-- ----------------------------
CREATE TABLE `namespace_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of namespace_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `parentlinkedsellist`
-- ----------------------------
CREATE TABLE `parentlinkedsellist` (
  `fieldtype_id` bigint(20) NOT NULL,
  `whereclause` longtext NOT NULL,
  `filtervariants` char(1) NOT NULL,
  `linkfield` varchar(50) NOT NULL,
  UNIQUE KEY `fieldtype_id` (`fieldtype_id`),
  CONSTRAINT `parentlinkedsellist_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`)
) ;

-- ----------------------------
-- Records of parentlinkedsellist
-- ----------------------------

-- ----------------------------
-- Table structure for `part_types`
-- ----------------------------
CREATE TABLE `part_types` (
  `part_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label_id` bigint(20) NOT NULL,
  `description_id` bigint(20) NOT NULL,
  `mimetype` varchar(100) NOT NULL,
  `daisy_html` char(1) default NULL,
  `linkextractor` varchar(50) default NULL,
  `deprecated` char(1) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`part_id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `part_types_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of part_types
-- ----------------------------

-- ----------------------------
-- Table structure for `parts`
-- ----------------------------
CREATE TABLE `parts` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  `parttype_id` bigint(20) NOT NULL,
  `blob_id` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  `filename` varchar(255) default NULL,
  `blob_size` bigint(20) NOT NULL,
  `changed_in_version` bigint(20) NOT NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`,`version_id`,`parttype_id`),
  KEY `parts_I_1` (`parttype_id`),
  KEY `parts_I_2` (`blob_id`),
  CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`parttype_id`) REFERENCES `part_types` (`part_id`)
) ;

-- ----------------------------
-- Records of parts
-- ----------------------------

-- ----------------------------
-- Table structure for `parttype_sequence`
-- ----------------------------
CREATE TABLE `parttype_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of parttype_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `querysellist`
-- ----------------------------
CREATE TABLE `querysellist` (
  `fieldtype_id` bigint(20) NOT NULL,
  `query` longtext NOT NULL,
  `filtervariants` char(1) NOT NULL,
  `sort_order` varchar(1) NOT NULL,
  UNIQUE KEY `fieldtype_id` (`fieldtype_id`),
  CONSTRAINT `querysellist_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`)
) ;

-- ----------------------------
-- Records of querysellist
-- ----------------------------

-- ----------------------------
-- Table structure for `role_sequence`
-- ----------------------------
CREATE TABLE `role_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `role_modifier_fk` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Table structure for `selectionlist_data`
-- ----------------------------
CREATE TABLE `selectionlist_data` (
  `fieldtype_id` bigint(20) NOT NULL,
  `sequencenr` smallint(6) NOT NULL,
  `depth` smallint(6) NOT NULL,
  `stringvalue` varchar(255) default NULL,
  `datevalue` datetime default NULL,
  `datetimevalue` datetime default NULL,
  `integervalue` bigint(20) default NULL,
  `floatvalue` double default NULL,
  `decimalvalue` decimal(10,5) default NULL,
  `booleanvalue` char(1) default NULL,
  `link_docid` bigint(20) default NULL,
  `link_nsid` bigint(20) default NULL,
  `link_branchid` bigint(20) default NULL,
  `link_langid` bigint(20) default NULL,
  `label_id` bigint(20) NOT NULL,
  KEY `link_nsid` (`link_nsid`),
  KEY `fieldtype_id` (`fieldtype_id`),
  CONSTRAINT `selectionlist_data_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`),
  CONSTRAINT `selectionlist_data_ibfk_2` FOREIGN KEY (`link_nsid`) REFERENCES `daisy_namespaces` (`id`)
) ;

-- ----------------------------
-- Records of selectionlist_data
-- ----------------------------

-- ----------------------------
-- Table structure for `summaries`
-- ----------------------------
CREATE TABLE `summaries` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `summary` longtext NOT NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`)
) ;

-- ----------------------------
-- Records of summaries
-- ----------------------------

-- ----------------------------
-- Table structure for `task_doc_details`
-- ----------------------------
CREATE TABLE `task_doc_details` (
  `task_id` bigint(20) NOT NULL,
  `doc_id` varchar(255) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `seqnr` bigint(20) NOT NULL,
  `state` varchar(1) NOT NULL,
  `details` longtext,
  PRIMARY KEY  (`task_id`,`doc_id`,`branch_id`,`lang_id`),
  CONSTRAINT `task_doc_details_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `document_tasks` (`id`)
) ;

-- ----------------------------
-- Records of task_doc_details
-- ----------------------------

-- ----------------------------
-- Table structure for `task_sequence`
-- ----------------------------
CREATE TABLE `task_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of task_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `thefields`
-- ----------------------------
CREATE TABLE `thefields` (
  `doc_id` bigint(20) NOT NULL,
  `ns_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `lang_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  `fieldtype_id` bigint(20) NOT NULL,
  `value_seq` bigint(20) NOT NULL,
  `hier_seq` bigint(20) NOT NULL,
  `value_count` bigint(20) NOT NULL,
  `hier_count` bigint(20) NOT NULL,
  `stringvalue` varchar(255) default NULL,
  `datevalue` datetime default NULL,
  `datetimevalue` datetime default NULL,
  `integervalue` bigint(20) default NULL,
  `floatvalue` double default NULL,
  `decimalvalue` decimal(10,5) default NULL,
  `booleanvalue` char(1) default NULL,
  `link_docid` bigint(20) default NULL,
  `link_nsid` bigint(20) default NULL,
  `link_searchdocid` varchar(50) default NULL,
  `link_branchid` bigint(20) default NULL,
  `link_searchbranchid` bigint(20) default NULL,
  `link_langid` bigint(20) default NULL,
  `link_searchlangid` bigint(20) default NULL,
  `link_search` varchar(100) default NULL,
  PRIMARY KEY  (`doc_id`,`ns_id`,`branch_id`,`lang_id`,`version_id`,`fieldtype_id`,`value_seq`,`hier_seq`),
  KEY `link_nsid` (`link_nsid`),
  KEY `thefields_I_1` (`stringvalue`),
  KEY `thefields_I_2` (`datevalue`),
  KEY `thefields_I_3` (`datetimevalue`),
  KEY `thefields_I_4` (`integervalue`),
  KEY `thefields_I_5` (`floatvalue`),
  KEY `thefields_I_6` (`decimalvalue`),
  KEY `thefields_I_7` (`booleanvalue`),
  KEY `thefields_I_8` (`link_searchdocid`),
  KEY `thefields_I_9` (`link_searchbranchid`),
  KEY `thefields_I_10` (`link_searchlangid`),
  KEY `thefields_I_11` (`link_search`),
  KEY `thefields_I_12` (`fieldtype_id`),
  CONSTRAINT `thefields_ibfk_1` FOREIGN KEY (`fieldtype_id`) REFERENCES `field_types` (`id`),
  CONSTRAINT `thefields_ibfk_2` FOREIGN KEY (`link_nsid`) REFERENCES `daisy_namespaces` (`id`)
) ;

-- ----------------------------
-- Records of thefields
-- ----------------------------

-- ----------------------------
-- Table structure for `user_roles`
-- ----------------------------
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `user_sequence`
-- ----------------------------
CREATE TABLE `user_sequence` (
  `maxid` bigint(20) default NULL
) ;

-- ----------------------------
-- Records of user_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `default_role` bigint(20) NOT NULL,
  `first_name` varchar(50) default NULL,
  `last_name` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  `updateable_by_user` char(1) NOT NULL,
  `confirmed` char(1) NOT NULL,
  `confirmkey` varchar(50) default NULL,
  `auth_scheme` varchar(50) NOT NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `last_modifier` (`last_modifier`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`last_modifier`) REFERENCES `users` (`id`)
) ;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `wf_pool_members`
-- ----------------------------
CREATE TABLE `wf_pool_members` (
  `pool_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `added` datetime NOT NULL,
  `adder` bigint(20) NOT NULL,
  PRIMARY KEY  (`pool_id`,`user_id`),
  KEY `wf_pool_members_I_1` (`user_id`),
  CONSTRAINT `wf_pool_members_ibfk_1` FOREIGN KEY (`pool_id`) REFERENCES `wf_pools` (`id`)
) ;

-- ----------------------------
-- Records of wf_pool_members
-- ----------------------------

-- ----------------------------
-- Table structure for `wf_pools`
-- ----------------------------
CREATE TABLE `wf_pools` (
  `id` bigint(20) NOT NULL,
  `name_` varchar(100) NOT NULL,
  `description` varchar(255) default NULL,
  `last_modified` datetime NOT NULL,
  `last_modifier` bigint(20) NOT NULL,
  `updatecount` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name_` (`name_`)
) ;

-- ----------------------------
-- Records of wf_pools
-- ----------------------------

-- ----------------------------
-- Table structure for `wfpool_sequence`
-- ----------------------------
CREATE TABLE `wfpool_sequence` (
  `maxid` bigint(20) default NULL
) ;

