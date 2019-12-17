<div align="center">
  <img alt="Logo" src="https://imgur.com/z1ubeIb.png" width="80" />
</div>
<h1 align="center">
  TripHub
</h1>
<div align="center">
  <div align="center">
    <a href="https://trip-hub.herokuapp.com/">
      <img src="https://imgur.com/L55dJZ5.png" width="150">
    </a>
  </div>
  <p>A graduation project of a four-month coding bootcamp in DIVE INTO CODE.</p>
  <p>Triphub is where travel enthusiasts can share their travel schedules while exploring the world.</p>
  <p>This application is built with Ruby on Rails and hosted with Heroku</p>
</div>

## 概要

旅行のスケジュールを計画とシェアできるアプリです。  
他のユーザの公開した旅行スケジュールを参考できできます。  
気になるスポットを見つけたらその場で保存、自分のオリジナルプランを作成することができます。

## バージョン情報

Ruby 2.6.5  
Rails 5.2.3

## 機能一覧

- ユーザ

  - ユーザ登録機能
  - ユーザログイン機能（及びパスワードリセット）
  - ユーザフォーロー機能

- トリップ / スケジュール

  - トリップを作成、編集、削除機能
  - ユーザが公開中のスケジュールの一覧表示
  - 公開中のスケジュールから観光スポットを保存機能
  - スケジュールに入れましたスポットを Google Map にて表示機能
  - スポットで使う費用から、トリップの費用概算機能

- 観光スポット
  - 観光スポット作成（Google Places Library）
  - スポット保存機能

## 要件定義：カタログ設計

[Direct Link](https://drive.google.com/file/d/1R0O7ygGzgbY4058xtdGCCMOlUri4GKpD/view?usp=sharing)

## 要件定義：テーブル定義書

[Direct Link](https://drive.google.com/file/d/1mrcARaz8X_r2vWIWIKYUmGdjGRlgZ8yv/view?usp=sharing)

## 要件定義：[画面遷移図](https://drive.google.com/file/d/1dD1-RK0_-XHlh0WIrr8jnxg6UKk317aZ/view?usp=sharing)

<img src="https://imgur.com/nZ2NG4A.png" width="650px">

## 要件定義：[ER 図](https://drive.google.com/file/d/1u6-avgjb6W-fgFCMFn-Irl_LW5RBCu6P/view?usp=sharing)

<img src="https://imgur.com/PtfEAW1.png" width="650px">

## 要件定義：[ワイヤーフレーム](https://drive.google.com/file/d/1uu_QNMKeaifBNTgNSvwJsZ41ntMBSJDh/view?usp=sharing)

<img src="https://imgur.com/AqTuFT0.png" width="650px">

## 使用予定 Gem

- devise
- devise-i18n
- devise-i18n-views
- geocoder
- google_places
- unsplash
- carrierwave
- mini_magick
- fog-aws
- faker
- bootstrap
- jquery-rails
- font-awesome-sass
- dotenv-rails
- letter_opener_web

## How to set up

1. Clone this repo

   ```
   git clone https://github.com/Wangchimei/TripHub.git
   ```

2. Install necessary gem

   ```
   bundle install
   ```

3. Create database and run migration

   ```
   rails db:create db:migrate
   ```

4. Import countries, states and cities database

   ```
   rake import:continents
   rake import:countries
   rake import:states
   rake import:cities
   ```

5. Import sightseeing spots sample data

   ```
   rake import:spots
   ```

6. Create seed data

   ```
   rails db:seed
   ```

7. Run test

   ```
   bundle exec rspec
   ```

8. Start server

   ```
   rails s
   ```
