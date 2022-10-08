class CartItem < ApplicationRecord
    def subtotal_price#小計の計算
        (item.tax_included_price * amount).to_i
    end
    
    belongs_to :customer
    belongs_to :item
end
