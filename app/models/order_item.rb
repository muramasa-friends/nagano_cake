class OrderItem < ApplicationRecord
  enum production_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  belongs_to :item
  belongs_to :order

  validates :amount, :price, :production_status, presence: true
end
