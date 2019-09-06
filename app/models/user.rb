class User < ApplicationRecord
  after_create :create_cart
  has_one :cart
  has_many :orders
  has_one_attached :avatar
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def create_cart
  	Cart.create(user_id:self.id)
  end
end
