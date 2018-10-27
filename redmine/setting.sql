INSERT INTO `settings` (`name`, `value`) VALUES
('protocol','https'),
('text_formatting','markdown'),
('default_language','ja'),
('login_required','1'),
('autologin','7'),
('session_lifetime','43200'),
('session_timeout','480'),
('default_users_time_zone','Tokyo'),
('rest_api_enabled','1'),
('jsonp_enabled','1'),
('default_projects_public','0'),
('cross_project_issue_relations','1'),
('attachment_max_size','51200'),
('repositories_encodings','utf-8,cp932,euc-jp'),
('enabled_scm','---
- Subversion
- Git
'),
('commit_ref_keywords','refs,references,IssueID,*'),
('commit_cross_project_ref','1');

UPDATE `roles` SET `permissions` = NULL WHERE `id` = '1' OR `id` = '2';

COMMIT;
