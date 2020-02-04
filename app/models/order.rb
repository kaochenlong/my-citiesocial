class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :recipient, :tel, :address, presence: true
end
