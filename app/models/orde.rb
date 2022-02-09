class Orde < ApplicationRecord

  has_many :orders_details
  belongs_to :customer

  enum payment: { credit_card: 0, transfer: 1 }

end
