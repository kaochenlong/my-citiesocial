class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :code_generator, use: :slugged, slug_column: :code

  validates :name, presence: true
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true }
  validates :code, uniqueness: true

  belongs_to :vendor

  private
  def code_generator
    SecureRandom.hex(10)
  end
end

