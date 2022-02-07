class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy

  def address_customer
    '〒' + postal_code + ' ' + address + ' ' + first_name + last_name
  end

end
