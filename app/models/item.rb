class Item < ApplicationRecord
    has_one_attached :image
    
    #genreに属している
    belongs_to :genre
    
    has_many :cart_items, dependent: :destroy

    
    def tax_included_price#税込の計算
        (price * 1.1).to_i
    end
    
    
    def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image.variant(resize_to_limit: [100, 100]).processed
    end
end
