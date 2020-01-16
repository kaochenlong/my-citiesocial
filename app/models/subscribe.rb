class Subscribe < ApplicationRecord
  validates :email, uniqueness: true
end
