**動作未検証のため本ディレクトリのファイルはそのまま使用しないこと** 

# Redmine
本ディレクトリではDocker Composeを使用してRedmineを構築する手順と作成ファイルを記録する。  

## 手順
### Docker Compose設定ファイル（YAMLファイル）を作成する
- ファイルの基本的な書き方
  - [Redmine を Docker 公式イメージで運用する](https://qiita.com/bezeklik/items/b5c39136a8db23e2e81c)
  - [Redmine](https://hub.docker.com/_/redmine/)
  - [mariadb](https://hub.docker.com/_/mariadb/)
- redmine.yml の主な特徴
  - データ格納領域はホストにマウント
  - 日本で日本語で使用されると想定：[dockerでRedmineを起動する](https://qiita.com/kazuy/items/1a4c0f718c59479e2aa5)
  - HTTPS対応：[既存環境に手を加えずにサクッとHTTPS化する (NAT配下でもok)](https://amaya382.hatenablog.jp/entry/2017/04/02/002746)
    - 内部の通信はHTTPのままとする
    - HTTPS化が不要な場合は、https-portalの記述を削除する

### 起動
#### Dockerコンテナを作成して起動
```
$ sudo docker-compose -f redmine.yml up -d
Creating network "redmine_default" with the default driver
Creating redmine-main-tool ... done
Creating redmine-main-dbms ... done
Creating redmine-https     ... done
```

`-d`が無いとプロンプトが返ってこない（バックグラウンド起動されない）。  

#### Redmineが正常に起動したことの確認
```
$ sudo docker container logs --follow redmine-main-tool
...
[2018-10-27 10:30:59] INFO  WEBrick 1.3.1
[2018-10-27 10:30:59] INFO  ruby 2.4.5 (2018-10-18) [x86_64-linux]
[2018-10-27 10:30:59] INFO  WEBrick::HTTPServer#start: pid=1 port=3000
```

上記のログを確認したら＜Ctrl＞ + ＜C＞でログ確認を終了する。

#### Redmineの設定
```
$ cat < config/redmine.sql | sudo docker exec -i redmine-main-dbms mysql -D main-db -u main-db-user -pmain-db-password
$ sudo docker-compose -f redmine.yml restart main-tool
```

### Redmineアクセス
今回はブラウザから`https://test.com`にアクセスする。  
test.comのドメインを取得していないため、作業マシンのhostsファイルで名前解決が必要。  

## 気づいたこと
### YAMLファイルのRedmine本体側に`restart: always`が必要
DBが起動するまではRedmine起動時にDB接続に失敗してしまう。 
```
main-tool_1  | Mysql2::Error: Can't connect to MySQL server on 'main-dbms' (111 "Connection refused")
...
redmine_main-tool_1 exited with code 1
```
再起動の設定がないと、一度DB接続に失敗したらRedmine起動は諦められてしまう。

### YAMLファイルのDB側にRedmineが使用するDB名・ユーザ名・パスワードが必要
Redmine側の設定だけに書けばよろしくやってくれる、というわけでは無かった。 
なお、Redmine側にDB名を指定しない場合は、DBMS側の設定に`redmine`の名前でDB名の指定が必要（未検証）。  

### マウント先のディレクトリがホスト側に無くても自動で作成してくれる
