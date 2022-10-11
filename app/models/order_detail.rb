class OrderDetail < ApplicationRecord
  #customer1:order多(n)の関係
  #orderから見てcustomerは1→「belongs_to :customer」(属する)を記述する
  #customerから見てorderは多(n)→「has_many: orders, dependent: :destroy」を記述する
  #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
  belongs_to :order
    
  #customer1:order多(n)の関係
  #orderから見てcustomerは1→「belongs_to :customer」(属する)を記述する
  #customerから見てorderは多(n)→「has_many: orders, dependent: :destroy」を記述する
  #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
  belongs_to :item
  
    def subtotal_price#小計の計算　.to_i→整数に変換して小数点を切り捨てる
        (item.tax_included_price * amount).to_i
    end
end
