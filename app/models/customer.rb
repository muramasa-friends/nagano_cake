class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :orders
	has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :addresses, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true, length: {is:7}
  

  def full_name
    self.last_name + self.first_name
  end


  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
