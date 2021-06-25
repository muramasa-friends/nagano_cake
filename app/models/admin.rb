class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :first_name_kana, presence: true, format: { with: /\p{katakana}/ }
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true, length: {is:7}
end
