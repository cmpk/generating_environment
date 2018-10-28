# 設定ファイル
本ディレクトリには各設定に必要なコマンドや設定ファイルを配置する。

## Redmineプロジェクト設定
redmine.sqlでは以下の設定を実施している。  
設定一覧は公式[Application Settings](http://www.redmine.org/projects/redmine/wiki/RedmineSettings)を参照、  
設定値は[ソースコード](https://svn.redmine.org/redmine/)を参照した。  

|name                   |default    |value    |意味    |
|---|---|---|---|
|protocol               |http   |https   |メール通知にてメール内に記載されるRedmine URLのプロトコルを'https'にする。|
|text_formatting        |Textile|Textile |Redmine上で利用するテキストフォーマットを'Textile'にする。|
|default_language       |en     |ja      |クライアントブラウザの言語が不明な場合やメール通知に使用する言語を日本語にする。|
|login_required         |0      |1       |各ページを閲覧するためにログインを必須とする。|
|autologin              |0      |1       |自動ログインを許可しない。|
|self_registration      |2      |2       |ユーザ登録後の有効化に管理者の許可が必要とする。|
|session_lifetime       |-      |28800   |セッション生存時間を8時間とする。（たぶん秒指定）|
|session_timeout        |-      |168     |セッションタイムアウトまでの時間を1週間とする。|
|default_users_time_zone|-      |Tokyo   |ユーザのデフォルトタイムゾーンを東京とする。|
|default_projects_public|1      |0       |プロジェクト作成時にそのプロジェクトを非公開とする。|
|cross_project_issue_relations|0|0       |チケットの親子関係は同じプロジェクト内でしか築けない。|
|attachment_max_size    |5120   |51200   |アップロード可能なファイルサイズ上限を50MBとする。（経験上デフォルト値だと足りない。）|
|repositories_encodings |-      |utf-8,cp932,euc-jp|レポジトリ内ファイルを日本語用エンコーディングで解釈する。|
|plain_text_mail        |0      |1       |メール通知のメールにHTMLメールを使用しない（プレーンテキスト）。|
|enabled_scm            |Subversion,Mercurial,Cvs,Bazaar,Git|Subversion,Git|連携バージョン管理システムをSVNとGitとする。|
|commit_ref_keywords    |refs,references,IssueID|refs,references,IssueID,\*|enabled_scmで指定したシステムのコミットメッセージに本項目に含むキーワードがあった場合に、対象チケットにリンクを表示する。|

## 非メンバーと匿名ユーザの権限を削除
redmine.sqlで実施。  
[Redmine を Docker 公式イメージで運用する](https://qiita.com/bezeklik/items/b5c39136a8db23e2e81c)を参照のこと。  
