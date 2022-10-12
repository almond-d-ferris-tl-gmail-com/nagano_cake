class Address < ApplicationRecord
  #customer1:address多(n)の関係
  #addressから見てcustomerは1→「belongs_to :customer」(属する)を記述する
  #customerから見てaddressは多(n)→「has_many :addresses, dependent: :destroy」を記述する
  #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
  belongs_to :customer
  
    def address_display
      '〒' + postal_code + ' ' + address + ' ' + name
    end
end
