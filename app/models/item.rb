class Item < ApplicationRecord
    has_one_attached :image
    
    #genreに属している
    belongs_to :genre
    
    def tax_included_price#税込の計算
    price * 1.1
    
    end
end
