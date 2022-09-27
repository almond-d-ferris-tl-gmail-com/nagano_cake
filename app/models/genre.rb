class Genre < ApplicationRecord
    #itemのほうでgenre.nameを使用したい→itemを所有している(複数形にする)
    has_many :items
end
