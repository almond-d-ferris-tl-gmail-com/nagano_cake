class Order < ApplicationRecord
  #customer1:order多(n)の関係
  #orderから見てcustomerは1→「belongs_to :customer」(属する)を記述する
  #customerから見てorderは多(n)→「has_many: orders, dependent: :destroy」を記述する
  #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
  belongs_to :customer
    
  #payment_method(支払い方法)カラム
  #0:credit_card(クレジットカード)、1:transfer(銀行振込)
  enum payment_method: { credit_card: 0, transfer: 1 }

  #受注ステータス
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
