# generating_environment
環境構築の手順と作成ファイルを記録するためのリポジトリ

*現状では Redmine の構築手順のみコミット*

## 目的
開発プロジェクトで有意義なツールを連携させる方法を確立する。
- 有意義なツールとは
  - SVNとかgitとかRedmineとかJenkinsとか
- 連携とは
  - 各ツール間でのアカウント連携
  - 相互参照可能

## 背景
開発プロジェクトを進めるにあたり、自分にとってやり易い環境を会社に提案したい。  
提案するにあたり構築がどれだけ楽か主張できるようにしたい。  

## 前提
- できる限り疎結合とする
  - Redmineがメンテ中でもgit触りたい

## 留意事項
- httpではなくhttpsで
- メール飛ばしたいからSMTPサーバーもたてる？
- 移行手順も知っといた方がいいかも

## 環境構築のために使用した環境
以下の手順により作成した環境を使用する。  

### VagrantからUbuntuの起動してログイン
  
OS選定理由：作業時点でもっとも流行っているらしいから。  

作成時点では以下のVersionとなった。  
```
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="14.04.5 LTS, Trusty Tahr"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 14.04.5 LTS"
VERSION_ID="14.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
```

### gitインストール

導入理由：作成した環境をgitで公開して仕事中に参照したい。  

Vagrantから作成した環境では既にインストールされていた。
```
$ git version
git version 1.9.1
```

### Dockerインストール

導入理由：様々なツールをインストールしたいので環境を競合させたくない。  
参考: [Get Docker CE for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)  

作業時点では以下のVersionとなった。
```
$ sudo docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a
 Built:             Tue Aug 21 17:24:58 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a
  Built:            Tue Aug 21 17:23:24 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```

また、公式サイトで推奨されるままに extra パッケージもインストールした。

### Docker Composeインストール

導入理由：様々なツールの連携を検討しているため。  
参考：[Install Docker Compose](https://docs.docker.com/compose/install/)  

作業時点では以下のVersionとなった。
```
$ docker-compose --version
docker-compose version 1.22.0, build f46880fe
```
