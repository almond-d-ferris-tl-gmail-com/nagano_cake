class Order < ApplicationRecord
    
    #payment_method(支払い方法)カラム
    #0:credit_card(クレジットカード)、1:transfer(銀行振込)
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    #受注ステータス
    enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
