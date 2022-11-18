## Quiz-Sheet
サイトURL: 22/11/18現在 本番環境未デプロイ<br>
Googleスプレッドシートと連携してクイズを作成するアプリです

### 環境構築

```
$ git clone
```
でレポジトリをcloneする。

```
$ docker pull ysk91/quiz-sheet
```
でDockerファイルをpullする。
(DockerHub: https://hub.docker.com/r/ysk91/quiz-sheet)

```
$ docker-compose up -d
```
を実行し、 http://localhost:3000/ にアクセスする。


## 使用技術
+ Ruby 3.0.4
+ Rails 6.1.7
+ VScode
+ データベース
  + 開発, テスト環境, 本番環境: MySQL5.7
+ サーバー
  + AWS
+ テスト (22/11/18現在 未実装)
  + RSpec
+ フロントエンド
  + Bootstrap
  + jQuery

## インフラ構成図


## ER図
![Quiz-Sheet](https://user-images.githubusercontent.com/106280032/202601902-175cc439-ecc0-4afe-8b3d-67944ff868b2.png)


## 機能一覧
+ CRUD
+ Google Spreadsheet API
+ Active Job

## テスト方法


## フィードバック


## アウトプット
[Qiita](https://qiita.com/ysk91_engineer)参照
