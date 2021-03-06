class Order < ApplicationRecord

  enum payment_method: {
    クレジットカード: 0,
    銀行振込: 1
  }

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4
  }

  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  validates :payment_amount, :payment_method, :shipping_fee, :status, :postal_code, :name, :address, presence: true
  validates :postal_code, length: {is:7}

  def total_price
		order_items.to_a.sum { |item| item.sub_total }
	end

  def send_to
    "〒" + self.postal_code + " " + self.address + " " + self.name
  end
end
