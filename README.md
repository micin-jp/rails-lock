# railsでのロック処理

* 環境構築

```
docker-compose up --build
```

```
rails db:seed
```

```
//bashに入る
docker-compose exec web bash

// rails console
rails c
```

ScheduleBlockとAlternativeSchduleBlockという二つのテーブルを
追加しどちらもcapacityというカラムの予約枠をinteger型で持っている。

* 悲観的ロック

ターミナルを二つ立ち上げて
```
curl --location --request POST 'http://localhost:3005/schedule_blocks/lock_transaction'
```
を実行する。実行処理にsleepを設けているので一つのターミナルで実行してからもう一つのを実行する形で同時リクエストを実現



* 楽観的ロック

ターミナルを二つ立ち上げて
```
curl --location --request POST 'http://localhost:3005/alternative_schedule_blocks/lock_transaction'
```
を実行する。実行処理にsleepを設けているので一つのターミナルで実行してからもう一つのを実行する形で同時リクエストを実現
