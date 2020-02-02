class Category < ApplicationRecord
  acts_as_paranoid
  acts_as_list

  has_many :products

  validates :name, presence: true
end
