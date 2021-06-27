class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true

  def add_tax_price
    (self.item.price * 1.1).round
  end

  def sub_total
    (self.item.price * 1.1 * self.amount).round
  end

end
