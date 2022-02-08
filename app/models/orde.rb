class Orde < ApplicationRecord

  has_many :orders_details

  enum payment: { credit_card: 0, transfer: 1 }

end
