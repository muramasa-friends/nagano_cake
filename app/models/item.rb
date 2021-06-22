class Item < ApplicationRecord
  belongs_to :genre
	has_many :cart_items
  has_many :customers, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items

  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  
  def sub_total
    price * amount
  end
  
end
