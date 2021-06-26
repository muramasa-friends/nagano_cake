class Customer < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture_code

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
  validates :last_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true, length: {is:7}

  def full_name
    self.last_name + self.first_name
  end

  def my_address
    "〒" + self.postal_code + " " + self.address
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def inactive_message
    "退会済みのアカウントです。"
  end


  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
