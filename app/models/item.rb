class Item < ApplicationRecord
    has_many :list_commands
    has_many :carts, through: :list_commands
    has_one_attached :picture

    validates :title,  presence: true,length: {maximum: 40}
    validates :description, presence: true, length: {maximum: 500}
    validates :image_url, presence: true
    validates :price,  numericality: {greater_than: 0}

end
