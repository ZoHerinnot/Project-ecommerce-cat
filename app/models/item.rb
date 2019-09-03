class Item < ApplicationRecord
    validates :title,  presence: true,length: {maximum: 40}

    validates :description, presence: true, length: {maximum: 500}

    validates :image_url, presence: true

    validates :price,  numericality: {greater_than: 0}


end
