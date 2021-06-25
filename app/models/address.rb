class Address < ApplicationRecord
  belongs_to :customer

  validates :address, :name, presence: true
  validates :postal_code, presence: true, length: { is: 7 }

  def full_address
    "〒" + self.postal_code + self.address + self.name
  end
end
