# README

## アプリ名

udemy bot  


## 概要

- 毎朝、udemyのurlがbotから送信されるのでセールの見逃しを防ぎます  


## アプリの構成

![](.drawio.svg)


## 本番環境

- デプロイ先 → Heroku  
- Heroku schedulerを使用して、毎朝8時に送信するように設定 


## 制作背景

プログラミングの教材としてudemyを利用しています。基本的にはセール時に購入をしますが、毎日のセール開催有無の確認作業を私の場合、つい忘れてしまいます。そんな時に、毎朝udemyのurlをlineに送信してくれるbotがあれば良いなと考えたのがきっかけです。  
※lineに送信してもらう理由は、私自身のline使用頻度が高いからです。  


## DEMO

[![Image from Gyazo](https://i.gyazo.com/c7cabf697cdcb87b88aa88122f942384.png)](https://gyazo.com/c7cabf697cdcb87b88aa88122f942384) 
テスト画像です。


## 使用言語

- バックエンド  
Ruby -v 2.5.1  
Ruby on Rails -v 6.0.3.2  


## 使用技術

- LINE Messager API  
→JSON形式でHTTPSを使いメッセージを送信。また、プッシュ機能を使用して自動送信を実現。  
※ LINE Messager API  
https://developers.line.biz/ja/docs/messaging-api/overview/#messaging-api%E3%81%AE%E4%BB%95%E7%B5%84%E3%81%BF  


## 開発環境

ローカル  


## 課題や今後実装したい機能

- 多くのユーザーが使用できるように改良。  


