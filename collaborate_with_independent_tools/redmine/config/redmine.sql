INSERT INTO `settings` (`name`, `value`) VALUES
('protocol','https'),
('text_formatting','markdown'),
('default_language','ja'),
('login_required','1'),
('autologin','0'),
('self_registration','2'),
('session_lifetime','28800'),
('session_timeout','168'),
('default_users_time_zone','Tokyo'),
('default_projects_public','0'),
('cross_project_issue_relations','1'),
('attachment_max_size','51200'),
('repositories_encodings','utf-8,cp932,euc-jp'),
('plain_text_mail','1'),
('enabled_scm','---
- Subversion
- Git
'),
('commit_ref_keywords','refs,references,IssueID,*');

UPDATE `roles` SET `permissions` = NULL WHERE `id` = '1' OR `id` = '2';

COMMIT;
