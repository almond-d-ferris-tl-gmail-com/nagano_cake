class Item < ApplicationRecord
    has_one_attached :image
    
    #genre1:item多(n)の関係
    #itemから見てgenreは1→「belongs_to: 1」(属する)を記述する
    #genreから見てitemは多(n)→「has_many: 多(n)s, dependent: :destroy」を記述する
    #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
    belongs_to :genre
    
    #item1:cart_item多(n)の関係
    #cart_itemから見てitemは1→「belongs_to: 1」(属するの意味)を記述する
    #itemから見てcart_itemは多(n)→「has_many: 多(n)s, dependent: :destroy」を記述する
    #has_many:・・・テーブル同士を関連付ける、dependent(依存): :destroy・・・親モデルの削除時に、紐づいている子モデルも一緒に削除される
    has_many :cart_items, dependent: :destroy

    
    def tax_included_price#税込の計算
        (price * 1.1).to_i
    end
    
    
    def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image.variant(resize_to_limit: [200, 100]).processed
    end
end
