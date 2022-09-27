class Item < ApplicationRecord
    has_one_attached :image
    
    #genreに属している
    belongs_to :genre
end
