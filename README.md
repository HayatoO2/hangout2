# README

# テーブル設計


## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |


### Association

- has_many :shares
- has_many :shares, through: :user_shares
- has_many :presents
- has_many :chats
- has_many :chats, through: :user_chats

## present テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| user              | references  | null: false, foreign_key: true |
| enter_time        | date        | null: false                    |
| leave_time        | date        | null: false                    |
| share             | references  | null: false, foreign_key: true |

### Association

- belongs_to :share
- belongs_to :user
- has_many :chats
- has_many :chats, through: chat_presents

## user_share テーブル

| Column | Type       | Options                        | 
| ------ | -----------| -------------------------------|
| present| references | null: false, foreign_key: true |
| chat   | references | null: false, foreign_key: true |

### Association

- belongs_to :present
- belongs_to :chat




## chats テーブル

| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| date   | date       | null: false                   |
| share  | references | null: false, foreign_key: true |



### Association

- has_many :users
- has_many :users, through: user_chats
- belongs_to :share
- has_many :presents
- has_many :presents, through: chat_presents



## shares テーブル

| Column             | Type    | Options     | 
| -------------------| --------| ------------|
| name               | string  | null: false |
| log_name           | string  | null: false |
| encrypted_password | string  | null: false |

### Association


- has_many :users
- has_many :users, through: user_share
- has_many :chats
- has_many :presents

## user_share テーブル

| Column | Type       | Options                        | 
| ------ | -----------| -------------------------------|
| user   | references | null: false, foreign_key: true |
| share  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :share

