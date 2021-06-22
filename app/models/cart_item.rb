class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, presence: true

#   def sub_total_price
# 		line_items.to_a.sum { |item| item.total_price }
# 	end

  
  
  
  
  def total_price
		items.to_a.sum { |item| item.sub_total }
	end
  
  def add_tax_price
    (self.item.price * 1.1).round
  end

end
