class Product < ApplicationRecord
  include CodeGenerator

  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }
  validates :code, uniqueness: true

  belongs_to :vendor
end

